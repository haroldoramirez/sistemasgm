unit UCtrlFornecedor;

interface
      uses uController, DB, UDaoFornecedor;
      type CtrlFornecedor = class(Controller)

      private

      protected
        umaDaoFornecedor : DaoFornecedor;
      public
          Constructor CrieObjeto;
          Destructor Destrua_se;
          function Salvar(obj:TObject): string;      override;
          function GetDS : TDataSource;              override;
          function Carrega(obj:TObject): TObject;    override;
          function Buscar(obj : TObject) : Boolean;  override;
          function Excluir(obj : TObject) : string ; override;
          procedure FiltroFavorecido(tipo : string);
          procedure AtualizaGrid(tipo : string);
end;
implementation

{ CtrlFornecedor }


function CtrlFornecedor.Buscar(obj: TObject): Boolean;
begin
   result := umaDaoFornecedor.Buscar(obj);
end;

procedure CtrlFornecedor.AtualizaGrid(tipo : string);
begin
    umaDaoFornecedor.AtualizaGrid(tipo);
end;

procedure CtrlFornecedor.FiltroFavorecido(tipo : string);
begin
   umaDaoFornecedor.FiltroFavorecido(tipo);
end;

function CtrlFornecedor.Carrega(obj: TObject): TObject;
begin
   result := umaDaoFornecedor.Carrega(obj);
end;

constructor CtrlFornecedor.CrieObjeto;
begin
   umaDaoFornecedor := DaoFornecedor.CrieObjeto;
end;

destructor CtrlFornecedor.Destrua_se;
begin
    umaDaoFornecedor.Destrua_se;
end;

function CtrlFornecedor.Excluir(obj: TObject): string;
begin
   result := umaDaoFornecedor.Excluir(obj);
end;

function CtrlFornecedor.GetDS: TDataSource;
begin
   result := umaDaoFornecedor.GetDS;
end;

function CtrlFornecedor.Salvar(obj: TObject): string;
begin
   result := umaDaoFornecedor.Salvar(obj);
end;

end.
