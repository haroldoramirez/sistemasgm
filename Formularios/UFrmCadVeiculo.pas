unit UFrmCadVeiculo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCadastro, StdCtrls, Buttons, sBitBtn, sGroupBox, sLabel,
  uVeiculo, UCtrlVeiculo, Mask, sMaskEdit, sCustomComboEdit, sTooledit, sEdit;

type
  TFrmCadVeiculo = class(TFrmCadastro)
    lbl_Codigo: TsLabel;
    lbl_Pais: TsLabel;
    lbl_DDI: TsLabel;
    lbl_DataCadastro: TsLabel;
    lbl_DataUltAlteracao: TsLabel;
    sLabel2: TsLabel;
    edt_IdVeiculo: TsEdit;
    edt_Antt: TsEdit;
    edt_Uf: TsEdit;
    edt_DataCadastro: TsDateEdit;
    edt_DataUltAlteracao: TsDateEdit;
    edt_Placa: TsEdit;
    procedure btn_SairClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
  private
    { Private declarations }
    UmVeiculo : Veiculo;
    umaCtrlVeiculo : CtrlVeiculo;
  public
    { Public declarations }
      procedure ConhecaObj(vVeiculo: Veiculo; vCtrlVeiculo : CtrlVeiculo);
      procedure HabilitaCampos;
      procedure LimpaCampos;
      procedure CarregaObj;
  end;

var
  FrmCadVeiculo: TFrmCadVeiculo;

implementation

{$R *.dfm}

{ TFrmCadVeiculo }

procedure TFrmCadVeiculo.btn_SairClick(Sender: TObject);
begin
  inherited;
  self.HabilitaCampos;
end;

procedure TFrmCadVeiculo.btn_SalvarClick(Sender: TObject);
var
  dataAtual : TDateTime;
  msg: string;
begin
  inherited;
  dataAtual := Date;
  if edt_Antt.Text = '' then
    begin
      ShowMessage('Campo Antt não pode estar em branco!');
      edt_Antt.SetFocus;
    end
  else
  if edt_Placa.Text = '' then
    begin
        ShowMessage('Campo Placa não pode estar em branco!');
        edt_Placa.SetFocus;
    end
  else
  if edt_Uf.Text = '' then
    begin
        ShowMessage('Campo Uf não pode estar em branco!');
        edt_Uf.SetFocus;
    end
  else
  if self.btn_Salvar.Caption = 'Salvar' then
    begin
      UmVeiculo.setAntt(edt_Antt.Text);
      UmVeiculo.setPlaca(edt_Placa.Text);
      UmVeiculo.setUf(edt_Uf.Text);
      UmVeiculo.setDataCadastro(edt_DataCadastro.Date);
      if self.edt_DataUltAlteracao.Date <> dataAtual then
        UmVeiculo.setDataAlteracao(dataAtual);
      msg := umaCtrlVeiculo.Salvar(UmVeiculo);
      if Copy(msg,0,4) = 'Esse' then
      begin
          ShowMessage(msg);
          edt_Antt.SetFocus;
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
        msg := umaCtrlVeiculo.Excluir(UmVeiculo);
        ShowMessage(msg);
        Close;
    end;
end;

procedure TFrmCadVeiculo.CarregaObj;
begin
    Self.edt_IdVeiculo.Text        := IntToStr(UmVeiculo.getId);
    self.edt_Antt.Text             := umVeiculo.getAntt;
    self.edt_Uf.Text               := umVeiculo.getUf;
    self.edt_Placa.Text            := umVeiculo.getPlaca;
    Self.edt_DataCadastro.Date     := umVeiculo.getDataCadastro;
    Self.edt_DataUltAlteracao.Date := umVeiculo.getDataAlteracao;
end;

procedure TFrmCadVeiculo.ConhecaObj(vVeiculo: Veiculo; vCtrlVeiculo: CtrlVeiculo);
begin
   UmVeiculo := vVeiculo;
   umaCtrlVeiculo := vCtrlVeiculo;
   self.HabilitaCampos;
   self.LimpaCampos;
end;

procedure TFrmCadVeiculo.HabilitaCampos;
begin
   Self.btn_Salvar.Caption  := 'Salvar';
   Self.edt_Antt.Enabled := true;
   self.edt_Uf.Enabled := true;
   self.edt_Placa.Enabled := True;
end;

procedure TFrmCadVeiculo.LimpaCampos;
var dataAtual : TDateTime;
begin
    dataAtual := Date;
    self.edt_IdVeiculo.Clear;
    self.edt_Antt.Clear;
    self.edt_Uf.Clear;
    Self.edt_Placa.Clear;
    self.edt_DataCadastro.Date := dataAtual;
    self.edt_DataUltAlteracao.Date := dataAtual;
end;

end.
