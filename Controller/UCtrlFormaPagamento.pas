unit UCtrlFormaPagamento;

interface
      uses uController, DB, UDaoFormaPagamento;
      type CtrlFormaPagamento = class(Controller)

      private

      protected
          umaDaoFormaPagamento : DaoFormaPagamento;
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

{ CtrlFormaPagamento }

function CtrlFormaPagamento.Buscar(obj: TObject): Boolean;
begin
    result := umaDaoFormaPagamento.Buscar(obj);
end;

function CtrlFormaPagamento.Carrega(obj: TObject): TObject;
begin
    result := umaDaoFormaPagamento.Carrega(obj);
end;

constructor CtrlFormaPagamento.CrieObjeto;
begin
     umaDaoFormaPagamento := DaoFormaPagamento.CrieObjeto;
end;

destructor CtrlFormaPagamento.Destrua_se;
begin
    umaDaoFormaPagamento.Destrua_se;
end;

function CtrlFormaPagamento.Excluir(obj: TObject): string;
begin
    result := umaDaoFormaPagamento.Excluir(obj);
end;

function CtrlFormaPagamento.GetDS: TDataSource;
begin
    result := umaDaoFormaPagamento.GetDS;
end;

function CtrlFormaPagamento.Salvar(obj: TObject): string;
begin
    result := umaDaoFormaPagamento.Salvar(obj);
end;

end.
