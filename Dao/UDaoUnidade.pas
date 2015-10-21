unit UDaoUnidade;

interface
      uses uDao, DB, SysUtils, Messages, uUnidade;
      type DaoUnidade = class(Dao)
      private

      protected
         umaUnidade : Unidade;
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

{ DaoUnidade }

function DaoUnidade.Buscar(obj: TObject): Boolean;
var
    prim: Boolean;
    sql, e, onde: string;
    umaUnidade: Unidade;
begin
    e := ' and ';
    onde := ' where';
    prim := true;
    UmaUnidade := Unidade(obj);
    sql := 'select * from unidade';
    if umaUnidade.getId <> 0 then
    begin
        if prim then  //SE FOR O PRIMEIRO, SETA COMO FLAG COMO FALSO PQ É O PRIMEIRO
        begin
            prim := false;
            sql := sql+onde;
        end
        else //SE NAO, COLOCA CLAUSULA AND PARA JUNTAR CONDIÇOES
            sql := sql+e;
        sql := sql+' idunidade = '+inttostr(umaUnidade.getId); //COLOCA CONDIÇAO NO SQL
    end;
    if umaUnidade.getDescricao <> '' then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' descricao like '+quotedstr('%'+umaUnidade.getDescricao+'%');
    end;
    with umDM do
    begin
        QUnidade.Close;
        QUnidade.sql.Text := sql+' order by idunidade';
        QUnidade.Open;
        if QUnidade.RecordCount > 0 then
          result := True
        else
          result := false;
    end;
end;

procedure DaoUnidade.AtualizaGrid;
begin
  with umDM do
    begin
        QUnidade.Close;
        QUnidade.sql.Text := 'select * from unidade order by idunidade';
        QUnidade.Open;
    end;
end;

function DaoUnidade.Carrega(obj: TObject): TObject;
var
    umaUnidade: Unidade;
begin
    umaUnidade := Unidade(obj);
    with umDM do
    begin
        if not QUnidade.Active then
            QUnidade.Open;

        if umaUnidade.getId <> 0 then
          begin
            QUnidade.Close;
            QUnidade.SQL.Text := 'select * from unidade where idunidade = '+IntToStr(umaUnidade.getId);
            QUnidade.Open;
          end;

        umaUnidade.setId(QUnidadeidunidade.AsInteger);
        umaUnidade.setDescricao(QUnidadedescricao.AsString);
        umaUnidade.setDataCadastro(QUnidadedatacadastro.AsDateTime);
        umaUnidade.setDataAlteracao(QUnidadedataalteracao.AsDateTime);
    end;
    result := umaUnidade;
    Self.AtualizaGrid;
end;

constructor DaoUnidade.CrieObjeto;
begin
    inherited;
end;

destructor DaoUnidade.Destrua_se;
begin
    inherited;
end;

function DaoUnidade.Excluir(obj: TObject): string;
var
    umaUnidade: Unidade;
begin
    umaUnidade := Unidade(obj);
    with umDM do
    begin
        try
            beginTrans;
            QUnidade.SQL := UpdateUnidade.DeleteSQL;
            QUnidade.Params.ParamByName('OLD_idunidade').Value := umaUnidade.getId;
            QUnidade.ExecSQL;
            Commit;
            result := 'Unidade excluída com sucesso!';
        except
            on e:Exception do
            begin
                rollback;
                if pos('chave estrangeira',e.Message)> 0 then
                    result := 'Ocorreu um erro! A Unidade não pode ser excluída pois ja está sendo usado pelo sistema.'
                else
                    result := 'Ocorreu um erro! Unidade não foi excluída. Erro: '+e.Message;
            end;
        end;
    end;
    Self.AtualizaGrid;
end;

function DaoUnidade.GetDS: TDataSource;
begin
  Self.AtualizaGrid;
  umDM.QUnidade.FieldByName('idunidade').DisplayWidth := 5;
  umDM.QUnidade.FieldByName('descricao').DisplayWidth := 60;
  umDM.QUnidade.FieldByName('datacadastro').DisplayWidth := 15;
  umDM.QUnidade.FieldByName('dataalteracao').DisplayWidth := 15;
  result := umDM.DSUnidade;
end;

procedure DaoUnidade.Ordena(campo: string);
begin
    umDM.QUnidade.IndexFieldNames := campo;
end;

function DaoUnidade.Salvar(obj: TObject): string;
var
    UmaUnidade : Unidade;
begin
    umaUnidade := Unidade(obj);
    with umDM do
    begin
        try
            beginTrans;
            QUnidade.Close;
            if umaUnidade.getId = 0 then
            begin
                if(Self.Buscar(umaUnidade)) then
                begin
                  Result := 'Essa Unidade já existe!';
                  Self.AtualizaGrid;
                  Exit;
                end;
                QUnidade.SQL := UpdateUnidade.InsertSQL
            end
            else
            begin
                if(not Self.Buscar(umaUnidade)) then
                begin
                  Result := 'Essa Unidade já existe!';
                  Self.AtualizaGrid;
                  Exit;
                end
                else
                begin
                  QUnidade.SQL := UpdateUnidade.ModifySQL;
                  QUnidade.Params.ParamByName('OLD_idunidade').Value := umaUnidade.getId;
                end;
            end;
            QUnidade.Params.ParamByName('descricao').Value := umaUnidade.getDescricao;
            QUnidade.Params.ParamByName('datacadastro').Value := umaUnidade.getDataCadastro;
            QUnidade.Params.ParamByName('dataalteracao').Value := umaUnidade.getDataAlteracao;

            QUnidade.ExecSQL;
            Commit;
            result := 'Unidade salva com sucesso!';
        except
          on e: Exception do
          begin
              rollback;
              Result := 'Ocorreu um erro! Unidade não foi salva. Erro: '+e.Message;
          end;
        end;
    end;
    Self.AtualizaGrid;
end;

end.
