unit UCtrlEstado;

interface
      uses uController, DB, UDaoEstado;
      type CtrlEstado = class(Controller)

      private

      protected
          umaDaoEstado : DaoEstado;
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

{ CtrlEstado }

function CtrlEstado.Buscar(obj: TObject): Boolean;
begin
    result := umaDaoEstado.Buscar(obj);
end;

function CtrlEstado.Carrega(obj: TObject): TObject;
begin
    result := umaDaoEstado.Carrega(obj);
end;

constructor CtrlEstado.CrieObjeto;
begin
     umaDaoEstado := DaoEstado.CrieObjeto;
end;

destructor CtrlEstado.Destrua_se;
begin
    umaDaoEstado.Destrua_se;
end;

function CtrlEstado.Excluir(obj: TObject): string;
begin
    result := umaDaoEstado.Excluir(obj);
end;

function CtrlEstado.GetDS: TDataSource;
begin
    result := umaDaoEstado.GetDS;
end;

function CtrlEstado.Salvar(obj: TObject): string;
begin
    result := umaDaoEstado.Salvar(obj);
end;

end.
