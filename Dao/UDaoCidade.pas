unit UDaoCidade;
interface
  uses uDao, DB, SysUtils, Messages, UCidade, UDaoEstado;
  type DaoCidade = class(Dao)
  private
  protected
     umCidade : Cidade;
     umaDaoEstado : DaoEstado;
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

{ DaoCidade }

function DaoCidade.Buscar(obj: TObject): Boolean;
var
    prim: Boolean;
    sql, e, onde: string;
    umCidade: Cidade;
begin
    e := ' and ';
    onde := ' where';
    prim := true;
    umCidade := Cidade(obj);
    sql := 'select * from cidade';
    if umCidade.getId <> 0 then
    begin
        if prim then  //SE FOR O PRIMEIRO, SETA COMO FLAG COMO FALSO PQ É O PRIMEIRO
        begin
            prim := false;
            sql := sql+onde;
        end
        else //SE NAO, COLOCA CLAUSULA AND PARA JUNTAR CONDIÇOES
            sql := sql+e;
        sql := sql+' idcidade = '+inttostr(umCidade.getId); //COLOCA CONDIÇAO NO SQL
    end;
    if umCidade.getDescricao <> '' then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' descricao like '+quotedstr('%'+umCidade.getDescricao+'%');
    end;
    with umDM do
    begin
        QCidade.Close;
        QCidade.sql.Text := sql+' order by idcidade';
        QCidade.Open;
        if QCidade.RecordCount > 0 then
          result := True
        else
          result := false;
    end;
end;

procedure DaoCidade.AtualizaGrid;
begin
  with umDM do
    begin
        QCidade.Close;
        QCidade.sql.Text := 'select * from cidade order by idcidade';
        QCidade.Open;
    end;
end;

function DaoCidade.Carrega(obj: TObject): TObject;
var
    umaCidade: Cidade;

begin
    umaCidade := Cidade(obj);
    with umDM do
    begin
        if not QCidade.Active then
            QCidade.Open;

        if umaCidade.getId <> 0 then
        begin
          QCidade.Close;
          QCidade.SQL.Text := 'select * from cidade where idcidade = '+IntToStr(umaCidade.getId);
          QCidade.Open;
        end;

        umaCidade.setId(QCidadeidcidade.AsInteger);
        umaCidade.setDescricao(QCidadedescricao.AsString);
        umaCidade.setDDD(QCidadeddd.AsString);
        umaCidade.setDataCadastro(QCidadedatacadastro.AsDateTime);
        umaCidade.setDataAlteracao(QCidadedataalteracao.AsDateTime);

        // Busca Estado referente a Cidade
        umaCidade.getumEstado.setId(QCidadeidestado.AsInteger);
        umaDaoEstado.Carrega(umaCidade.getumEstado);
    end;
    result := umaCidade;
    Self.AtualizaGrid;
end;

constructor DaoCidade.CrieObjeto;
begin
   inherited;
   umaDaoEstado := DaoEstado.CrieObjeto;
end;

destructor DaoCidade.Destrua_se;
begin
  inherited;
end;

function DaoCidade.Excluir(obj: TObject): string;
var
    umaCidade: Cidade;
begin
    umaCidade := Cidade(obj);
    with umDM do
    begin
        try
            beginTrans;
            QCidade.SQL := UpdateCidade.DeleteSQL;
            QCidade.Params.ParamByName('OLD_idcidade').Value := umaCidade.getId;
            QCidade.ExecSQL;
            Commit;
            result := 'Cidade excluída com sucesso!';
        except
            on e:Exception do
            begin
                rollback;
                if pos('chave estrangeira',e.Message)>0 then
                    result := 'Ocorreu um erro! A Cidade não pode ser excluída pois ja está sendo usado pelo sistema.'
                else
                    result := 'Ocorreu um erro! Cidade não foi excluída. Erro: '+e.Message;
            end;
        end;
    end;
    Self.AtualizaGrid;
end;

function DaoCidade.GetDS: TDataSource;
begin
   umDM.QCidade.FieldByName('descricao').DisplayWidth := 50;
   umDM.QCidade.FieldByName('datacadastro').DisplayWidth := 7;
   umDM.QCidade.FieldByName('dataalteracao').DisplayWidth := 7;
   Self.AtualizaGrid;
   result := umDM.DSCidade;
end;

procedure DaoCidade.Ordena(campo: string);
begin
   umDM.QCidade.IndexFieldNames := campo;
end;

function DaoCidade.Salvar(obj: TObject): string;
var
    umaCidade : Cidade;
begin
    umaCidade := Cidade(obj);
    with umDM do
    begin
        try
            beginTrans;
            QCidade.Close;
            if umaCidade.getId = 0 then
            begin
                if(Self.Buscar(umaCidade)) then
                begin
                  Result := 'Essa Cidade já existe!';
                  Self.AtualizaGrid;
                  Exit;
                end;
                QCidade.SQL := UpdateCidade.InsertSQL;
            end
            else
            begin
                if(not Self.Buscar(umaCidade)) then
                begin
                  Result := 'Essa Cidade já existe!';
                  Self.AtualizaGrid;
                  Exit;
                end
                else
                begin
                  QCidade.SQL := UpdateCidade.ModifySQL;
                  QCidade.Params.ParamByName('OLD_idcidade').Value := umaCidade.getId;
                end;
            end;
            QCidade.Params.ParamByName('descricao').Value := umaCidade.getDescricao;
            QCidade.Params.ParamByName('ddd').Value := umaCidade.getDDD;
            QCidade.Params.ParamByName('idestado').Value := umaCidade.getUmEstado.getId;
            QCidade.Params.ParamByName('datacadastro').Value := umaCidade.getDataCadastro;
            QCidade.Params.ParamByName('dataalteracao').Value := umaCidade.getDataAlteracao;

            QCidade.ExecSQL;
            Commit;
            result := 'Cidade salva com sucesso!';
        except
          on e: Exception do
          begin
              rollback;
              Result := 'Ocorreu um erro! Cidade não foi salva. Erro: '+e.Message;
          end;
        end;
    end;
    Self.AtualizaGrid;
end;

end.
