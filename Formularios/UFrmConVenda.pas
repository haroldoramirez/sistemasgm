unit UFrmConVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, sBitBtn, Grids, DBGrids, Mask, sMaskEdit, sCustomComboEdit,
  sTooledit, StdCtrls, sButton, sEdit, sLabel, sGroupBox, UVenda, UFrmCadVenda,
  UCtrlVenda, UDaoRelatorio;

type
  TFrmConVenda = class(TForm)
    gridConsulta: TDBGrid;
    sGroupBox2: TsGroupBox;
    btn_Novo: TsBitBtn;
    btn_Sair: TsBitBtn;
    btn_Cancelar: TsBitBtn;
    btn_Finalizar: TsBitBtn;
    sGroupBox1: TsGroupBox;
    lbl_Cliente: TsLabel;
    lbl_DataInicio: TsLabel;
    lbl_DataFinal: TsLabel;
    edt_Cliente: TsEdit;
    btn_Consultar: TsButton;
    edt_DataInicio: TsDateEdit;
    edt_DataFinal: TsDateEdit;
    rg_TipoConsulta: TsRadioGroup;
    btn_Relatorio: TsBitBtn;
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_CancelarClick(Sender: TObject);
    procedure btn_FinalizarClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure btn_ConsultarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_RelatorioClick(Sender: TObject);
  private
    umaVenda        : Venda;
    umaCtrlVenda    : CtrlVenda;
    umFrmCadVenda   : TFrmCadVenda;
    umaDaoRelatorio : DaoRelatorio;
  public
    procedure ConhecaObj(vVenda : Venda);
    function Consultar : Boolean;
  end;

var
  FrmConVenda: TFrmConVenda;

implementation

{$R *.dfm}

{ TFrmConVenda }

procedure TFrmConVenda.btn_CancelarClick(Sender: TObject);
begin
  umaVenda.setNumNota(0);
  umFrmCadVenda := TFrmCadVenda.Create(nil);
  umaCtrlVenda.Carrega(umaVenda);
  if (umaVenda.getNumNota = 0) then
    MessageDlg('ATENÇÃO: Não há venda para cancelar!',mtWarning,[mbOK],0)
  else
  if (umaVenda.getStatus = 'CANCELADA') then
    ShowMessage('Essa Venda já está '+umaVenda.getStatus+'!')
  else
    with umFrmCadVenda do
    begin
      btn_Salvar.Caption := 'Cancelar';
      ConhecaObj(umaVenda,umaCtrlVenda);
      CarregaObj;
      ShowModal;
    end;
end;

procedure TFrmConVenda.btn_FinalizarClick(Sender: TObject);
begin
  umaVenda.setNumNota(0);
  umFrmCadVenda := TFrmCadVenda.Create(nil);
  umaCtrlVenda.Carrega(umaVenda);
  if (umaVenda.getNumNota = 0) then
    MessageDlg('ATENÇÃO: Não há venda para visualizar!',mtWarning,[mbOK],0)
  else
  with umFrmCadVenda do
  begin
    btn_Salvar.Caption := 'Finalizar';
    ConhecaObj(umaVenda,umaCtrlVenda);
    CarregaObj;
    ShowModal;
  end;
end;

procedure TFrmConVenda.btn_NovoClick(Sender: TObject);
begin
  if umaVenda.getNumNota <> 0 then
    umaVenda.CrieObjeto;
  with umFrmCadVenda do
  begin
    btn_Salvar.Caption := 'Salvar';
    ConhecaObj(umaVenda, umaCtrlVenda);
    ShowModal;
  end;
end;

procedure TFrmConVenda.btn_RelatorioClick(Sender: TObject);
begin
  if (Self.Consultar) then
    umaDaoRelatorio.rl_Venda;
end;

function TFrmConVenda.Consultar: Boolean;
var  consVenda: Venda;
begin
  inherited;
  consVenda := Venda.CrieObjeto;
  consVenda.getUmCliente.setNome_RazaoSoCial(edt_Cliente.text);
  consVenda.setDataEmissao(edt_DataInicio.Date);
  consVenda.setDataVenda(edt_DataFinal.Date);   //Uso a dataVenda so pra jogar o valor

  if rg_TipoConsulta.ItemIndex = 0 then
    consVenda.setStatus('FINALIZADA')
  else if rg_TipoConsulta.ItemIndex = 1 then
    consVenda.setStatus('CANCELADA');
  if not umaCtrlVenda.Buscar(consVenda) then
  begin
    MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
    Result := False;
  end
  else
    Result := True;
  consVenda.destrua_se;
end;

procedure TFrmConVenda.btn_ConsultarClick(Sender: TObject);
begin
  Self.Consultar
end;

procedure TFrmConVenda.ConhecaObj(vVenda: Venda);
begin
  umaVenda        := vVenda;
  umaCtrlVenda    := CtrlVenda.CrieObjeto;
  umaDaoRelatorio := DaoRelatorio.CrieObjeto;
  umFrmCadVenda   := TFrmCadVenda.Create(nil);
  self.gridConsulta.DataSource := umaCtrlVenda.GetDS;
end;

procedure TFrmConVenda.FormActivate(Sender: TObject);
var count : Integer;
begin
for count := 0 to Self.ComponentCount - 1 do
    if Self.Components[count] is TsEdit then
      TsEdit(Components[count]).CharCase := ecUpperCase;
end;

procedure TFrmConVenda.btn_SairClick(Sender: TObject);
begin
  close;
end;

end.
