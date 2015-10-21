unit UCtrlUnidade;

interface
      uses uController, DB, UDaoUnidade;
      type CtrlUnidade = class(Controller)

      private

      protected
          umaDaoUnidade : DaoUnidade;
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

{ CtrlUnidade }

function CtrlUnidade.Buscar(obj: TObject): Boolean;
begin
    result := umaDaoUnidade.Buscar(obj);
end;

function CtrlUnidade.Carrega(obj: TObject): TObject;
begin
    result := umaDaoUnidade.Carrega(obj);
end;

constructor CtrlUnidade.CrieObjeto;
begin
     umaDaoUnidade := DaoUnidade.CrieObjeto;
end;

destructor CtrlUnidade.Destrua_se;
begin
    umaDaoUnidade.Destrua_se;
end;

function CtrlUnidade.Excluir(obj: TObject): string;
begin
    result := umaDaoUnidade.Excluir(obj);
end;

function CtrlUnidade.GetDS: TDataSource;
begin
    result := umaDaoUnidade.GetDS;
end;

function CtrlUnidade.Salvar(obj: TObject): string;
begin
    result := umaDaoUnidade.Salvar(obj);
end;

end.
