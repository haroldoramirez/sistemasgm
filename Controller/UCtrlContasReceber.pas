unit UCtrlContasReceber;

interface
      uses uController, DB, UDaoContasReceber;
      type CtrlContasReceber = class(Controller)

      private

      protected
          umaDaoContasReceber : DaoContasReceber;
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

{ CtrlContasReceber }

function CtrlContasReceber.Buscar(obj: TObject): Boolean;
begin
    result := umaDaoContasReceber.Buscar(obj);
end;

function CtrlContasReceber.VerificarContas(obj: TObject): Boolean;
begin
    result := umaDaoContasReceber.VerificarContas(obj);
end;

function CtrlContasReceber.VerificarParcelas (obj : TObject) : Boolean;
begin
    result := umaDaoContasReceber.VerificarParcelas(obj);
end;

function CtrlContasReceber.VerificarNota(obj: TObject): Boolean;
begin
  result := umaDaoContasReceber.VerificarNota(obj);
end;

function CtrlContasReceber.Carrega(obj: TObject): TObject;
begin
    result := umaDaoContasReceber.Carrega(obj);
end;

constructor CtrlContasReceber.CrieObjeto;
begin
     umaDaoContasReceber := DaoContasReceber.CrieObjeto;
end;

destructor CtrlContasReceber.Destrua_se;
begin
    umaDaoContasReceber.Destrua_se;
end;

function CtrlContasReceber.Excluir(obj: TObject): string;
begin
//    result := umaDaoContasReceber.Excluir(obj);
end;

function CtrlContasReceber.GetDS: TDataSource;
begin
    result := umaDaoContasReceber.GetDS;
end;

function CtrlContasReceber.Salvar(obj: TObject): string;
begin
    result := umaDaoContasReceber.Salvar(obj);
end;

end.
