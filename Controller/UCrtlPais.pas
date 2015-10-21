unit UCrtlPais;

interface
      uses uController, DB, UDaoPais, UDM;
      type CtrlPais = class(Controller)

      private

      protected
          umaDaoPais : DaoPais;
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

{ CtrlPais }

function CtrlPais.Buscar(obj: TObject): Boolean;
begin
    result := umaDaoPais.Buscar(obj);
end;

function CtrlPais.Carrega(obj: TObject): TObject;
begin
    result := umaDaoPais.Carrega(obj);
end;

constructor CtrlPais.CrieObjeto;
begin
     umaDaoPais := DaoPais.CrieObjeto;
end;

destructor CtrlPais.Destrua_se;
begin
    umaDaoPais.Destrua_se;
end;

function CtrlPais.Excluir(obj: TObject): string;
begin
    result := umaDaoPais.Excluir(obj);
end;

function CtrlPais.GetDS: TDataSource;
begin
    result := umaDaoPais.GetDS;
end;

function CtrlPais.Salvar(obj: TObject): string;
begin
    result := umaDaoPais.Salvar(obj);
end;

end.
