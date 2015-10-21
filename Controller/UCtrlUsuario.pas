unit UCtrlUsuario;

interface
      uses uController, DB, UDaoUsuario;
      type CtrlUsuario = class(Controller)

      private

      protected
          umaDaoUsuario : DaoUsuario;
      public
          Constructor CrieObjeto;
          Destructor Destrua_se;
          function Salvar(obj:TObject): string;      override;
          function GetDS : TDataSource;              override;
          function Carrega(obj:TObject): TObject;    override;
          function Buscar(obj : TObject) : Boolean;  override;
          function Excluir(obj : TObject) : string ; override;
          function BuscarFuncionario(id : Integer) : Boolean;
end;

implementation

{ CtrlUsuario }

function CtrlUsuario.Buscar(obj: TObject): Boolean;
begin
    result := umaDaoUsuario.Buscar(obj);
end;

function CtrlUsuario.BuscarFuncionario(id: Integer): Boolean;
begin
    result := umaDaoUsuario.BuscarFuncionario(id);
end;

function CtrlUsuario.Carrega(obj: TObject): TObject;
begin
    result := umaDaoUsuario.Carrega(obj);
end;

constructor CtrlUsuario.CrieObjeto;
begin
     umaDaoUsuario := DaoUsuario.CrieObjeto;
end;

destructor CtrlUsuario.Destrua_se;
begin
    umaDaoUsuario.Destrua_se;
end;

function CtrlUsuario.Excluir(obj: TObject): string;
begin
    result := umaDaoUsuario.Excluir(obj);
end;

function CtrlUsuario.GetDS: TDataSource;
begin
    result := umaDaoUsuario.GetDS;
end;

function CtrlUsuario.Salvar(obj: TObject): string;
begin
    result := umaDaoUsuario.Salvar(obj);
end;

end.
