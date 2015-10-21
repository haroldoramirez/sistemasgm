unit UDaoCargo;

interface
      uses uDao, DB, SysUtils, Messages, uCargo;
      type DaoCargo = class(Dao)
      private

      protected
         umCargo : Cargo;
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

{ DaoCargo }

function DaoCargo.Buscar(obj: TObject): Boolean;
var
    prim: Boolean;
    sql, e, onde: string;
    umCargo: Cargo;
begin
    e := ' and ';
    onde := ' where';
    prim := true;
    umCargo := Cargo(obj);
    sql := 'select * from cargo';
    if umCargo.getId <> 0 then
    begin
        if prim then  //SE FOR O PRIMEIRO, SETA COMO FLAG COMO FALSO PQ É O PRIMEIRO
        begin
            prim := false;
            sql := sql+onde;
        end
        else //SE NAO, COLOCA CLAUSULA AND PARA JUNTAR CONDIÇOES
            sql := sql+e;
        sql := sql+' idcargo = '+inttostr(umCargo.getId); //COLOCA CONDIÇAO NO SQL
    end;
    if umCargo.getDescricao <> '' then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' descricao like '+quotedstr('%'+umCargo.getDescricao+'%');
    end;
    with umDM do
    begin
        QCargo.Close;
        QCargo.sql.Text := sql;
        QCargo.Open;
        if QCargo.RecordCount > 0 then
          result := True
        else
          result := false;
    end;
end;

procedure DaoCargo.AtualizaGrid;
begin
  with umDM do
    begin
        QCargo.Close;
        QCargo.sql.Text := 'select * from cargo order by idcargo';
        QCargo.Open;
    end;
end;

function DaoCargo.Carrega(obj: TObject): TObject;
var
    umCargo: Cargo;
begin
    umCargo := Cargo(obj);
    with umDM do
    begin
        if not QCargo.Active then
            QCargo.Open;

        if umCargo.getId <> 0 then
          begin
            QCargo.Close;
            QCargo.SQL.Text := 'select * from cargo where idcargo = '+IntToStr(umCargo.getId);
            QCargo.Open;
          end;

        umCargo.setId(QCargoidcargo.AsInteger);
        umCargo.setDescricao(QCargodescricao.AsString);
        umCargo.setDataCadastro(QCargodatacadastro.AsDateTime);
        umCargo.setDataAlteracao(QCargodataalteracao.AsDateTime);
    end;
    result := umCargo;
    Self.AtualizaGrid;
end;

constructor DaoCargo.CrieObjeto;
begin
    inherited;
end;

destructor DaoCargo.Destrua_se;
begin
    inherited;
end;

function DaoCargo.Excluir(obj: TObject): string;
var
    umCargo: Cargo;
begin
    umCargo := Cargo(obj);
    with umDM do
    begin
        try
            beginTrans;
            QCargo.SQL := UpdateCargo.DeleteSQL;
            QCargo.Params.ParamByName('OLD_idcargo').Value := umCargo.getId;
            QCargo.ExecSQL;
            Commit;
            result := 'Cargo excluído com sucesso!';
        except
            on e:Exception do
            begin
                rollback;
                if pos('chave estrangeira',e.Message)>0 then
                    result := 'Ocorreu um erro! O Cargo não pode ser excluído pois ja está sendo usado pelo sistema.'
                else
                    result := 'Ocorreu um erro! Cargo não foi excluído. Erro: '+e.Message;
            end;
        end;
    end;
    Self.AtualizaGrid;
end;

function DaoCargo.GetDS: TDataSource;
begin
  umDM.QCargo.FieldByName('descricao').DisplayWidth := 50;
  umDM.QCargo.FieldByName('datacadastro').DisplayWidth := 7;
  umDM.QCargo.FieldByName('dataalteracao').DisplayWidth := 7;
  Self.AtualizaGrid;
  result := umDM.DSCargo;
end;

procedure DaoCargo.Ordena(campo: string);
begin
    umDM.QCargo.IndexFieldNames := campo;
end;

function DaoCargo.Salvar(obj: TObject): string;
var
    umCargo : Cargo;
begin
    umCargo := Cargo(obj);
    with umDM do
    begin
        try
            beginTrans;
            QCargo.Close;
            if umCargo.getId = 0 then
                QCargo.SQL := UpdateCargo.InsertSQL
            else
            begin
                QCargo.SQL := UpdateCargo.ModifySQL;
                QCargo.Params.ParamByName('OLD_idcargo').Value := umCargo.getId;
            end;
            QCargo.Params.ParamByName('descricao').Value := umCargo.getDescricao;
            QCargo.Params.ParamByName('datacadastro').Value := umCargo.getDataCadastro;
            QCargo.Params.ParamByName('dataalteracao').Value := umCargo.getDataAlteracao;

            QCargo.ExecSQL;
            Commit;
            result := 'Cargo salvo com sucesso!';
        except
          on e: Exception do
          begin
              rollback;
              Result := 'Ocorreu um erro! Cargo não foi salvo. Erro: '+e.Message;
          end;
        end;
    end;
    Self.AtualizaGrid;
end;

end.
