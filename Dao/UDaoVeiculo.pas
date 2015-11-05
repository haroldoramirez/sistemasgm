unit UDaoVeiculo;

interface
    uses uDao, DB, SysUtils, Messages, UVeiculo;

    type DaoVeiculo = class(Dao)

    private

    protected
         umVeiculo : Veiculo;
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

{ DaoVeiculo }

procedure DaoVeiculo.AtualizaGrid;
begin
  with umDM do
    begin
        QVeiculo.Close;
        QVeiculo.SQL.Text := 'select * from veiculo order by idveiculo';
        QVeiculo.Open;
    end;
end;

function DaoVeiculo.Buscar(obj: TObject): Boolean;
var
    prim: Boolean;
    sql, e, onde: string;
    umVeiculo: Veiculo;
begin
    e := ' and';
    onde := ' where';
    prim := true;
    umVeiculo := Veiculo(obj);
    sql := 'select * from veiculo';
    if umVeiculo.getId <> 0 then
    begin
        if prim then  //SE FOR O PRIMEIRO, SETA COMO FLAG COMO FALSO PQ É O PRIMEIRO
        begin
            prim := false;
            sql := sql+onde;
        end
        else //SE NAO, COLOCA CLAUSULA AND PARA JUNTAR CONDIÇOES
            sql := sql+e;
        sql := sql+' idveiculo = '+inttostr(umVeiculo.getId); //COLOCA CONDIÇAO NO SQL
    end;
    if umVeiculo.getAntt <> '' then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' antt like '+quotedstr('%'+umVeiculo.getAntt+'%');
    end;
    with umDM do
    begin
        QVeiculo.Close;
        QVeiculo.SQL.Text := sql+' order by idveiculo';
        QVeiculo.Open;
        if QVeiculo.RecordCount > 0 then
          result := True
        else
          result := false;
    end;
end;

function DaoVeiculo.Carrega(obj: TObject): TObject;
var
    umVeiculo: Veiculo;
begin
    umVeiculo := Veiculo(obj);
    with umDM do
    begin
        if not QVeiculo.Active then
            QVeiculo.Open;

        if umVeiculo.getId <> 0 then
          begin
            QVeiculo.Close;
            QVeiculo.SQL.Text := 'select * from veiculo where idveiculo = '+IntToStr(umVeiculo.getId);
            QVeiculo.Open;
          end;

        umVeiculo.setId(QVeiculoidveiculo.AsInteger);
        umVeiculo.setAntt(QVeiculoantt.AsString);
        umVeiculo.setPlaca(QVeiculoplaca.AsString);
        umVeiculo.setUf(QVeiculouf.AsString);
        umVeiculo.setDataCadastro(QVeiculodatacadastro.AsDateTime);
        umVeiculo.setDataAlteracao(QVeiculodataalteracao.AsDateTime);
    end;
    result := umVeiculo;
end;

constructor DaoVeiculo.CrieObjeto;
begin
    inherited;
end;

destructor DaoVeiculo.Destrua_se;
begin
    inherited;
end;

function DaoVeiculo.Excluir(obj: TObject): string;
var
    umVeiculo: Veiculo;
begin
    umVeiculo := Veiculo(obj);
    with umDM do
    begin
        try
            beginTrans;
            QVeiculo.SQL := UpdateVeiculo.DeleteSQL;
            QVeiculo.Params.ParamByName('OLD_idveiculo').Value := umVeiculo.getId;
            QVeiculo.ExecSQL;
            Commit;
            result := 'Veículo excluído com sucesso!';
        except
            on e:Exception do
            begin
                rollback;
                if pos('violates foreign key',e.Message)>0 then
                    result := 'Ocorreu um erro! O Veículo não pode ser excluído pois ja está sendo utilizado.'
                else
                    result := 'Ocorreu um erro! O Veículo não foi excluído. Erro: '+e.Message;
            end;
        end;
    end;
    Self.AtualizaGrid;
end;

function DaoVeiculo.GetDS: TDataSource;
begin
    umDM.QVeiculo.FieldByName('antt').DisplayWidth := 20;
    umDM.QVeiculo.FieldByName('placa').DisplayWidth := 10;
    umDM.QVeiculo.FieldByName('uf').DisplayWidth := 5;
    umDM.QVeiculo.FieldByName('datacadastro').DisplayWidth := 7;
    umDM.QVeiculo.FieldByName('dataalteracao').DisplayWidth := 7;
    Self.AtualizaGrid;
    result := umDM.DSVeiculo;
end;

procedure DaoVeiculo.Ordena(campo: string);
begin
    umDM.QVeiculo.IndexFieldNames := campo;
end;

function DaoVeiculo.Salvar(obj: TObject): string;
var
    umVeiculo : Veiculo;
begin
    umVeiculo := Veiculo(obj);
    with umDM do
    begin
        try
            beginTrans;
            QVeiculo.Close;
            if umVeiculo.getId = 0 then
            begin
                if(Self.Buscar(umVeiculo)) then
                begin
                  Result := 'Esse Veículo já existe!';
                  Self.AtualizaGrid;
                  Exit;
                end;
                QVeiculo.SQL := UpdateVeiculo.InsertSQL
            end
            else
            begin
                QVeiculo.SQL := UpdateVeiculo.ModifySQL;
                QVeiculo.Params.ParamByName('OLD_idveiculo').Value := umVeiculo.getId;
            end;

            QVeiculo.Params.ParamByName('antt').Value := umVeiculo.getAntt;
            QVeiculo.Params.ParamByName('placa').Value := umVeiculo.getPlaca;
            QVeiculo.Params.ParamByName('uf').Value := umVeiculo.getUf;
            QVeiculo.Params.ParamByName('datacadastro').Value := umVeiculo.getDataCadastro;
            QVeiculo.Params.ParamByName('dataalteracao').Value := umVeiculo.getDataAlteracao;

            QVeiculo.ExecSQL;
            Commit;
            result := 'O Veículo "' + umVeiculo.getAntt + '" foi salvo com sucesso!';
        except
          on e: Exception do
          begin
              rollback;
              Result := 'Não foi possível salvar o Veículo ' + umVeiculo.getAntt + 'Erro: '+e.Message;
          end;
        end;
    end;
    Self.AtualizaGrid;
end;

end.
