unit UUnidade;

interface
    uses UGenerico;
    type Unidade = class(Generico)

    protected

    public
        Constructor CrieObjeto;
        Destructor Destrua_Se;
end;

implementation

{ Unidade }

constructor Unidade.CrieObjeto;
begin
     inherited;
end;

destructor Unidade.Destrua_Se;
begin

end;

end.
