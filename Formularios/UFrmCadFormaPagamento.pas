unit UFrmCadFormaPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCadastro, Mask, sMaskEdit, sCustomComboEdit, sTooledit, StdCtrls,
  sEdit, sLabel, Buttons, sBitBtn, sGroupBox, UFormaPagamento, UCtrlFormaPagamento;

type
  TFrmCadFormaPagamento = class(TFrmCadastro)
    lbl_IdFormaPagamento: TsLabel;
    lbl_FormaPagamento: TsLabel;
    lbl_DataCadastro: TsLabel;
    lbl_DataUltAlteracao: TsLabel;
    edt_IdFormaPagamento: TsEdit;
    edt_FormaPagamento: TsEdit;
    edt_DataCadastro: TsDateEdit;
    edt_DataUltAlteracao: TsDateEdit;
    procedure btn_SairClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
  private
    { Private declarations }
    UmFormaPagamento : FormaPagamento;
    umaCtrlFormaPagamento : CtrlFormaPagamento;
  public
    { Public declarations }
      procedure ConhecaObj(vFormaPagamento: FormaPagamento; vCtrlFormaPagamento : CtrlFormaPagamento);
      procedure HabilitaCampos;
      procedure LimpaCampos;
      procedure CarregaObj;
  end;

var
  FrmCadFormaPagamento: TFrmCadFormaPagamento;

implementation

{$R *.dfm}

procedure TFrmCadFormaPagamento.btn_SairClick(Sender: TObject);
begin
  inherited;
  self.HabilitaCampos;
end;

procedure TFrmCadFormaPagamento.btn_SalvarClick(Sender: TObject);
var
  dataAtual : TDateTime;
  msg: string;
begin
    dataAtual := Date;
  inherited;
    if edt_FormaPagamento.Text = '' then
      begin
          ShowMessage('Campo País não pode estar em branco!');
          edt_FormaPagamento.SetFocus;
      end
    else
    if self.btn_Salvar.Caption = 'Salvar' then
      begin
          UmFormaPagamento.setDescricao(edt_FormaPagamento.Text);
          UmFormaPagamento.setDataCadastro(edt_DataCadastro.Date);
          if self.edt_DataUltAlteracao.Date <> dataAtual then
            UmFormaPagamento.setDataAlteracao(dataAtual);
           msg := umaCtrlFormaPagamento.Salvar(UmFormaPagamento);
          if Copy(msg,0,16) = 'Ocorreu um erro!' then
              Application.MessageBox(PChar(msg), 'Erro!', MB_OK + MB_ICONSTOP)
          else
              ShowMessage(msg);
          Close;
      end
    else
      if self.btn_Salvar.Caption = 'Excluir' then
        begin
            msg := umaCtrlFormaPagamento.Excluir(umFormaPagamento);
            showmessage(msg);
            self.HabilitaCampos;
            self.btn_Salvar.Caption := 'Salvar';
            close;
        end;
end;

procedure TFrmCadFormaPagamento.CarregaObj;
begin
    Self.edt_IdFormaPagamento.Text          := IntToStr(umFormaPagamento.getId);
    Self.edt_FormaPagamento.Text            := UmFormaPagamento.getDescricao;
    Self.edt_DataCadastro.Date     := umFormaPagamento.getDataCadastro;
    Self.edt_DataUltAlteracao.Date := umFormaPagamento.getDataAlteracao;
end;

procedure TFrmCadFormaPagamento.ConhecaObj(vFormaPagamento: FormaPagamento; vCtrlFormaPagamento: CtrlFormaPagamento);
begin
     umFormaPagamento := vFormaPagamento;
     umaCtrlFormaPagamento := vCtrlFormaPagamento;
     self.LimpaCampos;
end;

procedure TFrmCadFormaPagamento.HabilitaCampos;
begin
   Self.btn_Salvar.Caption  := 'Salvar';
   self.edt_FormaPagamento.Enabled := True;
end;

procedure TFrmCadFormaPagamento.LimpaCampos;
var dataAtual : TDateTime;
begin
    dataAtual := Date;
    Self.edt_IdFormaPagamento.Clear;
    Self.edt_FormaPagamento.Clear;
    Self.edt_DataCadastro.Date := dataAtual;
    Self.edt_DataUltAlteracao.Date :=dataAtual;
end;

end.
