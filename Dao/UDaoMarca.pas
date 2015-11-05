unit UDaoMarca;

interface
      uses uDao, DB, SysUtils, Messages, uMarca;
      type DaoMarca = class(Dao)
      private

      protected
         umMarca : Marca;
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

{ DaoMarca }

function DaoMarca.Buscar(obj: TObject): Boolean;
var
    prim: Boolean;
    sql, e, onde: string;
    umMarca: Marca;
begin
    e := ' and ';
    onde := ' where';
    prim := true;
    umMarca := Marca(obj);
    sql := 'select * from marca';
    if umMarca.getId <> 0 then
    begin
        if prim then  //SE FOR O PRIMEIRO, SETA COMO FLAG COMO FALSO PQ É O PRIMEIRO
        begin
            prim := false;
            sql := sql+onde;
        end
        else //SE NAO, COLOCA CLAUSULA AND PARA JUNTAR CONDIÇOES
            sql := sql+e;
        sql := sql+' idmarca = '+inttostr(umMarca.getId); //COLOCA CONDIÇAO NO SQL
    end;
    if umMarca.getDescricao <> '' then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' descricao like '+quotedstr('%'+umMarca.getDescricao+'%');
    end;
    with umDM do
    begin
        QMarca.Close;
        QMarca.sql.Text := sql+' order by idmarca';
        QMarca.Open;
        if QMarca.RecordCount > 0 then
          result := True
        else
          result := false;
    end;
end;

procedure DaoMarca.AtualizaGrid;
begin
  with umDM do
    begin
        QMarca.Close;
        QMarca.sql.Text := 'select * from marca order by idmarca';
        QMarca.Open;
    end;
end;

function DaoMarca.Carrega(obj: TObject): TObject;
var
    umMarca: Marca;
begin
    umMarca := Marca(obj);
    with umDM do
    begin
        if not QMarca.Active then
            QMarca.Open;

        if umMarca.getId <> 0 then
          begin
            QMarca.Close;
            QMarca.SQL.Text := 'select * from marca where idmarca = '+IntToStr(umMarca.getId);
            QMarca.Open;
          end;

        umMarca.setId(QMarcaidmarca.AsInteger);
        umMarca.setDescricao(QMarcadescricao.AsString);
        umMarca.setDataCadastro(QMarcadatacadastro.AsDateTime);
        umMarca.setDataAlteracao(QMarcadataalteracao.AsDateTime);
    end;
    result := umMarca;
    Self.AtualizaGrid;
end;

constructor DaoMarca.CrieObjeto;
begin
    inherited;
end;

destructor DaoMarca.Destrua_se;
begin
    inherited;
end;

function DaoMarca.Excluir(obj: TObject): string;
var
    umMarca: Marca;
begin
    umMarca := Marca(obj);
    with umDM do
    begin
        try
            beginTrans;
            QMarca.SQL := UpdateMarca.DeleteSQL;
            QMarca.Params.ParamByName('OLD_idmarca').Value := umMarca.getId;
            QMarca.ExecSQL;
            Commit;
            result := 'Marca excluída com sucesso!';
        except
            on e:Exception do
            begin
                rollback;
                if pos('violates foreign key',e.Message)> 0 then
                    result := 'Ocorreu um erro! A Marca não pode ser excluída pois ja está sendo usado pelo sistema.'
                else
                    result := 'Ocorreu um erro! Marca não foi excluída. Erro: '+e.Message;
            end;
        end;
    end;
    Self.AtualizaGrid;
end;

function DaoMarca.GetDS: TDataSource;
begin
  Self.AtualizaGrid;
  umDM.QMarca.FieldByName('idmarca').DisplayWidth := 5;
  umDM.QMarca.FieldByName('descricao').DisplayWidth := 60;
  umDM.QMarca.FieldByName('datacadastro').DisplayWidth := 15;
  umDM.QMarca.FieldByName('dataalteracao').DisplayWidth := 15;
  result := umDM.DSMarca;
end;

procedure DaoMarca.Ordena(campo: string);
begin
    umDM.QMarca.IndexFieldNames := campo;
end;

function DaoMarca.Salvar(obj: TObject): string;
var
    umMarca : Marca;
begin
    umMarca := Marca(obj);
    with umDM do
    begin
        try
            beginTrans;
            QMarca.Close;
            if umMarca.getId = 0 then
            begin
              if(Self.Buscar(umMarca)) then
                begin
                  Result := 'Esta Marca já existe!';
                  Self.AtualizaGrid;
                  Exit;
                end;
                QMarca.SQL := UpdateMarca.InsertSQL
            end
            else
            begin
                QMarca.SQL := UpdateMarca.ModifySQL;
                QMarca.Params.ParamByName('OLD_idmarca').Value := umMarca.getId;
            end;
            QMarca.Params.ParamByName('descricao').Value := umMarca.getDescricao;
            QMarca.Params.ParamByName('datacadastro').Value := umMarca.getDataCadastro;
            QMarca.Params.ParamByName('dataalteracao').Value := umMarca.getDataAlteracao;

            QMarca.ExecSQL;
            Commit;
            result := 'Marca salva com sucesso!';
        except
          on e: Exception do
          begin
              rollback;
              Result := 'Ocorreu um erro! Marca não foi salva. Erro: '+e.Message;
          end;
        end;
    end;
    Self.AtualizaGrid;
end;

end.
