unit UCtrlCategoria;

interface
      uses uController, DB, UDaoCategoria;
      type CtrlCategoria = class(Controller)

      private

      protected
          umaDaoCategoria : DaoCategoria;
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

{ CtrlCategoria }

function CtrlCategoria.Buscar(obj: TObject): Boolean;
begin
    result := umaDaoCategoria.Buscar(obj);
end;

function CtrlCategoria.Carrega(obj: TObject): TObject;
begin
    result := umaDaoCategoria.Carrega(obj);
end;

constructor CtrlCategoria.CrieObjeto;
begin
     umaDaoCategoria := DaoCategoria.CrieObjeto;
end;

destructor CtrlCategoria.Destrua_se;
begin
    umaDaoCategoria.Destrua_se;
end;

function CtrlCategoria.Excluir(obj: TObject): string;
begin
    result := umaDaoCategoria.Excluir(obj);
end;

function CtrlCategoria.GetDS: TDataSource;
begin
    result := umaDaoCategoria.GetDS;
end;

function CtrlCategoria.Salvar(obj: TObject): string;
begin
    result := umaDaoCategoria.Salvar(obj);
end;

end.
