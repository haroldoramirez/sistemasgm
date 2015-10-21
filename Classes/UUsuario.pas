unit UUsuario;

interface
      uses UFuncionario, SysUtils;
      type Usuario = class
      private
      Protected
        IdUsuario     : Integer;
        Login         : string[30];
        Senha         : string[10];
        Status        : string[15];
        Perfil        : string[3];
        umFuncionario : Funcionario;
        DataCadastro  : TDateTime;
        DataAlteracao : TDateTime;
      Public
        verificaLogin, verificaFunc : Boolean;
        Constructor CrieObjeto;
        Destructor Destrua_Se;

        Procedure setIdUsuario (vIdUsuario : integer);
        Procedure setLogin (vLogin : string);
        Procedure setSenha (vSenha : string);
        Procedure setStatus (vStatus : string);
        Procedure setPerfil (vPerfil : string);
        Procedure setUmFuncionario (vFuncionario : Funcionario);
        Procedure setDataCadastro (vDataCadastro : TDateTime);
        Procedure setDataAlteracao (vDataAlteracao : TDateTime);

        Function getIdUsuario     : integer;
        Function getLogin         : string;
        Function getSenha         : string;
        Function getStatus        : string;
        Function getPerfil        : string;
        Function getUmFuncionario : Funcionario;
        Function getDataCadastro  :TDateTime;
        Function getDataAlteracao : TDateTime;
End;

implementation

{ Usuario }

constructor Usuario.CrieObjeto;
var dataAtual : TDateTime;
begin
  dataAtual     := Date;
  IdUsuario     := 0;
  Login         := '';
  Senha         := '';
  Status        := '';
  Perfil        := '';
  umFuncionario := Funcionario.CrieObjeto;
  DataCadastro  := dataAtual;
  DataAlteracao := dataAtual;
end;

destructor Usuario.Destrua_Se;
begin

end;

function Usuario.getDataAlteracao: TDateTime;
begin
    Result := DataAlteracao;
end;

function Usuario.getDataCadastro: TDateTime;
begin
    Result := DataCadastro;
end;

function Usuario.getIdUsuario: integer;
begin
    Result := IdUsuario;
end;

function Usuario.getLogin: string;
begin
    Result := Login;
end;

function Usuario.getPerfil: string;
begin
    Result := Perfil;
end;

function Usuario.getSenha: string;
begin
    Result := Senha;
end;

function Usuario.getStatus: string;
begin
    Result := Status;
end;

function Usuario.getUmFuncionario: Funcionario;
begin
    Result := umFuncionario;
end;

procedure Usuario.setDataAlteracao(vDataAlteracao: TDateTime);
begin
    DataAlteracao := vDataAlteracao;
end;

procedure Usuario.setDataCadastro(vDataCadastro: TDateTime);
begin
    DataCadastro := vDataCadastro;
end;

procedure Usuario.setIdUsuario(vIdUsuario: integer);
begin
    IdUsuario := vIdUsuario;
end;

procedure Usuario.setLogin(vLogin: string);
begin
    Login := vLogin;
end;

procedure Usuario.setPerfil(vPerfil: string);
begin
    Perfil := vPerfil;
end;

procedure Usuario.setSenha(vSenha: string);
begin
    Senha := vSenha;
end;

procedure Usuario.setStatus(vStatus: string);
begin
    Status := vStatus;
end;
procedure Usuario.setUmFuncionario(vFuncionario: Funcionario);
begin
    umFuncionario := vFuncionario;
end;

end.

