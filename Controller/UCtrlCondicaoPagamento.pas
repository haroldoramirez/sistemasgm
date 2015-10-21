unit UCtrlCondicaoPagamento;

interface
      uses uController, DB, UDaoCondicaoPagamento;
      type CtrlCondicaoPagamento = class(Controller)

      private

      protected
          umaDaoCondicaoPagamento : DaoCondicaoPagamento;
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

{ CtrlCondicaoPagamento }

function CtrlCondicaoPagamento.Buscar(obj: TObject): Boolean;
begin
    result := umaDaoCondicaoPagamento.Buscar(obj);
end;

function CtrlCondicaoPagamento.Carrega(obj: TObject): TObject;
begin
    result := umaDaoCondicaoPagamento.Carrega(obj);
end;

constructor CtrlCondicaoPagamento.CrieObjeto;
begin
     umaDaoCondicaoPagamento := DaoCondicaoPagamento.CrieObjeto;
end;

destructor CtrlCondicaoPagamento.Destrua_se;
begin
    umaDaoCondicaoPagamento.Destrua_se;
end;

function CtrlCondicaoPagamento.Excluir(obj: TObject): string;
begin
    result := umaDaoCondicaoPagamento.Excluir(obj);
end;

function CtrlCondicaoPagamento.GetDS: TDataSource;
begin
    result := umaDaoCondicaoPagamento.GetDS;
end;

function CtrlCondicaoPagamento.Salvar(obj: TObject): string;
begin
    result := umaDaoCondicaoPagamento.Salvar(obj);
end;

end.
