unit UCtrlFuncionario;

interface
      uses uController, DB, UDaoFuncionario;
      type CtrlFuncionario = class(Controller)

      private

      protected
          umaDaoFuncionario : DaoFuncionario;
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

{ CtrlFuncionario }

function CtrlFuncionario.Buscar(obj: TObject): Boolean;
begin
    result := umaDaoFuncionario.Buscar(obj);
end;

function CtrlFuncionario.Carrega(obj: TObject): TObject;
begin
    result := umaDaoFuncionario.Carrega(obj);
end;

constructor CtrlFuncionario.CrieObjeto;
begin
    umaDaoFuncionario := DaoFuncionario.CrieObjeto;
end;

destructor CtrlFuncionario.Destrua_se;
begin
    umaDaoFuncionario.Destrua_se;
end;

function CtrlFuncionario.Excluir(obj: TObject): string;
begin
    result := umaDaoFuncionario.Excluir(obj);
end;

function CtrlFuncionario.GetDS: TDataSource;
begin
    result := umaDaoFuncionario.GetDS;
end;

function CtrlFuncionario.Salvar(obj: TObject): string;
begin
   result := umaDaoFuncionario.Salvar(obj);
end;

end.
