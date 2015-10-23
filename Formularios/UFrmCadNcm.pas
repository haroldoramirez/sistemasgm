unit UFrmCadNcm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCadastro, StdCtrls, Buttons, sBitBtn, sGroupBox, sLabel,
  UNcm, UCtrlNcm, Mask, sMaskEdit, sCustomComboEdit, sTooledit, sEdit;

type
  TFrmCadNcm = class(TFrmCadastro)
    lbl_Codigo: TsLabel;
    lbl_Pais: TsLabel;
    lbl_DataCadastro: TsLabel;
    lbl_DataUltAlteracao: TsLabel;
    sLabel2: TsLabel;
    edt_IdNcm: TsEdit;
    edt_Numero: TsEdit;
    edt_DataCadastro: TsDateEdit;
    edt_DataUltAlteracao: TsDateEdit;
    edt_PorcentagemIPI: TsEdit;
    procedure btn_SairClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
  private
    { Private declarations }
    umNcm : Ncm;
    umaCtrlNcm : CtrlNcm;
  public
    { Public declarations }
      procedure ConhecaObj(vNcm: Ncm; vCtrlNcm : CtrlNcm);
      procedure HabilitaCampos;
      procedure LimpaCampos;
      procedure CarregaObj;
  end;

var
  FrmCadNcm: TFrmCadNcm;

implementation

{$R *.dfm}

{ TFrmCadNcm }

procedure TFrmCadNcm.btn_SairClick(Sender: TObject);
begin
  inherited;
  self.HabilitaCampos;
end;

procedure TFrmCadNcm.btn_SalvarClick(Sender: TObject);
var
  dataAtual : TDateTime;
  msg: string;
begin
  inherited;
  dataAtual := Date;
  if edt_Numero.Text = '' then
    begin
      ShowMessage('Campo Número não pode estar em branco!');
      edt_Numero.SetFocus;
    end
  else
  if edt_PorcentagemIPI.Text = '' then
    begin
        ShowMessage('Campo Porcentagem IPI não pode estar em branco!');
        edt_PorcentagemIPI.SetFocus;
    end
  else
  if self.btn_Salvar.Caption = 'Salvar' then
    begin
      umNcm.setNumero(StrToInt(edt_Numero.Text));
      umNcm.setPorcentagem_Ipi(StrToFloat(edt_PorcentagemIPI.Text));
      umNcm.setDataCadastro(edt_DataCadastro.Date);
      if self.edt_DataUltAlteracao.Date <> dataAtual then
        umNcm.setDataAlteracao(dataAtual);
      msg := umaCtrlNcm.Salvar(UmNcm);
      if Copy(msg,0,4) = 'Esse' then
      begin
          ShowMessage(msg);
          edt_Numero.SetFocus;
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
        msg := umaCtrlNcm.Excluir(UmNcm);
        ShowMessage(msg);
        Close;
    end;
end;

procedure TFrmCadNcm.CarregaObj;
begin
    Self.edt_IdNcm.Text            := IntToStr(UmNcm.getId);
    self.edt_Numero.Text           := IntToStr(umNcm.getNumero);
    self.edt_PorcentagemIPI.Text   := FloatToStr(umNcm.getPorcentagem_Ipi);
    Self.edt_DataCadastro.Date     := umNcm.getDataCadastro;
    Self.edt_DataUltAlteracao.Date := umNcm.getDataAlteracao;
end;

procedure TFrmCadNcm.ConhecaObj(vNcm: Ncm; vCtrlNcm: CtrlNcm);
begin
   umNcm := vNcm;
   umaCtrlNcm := vCtrlNcm;
   self.HabilitaCampos;
   self.LimpaCampos;
end;

procedure TFrmCadNcm.HabilitaCampos;
begin
   Self.btn_Salvar.Caption  := 'Salvar';
   Self.edt_Numero.Enabled := true;
   self.edt_PorcentagemIPI.Enabled := true;
end;

procedure TFrmCadNcm.LimpaCampos;
var dataAtual : TDateTime;
begin
    dataAtual := Date;
    self.edt_IdNcm.Clear;
    self.edt_Numero.Clear;
    Self.edt_PorcentagemIPI.Clear;
    self.edt_DataCadastro.Date := dataAtual;
    self.edt_DataUltAlteracao.Date := dataAtual;
end;
end.
