unit UDaoCompra;

interface
      uses uDao, DB, SysUtils, Messages, UCompra, UDaoFornecedor, UDaoProduto,
      UDaoCondicaoPagamento, UDaoFuncionario, UDaoTransportadora, UDaoContasPagar,
      UContasPagar, UDaoUsuario, Dialogs;

      type DaoCompra = class(Dao)
      private
      protected
         umCompra                : Compra;
         umaDaoFornecedor        : DaoFornecedor;
         umaDaoProduto           : DaoProduto;
         umaDaoCondicaoPagamento : DaoCondicaoPagamento;
         umaDaoFuncionario       : DaoFuncionario;
         umaDaoUsuario           : DaoUsuario;
         umaDaoTransportadora    : DaoTransportadora;
         umaDaoContasPagar       : DaoContasPagar;
         umaContaPagar           : ContasPagar;
      public
          Constructor CrieObjeto;
          Destructor Destrua_se;
          function Salvar(obj:TObject): string;      override;
          function GetDS : TDataSource;              override;
          function Carrega(obj:TObject): TObject;    override;
          function Buscar(obj : TObject) : Boolean;  override;
          function Excluir(obj : TObject) : string ; override;
          function VerificarNota (obj : TObject) : Boolean;
          function VerificarProduto (obj : TObject) : Boolean;
          procedure AtualizaGrid;
          procedure Ordena(campo: string);
end;

implementation

{ DaoCompra }

function DaoCompra.Buscar(obj: TObject): Boolean;
var
    prim: Boolean;
    sql, e, onde: string;
    umaCompra: Compra;
begin
    e := ' and ';
    onde := ' where';
    prim := true;
    umaCompra := Compra(obj);
    sql := 'select * from compra c';
    if umaCompra.getUmFornecedor.getNome_RazaoSoCial <> '' then
    begin
        //Buscar a descricao do fornecedor na tabela fornecedor
        sql := sql+' INNER JOIN fornecedor f ON c.idfornecedor = f.idfornecedor and f.nome_razaosocial like '+quotedstr('%'+umaCompra.getUmFornecedor.getNome_RazaoSoCial+'%');
        if (prim) and (umaCompra.getStatus <> '')then
         begin
            prim := false;
            sql := sql+onde;
        end
    end;
    if umaCompra.getStatus <> '' then
    begin
        if prim then
        begin
            prim := false;
            sql := sql+onde;
        end;
        sql := sql+' c.status like '+quotedstr('%'+umaCompra.getStatus+'%'); //COLOCA CONDIÇAO NO SQL
    end;
    if (DateToStr(umaCompra.getDataEmissao) <> '30/12/1899') and (datetostr(umaCompra.getDataCompra) <> '30/12/1899') then
    begin
        if prim then
        begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' c.dataemissao between '+QuotedStr(DateToStr(umaCompra.getDataEmissao))+' and '+QuotedStr(DateToStr(umaCompra.getDataCompra));
    end;

    with umDM do
    begin
        QCompra.Close;
        QCompra.sql.Text := sql+' order by numnota';
        QCompra.Open;
        if QCompra.RecordCount > 0 then
          result := True
        else
          result := false;
    end;
end;

function DaoCompra.VerificarNota(obj: TObject): Boolean;
var sql: string;
    umaCompra: Compra;
begin
    umaCompra := Compra(obj);
    sql := 'select * from compra where numnota = '+IntToStr(umaCompra.getNumNota)+' and serienota = '''+umaCompra.getSerieNota+ ''' and idfornecedor = '+IntToStr(umaCompra.getUmFornecedor.getId)+' and status = '''+umaCompra.getStatus+'''' ;
    with umDM do
    begin
      QCompra.Close;
      QCompra.sql.Text := sql+' order by idcompra';
      QCompra.Open;
      if QCompra.RecordCount > 0 then
        result := True
      else
        result := false;
      QCompra.Refresh;
    end;
   // Self.AtualizaGrid;
end;

function DaoCompra.VerificarProduto (obj : TObject) : Boolean;
var sql: string;
    umaCompra: Compra;
begin
    umaCompra := Compra(obj);
    sql := 'select * from compra_produto where idproduto = '+IntToStr(umaCompra.getumProdutoCompra.getId);
    with umDM do
    begin
      QProdutoCompra.Close;
      QProdutoCompra.sql.Text := sql+' order by idcompra';
      QProdutoCompra.Open;
      if QProdutoCompra.RecordCount > 0 then
        result := True
      else
        result := false;
    end;
end;

procedure DaoCompra.AtualizaGrid;
begin
  with umDM do
  begin
    QCompra.Close;
    QCompra.sql.Text := 'select * from compra order by idcompra, numnota';
    QCompra.Open;
  end;
end;

function DaoCompra.Carrega(obj: TObject): TObject;
var umaCompra: Compra;
begin
    umaCompra := Compra(obj);
    with umDM do
    begin
        if not QCompra.Active then
            QCompra.Open;

//        if umaCompra.getNumNota <> 0 then
//          begin
//            QCompra.Close;
//            QCompra.SQL.Text := 'select * from compra where numnota = '+IntToStr(umaCompra.getNumNota);
//            QCompra.Open;
//          end;

        umaCompra.setIdCompra(QCompraidcompra.AsInteger);
        umaCompra.setNumNota(QCompranumnota.AsInteger);
        umaCompra.setSerieNota(QCompraserienota.AsString);
        umaCompra.setBaseICMS(QComprabase_icms.AsFloat);
        umaCompra.setTotalICMS(QCompratotal_icms.AsFloat);
        umaCompra.setValorFrete(QCompravalor_frete.AsFloat);
        umaCompra.setValorDesconto(QCompravalor_desconto.AsFloat);
        umaCompra.setTotalIPI(QCompratotal_ipi.AsFloat);
        umaCompra.setTotalProduto(QCompratotal_produto.AsFloat);
        umaCompra.setTotalNota(QCompratotal_nota.AsFloat);
        umaCompra.setObservacao(QCompraobservacao.AsString);
        umaCompra.setStatus(QComprastatus.AsString);
        umaCompra.setTipoFrete(QCompratipofrete.AsInteger);
        umaCompra.setDataEmissao(QCompradataemissao.AsDateTime);
        umaCompra.setDataCompra(QCompradatacompra.AsDateTime);
        umaCompra.setDataCadastro(QCompradatacadastro.AsDateTime);
        umaCompra.setDataAlteracao(QCompradataalteracao.AsDateTime);

        // Busca o Fornecedor referente a Compra
        umaCompra.getUmFornecedor.setId(QCompraidfornecedor.AsInteger);
        umaDaoFornecedor.Carrega(umaCompra.getumFornecedor);

        //Busca Funcioanrio referente a Compra
        umaCompra.getUmUsuario.setIdUsuario(QCompraidusuario.AsInteger);
        umaDaoUsuario.Carrega(umaCompra.getUmUsuario);

        //Busca Transportadora referente a Compra
        if (QCompraidtransportadora.AsInteger <> 0) then
        begin
          umaCompra.getUmaTransportadora.setId(QCompraidtransportadora.AsInteger);
          umaDaoFornecedor.Carrega(umaCompra.getUmaTransportadora);
        end;

        //Busca Condicao de Pagamento referente a Compra
        umaCompra.getUmaCondicaoPagamento.setId(QCompraidcondicaopagamento.AsInteger);
        umaDaoCondicaoPagamento.Carrega(umaCompra.getUmaCondicaoPagamento);

        //Carregar os Produtos
        QProdutoCompra.Close;
        QProdutoCompra.SQL.Text := 'select * from produto_compra where idcompra = '+ IntToStr(umaCompra.getIdCompra)+' and numnota = '+IntToStr(umaCompra.getNumNota)+' and serienota = '''+umaCompra.getSerieNota+ ''' and idfornecedor = '+IntToStr(umaCompra.getUmFornecedor.getId);
        QProdutoCompra.Open;
        QProdutoCompra.First;

        if umaCompra.CountProdutos <> 0 then
          umaCompra.LimparListaProduto;  //Limpar a lista caso a lista vim com itens carregados
        if umaCompra.CountParcelas <> 0 then
          umaCompra.LimparListaParcelas;  //Limpar a lista caso a lista vim com itens carregados

        while not QProdutoCompra.Eof do
        begin
          UmaCompra.CrieObejtoProduto;
          umaCompra.addProdutoCompra(umaCompra.getUmProdutoCompra);
          UmaCompra.getUmProdutoCompra.setId(QProdutoCompraidproduto.AsInteger);
          umaDaoProduto.Carrega(UmaCompra.getUmProdutoCompra);      //Buscar Descricao do Produto
          UmaCompra.getUmProdutoCompra.setNCMSH(QProdutoComprancm_sh.AsString);
          UmaCompra.getUmProdutoCompra.setCST(QProdutoCompracst.AsString);
          UmaCompra.getUmProdutoCompra.setCPOF(QProdutoCompracpof.AsInteger);
          UmaCompra.getUmProdutoCompra.setUnidadeCompra(QProdutoCompraunidade.AsString);
          UmaCompra.getUmProdutoCompra.setQuantidadeCompra(StrToFloat(FormatFloat('#0.000', QProdutoCompraquantidade.AsFloat)));
          UmaCompra.getUmProdutoCompra.setValorUnitarioCompra(StrToFloat(FormatFloat('#0.0000', QProdutoCompraprecocusto.AsFloat)));
          UmaCompra.getUmProdutoCompra.setDescontoCompra(StrToFloat(FormatFloat('#0.0000', QProdutoCompradesconto.AsFloat)));
          UmaCompra.getUmProdutoCompra.setValorTotalCompra(StrToFloat(FormatFloat('#0.0000', QProdutoCompravalortotal.AsFloat)));
          UmaCompra.getUmProdutoCompra.setBaseIcmsCompra(StrToFloat(FormatFloat('#0.0000', QProdutoComprabaseicms.AsFloat)));
          UmaCompra.getUmProdutoCompra.setValorIcmsCompra(StrToFloat(FormatFloat('#0.0000', QProdutoCompravaloricms.AsFloat)));
          UmaCompra.getUmProdutoCompra.setValorIpiCompra(StrToFloat(FormatFloat('#0.0000', QProdutoCompravaloripi.AsFloat)));
          UmaCompra.getUmProdutoCompra.setICMSCompra(StrToFloat(FormatFloat('#0.0000', QProdutoCompraicms.AsFloat)));
          UmaCompra.getUmProdutoCompra.setIPICompra(StrToFloat(FormatFloat('#0.0000', QProdutoCompraipi.AsFloat)));
          QProdutoCompra.Next;
        end;
    end;
    result := umaCompra;
    Self.AtualizaGrid;
end;

constructor DaoCompra.CrieObjeto;
begin
  inherited;
  umaDaoFornecedor        := DaoFornecedor.CrieObjeto;
  umaDaoProduto           := DaoProduto.CrieObjeto;
  umaDaoCondicaoPagamento := DaoCondicaoPagamento.CrieObjeto;
  umaDaoFuncionario       := DaoFuncionario.CrieObjeto;
  umaDaoUsuario           := DaoUsuario.CrieObjeto;
  umaDaoTransportadora    := DaoTransportadora.CrieObjeto;
  umaDaoContasPagar       := DaoContasPagar.CrieObjeto;
  umaContaPagar           := ContasPagar.CrieObjeto;
end;

destructor DaoCompra.Destrua_se;
begin
    inherited;
end;

function DaoCompra.Excluir(obj: TObject): string;
//var
//    umaCompra: Compra;
//    i : integer;
begin
//    umaCompra := Compra(obj);
//    with umDM do
//    begin
//        try
//            beginTrans;
//
//            QParcelas.SQL := UpdateParcelas.DeleteSQL;
//            QParcelas.Params.ParamByName('OLD_idcondicaopagamento').Value := umaCompra.getId;
//
//            QCompra.SQL := UpdateCompra.DeleteSQL;
//            QCompra.Params.ParamByName('OLD_idcondicaopagamento').Value := umaCompra.getId;
//
//            QParcelas.ExecSQL;
//            QCompra.ExecSQL;
//
//            Commit;
//            result := 'Compra excluído com sucesso!';
//        except
//            on e:Exception do
//            begin
//                rollback;
//                if pos('chave estrangeira',e.Message)>0 then
//                    result := 'Ocorreu um erro! O Compra não pode ser excluído pois ja está sendo usado pelo sistema.'
//                else
//                    result := 'Ocorreu um erro! Compra não foi excluído. Erro: '+e.Message;
//            end;
//        end;
//    end;
//    Self.AtualizaGrid;
end;

function DaoCompra.GetDS: TDataSource;
begin
    //-----Formatar Grid-----//
    umDM.QCompra.FieldByName('numnota').DisplayLabel := 'NN';
    umDM.QCompra.FieldByName('serienota').DisplayLabel := 'SN';

    umDM.QCompra.FieldByName('numnota').DisplayWidth := 5;
    umDM.QCompra.FieldByName('serienota').DisplayWidth := 5;

    umDM.QCompra.FieldByName('idcompra').Visible := False;

    (umDM.QCompra.FieldByName('base_icms') as TFloatField).DisplayFormat      := '0.00';
    (umDM.QCompra.FieldByName('valor_frete') as TFloatField).DisplayFormat    := '0.00';
    (umDM.QCompra.FieldByName('total_icms') as TFloatField).DisplayFormat     := '0.00';
    (umDM.QCompra.FieldByName('total_ipi') as TFloatField).DisplayFormat      := '0.00';
    (umDM.QCompra.FieldByName('valor_desconto') as TFloatField).DisplayFormat := '0.00';
    (umDM.QCompra.FieldByName('total_produto') as TFloatField).DisplayFormat  := '0.00';
    (umDM.QCompra.FieldByName('total_nota') as TFloatField).DisplayFormat     := '0.00';
    //----------------------//

    Self.AtualizaGrid;
    result := umDM.DSCompra;
end;

procedure DaoCompra.Ordena(campo: string);
begin
    umDM.QCompra.IndexFieldNames := campo;
end;

function DaoCompra.Salvar(obj: TObject): string;
var umaCompra : Compra;
    i         : Integer;
    cancelar  : Boolean;
    CP_Status : string;
    valor, numNotaAux, quantidade : Real;
begin
    umaCompra := Compra(obj);
    with umDM do
    begin
        try
            beginTrans;
            QCompra.Close;

             //Buscar a Conta a Pagar
            umaContaPagar.setNumNota(umaCompra.getNumNota);
            umaContaPagar.setSerieNota(umaCompra.getSerieNota);
            umaContaPagar.getUmFornecedor.setId(umaCompra.getUmFornecedor.getId);
            umaContaPagar.setStatus('PAGA');

            if umaCompra.getStatus = 'FINALIZADA' then
            begin
                umaContaPagar.setStatus('');
                if (umaDaoContasPagar.VerificarContas(umaContaPagar)) then
                begin
                   umaContaPagar.setStatus('CANCELADA');
                   if (not umaDaoContasPagar.VerificarContas(umaContaPagar)) then
                   begin
                     result := 'Esse Número, Série e Fornecedor da Nota já foram cadastrados no Contas a Pagar!';
                     Self.AtualizaGrid;
                     Exit;
                   end;
                end;
                QCompra.SQL := UpdateCompra.InsertSQL
            end
            else
            begin
                if (umaDaoContasPagar.VerificarContas(umaContaPagar)) then
                begin
                   result := 'Essa Compra não pode ser Cancelada pois 1 ou mais das parcelas ja foram pagas!';
                   Self.AtualizaGrid;
                   Exit;
                end;
                QCompra.SQL := UpdateCompra.ModifySQL;
                QCompra.Params.ParamByName('OLD_numnota').Value := umaCompra.getNumNota;
                QCompra.Params.ParamByName('OLD_serienota').Value := umaCompra.getSerieNota;
                QCompra.Params.ParamByName('OLD_idfornecedor').Value := umaCompra.getUmFornecedor.getId;
            end;
            QCompra.Params.ParamByName('numnota').Value := umaCompra.getNumNota;
            QCompra.Params.ParamByName('serienota').Value := umaCompra.getSerieNota;
            QCompra.Params.ParamByName('idfornecedor').Value := umaCompra.getUmFornecedor.getId;

            QCompra.Params.ParamByName('idusuario').Value := umaCompra.getUmUsuario.getIdUsuario;
            QCompra.Params.ParamByName('idcondicaopagamento').Value := umaCompra.getUmaCondicaoPagamento.getId;
            if (umaCompra.getUmaTransportadora.getId <> 0) then
              QCompra.Params.ParamByName('idtransportadora').Value := umaCompra.getUmaTransportadora.getId;
            QCompra.Params.ParamByName('tipofrete').Value := umaCompra.getTipoFrete;

            QCompra.Params.ParamByName('base_icms').Value := umaCompra.getBaseICMS;
            QCompra.Params.ParamByName('valor_frete').Value := umaCompra.getValorFrete;
            QCompra.Params.ParamByName('total_icms').Value := umaCompra.getTotalICMS;
            QCompra.Params.ParamByName('total_ipi').Value := umaCompra.getTotalIPI;
            QCompra.Params.ParamByName('valor_desconto').Value := umaCompra.getValorDesconto;
            QCompra.Params.ParamByName('total_produto').Value := umaCompra.getTotalProduto;
            QCompra.Params.ParamByName('total_nota').Value := umaCompra.getTotalNota;

            QCompra.Params.ParamByName('status').Value := umaCompra.getStatus;
            QCompra.Params.ParamByName('observacao').Value := umaCompra.getObservacao;
            QCompra.Params.ParamByName('dataemissao').Value := umaCompra.getDataEmissao;
            QCompra.Params.ParamByName('datacompra').Value := umaCompra.getDataCompra;
            QCompra.Params.ParamByName('datacadastro').Value := umaCompra.getDataCadastro;
            QCompra.Params.ParamByName('dataalteracao').Value := umaCompra.getDataAlteracao;

            QCompra.ExecSQL;

           if umaCompra.getIdCompra = 0 then
              begin
                QGenerica.Close;
                QGenerica.SQL.Text := 'Select last_value as idcompra from compra_idcompra_seq';
                QGenerica.Open;
                umaCompra.setIdCompra(QGenerica.Fields.FieldByName('idcompra').Value);
              end;

           numNotaAux := QProdutoCompranumnota.AsInteger; //Recupera o numNota da tabela relacional
           //Faz Relacao com os Itens da Compra
           for i := 1 to umaCompra.CountProdutos do
            begin
                if umaCompra.getStatus = 'FINALIZADA' then
                  begin
                    QProdutoCompra.SQL := UpdateProdutoCompra.InsertSQL;
                    cancelar := False;
                  end
                else
                  begin
                    QProdutoCompra.SQL := UpdateProdutoCompra.ModifySQL;
                    cancelar := True;
                  end;
                QProdutoCompra.Params.ParamByName('idcompra').Value := umaCompra.getIdCompra;
                QProdutoCompra.Params.ParamByName('numnota').Value := umaCompra.getNumNota;
                QProdutoCompra.Params.ParamByName('serienota').Value := umaCompra.getSerieNota;
                QProdutoCompra.Params.ParamByName('idfornecedor').Value := umaCompra.getUmFornecedor.getId;
                QProdutoCompra.Params.ParamByName('idproduto').Value := umaCompra.getProdutoCompra(i-1).getId;
                QProdutoCompra.Params.ParamByName('ncm_sh').Value := umaCompra.getProdutoCompra(i-1).getNCMSH;
                QProdutoCompra.Params.ParamByName('cst').Value := umaCompra.getProdutoCompra(i-1).getCST;
                QProdutoCompra.Params.ParamByName('cpof').Value := umaCompra.getProdutoCompra(i-1).getCPOF;
                QProdutoCompra.Params.ParamByName('unidade').Value := umaCompra.getProdutoCompra(i-1).getUnidadeCompra;
                QProdutoCompra.Params.ParamByName('quantidade').Value := umaCompra.getProdutoCompra(i-1).getQuantidadeCompra;

                QProdutoCompra.Params.ParamByName('precocusto').Value := umaCompra.getProdutoCompra(i-1).getValorUnitarioCompra;
                QProdutoCompra.Params.ParamByName('desconto').Value := umaCompra.getProdutoCompra(i-1).getDescontoCompra;
                QProdutoCompra.Params.ParamByName('valortotal').Value := umaCompra.getProdutoCompra(i-1).getValorTotalCompra;
                QProdutoCompra.Params.ParamByName('baseicms').Value := umaCompra.getProdutoCompra(i-1).getBaseIcmsCompra;
                QProdutoCompra.Params.ParamByName('valoricms').Value := umaCompra.getProdutoCompra(i-1).getValorIcmsCompra;
                QProdutoCompra.Params.ParamByName('valoripi').Value := umaCompra.getProdutoCompra(i-1).getValorIpiCompra;
                QProdutoCompra.Params.ParamByName('icms').Value := umaCompra.getProdutoCompra(i-1).getICMSCompra;
                QProdutoCompra.Params.ParamByName('ipi').Value := umaCompra.getProdutoCompra(i-1).getIPICompra;

                quantidade := umaCompra.getProdutoCompra(i-1).getQuantidade;
                if (cancelar) then
                begin                     //Diminui o estoque do produto correspondente
                  umaCompra.getProdutoCompra(i-1).setQuantidade( quantidade - umaCompra.getProdutoCompra(i-1).getQuantidadeCompra);
                  if(umaCompra.getProdutoCompra(i-1).getQuantidade = 0) then
                  begin
                    umaCompra.getProdutoCompra(i-1).setICMS(0);
                    umaCompra.getProdutoCompra(i-1).setIPI(0);
                    umaCompra.getProdutoCompra(i-1).setPrecoCompra(0);
                    umaCompra.getProdutoCompra(i-1).setICMSAnterior(0);
                    umaCompra.getProdutoCompra(i-1).setIPIAnterior(0);
                    umaCompra.getProdutoCompra(i-1).setPrecoCompraAnt(0);
                  end
                  else
                  begin
                    umaCompra.getProdutoCompra(i-1).setICMS(umaCompra.getProdutoCompra(i-1).getICMSAnterior);
                    umaCompra.getProdutoCompra(i-1).setIPI(umaCompra.getProdutoCompra(i-1).getIPIAnterior);
                  //umaCompra.getProdutoCompra(i-1).setPrecoCompra(umaCompra.getProdutoCompra(i-1).getPrecoCompraAnt);
                    umaCompra.getProdutoCompra(i-1).getPrecoCompra;
                  end;
                end
                else
                begin                     //Aumenta o estoque do produto correspondente
                  umaCompra.getProdutoCompra(i-1).setQuantidade( quantidade + umaCompra.getProdutoCompra(i-1).getQuantidadeCompra);
                  umaCompra.getProdutoCompra(i-1).setICMS(umaCompra.getProdutoCompra(i-1).getICMSCompra);
                  umaCompra.getProdutoCompra(i-1).setIPI(umaCompra.getProdutoCompra(i-1).getIPICompra);
                //umaCompra.getProdutoCompra(i-1).setPrecoCompra(umaCompra.getProdutoCompra(i-1).getValorUnitarioCompra);
                  umaCompra.getProdutoCompra(i-1).getPrecoCompra;
                end;

                umaDaoProduto.Salvar(umaCompra.getProdutoCompra(i-1));
                QProdutoCompra.ExecSQL;
            end;

            //Gerar as Contas a Pagar
            if (umaCompra.getTipo = True) then
              for i := 1 to umaCompra.CountParcelas  do
              begin
                if (umaCompra.getStatus <> 'FINALIZADA') and (not umaDaoContasPagar.VerificarContas(umaContaPagar)) then
                begin
                  QContasPagar.SQL := UpdateContasPagar.ModifySQL;
                  QContasPagar.Params.ParamByName('OLD_numnota').Value   := umaCompra.getNumNota;
                  QContasPagar.Params.ParamByName('OLD_serienota').Value := umaCompra.getSerieNota;
                  QContasPagar.Params.ParamByName('OLD_idfornecedor').Value := umaCompra.getUmFornecedor.getId;
                  QContasPagar.Params.ParamByName('OLD_numparcela').Value := umaCompra.getParcelas(i-1).getNumParcela;
                  CP_Status := 'CANCELADA';
                end
                else
                begin
                  QContasPagar.SQL := UpdateContasPagar.InsertSQL;
                  CP_Status := 'PENDENTE';
                end;

                QContasPagar.Params.ParamByName('idcompra').Value := umaCompra.getIdCompra;
                QContasPagar.Params.ParamByName('numnota').Value   := umaCompra.getNumNota;
                QContasPagar.Params.ParamByName('serienota').Value := umaCompra.getSerieNota;
                QContasPagar.Params.ParamByName('numparcela').Value  := umaCompra.getParcelas(i-1).getNumParcela;
                QContasPagar.Params.ParamByName('datavencimento').Value := DateToStr(Date + (umaCompra.getParcelas(i-1).getDias));

                valor := StrToFloat(FormatFloat('#0.00',(umaCompra.getParcelas(i-1).getPorcentagem/100) * umaCompra.getTotalNota));

                QContasPagar.Params.ParamByName('valor').Value  := valor;
                QContasPagar.Params.ParamByName('dataemissao').Value  := DateToStr(Date);
                QContasPagar.Params.ParamByName('status').Value := CP_Status;
                QContasPagar.Params.ParamByName('idfornecedor').Value  := umaCompra.getUmFornecedor.getId;
                QContasPagar.Params.ParamByName('idusuario').Value  := umaCompra.getUmUsuario.getIdUsuario;
                QContasPagar.Params.ParamByName('idformapagamento').Value := umaCompra.getUmaCondicaoPagamento.getUmaFormaPagamento.getId;

                QContasPagar.ExecSQL;
              end;
            Commit;
            if umaCompra.getStatus = 'CANCELADA' then
              result := 'Compra Cancelada com sucesso!'
            else
              result := 'Compra salva com sucesso!';
        except
          on e: Exception do
          begin
              rollback;
              if umaCompra.getStatus = 'CANCELADA' then
                Result := 'Ocorreu um erro! Compra não foi cancelada. Erro: '+e.Message
              else
                Result := 'Ocorreu um erro! Compra não foi salva. Erro: '+e.Message;
          end;
        end;
    end;
    Self.AtualizaGrid;
end;

end.
