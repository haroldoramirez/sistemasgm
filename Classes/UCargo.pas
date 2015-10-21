unit UCargo;

interface
    uses UGenerico;
    type Cargo = class(Generico)

    protected
    public
        Constructor CrieObjeto;
        Destructor Destrua_Se;

end;

implementation

{ Cargo }

constructor Cargo.CrieObjeto;
begin
     inherited;
end;

destructor Cargo.Destrua_Se;
begin

end;

end.
