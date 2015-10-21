unit UCtrlMarca;

interface
      uses uController, DB, UDaoMarca;
      type CtrlMarca = class(Controller)

      private

      protected
          umaDaoMarca : DaoMarca;
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

{ CtrlMarca }

function CtrlMarca.Buscar(obj: TObject): Boolean;
begin
    result := umaDaoMarca.Buscar(obj);
end;

function CtrlMarca.Carrega(obj: TObject): TObject;
begin
    result := umaDaoMarca.Carrega(obj);
end;

constructor CtrlMarca.CrieObjeto;
begin
     umaDaoMarca := DaoMarca.CrieObjeto;
end;

destructor CtrlMarca.Destrua_se;
begin
    umaDaoMarca.Destrua_se;
end;

function CtrlMarca.Excluir(obj: TObject): string;
begin
    result := umaDaoMarca.Excluir(obj);
end;

function CtrlMarca.GetDS: TDataSource;
begin
    result := umaDaoMarca.GetDS;
end;

function CtrlMarca.Salvar(obj: TObject): string;
begin
    result := umaDaoMarca.Salvar(obj);
end;

end.
