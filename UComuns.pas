unit UComuns;

interface
    uses SysUtils;
    procedure CampoNumero (Sender: TObject; var Key: Char);
    procedure CampoReal (Sender: TObject; var Key: Char; Campo : String);
    function addMascara(valor:String; tipo:Integer) : String;
    function removeMascara(valor:String) : String;
    function removeEspacos(texto:String) : String;

implementation

{Comuns}

procedure CampoNumero (Sender: TObject; var Key: Char);
begin
  if (not(KEY in ['0'..'9'])) and (KEY<>#8) then
      KEY := #0;
end;

procedure CampoReal (Sender: TObject; var Key: Char; Campo : String);
var i : Integer;
begin
   if (Campo = '') then                //Verificar se o campo esta vazio na primeira vez
  begin
    if (not(key in ['0'..'9', #8])) then
       Key := #0;
  end
  else
  begin
    for i := 0 to Length(Campo) do
      if (Campo[i] <> ',') then       //Verifica se ja existe ',' para não deixar adicionar
      begin
         if (not(key in ['0'..'9', ',', #8])) then
            Key := #0;
      end
      else
        CampoNumero(Sender,Key);
  end;
end;
function addMascara(valor:String; tipo:Integer) : String;
begin
  if tipo = 0 then
  begin
    insert('-',valor,10);
    insert('.',valor,7);
    insert('.',valor,4);
  end
  else
  begin
    insert('-',valor,13);
    insert('/',valor,9);
    insert('.',valor,6);
    insert('.',valor,3);
  end;
  Result := valor;
end;

function removeMascara(valor:String) : String;
begin
  Delete(valor,ansipos('.',valor),1);
  Delete(valor,ansipos('.',valor),1);
  Delete(valor,ansipos('/',valor),1);
  Delete(valor,ansipos('-',valor),1);

  Result := valor;
end;

function removeEspacos(texto:String) : String;
var i : Integer;
    textoAux : String;
begin
  textoAux := '';
  if texto <> '' then
  begin
    for i := 0 to Length(texto) do
      if (texto[i] <> #0) and (texto[i] <> #32) then
        textoAux := textoAux+texto[i];
    Result := textoAux;
  end;
end;

end.
