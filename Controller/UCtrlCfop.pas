unit UCtrlCfop;

interface
      uses uController, DB, UDaoCfop, UDM;

      type CtrlCfop = class(Controller)

      private

      protected
           umaDaoCfop : DaoCfop;
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

{ CtrlCfop }

function CtrlCfop.Buscar(obj: TObject): Boolean;
begin
    result := umaDaoCfop.Buscar(obj);
end;

function CtrlCfop.Carrega(obj: TObject): TObject;
begin
    result := umaDaoCfop.Carrega(obj);
end;

constructor CtrlCfop.CrieObjeto;
begin
    umaDaoCfop := DaoCfop.CrieObjeto;
end;

destructor CtrlCfop.Destrua_se;
begin
    umaDaoCfop.Destrua_se;
end;

function CtrlCfop.Excluir(obj: TObject): string;
begin
    result := umaDaoCfop.Excluir(obj);
end;

function CtrlCfop.GetDS: TDataSource;
begin
    result := umaDaoCfop.GetDS;
end;

function CtrlCfop.Salvar(obj: TObject): string;
begin
    result := umaDaoCfop.Salvar(obj);
end;

end.
