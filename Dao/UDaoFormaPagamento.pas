unit UDaoFormaPagamento;

interface
      uses uDao, DB, SysUtils, Messages, uFormaPagamento;
      type DaoFormaPagamento = class(Dao)
      private

      protected
         umFormaPagamento : FormaPagamento;
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

{ DaoFormaPagamento }

function DaoFormaPagamento.Buscar(obj: TObject): Boolean;
var
    prim: Boolean;
    sql, e, onde: string;
    umFormaPagamento: FormaPagamento;
begin
    e := ' and ';
    onde := ' where';
    prim := true;
    umFormaPagamento := FormaPagamento(obj);
    sql := 'select * from formapagamento';
    if umFormaPagamento.getId <> 0 then
    begin
        if prim then  //SE FOR O PRIMEIRO, SETA COMO FLAG COMO FALSO PQ É O PRIMEIRO
        begin
            prim := false;
            sql := sql+onde;
        end
        else //SE NAO, COLOCA CLAUSULA AND PARA JUNTAR CONDIÇOES
            sql := sql+e;
        sql := sql+' idformapagamento = '+inttostr(umFormaPagamento.getId); //COLOCA CONDIÇAO NO SQL
    end;
    if umFormaPagamento.getDescricao <> '' then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' descricao like '+quotedstr('%'+umFormaPagamento.getDescricao+'%');
    end;
    with umDM do
    begin
        QFormaPagamento.Close;
        QFormaPagamento.sql.Text := sql;
        QFormaPagamento.Open;
        if QFormaPagamento.RecordCount > 0 then
          result := True
        else
          result := false;
    end;
end;

procedure DaoFormaPagamento.AtualizaGrid;
begin
  with umDM do
    begin
        QFormaPagamento.Close;
        QFormaPagamento.sql.Text := 'select * from formapagamento order by idformapagamento';
        QFormaPagamento.Open;
    end;
end;

function DaoFormaPagamento.Carrega(obj: TObject): TObject;
var
    umFormaPagamento: FormaPagamento;
begin
    umFormaPagamento := FormaPagamento(obj);
    with umDM do
    begin
        if not QFormaPagamento.Active then
            QFormaPagamento.Open;

        if umFormaPagamento.getId <> 0 then
          begin
            QFormaPagamento.Close;
            QFormaPagamento.SQL.Text := 'select * from formapagamento where idformapagamento = '+IntToStr(umFormaPagamento.getId);
            QFormaPagamento.Open;
          end;

        umFormaPagamento.setId(QFormaPagamentoidformapagamento.AsInteger);
        umFormaPagamento.setDescricao(QFormaPagamentodescricao.AsString);
        umFormaPagamento.setDataCadastro(QFormaPagamentodatacadastro.AsDateTime);
        umFormaPagamento.setDataAlteracao(QFormaPagamentodataalteracao.AsDateTime);
    end;
    result := umFormaPagamento;
    Self.AtualizaGrid;
end;

constructor DaoFormaPagamento.CrieObjeto;
begin
    inherited;
end;

destructor DaoFormaPagamento.Destrua_se;
begin
    inherited;
end;

function DaoFormaPagamento.Excluir(obj: TObject): string;
var
    umFormaPagamento: FormaPagamento;
begin
    umFormaPagamento := FormaPagamento(obj);
    with umDM do
    begin
        try
            beginTrans;
            QFormaPagamento.SQL := UpdateFormaPagamento.DeleteSQL;
            QFormaPagamento.Params.ParamByName('OLD_idformapagamento').Value := umFormaPagamento.getId;
            QFormaPagamento.ExecSQL;
            Commit;
            result := 'Forma de Pagamento excluído com sucesso!';
        except
            on e:Exception do
            begin
                rollback;
                if pos('chave estrangeira',e.Message)>0 then
                    result := 'Ocorreu um erro! O Forma de Pagamento não pode ser excluído pois ja está sendo usado pelo sistema.'
                else
                    result := 'Ocorreu um erro! Forma de Pagamento não foi excluído. Erro: '+e.Message;
            end;
        end;
    end;
    Self.AtualizaGrid;
end;

function DaoFormaPagamento.GetDS: TDataSource;
begin
  umDM.QFormaPagamento.FieldByName('descricao').DisplayWidth := 50;
  umDM.QFormaPagamento.FieldByName('datacadastro').DisplayWidth := 7;
  umDM.QFormaPagamento.FieldByName('dataalteracao').DisplayWidth := 7;
  Self.AtualizaGrid;
  result := umDM.DSFormaPagamento;
end;

procedure DaoFormaPagamento.Ordena(campo: string);
begin
    umDM.QFormaPagamento.IndexFieldNames := campo;
end;

function DaoFormaPagamento.Salvar(obj: TObject): string;
var
    umFormaPagamento : FormaPagamento;
begin
    umFormaPagamento := FormaPagamento(obj);
    with umDM do
    begin
        try
            beginTrans;
            QFormaPagamento.Close;
            if umFormaPagamento.getId = 0 then
                QFormaPagamento.SQL := UpdateFormaPagamento.InsertSQL
            else
            begin
                QFormaPagamento.SQL := UpdateFormaPagamento.ModifySQL;
                QFormaPagamento.Params.ParamByName('OLD_idformapagamento').Value := umFormaPagamento.getId;
            end;
            QFormaPagamento.Params.ParamByName('descricao').Value := umFormaPagamento.getDescricao;
            QFormaPagamento.Params.ParamByName('datacadastro').Value := umFormaPagamento.getDataCadastro;
            QFormaPagamento.Params.ParamByName('dataalteracao').Value := umFormaPagamento.getDataAlteracao;

            QFormaPagamento.ExecSQL;
            Commit;
            result := 'Forma de Pagamento salvo com sucesso!';
        except
          on e: Exception do
          begin
              rollback;
              Result := 'Ocorreu um erro! Forma de Pagamento não foi salvo. Erro: '+e.Message;
          end;
        end;
    end;
    Self.AtualizaGrid;
end;

end.
