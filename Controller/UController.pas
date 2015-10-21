unit UController;

interface
      uses Classes, DB, uDM ;
      type Controller = class

      private
      protected
      public
          Constructor CrieObjeto;
          Destructor Destrua_se;
          function Salvar(obj:TObject): string;      virtual;
          function GetDS : TDataSource;              virtual;
          function Carrega(obj:TObject): TObject;    virtual;
          function Buscar(obj : TObject) : Boolean;  virtual;
          function Excluir(obj : TObject) : string ; virtual;

end;

implementation

{ Controller }

function Controller.Buscar(obj: TObject): Boolean;
begin

end;

function Controller.Carrega(obj: TObject): TObject;
begin

end;

constructor Controller.CrieObjeto;
begin

end;

destructor Controller.Destrua_se;
begin

end;

function Controller.Excluir(obj: TObject): string;
begin

end;

function Controller.GetDS: TDataSource;
begin

end;

function Controller.Salvar(obj: TObject): string;
begin

end;

end.

