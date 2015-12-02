unit UFrmCadUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCadastro, Mask, sMaskEdit, sCustomComboEdit, sTooledit, StdCtrls,
  sEdit, sLabel, Buttons, sBitBtn, sGroupBox, UUsuario, UCtrlUsuario, UFrmConFuncionario,
  UComuns, UCtrlFuncionario, UFuncionario, sCheckBox;

type
  TFrmCadUsuario = class(TFrmCadastro)
    lbl_IdUsuario: TsLabel;
    lbl_Login: TsLabel;
    lbl_Senha: TsLabel;
    lbl_IdFuncionario: TsLabel;
    lbl_Funcionario: TsLabel;
    lbl_DataCadastro: TsLabel;
    lbl_DataUltAlteracao: TsLabel;
    edt_IdUsuario: TsEdit;
    edt_Login: TsEdit;
    edt_Senha: TsEdit;
    edt_IdFuncionario: TsEdit;
    edt_Funcionario: TsEdit;
    edt_DataCadastro: TsDateEdit;
    edt_DataUltAlteracao: TsDateEdit;
    btn_Buscar: TsBitBtn;
    Status: TsGroupBox;
    edt_Status: TsEdit;
    sGroupBox2: TsGroupBox;
    ch_Administrador: TsCheckBox;
    procedure edt_IdFuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure edt_IdFuncionarioExit(Sender: TObject);
    procedure btn_BuscarClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
  private
    UmUsuario : Usuario;
    umaCtrlUsuario : CtrlUsuario;
    umFrmConFuncionario : TFrmConFuncionario;
  public
      loginAlterado : string;
      funcAlterado  : Integer;
      procedure ConhecaObj(vUsuario: Usuario; vCtrlUsuario : CtrlUsuario);
      procedure HabilitaCampos;
      procedure LimpaCampos;
      procedure CarregaObj;
  end;

var
  FrmCadUsuario: TFrmCadUsuario;

implementation

{$R *.dfm}

{ TFrmCadUsuario }

procedure TFrmCadUsuario.btn_BuscarClick(Sender: TObject);
begin
  inherited;
    umFrmConFuncionario := TFrmConFuncionario.Create(nil);
    umFrmConFuncionario.ConhecaObj(umUsuario.getumFuncionario);
    umFrmConFuncionario.btn_Sair.Caption := 'Selecionar';
    umFrmConFuncionario.ShowModal;
    if (UmUsuario.getumFuncionario.getId <> 0) then
    begin
      if (umaCtrlUsuario.BuscarFuncionario(UmUsuario.getUmFuncionario.getId))  and (funcAlterado <> umUsuario.getumFuncionario.getId) then
        begin
        if (UmUsuario.getUmFuncionario.getDataDemissao <> StrToDateTime('30/12/1899')) then
          MessageDlg('ATENÇÃO: Esse funcionário não tem mais acesso a esse sistema.',mtWarning,[mbOK],0)
        else
          MessageDlg('ATENÇÃO: Esse funcionário já tem um usuário cadastrado.',mtWarning,[mbOK],0);

        self.edt_IdFuncionario.SetFocus;
        self.edt_IdFuncionario.Clear;
        self.edt_Funcionario.Clear;
        Exit;
      end;
      self.edt_IdFuncionario.Text := inttostr(umUsuario.getumFuncionario.getId);
      self.edt_Funcionario.Text   := umUsuario.getumFuncionario.getNome_RazaoSoCial;
    end;
end;

procedure TFrmCadUsuario.btn_SalvarClick(Sender: TObject);
var
  dataAtual : TDateTime;
  msg: string;
  valida : Boolean;
begin
  inherited;
  dataAtual := Date;
  valida := False;
    if edt_Login.Text = '' then
      begin
          ShowMessage('Campo Login não pode estar em branco!');
          edt_Senha.SetFocus;
      end
    else
      if (edt_Senha.Text = '') or (Length(edt_Senha.Text) < 6) then
        begin
            if (Length(edt_Senha.Text) < 6) and (edt_Senha.Text <> '') then
              ShowMessage('Senha não pode ser menor que 6 caracteres!')
            else
              ShowMessage('Campo Senha não pode estar em branco!');
            edt_Senha.SetFocus;
        end
    else
      if edt_Funcionario.Text = '' then
        begin
            ShowMessage('Favor adicionar um funcionário!');
            edt_Senha.SetFocus;
        end
      else
      if self.btn_Salvar.Caption = 'Salvar' then
        begin
           valida := True;
           UmUsuario.setStatus('ATIVO');
        end
      else
        if self.btn_Salvar.Caption = 'Bloquear' then
          begin
             valida := True;
             UmUsuario.setStatus('BLOQUEADO');
          end;
      if (valida) then
      begin
        Self.edt_Status.Text := UmUsuario.getStatus;
        if (edt_Login.Text <> loginAlterado) then
          UmUsuario.verificaLogin := True
        else
          UmUsuario.verificaLogin := False;
        if (StrToInt(edt_IdFuncionario.Text) <> funcAlterado) then
          UmUsuario.verificaFunc := True
        else
          UmUsuario.verificaFunc := False;

        if (ch_Administrador.Checked) then
          UmUsuario.setPerfil('ADM')
        else
          UmUsuario.setPerfil('');

        UmUsuario.setLogin(edt_Login.Text);
        UmUsuario.setSenha(edt_Senha.Text);
        UmUsuario.getUmFuncionario.setId(StrToInt(edt_IdFuncionario.Text));
        UmUsuario.getUmFuncionario.setNome_RazaoSoCial(edt_Funcionario.Text);
        UmUsuario.setDataCadastro(edt_DataCadastro.Date);
        if self.edt_DataUltAlteracao.Date <> dataAtual then
          UmUsuario.setDataAlteracao(dataAtual);
         msg := umaCtrlUsuario.Salvar(UmUsuario);
        if (Copy(msg,0,4) = 'Esse') then
          ShowMessage(msg)
        else
        begin
          if Copy(msg,0,16) = 'Ocorreu um erro!' then
              Application.MessageBox(PChar(msg), 'Erro!', MB_OK + MB_ICONSTOP)
          else
              ShowMessage(msg);
          Close;
        end;
      end;
end;

procedure TFrmCadUsuario.CarregaObj;
begin
    loginAlterado                  := umUsuario.getLogin;
    funcAlterado                   := umUsuario.getUmFuncionario.getId;
    self.edt_IdUsuario.Text        := inttostr(umUsuario.getIdUsuario);
    self.edt_Login.Text            := loginAlterado;
    self.edt_Senha.Text            := umUsuario.getSenha;
    self.edt_Status.Text           := umUsuario.getStatus;
    self.edt_IdFuncionario.Text    := inttostr(funcAlterado);
    self.edt_Funcionario.Text      := umUsuario.getUmFuncionario.getNome_RazaoSoCial;
    self.edt_DataCadastro.Date     := umUsuario.getDataCadastro;
    self.edt_DataUltAlteracao.Date := umUsuario.getDataAlteracao;

    if (UmUsuario.getPerfil = 'ADM') then
      ch_Administrador.Checked := True
    else
      ch_Administrador.Checked := False;
end;

procedure TFrmCadUsuario.ConhecaObj(vUsuario: Usuario; vCtrlUsuario: CtrlUsuario);
begin
   umUsuario := vUsuario;
   umaCtrlUsuario := vCtrlUsuario;
   self.HabilitaCampos;
   self.LimpaCampos;
end;

procedure TFrmCadUsuario.edt_IdFuncionarioExit(Sender: TObject);
var umaCtrlFuncionario : CtrlFuncionario;
    umFuncionario : Funcionario;
begin
  inherited;
   if Self.edt_IdFuncionario.Text <> '' then
     begin
        Self.edt_Funcionario.Clear;
        umaCtrlFuncionario := CtrlFuncionario.CrieObjeto;
        umUsuario.getUmFuncionario.setId(StrToInt(Self.edt_IdFuncionario.Text));
        umUsuario.getUmFuncionario.setNome_RazaoSoCial(Self.edt_Funcionario.Text);
        umUsuario.getUmFuncionario.setCPF_CNPJ('');
        if not umaCtrlFuncionario.Buscar(umUsuario.getUmFuncionario) then
          begin
              MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
              self.edt_IdFuncionario.SetFocus;
              self.edt_IdFuncionario.Clear;
              self.edt_Funcionario.Clear;
              umUsuario.getUmFuncionario.setId(0);
          end
        else
          begin
              umaCtrlFuncionario.Carrega(umUsuario.getumFuncionario);
              if (umaCtrlUsuario.BuscarFuncionario(UmUsuario.getUmFuncionario.getId)) and (funcAlterado <> umUsuario.getumFuncionario.getId)then
              begin
                if (UmUsuario.getUmFuncionario.getDataDemissao <> StrToDateTime('30/12/1899')) then
                  MessageDlg('ATENÇÃO: Esse funcionário não tem mais acesso a esse sistema.',mtWarning,[mbOK],0)
                else
                  MessageDlg('ATENÇÃO: Esse funcionário já tem um usuário cadastrado.',mtWarning,[mbOK],0);

                self.edt_IdFuncionario.SetFocus;
                self.edt_IdFuncionario.Clear;
                self.edt_Funcionario.Clear;
                Exit;
              end;
              Self.edt_IdFuncionario.Text := IntToStr(UmUsuario.getUmFuncionario.getId);
              Self.edt_Funcionario.Text := UmUsuario.getUmFuncionario.getNome_RazaoSoCial;
          end;
        umFuncionario := Funcionario.CrieObjeto;
        umaCtrlFuncionario.Buscar(umFuncionario);
     end
   else
     begin
       self.edt_IdFuncionario.Clear;
       self.edt_Funcionario.Clear;
     end;
end;

procedure TFrmCadUsuario.edt_IdFuncionarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    CampoNumero(Sender,Key);
end;

procedure TFrmCadUsuario.HabilitaCampos;
begin
   Self.btn_Salvar.Caption  := 'Salvar';
   self.edt_Login.Enabled   := True;
   self.edt_senha.Enabled   := True;
   Self.edt_IdFuncionario.Enabled  := True;
   Self.btn_Buscar.Enabled  := True;
end;

procedure TFrmCadUsuario.LimpaCampos;
var dataAtual : TDateTime;
begin
    dataAtual := Date;
    Self.edt_IdUsuario.Clear;
    Self.edt_Login.Clear;
    Self.edt_Senha.Clear;
    Self.edt_Status.Clear;
    self.edt_IdFuncionario.Clear;
    self.edt_Funcionario.Clear;
    Self.edt_DataCadastro.Date := dataAtual;
    Self.edt_DataUltAlteracao.Date :=dataAtual;
end;

end.
