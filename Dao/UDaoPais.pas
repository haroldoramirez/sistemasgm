unit UDaoPais;

interface
      uses uDao, DB, SysUtils, Messages, uPais;

      type DaoPais = class(Dao)

      private

      protected
         umPais : Pais;
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

{ DaoPais }

function DaoPais.Buscar(obj: TObject): Boolean;
var
    prim: Boolean;
    sql, e, onde: string;
    umPais: Pais;
begin
    e := ' and ';
    onde := ' where';
    prim := true;
    umPais := Pais(obj);
    sql := 'select * from pais';
    if umPais.getId <> 0 then
    begin
        if prim then  //SE FOR O PRIMEIRO, SETA COMO FLAG COMO FALSO PQ É O PRIMEIRO
        begin
            prim := false;
            sql := sql+onde;
        end
        else //SE NAO, COLOCA CLAUSULA AND PARA JUNTAR CONDIÇOES
            sql := sql+e;
        sql := sql+' idpais = '+inttostr(umPais.getId); //COLOCA CONDIÇAO NO SQL
    end;
    if umPais.getDescricao <> '' then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' descricao like '+quotedstr('%'+umPais.getDescricao+'%');
    end;
    with umDM do
    begin
        QPais.Close;
        QPais.sql.Text := sql+' order by idpais';
        QPais.Open;
        if QPais.RecordCount > 0 then
          result := True
        else
          result := false;
    end;
end;

procedure DaoPais.AtualizaGrid;
begin
  with umDM do
    begin
        QPais.Close;
        QPais.sql.Text := 'select * from pais order by idpais';
        QPais.Open;
    end;
end;

function DaoPais.Carrega(obj: TObject): TObject;
var
    umPais: Pais;
begin
    umPais := Pais(obj);
    with umDM do
    begin
        if not QPais.Active then
            QPais.Open;

        if umPais.getId <> 0 then
          begin
            QPais.Close;
            QPais.SQL.Text := 'select * from pais where idpais = '+IntToStr(umPais.getId);
            QPais.Open;
          end;

        umPais.setId(QPaisidpais.AsInteger);
        umPais.setDescricao(QPaisdescricao.AsString);
        umPais.setDdi(QPaisddi.AsString);
        umPais.setSigla(QPaissigla.AsString);
        umPais.setDataCadastro(QPaisdatacadastro.AsDateTime);
        umPais.setDataAlteracao(QPaisdataalteracao.AsDateTime);
    end;
    result := umPais;
    Self.AtualizaGrid;
end;

constructor DaoPais.CrieObjeto;
begin
    inherited;
end;

destructor DaoPais.Destrua_se;
begin
    inherited;
end;

function DaoPais.Excluir(obj: TObject): string;
var
    umPais: Pais;
begin
    umPais := Pais(obj);
    with umDM do
    begin
        try
            beginTrans;
            QPais.SQL := UpdatePais.DeleteSQL;
            QPais.Params.ParamByName('OLD_idpais').Value := umPais.getId;
            QPais.ExecSQL;
            Commit;
            result := 'País excluído com sucesso!';
        except
            on e:Exception do
            begin
                rollback;
                if pos('violates foreign key',e.Message)>0 then
                    result := 'Ocorreu um erro! O País não pode ser excluído pois ja está sendo utilizado.'
                else
                    result := 'Ocorreu um erro! O País não foi excluído. Erro: '+e.Message;
            end;
        end;
    end;
    Self.AtualizaGrid;
end;

function DaoPais.GetDS: TDataSource;
begin
    umDM.QPais.FieldByName('descricao').DisplayWidth := 50;
    umDM.QPais.FieldByName('datacadastro').DisplayWidth := 7;
    umDM.QPais.FieldByName('dataalteracao').DisplayWidth := 7;
    Self.AtualizaGrid;
    result := umDM.DSPais;
end;

procedure DaoPais.Ordena(campo: string);
begin
    umDM.QPais.IndexFieldNames := campo;
end;

function DaoPais.Salvar(obj: TObject): string;
var
    umPais : Pais;
begin
    umPais := Pais(obj);
    with umDM do
    begin
        try
            beginTrans;
            QPais.Close;
            if umPais.getId = 0 then
            begin
                if(Self.Buscar(umPais)) then
                begin
                  Result := 'Esse País já existe!';
                  Self.AtualizaGrid;
                  Exit;
                end;
                QPais.SQL := UpdatePais.InsertSQL
            end
            else
            begin
                if(not Self.Buscar(umPais)) then
                begin
                  Result := 'País "'+umPais.getDescricao+'" já esta cadastrado no sistema!';
                  Self.AtualizaGrid;
                  Exit;
                end
                else
                begin
                  QPais.SQL := UpdatePais.ModifySQL;
                  QPais.Params.ParamByName('OLD_idpais').Value := umPais.getId;
                end;
            end;
            QPais.Params.ParamByName('descricao').Value := umPais.getDescricao;
            QPais.Params.ParamByName('ddi').Value := umPais.getDdi;

            QPais.Params.ParamByName('datacadastro').Value := umPais.getDataCadastro;
            QPais.Params.ParamByName('dataalteracao').Value := umPais.getDataAlteracao;
            QPais.Params.ParamByName('sigla').Value := umPais.getSigla;

            QPais.ExecSQL;
            Commit;
            result := 'O País "' + umPais.getDescricao + '" foi salvo com sucesso!';
        except
          on e: Exception do
          begin
              rollback;
              Result := 'Não foi possível salvar o Pais ' + umPais.getDescricao + 'Erro: '+e.Message;
          end;
        end;
    end;
    Self.AtualizaGrid;
end;

end.
