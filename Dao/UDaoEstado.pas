unit UDaoEstado;

interface
      uses uDao, DB, SysUtils, Messages, UEstado, UDaoPais;
      type DaoEstado = class(Dao)
      private

      protected
         umEstado : Estado;
         umaDaoPais : DaoPais;
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

{ DaoEstado }

function DaoEstado.Buscar(obj: TObject): Boolean;
var
    prim: Boolean;
    sql, e, onde: string;
    umEstado: Estado;
begin
    e := ' and ';
    onde := ' where';
    prim := true;
    umEstado := Estado(obj);
    sql := 'select * from estado';
    if umEstado.getId <> 0 then
    begin
        if prim then  //SE FOR O PRIMEIRO, SETA COMO FLAG COMO FALSO PQ É O PRIMEIRO
        begin
            prim := false;
            sql := sql+onde;
        end
        else //SE NAO, COLOCA CLAUSULA AND PARA JUNTAR CONDIÇOES
            sql := sql+e;
        sql := sql+' idestado = '+inttostr(umEstado.getId); //COLOCA CONDIÇAO NO SQL
    end;
    if umEstado.getDescricao <> '' then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' descricao like '+quotedstr('%'+umEstado.getDescricao+'%');
    end;
    if umEstado.getUmPais.getId <> 0 then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' idpais = '+inttostr(umEstado.getUmPais.getId);
    end;
    with umDM do
    begin
        QEstado.Close;
        QEstado.sql.Text := sql+' order by idestado';
        QEstado.Open;
        if QEstado.RecordCount > 0 then
          result := True
        else
          result := false;
    end;
end;

procedure DaoEstado.AtualizaGrid;
begin
  with umDM do
    begin
        QEstado.Close;
        QEstado.sql.Text := 'select * from estado order by idestado';
        QEstado.Open;
    end;
end;

function DaoEstado.Carrega(obj: TObject): TObject;
var
    umEstado: Estado;
begin
    umEstado := Estado(obj);
    with umDM do
    begin
        if not QEstado.Active then
            QEstado.Open;

        if umEstado.getId <> 0 then
          begin
            QEstado.Close;
            QEstado.SQL.Text := 'select * from estado where idestado = '+IntToStr(umEstado.getId);
            QEstado.Open;
          end;

        umEstado.setId(QEstadoidestado.AsInteger);
        umEstado.setDescricao(QEstadodescricao.AsString);
        umEstado.setUF(QEstadouf.AsString);
        umEstado.setDataCadastro(QEstadodatacadastro.AsDateTime);
        umEstado.setDataAlteracao(QEstadodataalteracao.AsDateTime);

        // Busca o País referente ao Estado
        umEstado.getumPais.setId(QEstadoidpais.AsInteger);
        umaDaoPais.Carrega(umEstado.getUmPais);
    end;
    result := umEstado;
    Self.AtualizaGrid;
end;

constructor DaoEstado.CrieObjeto;
begin
    inherited;
    umaDaoPais := DaoPais.CrieObjeto;
end;

destructor DaoEstado.Destrua_se;
begin
    inherited;
end;

function DaoEstado.Excluir(obj: TObject): string;
var
    umEstado: Estado;
begin
    umEstado := Estado(obj);
    with umDM do
    begin
        try
            beginTrans;
            QEstado.SQL := UpdateEstado.DeleteSQL;
            QEstado.Params.ParamByName('OLD_idestado').Value := umEstado.getId;
            QEstado.ExecSQL;
            Commit;
            result := 'Estado excluído com sucesso!';
        except
            on e:Exception do
            begin
                rollback;
                if pos('chave estrangeira',e.Message)>0 then
                    result := 'Ocorreu um erro! O Estado não pode ser excluído pois ja está sendo usado pelo sistema.'
                else
                    result := 'Ocorreu um erro! Estado não foi excluído. Erro: '+e.Message;
            end;
        end;
    end;
    Self.AtualizaGrid;
end;

function DaoEstado.GetDS: TDataSource;
begin
  umDM.QEstado.FieldByName('descricao').DisplayWidth := 50;
  umDM.QEstado.FieldByName('datacadastro').DisplayWidth := 7;
  umDM.QEstado.FieldByName('dataalteracao').DisplayWidth := 7;
  Self.AtualizaGrid;
  result := umDM.DSEstado;
end;

procedure DaoEstado.Ordena(campo: string);
begin
    umDM.QEstado.IndexFieldNames := campo;
end;

function DaoEstado.Salvar(obj: TObject): string;
var
    umEstado : Estado;
begin
    umEstado := Estado(obj);
    with umDM do
    begin
        try
            beginTrans;
            QEstado.Close;
            if umEstado.getId = 0 then
            begin
                if(Self.Buscar(umEstado)) then
                begin
                  Result := 'Esse Estado já existe!';
                  Self.AtualizaGrid;
                  Exit;
                end;
                QEstado.SQL := UpdateEstado.InsertSQL;
            end
            else
            begin
               QEstado.SQL := UpdateEstado.ModifySQL;
               QEstado.Params.ParamByName('OLD_idestado').Value := umEstado.getId;
            end;
            QEstado.Params.ParamByName('descricao').Value := umEstado.getDescricao;
            QEstado.Params.ParamByName('uf').Value := umEstado.getUF;
            QEstado.Params.ParamByName('idpais').Value := umEstado.getUmPais.getId;
            QEstado.Params.ParamByName('datacadastro').Value := umEstado.getDataCadastro;
            QEstado.Params.ParamByName('dataalteracao').Value := umEstado.getDataAlteracao;

            QEstado.ExecSQL;
            Commit;
            result := 'Estado salvo com sucesso!';
        except
          on e: Exception do
          begin
              rollback;
              Result := 'Ocorreu um erro! Estado não foi salvo. Erro: '+e.Message;
          end;
        end;
    end;
    Self.AtualizaGrid;
end;

end.
