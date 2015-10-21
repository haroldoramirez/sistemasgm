unit UCidade;

interface
      uses UEstado, UGenerico;
      type Cidade = class(Generico)
      protected
           DDD       : string[2];
           umEstado  : Estado;
      public
            Constructor CrieObjeto;
            Destructor Destrua_Se;

            Procedure setDDD (vDDD : string);
            Procedure setumEstado (vEstado : Estado);

            Function getDDD : string;
            Function getumEstado : Estado;
End;
implementation

{ Cidade }

constructor Cidade.CrieObjeto;
begin
     inherited;
      DDD       := ' ';
      umEstado  := Estado.CrieObjeto;
end;

destructor Cidade.Destrua_Se;
begin

end;

function Cidade.getDDD: string;
begin
    Result := DDD;
end;

function Cidade.getumEstado: Estado;
begin
     Result := umEstado;
end;

procedure Cidade.setDDD(vDDD: string);
begin
     DDD := vDDD;
end;

procedure Cidade.setumEstado(vEstado: Estado);
begin
     umEstado := vEstado;
end;

end.
