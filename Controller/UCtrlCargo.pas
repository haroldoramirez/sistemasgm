unit UCtrlCargo;

interface
      uses uController, DB, UDaoCargo, UDM;
      type CtrlCargo = class(Controller)

      private

      protected
          umaDaoCargo : DaoCargo;
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

{ CtrlCargo }

function CtrlCargo.Buscar(obj: TObject): Boolean;
begin
    result := umaDaoCargo.Buscar(obj);
end;

function CtrlCargo.Carrega(obj: TObject): TObject;
begin
    result := umaDaoCargo.Carrega(obj);
end;

constructor CtrlCargo.CrieObjeto;
begin
     umaDaoCargo := DaoCargo.CrieObjeto;
end;

destructor CtrlCargo.Destrua_se;
begin
    umaDaoCargo.Destrua_se;
end;

function CtrlCargo.Excluir(obj: TObject): string;
begin
    result := umaDaoCargo.Excluir(obj);
end;

function CtrlCargo.GetDS: TDataSource;
begin
    result := umaDaoCargo.GetDS;
end;

function CtrlCargo.Salvar(obj: TObject): string;
begin
    result := umaDaoCargo.Salvar(obj);
end;

end.
