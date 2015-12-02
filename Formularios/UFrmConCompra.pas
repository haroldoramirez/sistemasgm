unit UFrmConCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, sBitBtn, Grids, DBGrids, Mask, sMaskEdit, sCustomComboEdit,
  sTooledit, StdCtrls, sButton, sEdit, sLabel, sGroupBox, UCompra, UCtrlCompra,
  UFrmCadCompra, UDaoRelatorio;

type
  TFrmConCompra = class(TForm)
    gridConsulta: TDBGrid;
    sGroupBox2: TsGroupBox;
    btn_Novo: TsBitBtn;
    btn_Sair: TsBitBtn;
    btn_Cancelar: TsBitBtn;
    btn_Finalizar: TsBitBtn;
    sGroupBox1: TsGroupBox;
    lbl_Fornecedor: TsLabel;
    lbl_DataInicio: TsLabel;
    lbl_DataFinal: TsLabel;
    edt_Fornecedor: TsEdit;
    btn_Consultar: TsButton;
    edt_DataInicio: TsDateEdit;
    edt_DataFinal: TsDateEdit;
    rg_TipoConsulta: TsRadioGroup;
    btn_Relatorio: TsBitBtn;
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure btn_FinalizarClick(Sender: TObject);
    procedure btn_CancelarClick(Sender: TObject);
    procedure btn_ConsultarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_RelatorioClick(Sender: TObject);
    //procedure btn_RelatorioClick(Sender: TObject);
  private
    umaCompra       : Compra;
    umaCtrlCompra   : CtrlCompra;
    umFrmCadCompra  : TFrmCadCompra;
    umaDaoRelatorio : DaoRelatorio;
  public
    procedure ConhecaObj(vCompra : Compra);
    function Consultar : Boolean;
  end;

var
  FrmConCompra: TFrmConCompra;

implementation

{$R *.dfm}

{ TFrmConCompra }

procedure TFrmConCompra.ConhecaObj(vCompra: Compra);
begin
  umaCompra       := vCompra;
  umaCtrlCompra   := CtrlCompra.CrieObjeto;
  umaDaoRelatorio := DaoRelatorio.CrieObjeto;
  umFrmCadCompra  := TFrmCadCompra.Create(nil);
  self.gridConsulta.DataSource := umaCtrlCompra.GetDS;
end;

procedure TFrmConCompra.btn_NovoClick(Sender: TObject);
begin
  if umaCompra.getNumNota <> 0 then
    umaCompra.CrieObjeto;
  with umFrmCadCompra do
  begin
   btn_Salvar.Caption := 'Salvar';
   ConhecaObj(umaCompra, umaCtrlCompra);
   ShowModal;
  end;
end;

procedure TFrmConCompra.btn_RelatorioClick(Sender: TObject);
begin
//  if (Self.Consultar) then
//    umaDaoRelatorio.rl_Compra;
end;

procedure TFrmConCompra.btn_CancelarClick(Sender: TObject);
begin
  umaCompra.setNumNota(0);
  umFrmCadCompra := TFrmCadCompra.Create(nil);
  umaCtrlCompra.Carrega(umaCompra);
  if (umaCompra.getNumNota = 0) then
    MessageDlg('ATENÇÃO: Não há compra para cancelar!',mtWarning,[mbOK],0)
  else
  if (umaCompra.getStatus = 'CANCELADA') then
    ShowMessage('Essa Compra já está '+umaCompra.getStatus+'!')
  else
    with umFrmCadCompra do
    begin
      btn_Salvar.Caption := 'Cancelar';
      ConhecaObj(umaCompra,umaCtrlCompra);
      CarregaObj;
      ShowModal;
    end;
end;

function TFrmConCompra.Consultar : Boolean;
var  consCompra: Compra;
begin
  inherited;
  consCompra := Compra.CrieObjeto;
  consCompra.getUmFornecedor.setNome_RazaoSoCial(edt_Fornecedor.text);
  consCompra.setDataEmissao(edt_DataInicio.Date);
  consCompra.setDataCompra(edt_DataFinal.Date);   //Uso a dataCompra so pra jogar o valor

  if rg_TipoConsulta.ItemIndex = 0 then
    consCompra.setStatus('FINALIZADA')
  else if rg_TipoConsulta.ItemIndex = 1 then
    consCompra.setStatus('CANCELADA');
  if not umaCtrlCompra.Buscar(consCompra) then
  begin
    MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
    Result := False;
  end
  else
    Result := True;
  consCompra.destrua_se;
end;

procedure TFrmConCompra.btn_ConsultarClick(Sender: TObject);
begin
  Self.Consultar;
end;

procedure TFrmConCompra.btn_FinalizarClick(Sender: TObject);
begin
  umaCompra.setNumNota(0);
  umFrmCadCompra := TFrmCadCompra.Create(nil);
  umaCtrlCompra.Carrega(umaCompra);
  if (umaCompra.getNumNota = 0) then
    MessageDlg('ATENÇÃO: Não há compra para visualizar!',mtWarning,[mbOK],0)
  else
    with umFrmCadCompra do
    begin
      btn_Salvar.Caption := 'Visualizar';
      ConhecaObj(umaCompra,umaCtrlCompra);
      CarregaObj;
      ShowModal;
    end;
end;

procedure TFrmConCompra.FormActivate(Sender: TObject);
var count : Integer;
begin
  for count := 0 to Self.ComponentCount - 1 do
    if Self.Components[count] is TsEdit then
      TsEdit(Components[count]).CharCase := ecUpperCase;
end;

procedure TFrmConCompra.btn_SairClick(Sender: TObject);
begin
  close;
end;

end.
