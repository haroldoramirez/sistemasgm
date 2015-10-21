unit UCtrlCompra;

interface
      uses uController, DB, UDaoCompra;
      type CtrlCompra = class(Controller)

      private

      protected
          umaDaoCompra : DaoCompra;
      public
          Constructor CrieObjeto;
          Destructor Destrua_se;
          function Salvar(obj:TObject): string;      override;
          function GetDS : TDataSource;              override;
          function Carrega(obj:TObject): TObject;    override;
          function Buscar(obj : TObject) : Boolean;  override;
          function Excluir(obj : TObject) : string ; override;
          function VerificarNota (obj : TObject) : Boolean;
end;

implementation

{ CtrlCompra }

function CtrlCompra.Buscar(obj: TObject): Boolean;
begin
    result := umaDaoCompra.Buscar(obj);
end;

function CtrlCompra.VerificarNota(obj: TObject): Boolean;
begin
    result := umaDaoCompra.VerificarNota(obj);
end;

function CtrlCompra.Carrega(obj: TObject): TObject;
begin
    result := umaDaoCompra.Carrega(obj);
end;

constructor CtrlCompra.CrieObjeto;
begin
     umaDaoCompra := DaoCompra.CrieObjeto;
end;

destructor CtrlCompra.Destrua_se;
begin
    umaDaoCompra.Destrua_se;
end;

function CtrlCompra.Excluir(obj: TObject): string;
begin
    result := umaDaoCompra.Excluir(obj);
end;

function CtrlCompra.GetDS: TDataSource;
begin
    result := umaDaoCompra.GetDS;
end;

function CtrlCompra.Salvar(obj: TObject): string;
begin
    result := umaDaoCompra.Salvar(obj);
end;

end.
