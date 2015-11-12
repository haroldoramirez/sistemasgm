unit UFrmCadCfop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCadastro, StdCtrls, Buttons, sBitBtn, sGroupBox, sLabel, Mask,
  sMaskEdit, sCustomComboEdit, sTooledit, sEdit, uCfop, UCtrlCfop;

type
  TFrmCadCfop = class(TFrmCadastro)
    lbl_Codigo: TsLabel;
    lbl_Pais: TsLabel;
    lbl_DataCadastro: TsLabel;
    lbl_DataUltAlteracao: TsLabel;
    sLabel2: TsLabel;
    edt_IdCfop: TsEdit;
    edt_Nome: TsEdit;
    edt_DataCadastro: TsDateEdit;
    edt_DataUltAlteracao: TsDateEdit;
    edt_Numero: TsEdit;
    procedure btn_SalvarClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
  private
    { Private declarations }
    umCfop : Cfop;
    umaCtrlCfop : CtrlCfop;
  public
    { Public declarations }
      procedure ConhecaObj(vCfop: Cfop; vCtrlCfop : CtrlCfop);
      procedure HabilitaCampos;
      procedure LimpaCampos;
      procedure CarregaObj;
  end;

var
  FrmCadCfop: TFrmCadCfop;

implementation

{$R *.dfm}

{ TFrmCadCfop }

procedure TFrmCadCfop.btn_SairClick(Sender: TObject);
begin
  inherited;
  self.HabilitaCampos;
end;

procedure TFrmCadCfop.btn_SalvarClick(Sender: TObject);
var
  dataAtual : TDateTime;
  msg: string;
begin
  inherited;
  dataAtual := Date;
  if edt_Nome.Text = '' then
    begin
      ShowMessage('Campo Descrição não pode estar em branco!');
      edt_Nome.SetFocus;
    end
  else
  if edt_Numero.Text = '' then
    begin
      ShowMessage('Campo Número não pode estar em branco!');
      edt_Numero.SetFocus;
    end
  else
  if self.btn_Salvar.Caption = 'Salvar' then
    begin
      umCfop.setNome(edt_Nome.Text);
      umCfop.setNumero(edt_Numero.Text);
      umCfop.setDataCadastro(edt_DataCadastro.Date);
      if self.edt_DataUltAlteracao.Date <> dataAtual then
        umCfop.setDataAlteracao(dataAtual);
      msg := umaCtrlCfop.Salvar(umCfop);
      if Copy(msg,0,4) = 'Esse' then
      begin
          ShowMessage(msg);
          edt_Nome.SetFocus;
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
        msg := umaCtrlCfop.Excluir(umCfop);
        ShowMessage(msg);
        Close;
    end;
end;

procedure TFrmCadCfop.CarregaObj;
begin
    Self.edt_IdCfop.Text           := IntToStr(umCfop.getId);
    Self.edt_Nome.Text             := umCfop.getNome;
    Self.edt_Numero.Text           := umCfop.getNumero;
    Self.edt_DataCadastro.Date     := umCfop.getDataCadastro;
    Self.edt_DataUltAlteracao.Date := umCfop.getDataAlteracao;
end;

procedure TFrmCadCfop.ConhecaObj(vCfop: Cfop; vCtrlCfop: CtrlCfop);
begin
   umCfop := vCfop;
   umaCtrlCfop := vCtrlCfop;
   self.HabilitaCampos;
   self.LimpaCampos;
end;

procedure TFrmCadCfop.HabilitaCampos;
begin
   Self.btn_Salvar.Caption  := 'Salvar';
   self.edt_Nome.Enabled := True;
   self.edt_Numero.Enabled := True;
end;

procedure TFrmCadCfop.LimpaCampos;
var dataAtual : TDateTime;
begin
    dataAtual := Date;
    Self.edt_IdCfop.Clear;
    Self.edt_Nome.Clear;
    Self.edt_Numero.Clear;
    Self.edt_DataCadastro.Date := dataAtual;
    Self.edt_DataUltAlteracao.Date := dataAtual;
end;

end.
