unit UCtrlVeiculo;

interface
      uses uController, DB, UDaoVeiculo, UDM;

      type CtrlVeiculo = class(Controller)

      private

      protected
          umaDaoVeiculo : DaoVeiculo;
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

{ CtrlVeiculo }

function CtrlVeiculo.Buscar(obj: TObject): Boolean;
begin
    result := umaDaoVeiculo.Buscar(obj);
end;

function CtrlVeiculo.Carrega(obj: TObject): TObject;
begin
    result := umaDaoVeiculo.Carrega(obj);
end;

constructor CtrlVeiculo.CrieObjeto;
begin
    umaDaoVeiculo := DaoVeiculo.CrieObjeto;
end;

destructor CtrlVeiculo.Destrua_se;
begin
    umaDaoVeiculo.Destrua_se;
end;

function CtrlVeiculo.Excluir(obj: TObject): string;
begin
    result := umaDaoVeiculo.Excluir(obj);
end;

function CtrlVeiculo.GetDS: TDataSource;
begin
    result := umaDaoVeiculo.GetDS;
end;

function CtrlVeiculo.Salvar(obj: TObject): string;
begin
    result := umaDaoVeiculo.Salvar(obj);
end;

end.
