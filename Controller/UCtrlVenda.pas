unit UCtrlVenda;

interface
      uses uController, DB, UDaoVenda;
      type CtrlVenda = class(Controller)

      private

      protected
          umaDaoVenda : DaoVenda;
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

{ CtrlVenda }

function CtrlVenda.Buscar(obj: TObject): Boolean;
begin
    result := umaDaoVenda.Buscar(obj);
end;

function CtrlVenda.Carrega(obj: TObject): TObject;
begin
    result := umaDaoVenda.Carrega(obj);
end;

constructor CtrlVenda.CrieObjeto;
begin
     umaDaoVenda := DaoVenda.CrieObjeto;
end;

destructor CtrlVenda.Destrua_se;
begin
    umaDaoVenda.Destrua_se;
end;

function CtrlVenda.Excluir(obj: TObject): string;
begin
    result := umaDaoVenda.Excluir(obj);
end;

function CtrlVenda.GetDS: TDataSource;
begin
    result := umaDaoVenda.GetDS;
end;

function CtrlVenda.Salvar(obj: TObject): string;
begin
    result := umaDaoVenda.Salvar(obj);
end;

function CtrlVenda.VerificarNota(obj: TObject): Boolean;
begin
    Result := umaDaoVenda.VerificarNota(obj);
end;

end.
