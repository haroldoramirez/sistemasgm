unit UFrmCadEstado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCadastro, StdCtrls, ComCtrls, UEstado, UCtrlEstado, UCrtlPais, UPais, UFrmConPais,
  sGroupBox, Buttons, sBitBtn, sLabel, Mask, sMaskEdit, sCustomComboEdit,
  sTooledit, sEdit, UComuns, UValidacao;

type
  TFrmCadEstado = class(TFrmCadastro)
    lbl_IdEstado: TsLabel;
    lbl_Estado: TsLabel;
    lbl_UF: TsLabel;
    lbl_IdPais: TsLabel;
    lbl_Pais: TsLabel;
    lbl_DataCadastro: TsLabel;
    lbl_DataUltAlteracao: TsLabel;
    edt_IdEstado: TsEdit;
    edt_Estado: TsEdit;
    edt_UF: TsEdit;
    edt_IdPais: TsEdit;
    edt_Pais: TsEdit;
    edt_DataCadastro: TsDateEdit;
    edt_DataUltAlteracao: TsDateEdit;
    btn_Buscar: TsBitBtn;
    procedure btn_SalvarClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure edt_IdPaisExit(Sender: TObject);
    procedure edt_IdPaisKeyPress(Sender: TObject; var Key: Char);
    procedure btn_BuscarClick(Sender: TObject);

   private
    UmEstado : Estado;
    umaCtrlEstado : CtrlEstado;
    umFrmConPais : TFrmConPais;
  public
      procedure ConhecaObj(vEstado: Estado; vCtrlEstado : CtrlEstado);
      procedure HabilitaCampos;
      procedure LimpaCampos;
      procedure CarregaObj;
  end;

var
  FrmCadEstado: TFrmCadEstado;

implementation

{$R *.dfm}

{ TFrmCadEstado }

procedure TFrmCadEstado.btn_BuscarClick(Sender: TObject);
begin
  inherited;
  umFrmConPais := TFrmConPais.Create(nil);
  umFrmConPais.ConhecaObj(umEstado.getumPais);
  umFrmConPais.btn_Sair.Caption := 'Selecionar';
  umFrmConPais.ShowModal;
  self.edt_IdPais.Text := inttostr(umEstado.getumPais.getId);
  self.edt_Pais.Text    := umEstado.getumPais.getDescricao;
end;

procedure TFrmCadEstado.btn_SairClick(Sender: TObject);
begin
  inherited;
  self.HabilitaCampos;
end;

procedure TFrmCadEstado.btn_SalvarClick(Sender: TObject);
var dataAtual : TDateTime;
    msg: string;
begin
  inherited;
  dataAtual := Date;
  if edt_Estado.Text = '' then
  begin
    ShowMessage('Campo Estado não pode estar em branco!');
    edt_Estado.SetFocus;
  end
  else
  if ((not validarUF(edt_UF.Text)and (edt_Pais.Text = 'BRASIL') OR (edt_Pais.Text = 'BRAZIL'))) then
  begin
    ShowMessage('UF do estado inválida!');
  end
  else
  if edt_Pais.Text = '' then
  begin
    ShowMessage('Campo País não pode estar em branco!');
    edt_IdPais.SetFocus;
  end
  else
    if self.btn_Salvar.Caption = 'Salvar' then
    begin
      UmEstado.setDescricao(edt_Estado.Text);
      UmEstado.setUF(edt_UF.Text);
      UmEstado.getUmPais.setId(StrToInt(edt_IdPais.Text));
      UmEstado.getUmPais.setDescricao(edt_Pais.Text);
      UmEstado.setDataCadastro(edt_DataCadastro.Date);
      if self.edt_DataUltAlteracao.Date <> dataAtual then
          UmEstado.setDataAlteracao(dataAtual);
      msg := umaCtrlEstado.Salvar(UmEstado);
      if Copy(msg,0,4) = 'Esse' then
      begin
          ShowMessage(msg);
          edt_Estado.SetFocus;
      end
      else
      begin
        if Copy(msg,0,16) = 'Ocorreu um erro!' then
          Application.MessageBox(PChar(msg), 'Erro!', MB_OK + MB_ICONSTOP)
        else
          ShowMessage(msg);
        Close;
      end;
    end
    else
      if self.btn_Salvar.Caption = 'Excluir' then
      begin
        msg := umaCtrlEstado.Excluir(UmEstado);
        showmessage(msg);
        close;
      end;
end;

procedure TFrmCadEstado.CarregaObj;
begin
  self.edt_IdEstado.Text          := inttostr(umEstado.getId);
  self.edt_Estado.Text            := umEstado.getDescricao;
  self.edt_UF.Text                := umEstado.getUF;
  self.edt_IdPais.Text            := inttostr(umEstado.getumPais.getId);
  self.edt_Pais.Text              := umEstado.getumPais.getDescricao;
  self.edt_DataCadastro.Date      := umEstado.getDataCadastro;
  self.edt_DataUltAlteracao.Date  := umEstado.getDataAlteracao;
end;

procedure TFrmCadEstado.ConhecaObj(vEstado: Estado; vCtrlEstado: CtrlEstado);
begin
  umEstado := vEstado;
  umaCtrlEstado := vCtrlEstado;
  self.HabilitaCampos;
  self.LimpaCampos;
end;

procedure TFrmCadEstado.edt_IdPaisExit(Sender: TObject);
var umaCtrlPais : CtrlPais;
    umPais : Pais;
begin
  inherited;
  if Self.edt_IdPais.Text <> '' then
  begin
   // umEstado := Estado.CrieObjeto;
    Self.edt_Pais.Clear;
    umaCtrlPais := CtrlPais.CrieObjeto;
    umEstado.getUmPais.setId(StrToInt(Self.edt_IdPais.Text));
    umEstado.getUmPais.setDescricao(Self.edt_Pais.Text);
    if not umaCtrlPais.Buscar(umEstado.getUmPais) then
      begin
          MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
          self.edt_IdPais.Clear;
          self.edt_Pais.Clear;
      end
    else
      begin
          umaCtrlPais.Carrega(umEstado.getumPais);
          Self.edt_IdPais.Text := IntToStr(UmEstado.getUmPais.getId);
          Self.edt_Pais.Text := UmEstado.getUmPais.getDescricao;
      end;
    umPais := Pais.CrieObjeto;
    umaCtrlPais.Buscar(umPais);
  end
  else
  begin
   self.edt_IdPais.Clear;
   self.edt_Pais.Clear;
  end;
end;

procedure TFrmCadEstado.edt_IdPaisKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CampoNumero(Sender,Key);
end;

procedure TFrmCadEstado.HabilitaCampos;
begin
  Self.btn_Salvar.Caption  := 'Salvar';
  self.edt_Estado.Enabled  := True;
  self.edt_UF.Enabled      := True;
  Self.edt_IdPais.Enabled  := True;
  Self.btn_Buscar.Enabled  := True;
end;

procedure TFrmCadEstado.LimpaCampos;
var dataAtual : TDateTime;
begin
  dataAtual := Date;
  Self.edt_IdEstado.Clear;
  Self.edt_Estado.Clear;
  Self.edt_UF.Clear;
  self.edt_IdPais.Clear;
  self.edt_Pais.Clear;
  Self.edt_DataCadastro.Date := dataAtual;
  Self.edt_DataUltAlteracao.Date :=dataAtual;
end;

end.
