unit UFrmCadPais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCadastro, StdCtrls, UPais, UCrtlPais, ComCtrls, DateUtils,
  Buttons, sBitBtn, sGroupBox, Mask, sMaskEdit, sCustomComboEdit, sTooledit,
  sEdit, sLabel;
type
  TFrmCadPais = class(TFrmCadastro)
    lbl_Codigo: TsLabel;
    lbl_Pais: TsLabel;
    lbl_DDI: TsLabel;
    lbl_DataCadastro: TsLabel;
    lbl_DataUltAlteracao: TsLabel;
    edt_IdPais: TsEdit;
    edt_Pais: TsEdit;
    edt_DDI: TsEdit;
    edt_DataCadastro: TsDateEdit;
    edt_DataUltAlteracao: TsDateEdit;
    sLabel1: TsLabel;
    edt_Sigla: TsEdit;
    procedure edt_IdKeyPress(Sender: TObject; var Key: Char);
    procedure btn_SalvarClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
  private
    UmPais : Pais;
    umaCtrlPais : CtrlPais;
  public
      procedure ConhecaObj(vPais: Pais; vCtrlPais : CtrlPais);
      procedure HabilitaCampos;
      procedure LimpaCampos;
      procedure CarregaObj;
  end;

var
  FrmCadPais: TFrmCadPais;

implementation

{$R *.dfm}

{ TFrmCadPais }

procedure TFrmCadPais.btn_SairClick(Sender: TObject);
begin
  inherited;
  self.HabilitaCampos;
end;

procedure TFrmCadPais.btn_SalvarClick(Sender: TObject);
var
  dataAtual : TDateTime;
  msg: string;
begin
  inherited;
  dataAtual := Date;
  if edt_Pais.Text = '' then
    begin
      ShowMessage('Campo País não pode estar em branco!');
      edt_Pais.SetFocus;
    end
  else
  if self.btn_Salvar.Caption = 'Salvar' then
    begin
      UmPais.setDescricao(edt_Pais.Text);
      UmPais.setDdi(edt_Ddi.Text);
      UmPais.setSigla(edt_Sigla.Text);
      UmPais.setDataCadastro(edt_DataCadastro.Date);
      if self.edt_DataUltAlteracao.Date <> dataAtual then
        UmPais.setDataAlteracao(dataAtual);
      msg := umaCtrlPais.Salvar(UmPais);
      if Copy(msg,0,4) = 'Esse' then
      begin
          ShowMessage(msg);
          edt_Pais.SetFocus;
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
        msg := umaCtrlPais.Excluir(umPais);
        ShowMessage(msg);
        Close;
    end;
end;

procedure TFrmCadPais.CarregaObj;
begin
    Self.edt_IdPais.Text           := IntToStr(umPais.getId);
    Self.edt_Pais.Text             := UmPais.getDescricao;
    Self.edt_DDI.Text              := umPais.getDDI;
    Self.edt_Sigla.Text            := UmPais.getSigla;
    Self.edt_DataCadastro.Date     := umPais.getDataCadastro;
    Self.edt_DataUltAlteracao.Date := umPais.getDataAlteracao;
end;

procedure TFrmCadPais.ConhecaObj(vPais: Pais; vCtrlPais : CtrlPais);
begin
   umPais := vPais;
   umaCtrlPais := vCtrlPais;
   self.HabilitaCampos;
   self.LimpaCampos;
end;

procedure TFrmCadPais.edt_IdKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    if (not(KEY in ['0'..'9'])) and (KEY<>#0) then
      KEY := #0;
end;

procedure TFrmCadPais.HabilitaCampos;
begin
   Self.btn_Salvar.Caption  := 'Salvar';
   self.edt_Pais.Enabled := True;
   self.edt_DDI.Enabled := True;
   Self.edt_Sigla.Enabled := True;
end;

procedure TFrmCadPais.LimpaCampos;
var dataAtual : TDateTime;
begin
    dataAtual := Date;
    Self.edt_IdPais.Clear;
    Self.edt_Pais.Clear;
    Self.edt_DDI.Clear;
    Self.edt_Sigla.Clear;
    Self.edt_DataCadastro.Date := dataAtual;
    Self.edt_DataUltAlteracao.Date := dataAtual;
end;

end.
