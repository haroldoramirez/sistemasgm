unit UDaoVenda;

interface
      uses uDao, DB, SysUtils, Messages, UVenda, UDaoCliente, UDaoProduto,
      UDaoCondicaoPagamento, UDaoFuncionario, UDaoContasReceber, UContasReceber,
      UDaoUsuario, Dialogs;

      type DaoVenda = class(Dao)
      private

      protected
         umVenda                 : Venda;
         umaDaoCliente           : DaoCliente;
         umaDaoProduto           : DaoProduto;
         umaDaoCondicaoPagamento : DaoCondicaoPagamento;
         umaDaoFuncionario       : DaoFuncionario;
         UmaDaoUsuario           : DaoUsuario;
         umaDaoContasReceber     : DaoContasReceber;
         umaContaReceber         : ContasReceber;
      public
          Constructor CrieObjeto;
          Destructor Destrua_se;
          function Salvar(obj:TObject): string;      override;
          function GetDS : TDataSource;              override;
          function Carrega(obj:TObject): TObject;    override;
          function Buscar(obj : TObject) : Boolean;  override;
          function Excluir(obj : TObject) : string ; override;
          function VerificarVenda (obj : TObject) : Boolean;
          function VerificarNota (obj : TObject) : Boolean;
          procedure AtualizaGrid;
          procedure Ordena(campo: string);
end;

implementation

{ DaoVenda }

function DaoVenda.Buscar(obj: TObject): Boolean;
var
    prim: Boolean;
    sql, e, onde: string;
    umaVenda: Venda;
begin
    e := ' and ';
    onde := ' where';
    prim := true;
    umaVenda := Venda(obj);
    sql := 'select * from venda v';
    if umaVenda.getUmCliente.getNome_RazaoSoCial <> '' then
    begin
        //Buscar a descricao do cliente na tabela cliente
        sql := sql+' INNER JOIN cliente c ON v.idcliente = c.idcliente and c.nome_razaosocial like '+quotedstr('%'+umaVenda.getUmCliente.getNome_RazaoSoCial+'%');
        if (prim) and (umaVenda.getStatus <> '')then
         begin
            prim := false;
            sql := sql+onde;
        end
    end;
    if umaVenda.getStatus <> '' then
    begin
        if prim then
        begin
            prim := false;
            sql := sql+onde;
        end;
        sql := sql+' v.status like '+quotedstr('%'+umaVenda.getStatus+'%'); //COLOCA CONDIÇAO NO SQL
    end;
    if (DateToStr(umaVenda.getDataEmissao) <> '30/12/1899') and (datetostr(umaVenda.getDataVenda) <> '30/12/1899') then
    begin
        if prim then
        begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' v.dataemissao between '+QuotedStr(DateToStr(umaVenda.getDataEmissao))+' and '+QuotedStr(DateToStr(umaVenda.getDataVenda));
    end;

    with umDM do
    begin
        QVenda.Close;
        QVenda.sql.Text := sql+' order by numnota';
        QVenda.Open;
        if QVenda.RecordCount > 0 then
          result := True
        else
          result := false;
    end;
end;

function DaoVenda.VerificarVenda (obj : TObject) : Boolean;
var sql : string;
    umaVenda : Venda;
begin
  umaVenda := Venda(obj);
  sql := 'select * from venda where idordemservico = '+IntToStr(umaVenda.getIdOrdemServico)+' and status = '''+umaVenda.getStatus+'''';
  with umDM do
  begin
    QVenda.Close;
    QVenda.sql.Text := sql;
    QVenda.Open;
    if QVenda.RecordCount > 0 then
      result := True
    else
      result := false;
  end;
  Self.AtualizaGrid;
end;

function DaoVenda.VerificarNota (obj : TObject) : Boolean;
var sql : string;
    umaVenda : Venda;
begin
  umaVenda := Venda(obj);
  sql := 'select * from venda where numnota = '+IntToStr(umaVenda.getNumNota)+' and serienota = '''+umaVenda.getSerieNota+'''';
  with umDM do
  begin
    QVenda.Close;
    QVenda.sql.Text := sql;
    QVenda.Open;
    if QVenda.RecordCount > 0 then
      result := True
    else
      result := false;
  end;
  Self.AtualizaGrid;
end;

procedure DaoVenda.AtualizaGrid;
begin
  with umDM do
    begin
        QVenda.Close;
        QVenda.sql.Text := 'select * from venda order by numnota';
        QVenda.Open;
    end;
end;

function DaoVenda.Carrega(obj: TObject): TObject;
var
    umaVenda: Venda;
    I : Integer;
begin
    umaVenda := Venda(obj);
    with umDM do
    begin
        if not QVenda.Active then
            QVenda.Open;

        if umaVenda.getNumNota <> 0 then
          begin
            QVenda.Close;
            QVenda.SQL.Text := 'select * from venda where numnota = '+IntToStr(umaVenda.getNumNota);
            QVenda.Open;
          end;

        umaVenda.setNumNota(QVendanumnota.AsInteger);
        umaVenda.setSerieNota(QVendaserienota.AsString);
        umaVenda.setObservacao(QVendaobservacao.AsString);
        umaVenda.setStatus(QVendastatus.AsString);
        umaVenda.setDataCadastro(QVendadatacadastro.AsDateTime);
        umaVenda.setDataAlteracao(QVendadataalteracao.AsDateTime);
        umaVenda.setDataEmissao(QVendadataemissao.AsDateTime);
        umaVenda.setDataVenda(QVendadatavenda.AsDateTime);

        // Busca o Cliente referente a Venda
        umaVenda.getUmCliente.setId(QVendaidcliente.AsInteger);
        umaDaoCliente.Carrega(umaVenda.getumCliente);

        //Busca Funcioanrio referente a Venda
        umaVenda.getUmUsuario.setIdUsuario(QVendaidusuario.AsInteger);
        UmaDaoUsuario.Carrega(umaVenda.getUmUsuario);

        //Busca Condicao de Pagamento referente a Venda
        umaVenda.getUmaCondicaoPagamento.setId(QVendaidcondicaopagamento.AsInteger);
        umaDaoCondicaoPagamento.Carrega(umaVenda.getUmaCondicaoPagamento);

        //Carregar os Produtos
        QProdutoVenda.Close;
        QProdutoVenda.SQL.Text := 'select * from produto_venda where numnota = '+IntToStr(umaVenda.getNumNota);
        QProdutoVenda.Open;
        QProdutoVenda.First;

        if umaVenda.CountProdutos <> 0 then
            umaVenda.LimparListaProduto;  //Limpar a lista caso a lista vim com itens carregados
        if umaVenda.CountParcelas <> 0 then
            umaVenda.LimparListaParcelas; //Limpar a lista caso a lista vim com itens carregados

        while not QProdutoVenda.Eof do
        begin
          UmaVenda.CrieObejtoProduto;
          umaVenda.addProdutoVenda(umaVenda.getUmProdutoVenda);
          UmaVenda.getUmProdutoVenda.setId(QProdutoVendaidproduto.AsInteger);
          umaDaoProduto.Carrega(UmaVenda.getUmProdutoVenda);      //Buscar Descricao do Produto
          UmaVenda.getUmProdutoVenda.setQtdProduto(QProdutoVendaquantidade.AsFloat);
          UmaVenda.getUmProdutoVenda.setValorUnitario(QProdutoVendavalorunitario.AsFloat);
          UmaVenda.getUmProdutoVenda.setDesconto(QProdutoVendadesconto.AsFloat);
          QProdutoVenda.Next;
        end;
    end;
    result := umVenda;
    Self.AtualizaGrid;
end;

constructor DaoVenda.CrieObjeto;
begin
    inherited;
    umaDaoCliente           := DaoCliente.CrieObjeto;
    umaDaoProduto           := DaoProduto.CrieObjeto;
    umaDaoCondicaoPagamento := DaoCondicaoPagamento.CrieObjeto;
    umaDaoFuncionario       := DaoFuncionario.CrieObjeto;
    umaDaoUsuario           := DaoUsuario.CrieObjeto;
    umaDaoContasReceber     := DaoContasReceber.CrieObjeto;
    umaContaReceber         := ContasReceber.CrieObjeto;
end;

destructor DaoVenda.Destrua_se;
begin
    inherited;
end;

function DaoVenda.Excluir(obj: TObject): string;
var
    umaVenda: Venda;
    i : integer;
begin
//    umaVenda := Venda(obj);
//    with umDM do
//    begin
//        try
//            beginTrans;
//
//            QParcelas.SQL := UpdateParcelas.DeleteSQL;
//            QParcelas.Params.ParamByName('OLD_idcondicaopagamento').Value := umaVenda.getId;
//
//            QVenda.SQL := UpdateVenda.DeleteSQL;
//            QVenda.Params.ParamByName('OLD_idcondicaopagamento').Value := umaVenda.getId;
//
//            QParcelas.ExecSQL;
//            QVenda.ExecSQL;
//
//            Commit;
//            result := 'Venda excluído com sucesso!';
//        except
//            on e:Exception do
//            begin
//                rollback;
//                if pos('chave estrangeira',e.Message)>0 then
//                    result := 'Ocorreu um erro! O Venda não pode ser excluído pois ja está sendo usado pelo sistema.'
//                else
//                    result := 'Ocorreu um erro! Venda não foi excluído. Erro: '+e.Message;
//            end;
//        end;
//    end;
//    Self.AtualizaGrid;
end;

function DaoVenda.GetDS: TDataSource;
begin
    //-----Formatar Grid-----//
    umDM.QVenda.FieldByName('numnota').DisplayLabel := 'NN';
    umDM.QVenda.FieldByName('serienota').DisplayLabel := 'SN';
    umDM.QVenda.FieldByName('idordemservico').DisplayLabel := 'NumOS';

    umDM.QVenda.FieldByName('numnota').DisplayWidth := 5;
    umDM.QVenda.FieldByName('serienota').DisplayWidth := 5;
    //----------------------//
    Self.AtualizaGrid;
    result := umDM.DSVenda;
end;

procedure DaoVenda.Ordena(campo: string);
begin
    umDM.QVenda.IndexFieldNames := campo;
end;

function DaoVenda.Salvar(obj: TObject): string;
var
    umaVenda : Venda;
    i, j, compareNumNota, NumParcelas, count : Integer;
    cancelar, gerarContas : Boolean;
    valor, numNotaAux,quantidade : Real;
    CP_Status : String;
begin
    umaVenda := Venda(obj);
    NumParcelas := 0;
    numNotaAux  := 0;
    count       := 0;
    gerarContas := False;
    with umDM do
    begin
        try
            beginTrans;
            QVenda.Close;

            umaContaReceber.setNumNota(umaVenda.getNumNota);
            umaContaReceber.setSerieNota(umaVenda.getSerieNota);
            umaContaReceber.setStatus('RECEBIDA');

            if umaVenda.getNumNota = 0 then
                QVenda.SQL := UpdateVenda.InsertSQL
            else
            begin
                if (umaDaoContasReceber.VerificarContas(umaContaReceber)) then
                begin
                   result := 'Essa Compra não pode ser Cancelada pois 1 ou mais das parcelas já foram recebidas!';
                   Self.AtualizaGrid;
                   Exit;
                end;
                QVenda.SQL := UpdateVenda.ModifySQL;
                QVenda.Params.ParamByName('OLD_numnota').Value := umaVenda.getNumNota;
                QVenda.Params.ParamByName('OLD_serienota').Value := umaVenda.getSerieNota;
            end;
            QVenda.Params.ParamByName('serienota').Value := umaVenda.getSerieNota;
            if (umaVenda.getIdOrdemServico <> 0) then
              QVenda.Params.ParamByName('idordemservico').Value := umaVenda.getIdOrdemServico;
            QVenda.Params.ParamByName('idcliente').Value := umaVenda.getUmCliente.getId;
            QVenda.Params.ParamByName('idusuario').Value := umaVenda.getUmUsuario.getIdUsuario;
            QVenda.Params.ParamByName('idcondicaopagamento').Value := umaVenda.getUmaCondicaoPagamento.getId;
            QVenda.Params.ParamByName('status').Value := umaVenda.getStatus;
            QVenda.Params.ParamByName('observacao').Value := umaVenda.getObservacao;
            QVenda.Params.ParamByName('datacadastro').Value := umaVenda.getDataCadastro;
            QVenda.Params.ParamByName('dataalteracao').Value := umaVenda.getDataAlteracao;
            QVenda.Params.ParamByName('dataemissao').Value := umaVenda.getDataEmissao;
            QVenda.Params.ParamByName('datavenda').Value := umaVenda.getDataVenda;
            QVenda.ExecSQL;

            if umaVenda.getNumNota = 0 then
            begin
              QGenerica.Close;
              QGenerica.SQL.Text := 'Select last_value as numNota from numnota_seq';
              QGenerica.Open;
              umaVenda.setNumNota(QGenerica.Fields.FieldByName('numNota').Value);
            end;

            numNotaAux := QProdutoVendanumnota.AsInteger; //Recupera o numNota da tabela relacional
           //Faz Relacao com os Itens da Venda
            for i := 1 to umaVenda.CountProdutos do
            begin
                if (umaVenda.getNumNota <> numNotaAux)then
                begin
                  QProdutoVenda.SQL := UpdateProdutoVenda.InsertSQL;
                  cancelar := False;
                end
                else
                begin
                  QProdutoVenda.SQL := UpdateProdutoVenda.ModifySQL;
                  if ((umaVenda.getStatus = 'FINALIZADA') ) then
                    cancelar := False
                  else
                    cancelar := True;
                end;
                QProdutoVenda.Params.ParamByName('numnota').Value := umaVenda.getNumNota;
                QProdutoVenda.Params.ParamByName('serienota').Value := umaVenda.getSerieNota;
                QProdutoVenda.Params.ParamByName('idproduto').Value := umaVenda.getProdutoVenda(i-1).getId;
                QProdutoVenda.Params.ParamByName('valorunitario').Value := umaVenda.getProdutoVenda(i-1).getValorUnitario;
                QProdutoVenda.Params.ParamByName('quantidade').Value := umaVenda.getProdutoVenda(i-1).getQtdProduto;
                QProdutoVenda.Params.ParamByName('desconto').Value := umaVenda.getProdutoVenda(i-1).getDesconto;

                umaContaReceber.setStatus('PENDENTE');
                if (umaDaoContasReceber.VerificarContas(umaContaReceber)) or (umaVenda.getStatus <> 'CANCELADA') or (umaVenda.getTipo = False) then
                begin
                  gerarContas := True;
                  if (count = 0) then
                  begin
                      for j := 1 to umaVenda.CountCalcProduto do
                      begin
                        quantidade := umaVenda.getProdutoVenda(j-1).getQuantidade;
                        if (cancelar) then              //Aumenta o estoque do produto correspondente
                            umaVenda.getProdutoVenda(j-1).setQuantidade( quantidade + umaVenda.getCalcProduto(j-1).getTotalProduto)
                        else                            //Diminui o estoque do produto correspondente
                            umaVenda.getProdutoVenda(j-1).setQuantidade( quantidade - umaVenda.getCalcProduto(j-1).getTotalProduto);

                        umaDaoProduto.Salvar(umaVenda.getProdutoVenda(j-1));
                        count := count + 1;
                      end;
                  end;
                end;
                QProdutoVenda.ExecSQL;
            end;

            //Gera Contas a Receber
            if (gerarContas) and (umaVenda.getTipo <> False) then
            begin
              umaContaReceber.setStatus('RECEBIDA');
              for i := 1 to umaVenda.CountParcelas  do
              begin
                if (umaVenda.getStatus <> 'FINALIZADA') and (not umaDaoContasReceber.VerificarContas(umaContaReceber)) then
                begin
                  QContasReceber.SQL := UpdateContasReceber.ModifySQL;
                  QContasReceber.Params.ParamByName('OLD_numnota').Value   := umaVenda.getNumNota;
                  QContasReceber.Params.ParamByName('OLD_serienota').Value := umaVenda.getSerieNota;
                  QContasReceber.Params.ParamByName('OLD_numparcela').Value := umaVenda.getParcelas(i-1).getNumParcela;
                  CP_Status := 'CANCELADA';
                end
                else
                begin
                  QContasReceber.SQL := UpdateContasReceber.InsertSQL;
                  CP_Status := 'PENDENTE';
                end;
                  QContasReceber.Params.ParamByName('numnota').Value   := umaVenda.getNumNota;
                  QContasReceber.Params.ParamByName('serienota').Value := umaVenda.getSerieNota;
                  QContasReceber.Params.ParamByName('numparcela').Value  := umaVenda.getParcelas(i-1).getNumParcela;
                  QContasReceber.Params.ParamByName('datavencimento').Value := DateToStr(Date + (umaVenda.getParcelas(i-1).getDias));

                  valor := StrToFloat(FormatFloat('#0.00',(umaVenda.getParcelas(i-1).getPorcentagem/100) * umaVenda.getTotalAux));

                  QContasReceber.Params.ParamByName('valor').Value  := valor;
                  QContasReceber.Params.ParamByName('dataemissao').Value  := DateToStr(Date);
//                  if umaVenda.CountParcelas = 1 then
//                    QContasReceber.Params.ParamByName('status').Value := 'RECEBIDA'
//                  else
                    QContasReceber.Params.ParamByName('status').Value := CP_Status;
                  QContasReceber.Params.ParamByName('idcliente').Value  := umaVenda.getUmCliente.getId;
                  QContasReceber.Params.ParamByName('idusuario').Value  := umaVenda.getUmUsuario.getIdUsuario;
                  QContasReceber.Params.ParamByName('idformapagamento').Value := umaVenda.getUmaCondicaoPagamento.getUmaFormaPagamento.getId;

                QContasReceber.ExecSQL;
              end;
            end;
            Commit;
            if umaVenda.getStatus = 'CANCELADA' then
              result := 'Venda Cancelada com sucesso!'
            else
              result := 'Venda salva com sucesso!';
        except
          on e: Exception do
          begin
              rollback;
              if umaVenda.getStatus = 'CANCELADA' then
                Result := 'Ocorreu um erro! Venda não foi cancelada. Erro: '+e.Message
              else
                Result := 'Ocorreu um erro! Venda não foi salva. Erro: '+e.Message;
          end;
        end;
    end;
    Self.AtualizaGrid;
end;

end.
