unit UFrmAutenticacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sEdit, sLabel, ExtCtrls, sPanel, sButton, UUsuario,
  UDaoUsuario, UValidacao;

type
  TFrmAutenticacao = class(TForm)
    btn_Entrar: TsButton;
    btn_Cancelar: TsButton;
    Panel1: TsPanel;
    lbl_Login: TsLabel;
    lbl_Senha: TsLabel;
    edt_Login: TsEdit;
    edt_Senha: TsEdit;
    sLabel3: TsLabel;
    procedure btn_CancelarClick(Sender: TObject);
    procedure btn_EntrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edt_SenhaKeyPress(Sender: TObject; var Key: Char);
    procedure edt_LoginKeyPress(Sender: TObject; var Key: Char);
  private
    umUsuario     : Usuario;
    umaDaoUsuario : DaoUsuario;
    tentativas    : Integer;
  public
    permitido : Boolean;
    idFuncionario, Funcionario : String;
    procedure conhecaObj(vUsuario: Usuario);
    function usuarioLogado : Usuario;
  end;

var
  FrmAutenticacao: TFrmAutenticacao;

implementation

{$R *.dfm}

{ TFrmAutenticacao }

procedure TFrmAutenticacao.btn_EntrarClick(Sender: TObject);
begin
    umUsuario.setLogin(edt_Login.Text);
    umUsuario.setSenha(edt_Senha.Text);
    if umaDaoUsuario.validaUsuario(umUsuario) then
    begin
        if (umUsuario.getStatus = 'BLOQUEADO') then
        begin
           MessageDlg('ATENÇÃO: Esse usuário está bloqueado. Favor entrar em contato o Administrador!',mtWarning,[mbOK],0);
           permitido := False;
           edt_Login.Clear;
           edt_Senha.Clear;
           edt_Login.SetFocus;
           Exit;
        end;
        umaDaoUsuario.Carrega(umUsuario);
        permitido := true;
        MessageDlg('Bem Vindo "'+umUsuario.getLogin+'!" ',mtConfirmation,[mbOK],0);
        close;
    end
    else
    begin
        edt_Login.Clear;
        edt_Senha.Clear;
        permitido := false;
        if tentativas = 3 then
        begin
            messageDlg('Você fez mais 3 tentavias!',mtError,[mbOk],0);
            close;
        end
        else
        begin
            tentativas := tentativas+1;
            if (3-tentativas) = 0 then
                messageDlg('Login ou Senha incorreta!',mtWarning, [mbOk],0)
            else
            if (3-tentativas) = 1 then
                messageDlg('Login ou Senha incorreta!',mtWarning, [mbOk],0)
            else
                messageDlg('Login ou Senha incorreta!',mtWarning, [mbOk],0);
            edt_Login.SetFocus;
        end;
    end;
end;

function TFrmAutenticacao.usuarioLogado: Usuario;
begin
    Result := umUsuario;
end;

procedure TFrmAutenticacao.conhecaObj(vUsuario: Usuario);
begin
   umUsuario     := vUsuario;
   umaDaoUsuario := DaoUsuario.CrieObjeto;
end;

procedure TFrmAutenticacao.edt_LoginKeyPress(Sender: TObject; var Key: Char);
begin
  validarCaracteres(Sender, Key, 'Login');
end;

procedure TFrmAutenticacao.edt_SenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    Self.btn_Entrar.Click
  else
    validarCaracteres(Sender, Key, 'Senha');
end;

procedure TFrmAutenticacao.FormActivate(Sender: TObject);
begin
   Self.edt_Login.CharCase := ecUpperCase;
   Self.edt_Senha.CharCase := ecUpperCase;
   Self.edt_Login.SetFocus;
end;

procedure TFrmAutenticacao.btn_CancelarClick(Sender: TObject);
begin
  Close;
end;

end.
