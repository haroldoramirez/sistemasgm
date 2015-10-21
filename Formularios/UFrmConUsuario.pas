unit UFrmConUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmConsulta, Grids, DBGrids, sSkinManager, Buttons, sBitBtn,
  StdCtrls, sButton, sEdit, sLabel, sGroupBox, UUsuario, UFrmCadUsuario,
  UCtrlUsuario, UComuns;

type
  TFrmConUsuario = class(TFrmConsulta)
    gridConsulta: TDBGrid;
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_EditarClick(Sender: TObject);
    procedure btn_ConsultarClick(Sender: TObject);
    procedure edt_IdKeyPress(Sender: TObject; var Key: Char);
  private
    umUsuario : Usuario;
    umFrmCadUsuario : TFrmCadUsuario;
    umaCtrlUsuario : CtrlUsuario;
  public
    procedure ConhecaObj(vUsuario : Usuario);
    procedure DesabilitaCampos;
  end;

var
  FrmConUsuario: TFrmConUsuario;

implementation

uses UAplicacao;
{$R *.dfm}

{ TFrmConUsuario }

procedure TFrmConUsuario.btn_ConsultarClick(Sender: TObject);
  var
    consUsuario: Usuario;
begin
  inherited;
  consUsuario := Usuario.CrieObjeto;
  consUsuario.setLogin(edt_Descricao.text);
  if edt_Id.Text <> '' then
      consUsuario.setIdUsuario(strtoint(edt_Id.Text));
  if not umaCtrlUsuario.Buscar(consUsuario) then
      MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
  consUsuario.destrua_se;
  edt_Id.Clear;
  edt_Descricao.Clear;
end;

procedure TFrmConUsuario.btn_EditarClick(Sender: TObject);
begin
  inherited;
  umUsuario.setIdUsuario(0);
  umFrmCadUsuario := TFrmCadUsuario.Create(nil);
  umaCtrlUsuario.Carrega(umUsuario);

  if (perfilUser <> 'ADM') then
    MessageDlg('ATENÇÃO: Você não o possui perfil de administrador para editar esse usuário!',mtWarning,[mbOK],0)
  else
  if (umUsuario.getIdUsuario = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser editado!',mtWarning,[mbOK],0)
  else
    with umFrmCadUsuario do
    begin
      ConhecaObj(umUsuario,umaCtrlUsuario);
      CarregaObj;
      ShowModal;
    end
end;

procedure TFrmConUsuario.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  umUsuario.setIdUsuario(0);
  umaCtrlUsuario.Carrega(umUsuario);

  if (perfilUser <> 'ADM') then
    MessageDlg('ATENÇÃO: Você não o possui perfil de administrador para bloquear esse usuário!',mtWarning,[mbOK],0)
  else
  if (umUsuario.getIdUsuario = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser bloaqueado!',mtWarning,[mbOK],0)
  else if umUsuario.getStatus = 'BLOQUEADO' then
    MessageDlg('ATENÇÃO: Esse cadastro já está bloaqueado!',mtWarning,[mbOK],0)
  else
  begin
    umFrmCadUsuario.ConhecaObj(umUsuario, umaCtrlUsuario);
    umFrmCadUsuario.btn_Salvar.Caption := 'Bloquear';
    umFrmCadUsuario.CarregaObj;
    DesabilitaCampos;
    umFrmCadUsuario.ShowModal;
  end
end;

procedure TFrmConUsuario.btn_NovoClick(Sender: TObject);
begin
  inherited;
  if (perfilUser <> 'ADM') then
    MessageDlg('ATENÇÃO: Você não o possui perfil de administrador para criar um novo usuário!',mtWarning,[mbOK],0)
  else
  begin
    if umUsuario.getIdUsuario <> 0 then
      umUsuario.CrieObjeto;
    umFrmCadUsuario.ConhecaObj(umUsuario, umaCtrlUsuario);
    umFrmCadUsuario.ShowModal;
  end;
end;

procedure TFrmConUsuario.btn_SairClick(Sender: TObject);
begin
  inherited;
  if self.btn_Sair.Caption = 'Selecionar' then
  begin
      umUsuario.setIdUsuario(0);
      umUsuario := Usuario(umaCtrlUsuario.Carrega(umUsuario));
  end;
  umFrmCadUsuario.Free;
end;

procedure TFrmConUsuario.ConhecaObj(vUsuario: Usuario);
begin
    umUsuario       := vUsuario;
    umaCtrlUsuario  := CtrlUsuario.CrieObjeto;
    umFrmCadUsuario := TFrmCadUsuario.Create(nil);
    self.gridConsulta.DataSource := umaCtrlUsuario.GetDS;
end;

procedure TFrmConUsuario.DesabilitaCampos;
begin
    umFrmCadUsuario.edt_Login.Enabled := False;
    umFrmCadUsuario.edt_Senha.Enabled := False;
    umFrmCadUsuario.edt_Status.Enabled := False;
    umFrmCadUsuario.edt_IdFuncionario.Enabled := False;
    umFrmCadUsuario.edt_Funcionario.Enabled := False;
    umFrmCadUsuario.btn_Buscar.Enabled := False;
end;

procedure TFrmConUsuario.edt_IdKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CampoNumero(Sender, Key);
end;

end.
