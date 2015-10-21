unit UFrmCadCargo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCadastro, Mask, sMaskEdit, sCustomComboEdit, sTooledit, StdCtrls,
  sEdit, sLabel, Buttons, sBitBtn, sGroupBox, UCargo, UCtrlCargo;

type
  TFrmCadCargo = class(TFrmCadastro)
    lbl_Codigo: TsLabel;
    lbl_Cargo: TsLabel;
    lbl_DataCadastro: TsLabel;
    lbl_DataAlteracao: TsLabel;
    edt_IdCargo: TsEdit;
    edt_Cargo: TsEdit;
    edt_DataCadastro: TsDateEdit;
    edt_DataAlteracao: TsDateEdit;
    procedure btn_SalvarClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
  private
    { Private declarations }
    UmCargo : Cargo;
    umaCtrlCargo : CtrlCargo;
  public
    { Public declarations }
      procedure ConhecaObjeto(vCargo: Cargo; vCtrlCargo : CtrlCargo);
      procedure HabilitaCampos;
      procedure LimpaCampos;
      procedure CarregaObj;
  end;

var
  FrmCadCargo: TFrmCadCargo;

implementation

{$R *.dfm}

{ TFrmCadCargo }

procedure TFrmCadCargo.btn_SairClick(Sender: TObject);
begin
  inherited;
  self.HabilitaCampos;
end;

procedure TFrmCadCargo.btn_SalvarClick(Sender: TObject);
var
  dataAtual : TDateTime;
  msg: string;
begin
  inherited;
  dataAtual := Date;
    if edt_Cargo.Text = '' then
      begin
          ShowMessage('Campo País não pode estar em branco!');
          edt_Cargo.SetFocus;
      end
    else
    if self.btn_Salvar.Caption = 'Salvar' then
      begin
          UmCargo.setDescricao(edt_Cargo.Text);
          UmCargo.setDataCadastro(edt_DataCadastro.Date);
          if self.edt_DataAlteracao.Date <> dataAtual then
            UmCargo.setDataAlteracao(dataAtual);
           msg := umaCtrlCargo.Salvar(UmCargo);
          if Copy(msg,0,16) = 'Ocorreu um erro!' then
              Application.MessageBox(PChar(msg), 'Erro!', MB_OK + MB_ICONSTOP)
          else
              ShowMessage(msg);
          Close;
      end
    else
      if self.btn_Salvar.Caption = 'Excluir' then
        begin
            msg := umaCtrlCargo.Excluir(umCargo);
            showmessage(msg);
            self.HabilitaCampos;
            self.btn_Salvar.Caption := 'Salvar';
            close;
        end;
    UmCargo.CrieObjeto;
end;

procedure TFrmCadCargo.CarregaObj;
begin
    Self.edt_IdCargo.Text       := IntToStr(umCargo.getId);
    Self.edt_Cargo.Text         := UmCargo.getDescricao;
    Self.edt_DataCadastro.Date  := umCargo.getDataCadastro;
    Self.edt_DataAlteracao.Date := umCargo.getDataAlteracao;
end;

procedure TFrmCadCargo.ConhecaObjeto(vCargo: Cargo; vCtrlCargo: CtrlCargo);
begin
   umCargo := vCargo;
   umaCtrlCargo := vCtrlCargo;
   Self.HabilitaCampos;
   Self.LimpaCampos;
end;

procedure TFrmCadCargo.HabilitaCampos;
begin
   Self.btn_Salvar.Caption  := 'Salvar';
   self.edt_Cargo.Enabled := True;
end;

procedure TFrmCadCargo.LimpaCampos;
var dataAtual : TDateTime;
begin
    dataAtual := Date;
    Self.edt_IdCargo.Clear;
    Self.edt_Cargo.Clear;
    Self.edt_DataCadastro.Date := dataAtual;
    Self.edt_DataAlteracao.Date := dataAtual;
end;

end.
