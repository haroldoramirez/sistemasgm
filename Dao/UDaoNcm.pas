unit UDaoNcm;

interface
      uses uDao, DB, SysUtils, Messages, uNcm;

      type DaoNcm = class(Dao)

      private

      protected
          umNcm : Ncm;
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

{ DaoNcm }

procedure DaoNcm.AtualizaGrid;
begin
  with umDM do
    begin
        QNcm.Close;
        QNcm.SQL.Text := 'select * from ncm order by idncm';
        QNcm.Open;
    end;
end;

function DaoNcm.Buscar(obj: TObject): Boolean;
var
    prim: Boolean;
    sql, e, onde: string;
    umNcm: Ncm;
begin
    e := ' and';
    onde := ' where';
    prim := true;
    umNcm := Ncm(obj);
    sql := 'select * from ncm';
    if umNcm.getId <> 0 then
    begin
        if prim then  //SE FOR O PRIMEIRO, SETA COMO FLAG COMO FALSO PQ É O PRIMEIRO
        begin
            prim := false;
            sql := sql+onde;
        end
        else //SE NAO, COLOCA CLAUSULA AND PARA JUNTAR CONDIÇOES
            sql := sql+e;
        sql := sql+' idncm = '+inttostr(umNcm.getId); //COLOCA CONDIÇAO NO SQL
    end;
    if umNcm.getNumero <> 0 then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' numero = '+quotedstr(inttostr(umNcm.getNumero));
    end;
    with umDM do
    begin
        QNcm.Close;
        QNcm.SQL.Text := sql+' order by idncm';
        QNcm.Open;
        if QNcm.RecordCount > 0 then
          result := True
        else
          result := false;
    end;
end;

function DaoNcm.Carrega(obj: TObject): TObject;
var
    umNcm: Ncm;
begin
    umNcm := Ncm(obj);
    with umDM do
    begin
        if not QNcm.Active then
            QNcm.Open;

        if umNcm.getId <> 0 then
          begin
            QNcm.Close;
            QNcm.SQL.Text := 'select * from ncm where idncm = '+IntToStr(umNcm.getId);
            QNcm.Open;
          end;

        umNcm.setId(QNcmidncm.AsInteger);
        umNcm.setPorcentagem_Ipi(QNcmporcentagem_ipi.AsFloat);
        umNcm.setDataCadastro(QNcmdatacadastro.AsDateTime);
        umNcm.setDataAlteracao(QNcmdataalteracao.AsDateTime);
    end;
    result := umNcm;
    Self.AtualizaGrid;
end;

constructor DaoNcm.CrieObjeto;
begin
    inherited;
end;

destructor DaoNcm.Destrua_se;
begin
    inherited;
end;

function DaoNcm.Excluir(obj: TObject): string;
var
    umNcm: Ncm;
begin
    umNcm := Ncm(obj);
    with umDM do
    begin
        try
            beginTrans;
            QNcm.SQL := UpdateNcm.DeleteSQL;
            QNcm.Params.ParamByName('OLD_idncm').Value := umNcm.getId;
            QNcm.ExecSQL;
            Commit;
            result := 'Ncm excluído com sucesso!';
        except
            on e:Exception do
            begin
                rollback;
                if pos('violates foreign key',e.Message)>0 then
                    result := 'Ocorreu um erro! O Ncm não pode ser excluído pois ja está sendo utilizado.'
                else
                    result := 'Ocorreu um erro! O Ncm não foi excluído. Erro: '+e.Message;
            end;
        end;
    end;
    Self.AtualizaGrid;

end;

function DaoNcm.GetDS: TDataSource;
begin
    umDM.QNcm.FieldByName('numero').DisplayWidth := 15;
    umDM.QNcm.FieldByName('porcentagem_ipi').DisplayWidth := 10;
    umDM.QNcm.FieldByName('datacadastro').DisplayWidth := 7;
    umDM.QNcm.FieldByName('dataalteracao').DisplayWidth := 7;
    Self.AtualizaGrid;
    result := umDM.DSNcm;
end;

procedure DaoNcm.Ordena(campo: string);
begin
    umDM.QNcm.IndexFieldNames := campo;
end;

function DaoNcm.Salvar(obj: TObject): string;
var
    umNcm : NCm;
begin
    umNcm := Ncm(obj);
    with umDM do
    begin
        try
            beginTrans;
            QNcm.Close;
            if umNcm.getId = 0 then
            begin
                if(Self.Buscar(umNcm)) then
                begin
                  Result := 'Esse Ncm já existe!';
                  Self.AtualizaGrid;
                  Exit;
                end;
                QNcm.SQL := UpdateNcm.InsertSQL
            end
            else
            begin
                  QNcm.SQL := UpdateNcm.ModifySQL;
                  QNcm.Params.ParamByName('OLD_idncm').Value := umNcm.getId;
            end;

            QNcm.Params.ParamByName('numero').Value := umNcm.getNumero;
            QNcm.Params.ParamByName('porcentagem_ipi').Value := umNcm.getPorcentagem_Ipi;
            QNcm.Params.ParamByName('datacadastro').Value := umNcm.getDataCadastro;
            QNcm.Params.ParamByName('dataalteracao').Value := umNcm.getDataAlteracao;

            QNcm.ExecSQL;
            Commit;
            result := 'O Ncm foi salvo com sucesso!';
        except
          on e: Exception do
          begin
              rollback;
              Result := 'Não foi possível salvar o Ncm Erro: '+e.Message;
          end;
        end;
    end;
    Self.AtualizaGrid;
end;

end.
