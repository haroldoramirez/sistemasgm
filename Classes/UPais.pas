unit UPais;

interface
    uses UGenerico;
    type Pais = class(Generico)

    protected
        DDI      : string[4];
        sigla    : string[3];
    public
        Constructor CrieObjeto;
        Destructor Destrua_Se;

        Procedure setDdi (vDdi : string);
        Function getDdi      : string;

        Procedure setSigla (vSigla : string);
        Function getSigla          : string;
end;

implementation

{ Pais }

constructor Pais.CrieObjeto;
begin
     inherited;
     DDI := '';
     sigla := '';
end;

destructor Pais.Destrua_Se;
begin

end;

function Pais.getDdi: string;
begin
   Result := Ddi;
end;

function Pais.getSigla: string;
begin
   Result := sigla;
end;

procedure Pais.setDdi(vDdi: string);
begin
    DDI := vDdi;
end;

procedure Pais.setSigla(vSigla: string);
begin
    sigla := vSigla;
end;

end.
