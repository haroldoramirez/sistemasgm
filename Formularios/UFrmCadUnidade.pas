unit UFrmCadUnidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCadastro, Mask, sMaskEdit, sCustomComboEdit, sTooledit, StdCtrls,
  sEdit, Buttons, sBitBtn, sGroupBox, sLabel, UUnidade, UCtrlUnidade;

type
  TFrmCadUnidade = class(TFrmCadastro)
    lbl_Unidade: TsLabel;
    lbl_DataCadastro: TsLabel;
    lbl_DataUltAlteracao: TsLabel;
    edt_IdUnidade: TsEdit;
    edt_Unidade: TsEdit;
    edt_DataCadastro: TsDateEdit;
    edt_DataUltAlteracao: TsDateEdit;
    lbl_Codigo: TsLabel;
    procedure btn_SairClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    UmUnidade      : Unidade;
    umaCtrlUnidade : CtrlUnidade;
  public
    procedure ConhecaObj(vUnidade: Unidade; vCtrlUnidade : CtrlUnidade);
    procedure HabilitaCampos;
    procedure LimpaCampos;
    procedure CarregaObj;
  end;

var
  FrmCadUnidade: TFrmCadUnidade;

implementation

{$R *.dfm}

{ TFrmCadUnidade }

procedure TFrmCadUnidade.ConhecaObj(vUnidade: Unidade; vCtrlUnidade: CtrlUnidade);
begin
  umUnidade := vUnidade;
  umaCtrlUnidade := vCtrlUnidade;
  self.HabilitaCampos;
  self.LimpaCampos;
end;

procedure TFrmCadUnidade.CarregaObj;
begin
  Self.edt_IdUnidade.Text          := IntToStr(umUnidade.getId);
  Self.edt_Unidade.Text            := UmUnidade.getDescricao;
  Self.edt_DataCadastro.Date     := umUnidade.getDataCadastro;
  Self.edt_DataUltAlteracao.Date := umUnidade.getDataAlteracao;
end;

procedure TFrmCadUnidade.HabilitaCampos;
begin
  self.edt_Unidade.Enabled := True;
end;

procedure TFrmCadUnidade.LimpaCampos;
var dataAtual : TDateTime;
begin
  dataAtual := Date;
  Self.edt_IdUnidade.Clear;
  Self.edt_Unidade.Clear;
  Self.edt_DataCadastro.Date := dataAtual;
  Self.edt_DataUltAlteracao.Date :=dataAtual;
end;

procedure TFrmCadUnidade.btn_SalvarClick(Sender: TObject);
var dataAtual : TDateTime;
    msg: string;
begin
  dataAtual := Date;
  inherited;
  if edt_Unidade.Text = '' then
  begin
    ShowMessage('Campo Unidade não pode estar em branco!');
    edt_Unidade.SetFocus;
  end
  else
  if self.btn_Salvar.Caption = 'Salvar' then
  begin
    UmUnidade.setDescricao(edt_Unidade.Text);
    UmUnidade.setDataCadastro(edt_DataCadastro.Date);
    if self.edt_DataUltAlteracao.Date <> dataAtual then
      UmUnidade.setDataAlteracao(dataAtual);
     msg := umaCtrlUnidade.Salvar(UmUnidade);
    if Copy(msg,0,4) = 'Essa!' then
        ShowMessage(msg)
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
    msg := umaCtrlUnidade.Excluir(umUnidade);
    showmessage(msg);
    self.HabilitaCampos;
    close;
  end;
end;

procedure TFrmCadUnidade.FormActivate(Sender: TObject);
begin
  inherited;
  if (edt_Unidade.Enabled <> False) then
    edt_Unidade.SetFocus;
end;

procedure TFrmCadUnidade.btn_SairClick(Sender: TObject);
begin
  inherited;
  self.HabilitaCampos;
end;

end.
