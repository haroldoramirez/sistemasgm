unit UDao;

interface
      uses uDM, DB, USingleton;
      type Dao = class
      private
      protected
          umDM : TDM;
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

{ Dao }

function Dao.Buscar(obj: TObject): Boolean;
begin

end;

function Dao.Carrega(obj: TObject): TObject;
begin

end;

constructor Dao.CrieObjeto;
begin
    //umDM := TDM.Create(nil);
    umDM := USingleton.getInstance;
end;

destructor Dao.Destrua_se;
begin
    umDM.FreeInstance;
end;

function Dao.Excluir(obj: TObject): string;
begin

end;

function Dao.GetDS: TDataSource;
begin

end;

function Dao.Salvar(obj: TObject): string;
begin

end;

end.

