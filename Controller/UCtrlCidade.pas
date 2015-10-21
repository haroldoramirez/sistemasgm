unit UCtrlCidade;

interface
      uses uController, DB, UDaoCidade;
      type CtrlCidade = class(Controller)

      private

      protected
          umaDaoCidade : DaoCidade;
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

{ CtrlCidade }

function CtrlCidade.Buscar(obj: TObject): Boolean;
begin
    result := umaDaoCidade.Buscar(obj);
end;

function CtrlCidade.Carrega(obj: TObject): TObject;
begin
    result := umaDaoCidade.Carrega(obj);
end;

constructor CtrlCidade.CrieObjeto;
begin
     umaDaoCidade := DaoCidade.CrieObjeto;
end;

destructor CtrlCidade.Destrua_se;
begin
    umaDaoCidade.Destrua_se;
end;

function CtrlCidade.Excluir(obj: TObject): string;
begin
    result := umaDaoCidade.Excluir(obj);
end;

function CtrlCidade.GetDS: TDataSource;
begin
    result := umaDaoCidade.GetDS;
end;

function CtrlCidade.Salvar(obj: TObject): string;
begin
    result := umaDaoCidade.Salvar(obj);
end;

end.
