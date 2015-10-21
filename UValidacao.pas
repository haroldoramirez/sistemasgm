unit UValidacao;

interface
    uses SysUtils, Messages, Dialogs;

      function validar_CPF_CNPJ (valor : string) : Boolean;
      function validarEmail (const EMailIn: String) : Boolean;
      function validarUF(UF : String) : Boolean;
      function validarData(Data:TDateTime; Tipo:Integer) : Boolean;
      procedure validarCaracteres(Sender: TObject; var Key: Char; TipoCampo: String);

implementation

{ Validacao }

function validar_CPF_CNPJ(valor: string): Boolean;
var i : integer;
    equal: char;
    valid : boolean;
    digit1, digit2 : Integer;
    cpf, cnpj : string;
    apoio: array[0..15] of integer;
begin
    valor := Trim(valor);
    if Length(valor) = 11 then
      begin
         cpf := valor;
         digit1 := 0;
         digit2 := 0;
         equal := cpf[1];  //variavel para testar se o cpf È repetido: Ex: 111.111.111-11

         // Testar se o CPF È repetido
         for i := 1 to Length(cpf) do
           begin
             if cpf[i] <> equal then
                begin
                  valid := True;    // Se o CPF possui um digito diferente ele passou no primeiro teste
                  Break;
                end;
           end;

         // Se o cpf È composto por numeros repetido retorna falso
         if not valid then
           begin
              validar_CPF_CNPJ := False;
              exit;
           end;

         // Executa o calculo para o primeiro verificador
         for i:=1 to 9 do
           begin
              digit1:= digit1+(strtoint(cpf[10-i])*(i+1));   // formula do primeiro verificador soma=1∞*2 + 2∞*3 + 3∞*4.. atÈ 9∞*10
           end;
         digit1:= ((11 - (digit1 mod 11))mod 11) mod 10;    // digito1 = 11 - soma mod 11  se digito > 10 digito1 =0

         // Verifica se o 1∞ digito confere
         if IntToStr(digit1) <> cpf[10] then
           begin
             validar_CPF_CNPJ := False;
             exit;
           end;

         for i:=1 to 10 do
           begin
              digit2:= digit2+(strtoint(cpf[11-i])*(I+1));  // formula do segundo verificador soma=1∞*2 +2∞*3 +3∞*4.. atÈ 10∞*11
           end;
         digit2:= ((11 - (digit2 mod 11))mod 11) mod 10;    // digito1 = 11 - soma mod 11 se digito > 10 digito1 =0

         // Confere o 2∞ digito verificador
         if IntToStr(digit2) <> cpf[11] then
            begin
               validar_CPF_CNPJ := False;
               exit;
            end;
       // Cpf È valido
       validar_CPF_CNPJ := True;
      end
    else if Length(valor) = 14 then
      begin
          cnpj := valor;
          digit1 := 0;
          digit2 := 0;
          //Monta matriz de apoio
          apoio[0]:=6;//sÛ ser· usada no c·lculo do segundo dÌgito verificador
          apoio[1]:=5;
          apoio[2]:=4;
          apoio[3]:=3;
          apoio[4]:=2;
          apoio[5]:=9;
          apoio[6]:=8;
          apoio[7]:=7;
          apoio[8]:=6;
          apoio[9]:=5;
          apoio[10]:=4;
          apoio[11]:=3;
          apoio[12]:=2;
          //ComeÁa c·lculo do primeiro dÌgito verificador

          for i := 1 to 12 do
            begin
              digit1 := digit1 +(strtoint(cnpj[i])*apoio[i]);
            end;
          digit1 := digit1 mod 11;
          if (digit1 < 2) then
            digit1:=0
          else
            digit1:=11-digit1;

          if (IntToStr(digit1) <> cnpj[13]) then       // Verifica se o 1∞ digito confere
            begin
              validar_CPF_CNPJ := False;
              exit;
            end
          else
            begin       //Primeiro dÌgito confere!
              for i := 0 to 12 do
                begin
                  digit2:=digit2+(strtoint(cnpj[i+1])*apoio[i]);
                end;
              digit2 := digit2 mod 11;
              if (digit2 < 2) then
                digit2 :=0
              else
                digit2 := 11 - digit2;
              if (IntToStr(digit2) <> cnpj[14]) then         // Confere o 2∞ digito verificador
                begin
                  validar_CPF_CNPJ := False;
                  exit;
                end
              else
                validar_CPF_CNPJ := true;
              end;
      end;
end;

function validarEmail(const EMailIn: String):Boolean;
const
  CaraEsp: array[1..40] of string[1] =
  ( '!','#','$','%','®','&','*',
  '(',')','+','=','ß','¨','¢','π','≤',
  '≥','£','¥','`','Á','«',',',';',':',
  '<','>','~','^','?','/','','|','[',']','{','}',
  '∫','™','∞');
var
  i,cont   : integer;
  EMail    : ShortString;
begin
  EMail := EMailIn;
  Result := True;
  cont := 0;
  if EMail <> '' then
    if (Pos('@', EMail)<>0) and (Pos('.', EMail)<>0) then    // existe @ .
    begin
      if (Pos('@', EMail)=1) or (Pos('@', EMail)= Length(EMail)) or (Pos('.', EMail)=1) or (Pos('.', EMail)= Length(EMail)) or (Pos(' ', EMail)<>0) then
        Result := False
      else                                   // @ seguido de . e vice-versa
        if (abs(Pos('@', EMail) - Pos('.', EMail)) = 1) then
          Result := False
        else
          begin
            for i := 1 to 40 do            // se existe Caracter Especial
              if Pos(CaraEsp[i], EMail)<>0 then
                Result := False;
            for i := 1 to length(EMail) do
            begin                                 // se existe apenas 1 @
              if EMail[i] = '@' then
                cont := cont + 1;                    // . seguidos de .
              if (EMail[i] = '.') and (EMail[i+1] = '.') then
                Result := false;
            end;
                                   // . no f, 2ou+ @, . no i, - no i, _ no i
            if (cont >=2) or ( EMail[length(EMail)]= '.' )
              or ( EMail[1]= '.' ) or ( EMail[1]= '_' )
              or ( EMail[1]= '-' )  then
                Result := false;
                                            // @ seguido de COM e vice-versa
            if (abs(Pos('@', EMail) - Pos('com', EMail)) = 1) then
              Result := False;
                                              // @ seguido de - e vice-versa
            if (abs(Pos('@', EMail) - Pos('-', EMail)) = 1) then
              Result := False;
                                              // @ seguido de _ e vice-versa
            if (abs(Pos('@', EMail) - Pos('_', EMail)) = 1) then
              Result := False;
          end;
    end
    else
      Result := False;
end;

function validarUF(UF : String) : Boolean;
const
  UFs = 'SPMGRJRSSCPRESDFMTMSGOTOBASEALPBPEMARNCEPIPAAMAPFNACRRRO';
var
  Posicao : integer;
begin
  Result := true;
  if UF <> '' then
  begin
    Posicao := Pos(UpperCase(UF),UFs);
    if (Posicao = 0) or ((Posicao mod 2) = 0) then
    begin
      Result := false;
    end;
  end;
end;

function validarData(Data : TDateTime; Tipo : Integer) : Boolean;
var a1,m1,d1, a2, m2, d2: word;
    Ano: Integer;
begin
  Result := False;
  DecodeDate(Data, a1, m1, d1);
  DecodeDate(Date, a2, m2, d2);
  if (d1 > 31) or (m1 > 12) or (a1 < 1900) then
  begin
      if (Tipo = 0) then
        MessageDlg('Data de Nascimento inv·lida!', MTERROR, [MBOK], 0)
      else if (Tipo = 1) then
        MessageDlg('Data de FundaÁ„o inv·lida!', MTERROR, [MBOK], 0)
      else if (Tipo = 3) then
        MessageDlg('Data inv·lida!', MTERROR, [MBOK], 0);
      Result := True
  end
  else
  begin
    Ano := a2 - a1;
    if m2 < m1 then
      Ano := Ano - 1
    else if m2 = m1 then
    begin
      if d2 < d1 then
      Ano := Ano - 1;
    end;
    if (Ano < 16) and (Tipo = 0) then
    begin
      MessageDlg('ATEN«√O: Idade menor que 16 anos.',mtWarning,[mbOK],0);
      Result := True;
    end
    else if (Ano < 0) and (Tipo = 1) then
    begin
      MessageDlg('ATEN«√O: A data n„o pode ser maior que a atual.',mtWarning,[mbOK],0);
      Result := True;
    end
    else if (Ano >= 0) and (Tipo = 2) and (d2 <> d1)then
    begin
      MessageDlg('ATEN«√O: Essa CNH est· vencida.',mtWarning,[mbOK],0);
      Result := True;
    end;
  end;
end;

procedure validarCaracteres(Sender: TObject; var Key: Char; TipoCampo: String);
Const
especiais = '0123456789<>!@#$%®&*()_-+={}[]?;:,.|/*"Á«~^¥`®‚¬‡¿„√È…Í Ë»ÌÕÓŒÏÃÊ∆ÙÚ˚˘¯£ÿÉ·¡Û˙Ò—™∫øÆΩº”ﬂ‘“ı’µ˛⁄€Ÿ˝›';//caracteres especiais que sql n„o aceita
especiaisNumber = '<>!@#$%®&*()_-+={}[]?;:,.|/*"Á«~^¥`®‚¬‡¿„√È…Í Ë»ÌÕÓŒÏÃÊ∆ÙÚ˚˘¯£ÿÉ·¡Û˙Ò—™∫øÆΩº”ﬂ‘“ı’µ˛⁄€Ÿ˝›';
Var
  Str : String;
begin
  Str := key;
  if (TipoCampo = 'Login') then
  begin
    if (Pos(Str,especiais)<>0) or (Str = '''') Then
      key:= #0;
  end
  else
  begin
    if(Pos(Str,especiaisNumber)<>0) or (Str = '''') Then
      key:= #0;
  end;
end;

end.
