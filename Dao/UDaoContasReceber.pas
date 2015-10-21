unit UDaoContasReceber;

interface
      uses uDao, DB, SysUtils, Messages, UContasReceber, UDaoCliente,
      UDaoFormaPagamento, UDaoUsuario;
      type DaoContasReceber = class(Dao)
      private

      protected
         umaContasReceber : ContasReceber;
         umaDaoCliente : DaoCliente;
         umaDaoUsuario : DaoUsuario;
         umaDaoFormaPagamento : DaoFormaPagamento;
      public
          Constructor CrieObjeto;
          Destructor Destrua_se;
          function Salvar(obj:TObject): string;      override;
          function GetDS : TDataSource;              override;
          function Carrega(obj:TObject): TObject;    override;
          function Buscar(obj : TObject) : Boolean;  override;
          function Excluir(obj : TObject) : string ; override;
          function VerificarNota (obj : TObject) : Boolean;
          function VerificarContas (obj : TObject) : Boolean;
          function VerificarParcelas (obj : TObject) : Boolean;
          procedure VerificarVenda (obj : TObject);
          function ContarContasReceber(obj : TObject) : Integer;
          procedure AtualizaGrid;
          procedure Ordena(campo: string);
end;

implementation

uses UVenda, UCtrlVenda;

{ DaoContasReceber }

function DaoContasReceber.Buscar(obj: TObject): Boolean;
var
    prim: Boolean;
    sql, e, onde: string;
    umaContasReceber: ContasReceber;
begin
    e := ' and ';
    onde := ' where';
    prim := true;
    umaContasReceber := ContasReceber(obj);
    sql := 'select * from contareceber conta';
    if umaContasReceber.getUmCliente.getNome_RazaoSoCial <> '' then
    begin
        //Buscar a descricao do cliente na tabela cliente
        sql := sql+' INNER JOIN cliente c ON conta.idcliente = c.idcliente and c.nome_razaosocial like '+quotedstr('%'+umaContasReceber.getUmCliente.getNome_RazaoSoCial+'%');
        if (prim) and (umaContasReceber.getStatus <> '')then
         begin
            prim := false;
            sql := sql+onde;
        end
    end;
    if umaContasReceber.getStatus <> '' then
    begin
        if prim then
        begin
            prim := false;
            sql := sql+onde;
        end;
        sql := sql+' conta.status like '+quotedstr('%'+umaContasReceber.getStatus+'%'); //COLOCA CONDIÇAO NO SQL
    end;
    if (DateToStr(umaContasReceber.getDataEmissao) <> '30/12/1899') and (datetostr(umaContasReceber.getDataPagamento) <> '30/12/1899') then
    begin
        if prim then
        begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' dataemissao between '+QuotedStr(DateToStr(umaContasReceber.getDataEmissao))+' and '+QuotedStr(DateToStr(umaContasReceber.getDataPagamento));
    end;

    with umDM do
    begin
        QContasReceber.Close;
        QContasReceber.sql.Text := sql+' order by numnota, serienota, numparcela';
        QContasReceber.Open;
        if QContasReceber.RecordCount > 0 then
          result := True
        else
          result := false;
    end;
end;

function DaoContasReceber.VerificarNota(obj: TObject): Boolean;
var sql : string;
    umaContaReceber : ContasReceber;
    i : integer;
begin
  umaContaReceber := ContasReceber(obj);
  for i := 1 to 2 do
  begin
    if i = 1 then
      umaContaReceber.setStatus('RECEBIDA')
    else
      umaContaReceber.setStatus('PENDENTE');

    sql := 'select * from contareceber where numnota = '+IntToStr(umaContaReceber.getNumNota)+' and serienota = '''+umaContaReceber.getSerieNota+ ''' and idcliente = '+IntToStr(umaContaReceber.getUmCliente.getId)+' and status = '''+umaContaReceber.getStatus+'''';
    with umDM do
    begin
      QContasReceber.Close;
      QContasReceber.sql.Text := sql+' order by numnota, serienota, numparcela';
      QContasReceber.Open;
      if QContasReceber.RecordCount > 0 then
      begin
        result := True;
        Self.AtualizaGrid;
        Exit;
      end
      else
        result := false;
    end;
  end;
  Self.AtualizaGrid;
end;

procedure DaoContasReceber.VerificarVenda (obj : TObject);
var umaCtrlVenda : CtrlVenda;
    umaVenda     : Venda;
begin
  umaContasReceber := ContasReceber(obj);
  umaCtrlVenda     := CtrlVenda.CrieObjeto;
  umaVenda         := Venda.CrieObjeto;
  umaVenda.setNumNota(umaContasReceber.getNumNota);
  umaVenda.setSerieNota(umaContasReceber.getSerieNota);
  if (umaCtrlVenda.VerificarNota(umaVenda)) then
  begin
    umaCtrlVenda.Carrega(umaVenda);
    umaVenda.setStatus('CANCELADA');
    umaVenda.setTipo(False);
    umaCtrlVenda.Salvar(umaVenda)
  end;
end;

function DaoContasReceber.VerificarContas(obj: TObject): Boolean;
var sql : string;
    umaContaReceber : ContasReceber;
    i : Integer;
begin
  umaContaReceber := ContasReceber(obj);
  sql := 'select * from contareceber where numnota = '+IntToStr(umaContaReceber.getNumNota)+' and serienota = '''+umaContaReceber.getSerieNota+ ''' and status = '''+umaContaReceber.getStatus+'''';
  with umDM do
  begin
    QContasReceber.Close;
    QContasReceber.sql.Text := sql+' order by numnota, serienota, numparcela';
    QContasReceber.Open;
    if QContasReceber.RecordCount > 0 then
      result := True
    else
      result := false;
  end;
  Self.AtualizaGrid;
end;

function DaoContasReceber.VerificarParcelas (obj : TObject) : Boolean;
var umaContaReceber : ContasReceber;
begin
  umaContaReceber := ContasReceber(obj);

  with umDM do
  begin
    QContasReceber.Close;
    QContasReceber.sql.Text := 'select * from contareceber where numnota = '+IntToStr(umaContaReceber.getNumNota)+' and serienota = '''+umaContaReceber.getSerieNota+ ''' order by numparcela';;
    QContasReceber.Open;

    while not QContasReceber.Eof do
    begin
      if (QContasReceberstatus.AsString = 'PENDENTE') then
        if(umaContaReceber.getNumParcela = QContasRecebernumparcela.AsInteger) then
        begin
          Result := True;
          Break;
        end
        else
        begin
          Result := False;
          Break;
        end;
        QContasReceber.Next;
    end;
    Self.AtualizaGrid;
  end;
end;

function DaoContasReceber.ContarContasReceber(obj : TObject) : Integer;
var count : Integer;
begin
  count := 0;
  umaContasReceber := ContasReceber(obj);
  with umDM do
  begin
    QContasReceber.Close;
    QContasReceber.SQL.Text := 'select * from contareceber where numnota = '+IntToStr(umaContasReceber.getNumNota)+ ' and serienota = '''+umaContasReceber.getSerieNota+'''';
    QContasReceber.Open;
    QContasReceber.First;

    if umaContasReceber.CountParcelas <> 0 then
      umaContasReceber.LimparListaParcelas;

    while not QContasReceber.Eof do
    begin
    count := count + 1;
    umaContasReceber.CrieObjetoParcela;
    umaContasReceber.addParcelas(umaContasReceber.getUmaParcelas);
    umaContasReceber.getParcelas(count-1).setNumParcela(QContasRecebernumparcela.AsInteger);
    QContasReceber.Next;
    end;
  end;
  Result := count;
end;

procedure DaoContasReceber.AtualizaGrid;
begin
  with umDM do
  begin
    QContasReceber.Close;
    QContasReceber.sql.Text := 'select * from contareceber order by numnota, serienota, numparcela';
    QContasReceber.Open;
  end;
end;

function DaoContasReceber.Carrega(obj: TObject): TObject;
var
    umaContasReceber: ContasReceber;
begin
    umaContasReceber := ContasReceber(obj);
    with umDM do
    begin
        if not QContasReceber.Active then
            QContasReceber.Open;
//
//        if umaContasReceber.getId <> 0 then
//          begin
//            QContasReceber.Close;
//            QContasReceber.SQL.Text := 'select * from estado where idestado = '+IntToStr(umaContasReceber.getId);
//            QContasReceber.Open;
//          end;
//
        umaContasReceber.setNumNota(QContasRecebernumnota.AsInteger);
        umaContasReceber.setSerieNota(QContasReceberserienota.AsString);
        umaContasReceber.setNumParcela(QContasRecebernumparcela.AsInteger);
        umaContasReceber.setDataEmissao(QContasReceberdataemissao.AsDateTime);
        umaContasReceber.setDataVencimento(QContasReceberdatavencimento.AsDateTime);
        umaContasReceber.setDataPagamento(QContasReceberdatapagamento.AsDateTime);
        umaContasReceber.setValor(QContasRecebervalor.AsFloat);
        umaContasReceber.setMulta(QContasRecebermulta.AsFloat);
        umaContasReceber.setJuros(QContasReceberjuros.AsFloat);
        umaContasReceber.setDesconto(QContasReceberdesconto.AsFloat);
        umaContasReceber.setStatus(QContasReceberstatus.AsString);
        umaContasReceber.setObservacao(QContasReceberobservacao.AsString);

        // Busca o Cliente referente ao ContasReceber
        umaContasReceber.getUmCliente.setId(QContasReceberidcliente.AsInteger);
        umaDaoCliente.Carrega(umaContasReceber.getUmCliente);

        // Busca o Usuario referente ao ContasReceber
        umaContasReceber.getUmUsuario.setIdUsuario(QContasReceberidusuario.AsInteger);
        umaDaoUsuario.Carrega(umaContasReceber.getUmUsuario);

        // Busca a Forma de Pagamento referente ao ContasReceber
        umaContasReceber.getUmaFormaPagamento.setId(QContasReceberidformapagamento.AsInteger);
        umaDaoFormaPagamento.Carrega(umaContasReceber.getUmaFormaPagamento);

        //Cria uma Parcela referente a que foi selecionada na grid apenas para percorrer o FOR na hora de salvar
        umaContasReceber.getUmaCondicaoPagamento.addParcela;
        umaContasReceber.addParcelas(umaContasReceber.getUmaCondicaoPagamento.getParcela);
    end;
    result := umaContasReceber;
    Self.AtualizaGrid;
end;

constructor DaoContasReceber.CrieObjeto;
begin
  inherited;
  umaDaoCliente        := DaoCliente.CrieObjeto;
  umaDaoUsuario        := DaoUsuario.CrieObjeto;
  umaDaoFormaPagamento := DaoFormaPagamento.CrieObjeto;
end;

destructor DaoContasReceber.Destrua_se;
begin
    inherited;
end;

function DaoContasReceber.Excluir(obj: TObject): string;
var
    umaContasReceber: ContasReceber;
begin
//    umaContasReceber := ContasReceber(obj);
//    with umDM do
//    begin
//        try
//            beginTrans;
//            QContasReceber.SQL := UpdateContasReceber.DeleteSQL;
//            QContasReceber.Params.ParamByName('OLD_idestado').Value := umaContasReceber.getId;
//            QContasReceber.ExecSQL;
//            Commit;
//            result := 'ContasReceber excluído com sucesso!';
//        except
//            on e:Exception do
//            begin
//                rollback;
//                if pos('chave estrangeira',e.Message)>0 then
//                    result := 'Ocorreu um erro! O ContasReceber não pode ser excluído pois ja está sendo usado pelo sistema.'
//                else
//                    result := 'Ocorreu um erro! ContasReceber não foi excluído. Erro: '+e.Message;
//            end;
//        end;
//    end;
//    Self.AtualizaGrid;
end;

function DaoContasReceber.GetDS: TDataSource;
begin
    //------Formatar Grid--------//
    (umDM.QContasReceber.FieldByName('valor') as TFloatField).DisplayFormat := '0.00'; //Formatar o campo valor do tipo Float
    (umDM.QContasReceber.FieldByName('juros') as TFloatField).DisplayFormat := '0.00';
    (umDM.QContasReceber.FieldByName('multa') as TFloatField).DisplayFormat := '0.00';
    (umDM.QContasReceber.FieldByName('desconto') as TFloatField).DisplayFormat := '0.00';

    umDM.QContasReceber.FieldByName('numnota').DisplayLabel := 'NN';
    umDM.QContasReceber.FieldByName('serienota').DisplayLabel := 'SN';
    umDM.QContasReceber.FieldByName('numparcela').DisplayLabel := 'P';

    umDM.QContasReceber.FieldByName('numnota').DisplayWidth := 5;
    umDM.QContasReceber.FieldByName('serienota').DisplayWidth := 5;
    umDM.QContasReceber.FieldByName('numparcela').DisplayWidth := 5;

    umDM.QContasReceber.FieldByName('valor').DisplayWidth := 10;
    umDM.QContasReceber.FieldByName('multa').DisplayWidth := 5;
    umDM.QContasReceber.FieldByName('juros').DisplayWidth := 5;
    umDM.QContasReceber.FieldByName('desconto').DisplayWidth := 5;

   //-----------------------------//
    AtualizaGrid;
    result := umDM.DSContasReceber;
end;

procedure DaoContasReceber.Ordena(campo: string);
begin
    umDM.QContasReceber.IndexFieldNames := campo;
end;

function DaoContasReceber.Salvar(obj: TObject): string;
var  umaContasReceber : ContasReceber;
     i, countParcelas, numParcela : Integer;
     valor : Real;
     status : string;
     cancelar : Boolean;
begin
  umaContasReceber := ContasReceber(obj);
  with umDM do
  begin
    try
      beginTrans;
      QContasReceber.Close;

      if (umaContasReceber.getStatus = 'CANCELADA' ) then
      begin
        countParcelas := ContarContasReceber(umaContasReceber);
        status := umaContasReceber.getStatus;
        cancelar := True;
      end
      else
      begin
        countParcelas := umaContasReceber.CountParcelas;
        status := umaContasReceber.getStatus;
        cancelar := False;
      end;

      for i := 1 to countParcelas do
      begin
        if (cancelar) then
          numParcela := umaContasReceber.getParcelas(i-1).getNumParcela
        else
          numParcela := umaContasReceber.getNumParcela;

        if umaContasReceber.getStatus = 'PENDENTE' then
          QContasReceber.SQL := UpdateContasReceber.InsertSQL
        else
        begin
          QContasReceber.SQL := UpdateContasReceber.ModifySQL;
          QContasReceber.Params.ParamByName('OLD_numnota').Value := umaContasReceber.getNumNota;
          QContasReceber.Params.ParamByName('OLD_serienota').Value := umaContasReceber.getSerieNota;
          QContasReceber.Params.ParamByName('OLD_numparcela').Value := numParcela;
        end;
        QContasReceber.Params.ParamByName('numnota').Value := umaContasReceber.getNumNota;
        QContasReceber.Params.ParamByName('serienota').Value := umaContasReceber.getSerieNota;
        QContasReceber.Params.ParamByName('idcliente').Value := umaContasReceber.getUmCliente.getId;
        QContasReceber.Params.ParamByName('idusuario').Value := umaContasReceber.getUmUsuario.getIdUsuario;
        QContasReceber.Params.ParamByName('idformapagamento').Value := umaContasReceber.getUmaFormaPagamento.getId;
        QContasReceber.Params.ParamByName('multa').Value := umaContasReceber.getMulta;
        QContasReceber.Params.ParamByName('juros').Value := umaContasReceber.getJuros;
        QContasReceber.Params.ParamByName('desconto').Value := umaContasReceber.getDesconto;
        QContasReceber.Params.ParamByName('status').Value := status;
        QContasReceber.Params.ParamByName('observacao').Value := umaContasReceber.getObservacao;
        QContasReceber.Params.ParamByName('dataemissao').Value := umaContasReceber.getDataEmissao;
        if (umaContasReceber.getDataPagamento <> StrToDateTime('30/12/1899')) then
          QContasReceber.Params.ParamByName('datapagamento').Value := umaContasReceber.getDataPagamento;

        if umaContasReceber.getStatus = 'PENDENTE' then
        begin
          QContasReceber.Params.ParamByName('numparcela').Value := umaContasReceber.getParcelas(i-1).getNumParcela;
          valor := StrToFloat(FormatFloat('#0.00',(umaContasReceber.getParcelas(i-1).getPorcentagem/100) * umaContasReceber.getTotalAux));
          QContasReceber.Params.ParamByName('valor').Value := valor;
          QContasReceber.Params.ParamByName('datavencimento').Value := DateToStr(Date + umaContasReceber.getParcelas(i-1).getDias);
        end
        else
        begin
          QContasReceber.Params.ParamByName('numparcela').Value := numParcela;
          QContasReceber.Params.ParamByName('valor').Value := umaContasReceber.getValor;
          QContasReceber.Params.ParamByName('datavencimento').Value := umaContasReceber.getDataVencimento;
        end;
        QContasReceber.ExecSQL;
      end;
      //Chamada para o cancelamento da compra quando uma contas a receber for cancelada pela propria tela
      if (status = 'CANCELADA') then
        Self.VerificarVenda(umaContasReceber);

      Commit;
      if umaContasReceber.getStatus = 'CANCELADA' then
        result := 'Conta Cancelada com sucesso!'
      else
        result := 'Conta Recebida com sucesso!';
    except
      on e: Exception do
      begin
          rollback;
          if umaContasReceber.getStatus = 'CANCELADA' then
            Result := 'Ocorreu um erro! Essa Conta não foi cancelada. Erro: '+e.Message
          else
            Result := 'Ocorreu um erro! Essa Conta não foi salva. Erro: '+e.Message;

      end;
    end;
  end;
  Self.AtualizaGrid;
end;

end.
