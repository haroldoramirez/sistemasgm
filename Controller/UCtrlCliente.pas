unit UCtrlCliente;

interface
      uses uController, DB, UDaoCliente;
      type CtrlCliente = class(Controller)

      private

      protected
          umaDaoCliente : DaoCliente;
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

{ CtrlCliente }

function CtrlCliente.Buscar(obj: TObject): Boolean;
begin
result := umaDaoCliente.Buscar(obj);
end;

function CtrlCliente.Carrega(obj: TObject): TObject;
begin
       result := umaDaoCliente.Carrega(obj);
end;

constructor CtrlCliente.CrieObjeto;
begin
    umaDaoCliente := DaoCliente.CrieObjeto;
end;

destructor CtrlCliente.Destrua_se;
begin
    umaDaoCliente.Destrua_se;
end;

function CtrlCliente.Excluir(obj: TObject): string;
begin
    result := umaDaoCliente.Excluir(obj);
end;

function CtrlCliente.GetDS: TDataSource;
begin
    result := umaDaoCliente.GetDS;
end;

function CtrlCliente.Salvar(obj: TObject): string;
begin
   result := umaDaoCliente.Salvar(obj);
end;

end.
