unit UCtrlProduto;

interface
      uses uController, DB, UDaoProduto;
      type CtrlProduto = class(Controller)

      private

      protected
          umaDaoProduto : DaoProduto;
      public
          Constructor CrieObjeto;
          Destructor Destrua_se;
          function Salvar(obj:TObject): string;      override;
          function GetDS : TDataSource;              override;
          function Carrega(obj:TObject): TObject;    override;
          function Buscar(obj : TObject) : Boolean;  override;
          function Excluir(obj : TObject) : string ; override;
          function CarregarFornececor(obj: TObject): TObject;
          function RelacaoProduto(tipo: Integer) : Boolean;
end;

implementation

{ CtrlProduto }

function CtrlProduto.Buscar(obj: TObject): Boolean;
begin
    result := umaDaoProduto.Buscar(obj);
end;

function CtrlProduto.Carrega(obj: TObject): TObject;
begin
    result := umaDaoProduto.Carrega(obj);
end;

function CtrlProduto.CarregarFornececor(obj: TObject): TObject;
begin
    result := umaDaoProduto.CarregarFornececor(obj);
end;

constructor CtrlProduto.CrieObjeto;
begin
    umaDaoProduto := DaoProduto.CrieObjeto;
end;

destructor CtrlProduto.Destrua_se;
begin
    umaDaoProduto.Destrua_se;
end;

function CtrlProduto.Excluir(obj: TObject): string;
begin
    result := umaDaoProduto.Excluir(obj);
end;

function CtrlProduto.GetDS: TDataSource;
begin
    result := umaDaoProduto.GetDS;
end;

function CtrlProduto.RelacaoProduto(tipo: Integer): Boolean;
begin
    result := umaDaoProduto.RelacaoProduto(tipo);
end;

function CtrlProduto.Salvar(obj: TObject): string;
begin
    result := umaDaoProduto.Salvar(obj);
end;

end.
