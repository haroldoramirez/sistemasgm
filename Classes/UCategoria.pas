unit UCategoria;

interface
    uses UGenerico;
    type Categoria = class(Generico)

    public
        Constructor CrieObjeto;
        Destructor Destrua_Se;
    end;
implementation

{ Categoria }

constructor Categoria.CrieObjeto;
begin
    inherited;
end;

destructor Categoria.Destrua_Se;
begin

end;

end.
