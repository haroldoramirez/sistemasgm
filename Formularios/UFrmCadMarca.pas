unit UFrmCadMarca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCadastro, Mask, sMaskEdit, sCustomComboEdit, sTooledit, StdCtrls,
  sEdit, sLabel, Buttons, sBitBtn, sGroupBox, UMarca, UCtrlMarca;

type
  TFrmCadMarca = class(TFrmCadastro)
    lbl_Codigo: TsLabel;
    lbl_Marca: TsLabel;
    lbl_DataCadastro: TsLabel;
    lbl_DataUltAlteracao: TsLabel;
    edt_IdMarca: TsEdit;
    edt_Marca: TsEdit;
    edt_DataCadastro: TsDateEdit;
    edt_DataUltAlteracao: TsDateEdit;
    procedure btn_SairClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
  private
    UmMarca      : Marca;
    umaCtrlMarca : CtrlMarca;
  public
    procedure ConhecaObj(vMarca: Marca; vCtrlMarca : CtrlMarca);
    procedure HabilitaCampos;
    procedure LimpaCampos;
    procedure CarregaObj;
end;

var
  FrmCadMarca: TFrmCadMarca;

implementation

{$R *.dfm}

procedure TFrmCadMarca.CarregaObj;
begin
  Self.edt_IdMarca.Text          := IntToStr(umMarca.getId);
  Self.edt_Marca.Text            := UmMarca.getDescricao;
  Self.edt_DataCadastro.Date     := umMarca.getDataCadastro;
  Self.edt_DataUltAlteracao.Date := umMarca.getDataAlteracao;
end;

procedure TFrmCadMarca.ConhecaObj(vMarca: Marca; vCtrlMarca: CtrlMarca);
begin
  umMarca := vMarca;
  umaCtrlMarca := vCtrlMarca;
  self.HabilitaCampos;
  self.LimpaCampos;
end;

procedure TFrmCadMarca.btn_SalvarClick(Sender: TObject);
var dataAtual : TDateTime;
    msg: string;
begin
  dataAtual := Date;
  inherited;
  if edt_Marca.Text = '' then
    begin
        ShowMessage('Campo Marca não pode estar em branco!');
        edt_Marca.SetFocus;
    end
  else
  if self.btn_Salvar.Caption = 'Salvar' then
    begin
      UmMarca.setDescricao(edt_Marca.Text);
      UmMarca.setDataCadastro(edt_DataCadastro.Date);
      if self.edt_DataUltAlteracao.Date <> dataAtual then
        UmMarca.setDataAlteracao(dataAtual);
      msg := umaCtrlMarca.Salvar(UmMarca);
      if Copy(msg,0,4) = 'Esta' then
      begin
        ShowMessage(msg);
        edt_Marca.SetFocus;
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
    begin
    if self.btn_Salvar.Caption = 'Excluir' then
      begin
          msg := umaCtrlMarca.Excluir(umMarca);
          showmessage(msg);
          self.HabilitaCampos;
          close;
      end;
    end;
end;

procedure TFrmCadMarca.HabilitaCampos;
begin
   self.edt_Marca.Enabled := True;
end;

procedure TFrmCadMarca.LimpaCampos;
var dataAtual : TDateTime;
begin
  dataAtual := Date;
  Self.edt_IdMarca.Clear;
  Self.edt_Marca.Clear;
  Self.edt_DataCadastro.Date := dataAtual;
  Self.edt_DataUltAlteracao.Date :=dataAtual;
end;

procedure TFrmCadMarca.btn_SairClick(Sender: TObject);
begin
  inherited;
  self.HabilitaCampos;
end;

end.
