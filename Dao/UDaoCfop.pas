unit UDaoCfop;

interface
    uses uDao, DB, SysUtils, Messages, UCfop;

    type DaoCfop = class(Dao)

    private

    protected
        umCfop : Cfop;
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

{ DaoCfop }

procedure DaoCfop.AtualizaGrid;
begin
  with umDM do
    begin
        QCfop.Close;
        QCfop.SQL.Text := 'select * from cfop order by idcfop';
        QCfop.Open;
    end;
end;

function DaoCfop.Buscar(obj: TObject): Boolean;
var
    prim: Boolean;
    sql, e, onde: string;
    umCfop: Cfop;
begin
    e := ' and';
    onde := ' where';
    prim := true;
    umCfop := Cfop(obj);
    sql := 'select * from cfop';
    if umCfop.getId <> 0 then
    begin
        if prim then  //SE FOR O PRIMEIRO, SETA COMO FLAG COMO FALSO PQ É O PRIMEIRO
        begin
            prim := false;
            sql := sql+onde;
        end
        else //SE NAO, COLOCA CLAUSULA AND PARA JUNTAR CONDIÇOES
            sql := sql+e;
        sql := sql+' idcfop = '+inttostr(umCfop.getId); //COLOCA CONDIÇAO NO SQL
    end;
    if umCfop.getNome <> '' then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' nome like '+quotedstr('%'+umCfop.getNome+'%');
    end;
    with umDM do
    begin
        QCfop.Close;
        QCfop.SQL.Text := sql+' order by idcfop';
        QCfop.Open;
        if QCfop.RecordCount > 0 then
          result := True
        else
          result := false;
    end;

end;

function DaoCfop.Carrega(obj: TObject): TObject;
var
    umCfop: Cfop;
begin
    umCfop := Cfop(obj);
    with umDM do
    begin
        if not QCfop.Active then
            QCfop.Open;

        if umCfop.getId <> 0 then
          begin
            QCfop.Close;
            QCfop.SQL.Text := 'select * from cfop where idcfop = '+IntToStr(umCfop.getId);
            QCfop.Open;
          end;

        umCfop.setId(QCfopidcfop.AsInteger);
        umCfop.setNome(QCfopnome.AsString);
        umCfop.setNumero(QCfopnumero.AsInteger);
        umCfop.setDataCadastro(QCfopdatacadastro.AsDateTime);
        umCfop.setDataAlteracao(QCfopdataalteracao.AsDateTime);
    end;
    result := umCfop;
    Self.AtualizaGrid;
end;

constructor DaoCfop.CrieObjeto;
begin
   inherited;
end;

destructor DaoCfop.Destrua_se;
begin
    inherited;
end;

function DaoCfop.Excluir(obj: TObject): string;
var
    umCfop: Cfop;
begin
    umCfop := Cfop(obj);
    with umDM do
    begin
        try
            beginTrans;
            QCfop.SQL := UpdateCfop.DeleteSQL;
            QCfop.Params.ParamByName('OLD_idcfop').Value := umCfop.getId;
            QCfop.ExecSQL;
            Commit;
            result := 'CFOP excluído com sucesso!';
        except
            on e:Exception do
            begin
                rollback;
                if pos('violates foreign key',e.Message)>0 then
                    result := 'Ocorreu um erro! O CFOP não pode ser excluído pois ja está sendo utilizado.'
                else
                    result := 'Ocorreu um erro! O CFOP não foi excluído. Erro: '+e.Message;
            end;
        end;
    end;
    Self.AtualizaGrid;
end;

function DaoCfop.GetDS: TDataSource;
begin
    umDM.QCfop.FieldByName('nome').DisplayWidth := 20;
    umDM.QCfop.FieldByName('numero').DisplayWidth := 10;
    umDM.QCfop.FieldByName('datacadastro').DisplayWidth := 7;
    umDM.QCfop.FieldByName('dataalteracao').DisplayWidth := 7;
    Self.AtualizaGrid;
    result := umDM.DSCfop;
end;

procedure DaoCfop.Ordena(campo: string);
begin
    umDM.QCfop.IndexFieldNames := campo;
end;

function DaoCfop.Salvar(obj: TObject): string;
var
    umCfop : Cfop;
begin
    umCfop := Cfop(obj);
    with umDM do
    begin
        try
            beginTrans;
            QCfop.Close;
            if umCfop.getId = 0 then
            begin
                if(Self.Buscar(umCfop)) then
                begin
                  Result := 'Esse CFOP já existe!';
                  Self.AtualizaGrid;
                  Exit;
                end;
                QCfop.SQL := UpdateCfop.InsertSQL
            end
            else
            begin
                  QCfop.SQL := UpdateCfop.ModifySQL;
                  QCfop.Params.ParamByName('OLD_idcfop').Value := umCfop.getId;
            end;

            QCfop.Params.ParamByName('nome').Value := umCfop.getNome;
            QCfop.Params.ParamByName('numero').Value := umCfop.getNumero;
            QCfop.Params.ParamByName('datacadastro').Value := umCfop.getDataCadastro;
            QCfop.Params.ParamByName('dataalteracao').Value := umCfop.getDataAlteracao;

            QCfop.ExecSQL;
            Commit;
            result := 'O CFOP foi salvo com sucesso!';
        except
          on e: Exception do
          begin
              rollback;
              Result := 'Não foi possível salvar o CFOP Erro: '+e.Message;
          end;
        end;
    end;
    Self.AtualizaGrid;
end;

end.
