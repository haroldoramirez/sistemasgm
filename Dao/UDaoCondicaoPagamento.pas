unit UDaoCondicaoPagamento;

interface
      uses uDao, DB, SysUtils, Messages, UCondicaoPagamento, UDaoFormaPagamento;
      type DaoCondicaoPagamento = class(Dao)
      private

      protected
         umCondicaoPagamento : CondicaoPagamento;
         umaDaoFormaPagamento : DaoFormaPagamento;
      public
          Constructor CrieObjeto;
          Destructor Destrua_se;
          function Salvar(obj:TObject): string;      override;
          function GetDS : TDataSource;              override;
          function Carrega(obj:TObject): TObject;    override;
          function Buscar(obj : TObject) : Boolean;  override;
          function Excluir(obj : TObject) : string ; override;
          procedure AtualizaGrid;
          procedure Ordena(campo: string);
end;

implementation

{ DaoCondicaoPagamento }

function DaoCondicaoPagamento.Buscar(obj: TObject): Boolean;
var
    prim: Boolean;
    sql, e, onde: string;
    umCondicaoPagamento: CondicaoPagamento;
begin
    e := ' and ';
    onde := ' where';
    prim := true;
    umCondicaoPagamento := CondicaoPagamento(obj);
    sql := 'select * from condicaopagamento';
    if umCondicaoPagamento.getId <> 0 then
    begin
        if prim then  //SE FOR O PRIMEIRO, SETA COMO FLAG COMO FALSO PQ É O PRIMEIRO
        begin
            prim := false;
            sql := sql+onde;
        end
        else //SE NAO, COLOCA CLAUSULA AND PARA JUNTAR CONDIÇOES
            sql := sql+e;
        sql := sql+' idcondicaopagamento = '+inttostr(umCondicaoPagamento.getId); //COLOCA CONDIÇAO NO SQL
    end;
    if umCondicaoPagamento.getDescricao <> '' then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' descricao like '+quotedstr('%'+umCondicaoPagamento.getDescricao+'%');
    end;
    if umCondicaoPagamento.getUmaFormaPagamento.getId <> 0 then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' idformapagamento = '+inttostr(umCondicaoPagamento.getUmaFormaPagamento.getId);
    end;
    with umDM do
    begin
        QCondicaoPagamento.Close;
        QCondicaoPagamento.sql.Text := sql+' order by idcondicaopagamento';
        QCondicaoPagamento.Open;
        if QCondicaoPagamento.RecordCount > 0 then
          result := True
        else
          result := false;
    end;
end;

procedure DaoCondicaoPagamento.AtualizaGrid;
begin
  with umDM do
    begin
        QCondicaoPagamento.Close;
        QCondicaoPagamento.sql.Text := 'select * from condicaopagamento order by idcondicaopagamento';
        QCondicaoPagamento.Open;
    end;
end;

function DaoCondicaoPagamento.Carrega(obj: TObject): TObject;
var
    umaCondicaoPagamento: CondicaoPagamento;
    I : Integer;
begin
    umaCondicaoPagamento := CondicaoPagamento(obj);
    with umDM do
    begin
        if not QCondicaoPagamento.Active then
            QCondicaoPagamento.Open;

        if umaCondicaoPagamento.getId <> 0 then
          begin
            QCondicaoPagamento.Close;
            QCondicaoPagamento.SQL.Text := 'select * from condicaopagamento where idcondicaopagamento = '+IntToStr(umaCondicaoPagamento.getId);
            QCondicaoPagamento.Open;
          end;

        umaCondicaoPagamento.setId(QCondicaoPagamentoidcondicaopagamento.AsInteger);
        umaCondicaoPagamento.setDescricao(QCondicaoPagamentodescricao.AsString);
        umaCondicaoPagamento.setDataCadastro(QCondicaoPagamentodatacadastro.AsDateTime);
        umaCondicaoPagamento.setDataAlteracao(QCondicaoPagamentodataalteracao.AsDateTime);

        // Busca a Forma de Pagamento referente ao Condicao de Pagamento
        umaCondicaoPagamento.getumaFormaPagamento.setId(QCondicaoPagamentoidformapagamento.AsInteger);
        umaDaoFormaPagamento.Carrega(umaCondicaoPagamento.getumaFormaPagamento);

        //Carrega as Parcelas
        QParcelas.Close;
        QParcelas.SQL.Text := 'select * from parcelas where idcondicaopagamento = '+IntToStr(umaCondicaoPagamento.getId);
        QParcelas.Open;
        QParcelas.First;

        for i := 0 to UmaCondicaoPagamento.P - 1 do
             UmaCondicaoPagamento.removeParcela;

        while not QParcelas.Eof do
          begin
            UmaCondicaoPagamento.addParcela;
            UmaCondicaoPagamento.getParcela.setNumParcela(QParcelasnumparcela.AsInteger);
            UmaCondicaoPagamento.getParcela.setDias(QParcelasnumdias.AsInteger);
            UmaCondicaoPagamento.getParcela.setPorcentagem(QParcelasporcentagem.AsFloat);
            QParcelas.Next;
          end;
    end;
    result := umCondicaoPagamento;
    Self.AtualizaGrid;
end;

constructor DaoCondicaoPagamento.CrieObjeto;
begin
    inherited;
    umaDaoFormaPagamento := DaoFormaPagamento.CrieObjeto;
end;

destructor DaoCondicaoPagamento.Destrua_se;
begin
    inherited;
end;

function DaoCondicaoPagamento.Excluir(obj: TObject): string;
var
    umaCondicaoPagamento: CondicaoPagamento;
    i : integer;
begin
    umaCondicaoPagamento := CondicaoPagamento(obj);
    with umDM do
    begin
        try
            beginTrans;

            QParcelas.SQL := UpdateParcelas.DeleteSQL;
            QParcelas.Params.ParamByName('OLD_idcondicaopagamento').Value := umaCondicaoPagamento.getId;

            QCondicaoPagamento.SQL := UpdateCondicaoPagamento.DeleteSQL;
            QCondicaoPagamento.Params.ParamByName('OLD_idcondicaopagamento').Value := umaCondicaoPagamento.getId;

            QParcelas.ExecSQL;
            QCondicaoPagamento.ExecSQL;

            Commit;
            result := 'CondicaoPagamento excluído com sucesso!';
        except
            on e:Exception do
            begin
                rollback;
                if pos('violates foreign key',e.Message)>0 then
                    result := 'Ocorreu um erro! O CondicaoPagamento não pode ser excluído pois ja está sendo usado pelo sistema.'
                else
                    result := 'Ocorreu um erro! CondicaoPagamento não foi excluído. Erro: '+e.Message;
            end;
        end;
    end;
    Self.AtualizaGrid;
end;

function DaoCondicaoPagamento.GetDS: TDataSource;
begin
      result := umDM.DSCondicaoPagamento;
end;

procedure DaoCondicaoPagamento.Ordena(campo: string);
begin
    umDM.QCondicaoPagamento.IndexFieldNames := campo;
end;

function DaoCondicaoPagamento.Salvar(obj: TObject): string;
var
    umaCondicaoPagamento : CondicaoPagamento;
    i : Integer;
begin
    umaCondicaoPagamento := CondicaoPagamento(obj);
    with umDM do
    begin
        try
            beginTrans;
            QCondicaoPagamento.Close;
            if umaCondicaoPagamento.getId = 0 then
                QCondicaoPagamento.SQL := UpdateCondicaoPagamento.InsertSQL
            else
            begin
                QParcelas.SQL := UpdateParcelas.DeleteSQL;
                QParcelas.Params.ParamByName('OLD_idcondicaopagamento').Value := umaCondicaoPagamento.getId;
                QParcelas.ExecSQL;

                QCondicaoPagamento.SQL := UpdateCondicaoPagamento.ModifySQL;
                QCondicaoPagamento.Params.ParamByName('OLD_idcondicaopagamento').Value := umaCondicaoPagamento.getId;
            end;
            QCondicaoPagamento.Params.ParamByName('descricao').Value := umaCondicaoPagamento.getDescricao;
            QCondicaoPagamento.Params.ParamByName('idformapagamento').Value := umaCondicaoPagamento.getUmaFormaPagamento.getId;
            QCondicaoPagamento.Params.ParamByName('datacadastro').Value := umaCondicaoPagamento.getDataCadastro;
            QCondicaoPagamento.Params.ParamByName('dataalteracao').Value := umaCondicaoPagamento.getDataAlteracao;
            QCondicaoPagamento.ExecSQL;

            if umaCondicaoPagamento.getId = 0 then
              begin
                QGenerica.Close;
                QGenerica.SQL.Text := 'Select last_value as idcondicaopagamento from idcondicaopagamento_seq';
                QGenerica.Open;
                umaCondicaoPagamento.setId(QGenerica.Fields.FieldByName('idcondicaopagamento').Value);
              end;

            for i := 0 to umaCondicaoPagamento.p - 1 do
              begin
//                  if not QParcelas.Active then
//                      QParcelas.Open;
                  QParcelas.SQL := UpdateParcelas.InsertSQL;
                  QParcelas.Params.ParamByName('idcondicaopagamento').Value := umaCondicaoPagamento.getId;
                  QParcelas.Params.ParamByName('numparcela').Value := umaCondicaoPagamento.getParcela(i).getNumParcela;
                  QParcelas.Params.ParamByName('numdias').Value := umaCondicaoPagamento.getParcela(i).getDias;
                  QParcelas.Params.ParamByName('porcentagem').Value := umaCondicaoPagamento.getParcela(i).getPorcentagem;
                  QParcelas.ExecSQL;
              end;

            Commit;
            result := 'Condição de Pagamento salva com sucesso!';
        except
          on e: Exception do
          begin
              rollback;
              Result := 'Ocorreu um erro! A Condição de Pagamento não foi salva. Erro: '+e.Message;
          end;
        end;
    end;
    Self.AtualizaGrid;
end;

end.
