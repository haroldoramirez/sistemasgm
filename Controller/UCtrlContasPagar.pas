unit UCtrlContasPagar;

interface
    uses uController, DB, UDaoContasPagar;
    type CtrlContasPagar = class(Controller)
    private
    protected
      umaDaoContasPagar : DaoContasPagar;
    public
      Constructor CrieObjeto;
      Destructor Destrua_se;
      function Salvar(obj:TObject): string;      override;
      function GetDS : TDataSource;              override;
      function Carrega(obj:TObject): TObject;    override;
      function Buscar(obj : TObject) : Boolean;  override;
      function Excluir(obj : TObject) : string ; override;
      function VerificarNota (obj : TObject) : Boolean;
      function VerificarContas (obj : TObject) : Boolean;
      function VerificarParcelas (obj : TObject) : Boolean;
end;

implementation

{ CtrlContasPagar }

function CtrlContasPagar.Buscar(obj: TObject): Boolean;
begin
    result := umaDaoContasPagar.Buscar(obj);
end;

function CtrlContasPagar.VerificarContas(obj: TObject): Boolean;
begin
    result := umaDaoContasPagar.VerificarContas(obj);
end;

function CtrlContasPagar.VerificarParcelas (obj : TObject) : Boolean;
begin
    result := umaDaoContasPagar.VerificarParcelas(obj);
end;

function CtrlContasPagar.VerificarNota(obj: TObject): Boolean;
begin
    result := umaDaoContasPagar.VerificarNota(obj);
end;

function CtrlContasPagar.Carrega(obj: TObject): TObject;
begin
    result := umaDaoContasPagar.Carrega(obj);
end;

constructor CtrlContasPagar.CrieObjeto;
begin
     umaDaoContasPagar := DaoContasPagar.CrieObjeto;
end;

destructor CtrlContasPagar.Destrua_se;
begin
    umaDaoContasPagar.Destrua_se;
end;

function CtrlContasPagar.Excluir(obj: TObject): string;
begin
//    result := umaDaoContasPagar.Excluir(obj);
end;

function CtrlContasPagar.GetDS: TDataSource;
begin
    result := umaDaoContasPagar.GetDS;
end;

function CtrlContasPagar.Salvar(obj: TObject): string;
begin
    result := umaDaoContasPagar.Salvar(obj);
end;

end.
