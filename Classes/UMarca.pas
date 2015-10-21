unit UMarca;

interface
    uses UGenerico;
    type Marca = class(Generico)

    public
        Constructor CrieObjeto;
        Destructor Destrua_Se;
    end;
implementation

{ Marca }

constructor Marca.CrieObjeto;
begin
    inherited;
end;

destructor Marca.Destrua_Se;
begin

end;

end.
