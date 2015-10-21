unit UFrmCadCategoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCadastro, Mask, sMaskEdit, sCustomComboEdit, sTooledit, StdCtrls,
  sEdit, sLabel, Buttons, sBitBtn, sGroupBox, UCategoria, UCtrlCategoria;

type
  TFrmCadCategoria = class(TFrmCadastro)
    lbl_Codigo: TsLabel;
    lbl_Categoria: TsLabel;
    lbl_DataCadastro: TsLabel;
    lbl_DataUltAlteracao: TsLabel;
    edt_IdCategoria: TsEdit;
    edt_Categoria: TsEdit;
    edt_DataCadastro: TsDateEdit;
    edt_DataUltAlteracao: TsDateEdit;
    procedure btn_SairClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
  private
    { Private declarations }
    UmCategoria : Categoria;
    umaCtrlCategoria : CtrlCategoria;
  public
    { Public declarations }
      procedure ConhecaObj(vCategoria: Categoria; vCtrlCategoria : CtrlCategoria);
      procedure HabilitaCampos;
      procedure LimpaCampos;
      procedure CarregaObj;
  end;

var
  FrmCadCategoria: TFrmCadCategoria;

implementation

{$R *.dfm}

procedure TFrmCadCategoria.btn_SairClick(Sender: TObject);
begin
  inherited;
  self.HabilitaCampos;
end;

procedure TFrmCadCategoria.btn_SalvarClick(Sender: TObject);
var
  dataAtual : TDateTime;
  msg: string;
begin
    dataAtual := Date;
  inherited;
    if edt_Categoria.Text = '' then
      begin
          ShowMessage('Campo País não pode estar em branco!');
          edt_Categoria.SetFocus;
      end
    else
    if self.btn_Salvar.Caption = 'Salvar' then
      begin
          UmCategoria.setDescricao(edt_Categoria.Text);
          UmCategoria.setDataCadastro(edt_DataCadastro.Date);
          if self.edt_DataUltAlteracao.Date <> dataAtual then
            UmCategoria.setDataAlteracao(dataAtual);
           msg := umaCtrlCategoria.Salvar(UmCategoria);
          if Copy(msg,0,16) = 'Ocorreu um erro!' then
              Application.MessageBox(PChar(msg), 'Erro!', MB_OK + MB_ICONSTOP)
          else
              ShowMessage(msg);
          Close;
      end
    else
      if self.btn_Salvar.Caption = 'Excluir' then
        begin
            msg := umaCtrlCategoria.Excluir(umCategoria);
            showmessage(msg);
            self.HabilitaCampos;
            self.btn_Salvar.Caption := 'Salvar';
            close;
        end;
end;

procedure TFrmCadCategoria.CarregaObj;
begin
    Self.edt_IdCategoria.Text          := IntToStr(umCategoria.getId);
    Self.edt_Categoria.Text            := UmCategoria.getDescricao;
    Self.edt_DataCadastro.Date     := umCategoria.getDataCadastro;
    Self.edt_DataUltAlteracao.Date := umCategoria.getDataAlteracao;
end;

procedure TFrmCadCategoria.ConhecaObj(vCategoria: Categoria; vCtrlCategoria: CtrlCategoria);
begin
     umCategoria := vCategoria;
     umaCtrlCategoria := vCtrlCategoria;
     self.LimpaCampos;
end;

procedure TFrmCadCategoria.HabilitaCampos;
begin
   Self.btn_Salvar.Caption  := 'Salvar';
   self.edt_Categoria.Enabled := True;
end;

procedure TFrmCadCategoria.LimpaCampos;
var dataAtual : TDateTime;
begin
    dataAtual := Date;
    Self.edt_IdCategoria.Clear;
    Self.edt_Categoria.Clear;
    Self.edt_DataCadastro.Date := dataAtual;
    Self.edt_DataUltAlteracao.Date :=dataAtual;
end;

end.
