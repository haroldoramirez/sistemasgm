unit UEstado;

interface
      uses UPais, UGenerico;
      type Estado = class(Generico)
      Protected
              UF     : string[3];
              umPais : Pais;
      Public
            Constructor CrieObjeto;
            Destructor Destrua_Se;

            Procedure setUF (vUF : string);
            Procedure setUmPais (vPais : Pais);

            Function getUF : string;
            Function getUmPais : Pais;
End;

implementation

{ Estado }

constructor Estado.CrieObjeto;
begin
    inherited;
    UF := '';
    umPais := Pais.CrieObjeto;
end;

destructor Estado.Destrua_Se;
begin

end;

function Estado.getUF: string;
begin
    Result := UF;
end;

function Estado.getUmPais: Pais;
begin
    Result := umPais;
end;

procedure Estado.setUF(vUF: string);
begin
    UF := vUF;
end;

procedure Estado.setUmPais(vPais: Pais);
begin
    umPais := vPais;
end;

end.

