unit UCtrlNcm;

interface
    uses  UNcm, UController, uDaoNcm, DB, UDM;

    type CtrlNcm = class(Controller)

    private

    protected
        umaDaoNcm : DaoNcm;
    public
          Constructor CrieObjeto;
          Destructor Destrua_se;
          function Salvar(obj:TObject): string;      override;
          function GetDS : TDataSource;              override;
          function Carrega(obj:TObject): TObject;    override;
          function Buscar(obj : TObject) : Boolean;  override;
          function Excluir(obj : TObject) : string ; override;

    end;

implementation

{ CtrlNcm }

function CtrlNcm.Buscar(obj: TObject): Boolean;
begin
    result := umaDaoNcm.Buscar(obj);
end;

function CtrlNcm.Carrega(obj: TObject): TObject;
begin
    result := umaDaoNcm.Carrega(obj);
end;

constructor CtrlNcm.CrieObjeto;
begin
    umaDaoNcm := DaoNcm.CrieObjeto;
end;

destructor CtrlNcm.Destrua_se;
begin
     umaDaoNcm.Destrua_se;
end;

function CtrlNcm.Excluir(obj: TObject): string;
begin
    result := umaDaoNcm.Excluir(obj);
end;

function CtrlNcm.GetDS: TDataSource;
begin
    result := umaDaoNcm.GetDS;
end;

function CtrlNcm.Salvar(obj: TObject): string;
begin
   result := umaDaoNcm.Salvar(obj);
end;

end.
