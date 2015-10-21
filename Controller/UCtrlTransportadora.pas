unit UCtrlTransportadora;

interface
      uses uController, DB, UDaoTransportadora;
      type CtrlTransportadora = class(Controller)

      private

      protected
        umaDaoTransportadora : DaoTransportadora;
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

{ CtrlTransportadora }

function CtrlTransportadora.Buscar(obj: TObject): Boolean;
begin
   result := umaDaoTransportadora.Buscar(obj);
end;

function CtrlTransportadora.Carrega(obj: TObject): TObject;
begin
   result := umaDaoTransportadora.Carrega(obj);
end;

constructor CtrlTransportadora.CrieObjeto;
begin
   umaDaoTransportadora := DaoTransportadora.CrieObjeto;
end;

destructor CtrlTransportadora.Destrua_se;
begin
    umaDaoTransportadora.Destrua_se;
end;

function CtrlTransportadora.Excluir(obj: TObject): string;
begin
   result := umaDaoTransportadora.Excluir(obj);
end;

function CtrlTransportadora.GetDS: TDataSource;
begin
   result := umaDaoTransportadora.GetDS;
end;

function CtrlTransportadora.Salvar(obj: TObject): string;
begin
   result := umaDaoTransportadora.Salvar(obj);
end;

end.
