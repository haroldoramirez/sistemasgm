unit UDaoCategoria;

interface
      uses uDao, DB, SysUtils, Messages, uCategoria;
      type DaoCategoria = class(Dao)
      private

      protected
         umCategoria : Categoria;
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

{ DaoCategoria }

function DaoCategoria.Buscar(obj: TObject): Boolean;
var
    prim: Boolean;
    sql, e, onde: string;
    umCategoria: Categoria;
begin
    e := ' and ';
    onde := ' where';
    prim := true;
    umCategoria := Categoria(obj);
    sql := 'select * from categoria';
    if umCategoria.getId <> 0 then
    begin
        if prim then  //SE FOR O PRIMEIRO, SETA COMO FLAG COMO FALSO PQ É O PRIMEIRO
        begin
            prim := false;
            sql := sql+onde;
        end
        else //SE NAO, COLOCA CLAUSULA AND PARA JUNTAR CONDIÇOES
            sql := sql+e;
        sql := sql+' idcategoria = '+inttostr(umCategoria.getId); //COLOCA CONDIÇAO NO SQL
    end;
    if umCategoria.getDescricao <> '' then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' descricao like '+quotedstr('%'+umCategoria.getDescricao+'%');
    end;
    with umDM do
    begin
        QCategoria.Close;
        QCategoria.sql.Text := sql;
        QCategoria.Open;
        if QCategoria.RecordCount > 0 then
          result := True
        else
          result := false;
    end;
end;

procedure DaoCategoria.AtualizaGrid;
begin
  with umDM do
    begin
        QCategoria.Close;
        QCategoria.sql.Text := 'select * from categoria order by idcategoria';
        QCategoria.Open;
    end;
end;

function DaoCategoria.Carrega(obj: TObject): TObject;
var
    umCategoria: Categoria;
begin
    umCategoria := Categoria(obj);
    with umDM do
    begin
        if not QCategoria.Active then
            QCategoria.Open;

        if umCategoria.getId <> 0 then
          begin
            QCategoria.Close;
            QCategoria.SQL.Text := 'select * from categoria where idcategoria = '+IntToStr(umCategoria.getId);
            QCategoria.Open;
          end;

        umCategoria.setId(QCategoriaidcategoria.AsInteger);
        umCategoria.setDescricao(QCategoriadescricao.AsString);
        umCategoria.setDataCadastro(QCategoriadatacadastro.AsDateTime);
        umCategoria.setDataAlteracao(QCategoriadataalteracao.AsDateTime);
    end;
    result := umCategoria;
    Self.AtualizaGrid;
end;

constructor DaoCategoria.CrieObjeto;
begin
    inherited;
end;

destructor DaoCategoria.Destrua_se;
begin
    inherited;
end;

function DaoCategoria.Excluir(obj: TObject): string;
var
    umCategoria: Categoria;
begin
    umCategoria := Categoria(obj);
    with umDM do
    begin
        try
            beginTrans;
            QCategoria.SQL := UpdateCategoria.DeleteSQL;
            QCategoria.Params.ParamByName('OLD_idcategoria').Value := umCategoria.getId;
            QCategoria.ExecSQL;
            Commit;
            result := 'Categoria excluído com sucesso!';
        except
            on e:Exception do
            begin
                rollback;
                if pos('chave estrangeira',e.Message)>0 then
                    result := 'Ocorreu um erro! O Categoria não pode ser excluído pois ja está sendo usado pelo sistema.'
                else
                    result := 'Ocorreu um erro! Categoria não foi excluído. Erro: '+e.Message;
            end;
        end;
    end;
    Self.AtualizaGrid;
end;

function DaoCategoria.GetDS: TDataSource;
begin
  Self.AtualizaGrid;
  umDM.QCategoria.FieldByName('idcategoria').DisplayWidth := 5;
  umDM.QCategoria.FieldByName('descricao').DisplayWidth := 60;
  umDM.QCategoria.FieldByName('datacadastro').DisplayWidth := 15;
  umDM.QCategoria.FieldByName('dataalteracao').DisplayWidth := 15;
  result := umDM.DSCategoria;
end;

procedure DaoCategoria.Ordena(campo: string);
begin
    umDM.QCategoria.IndexFieldNames := campo;
end;

function DaoCategoria.Salvar(obj: TObject): string;
var
    umCategoria : Categoria;
begin
    umCategoria := Categoria(obj);
    with umDM do
    begin
        try
            beginTrans;
            QCategoria.Close;
            if umCategoria.getId = 0 then
                QCategoria.SQL := UpdateCategoria.InsertSQL
            else
            begin
                QCategoria.SQL := UpdateCategoria.ModifySQL;
                QCategoria.Params.ParamByName('OLD_idcategoria').Value := umCategoria.getId;
            end;
            QCategoria.Params.ParamByName('descricao').Value := umCategoria.getDescricao;
            QCategoria.Params.ParamByName('datacadastro').Value := umCategoria.getDataCadastro;
            QCategoria.Params.ParamByName('dataalteracao').Value := umCategoria.getDataAlteracao;

            QCategoria.ExecSQL;
            Commit;
            result := 'Categoria salvo com sucesso!';
        except
          on e: Exception do
          begin
              rollback;
              Result := 'Ocorreu um erro! Páis não foi salvo. Erro: '+e.Message;
          end;
        end;
    end;
    Self.AtualizaGrid;
end;

end.
