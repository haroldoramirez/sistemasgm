unit UFrmConContasReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, sBitBtn, Grids, DBGrids, Mask, sMaskEdit, sCustomComboEdit,
  sTooledit, StdCtrls, sButton, sEdit, sLabel, sGroupBox, UContasReceber,
  UFrmCadContasReceber, UCtrlContasReceber, UDaoRelatorio;

type
  TFrmConContasReceber = class(TForm)
    sGroupBox1: TsGroupBox;
    lbl_Cliente: TsLabel;
    edt_Cliente: TsEdit;
    btn_Consultar: TsButton;
    lbl_DataInicio: TsLabel;
    lbl_DataFinal: TsLabel;
    edt_DataInicio: TsDateEdit;
    edt_DataFinal: TsDateEdit;
    gridConsulta: TDBGrid;
    rg_TipoConsulta: TsRadioGroup;
    sGroupBox2: TsGroupBox;
    btn_Visualizar: TsBitBtn;
    btn_Receber: TsBitBtn;
    btn_Sair: TsBitBtn;
    btn_Relatorio: TsButton;
    procedure btn_ConsultarClick(Sender: TObject);
    procedure btn_ReceberClick(Sender: TObject);
    procedure btn_VisualizarClick(Sender: TObject);
    procedure btn_CancelarClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure btn_NovoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_RelatorioClick(Sender: TObject);
  private
    umaContaReceber       : ContasReceber;
    umFrmCadContasReceber : TFrmCadContasReceber;
    umaCtrlContasReceber  : CtrlContasReceber;
    umaDaoRelatorio       : DaoRelatorio;
  public
    procedure ConhecaObj(vContasReceber:ContasReceber);
    procedure CarregaObj(status: String; botao:String);
    function Consultar : Boolean;
  end;

var
  FrmConContasReceber: TFrmConContasReceber;

implementation

{$R *.dfm}

{ TFrmConContasReceber }


procedure TFrmConContasReceber.ConhecaObj(vContasReceber: ContasReceber);
begin
  umaContaReceber       := vContasReceber;
  umaCtrlContasReceber  := CtrlContasReceber.CrieObjeto;
  umaDaoRelatorio       := DaoRelatorio.CrieObjeto;
  umFrmCadContasReceber := TFrmCadContasReceber.Create(nil);
  Self.gridConsulta.DataSource := umaCtrlContasReceber.GetDS;
  self.btn_Relatorio.Hide;
end;

procedure TFrmConContasReceber.CarregaObj(status, botao: String);
var verifica : Boolean;
begin
  verifica := False;
  umaContaReceber.setNumNota(0);
  umaContaReceber.LimparListaParcelas;
  umFrmCadContasReceber := TFrmCadContasReceber.Create(nil);
  umaCtrlContasReceber.Carrega(umaContaReceber);
  if (umaContaReceber.getNumNota = 0) then
    MessageDlg('ATENÇÃO: Não há conta para '+botao+' !',mtWarning,[mbOK],0)
  else
  if (umaContaReceber.getStatus = 'CANCELADA') and (botao <> 'Visualizar')then
    ShowMessage('Essa Conta está '+umaContaReceber.getStatus+'!')
  else
  if (umaContaReceber.getStatus = status) and (botao <> 'Visualizar')then
    ShowMessage('Essa Conta já foi '+umaContaReceber.getStatus+'!')
  else
  if (botao = 'Cancelar') then
  begin
    umaContaReceber.setStatus('RECEBIDA');
    if umaCtrlContasReceber.VerificarContas(umaContaReceber) then
      ShowMessage('Essa parcela não pode ser Cancelada porque 1 ou mais parcelas já foram Pagas!')
    else
    begin
      verifica := True;
      umaContaReceber.setStatus('PENDENTE');
    end;
  end
  else
  if (not umaCtrlContasReceber.VerificarParcelas(umaContaReceber)) and (botao = 'Receber') then
    ShowMessage('As parcelas devem ser recebidas sequencialmente!')
  else
   verifica := True;

  if (verifica) then   
  with umFrmCadContasReceber do
  begin
    btn_Receber.Caption := botao;
    ConhecaObj(umaContaReceber,umaCtrlContasReceber);
    CarregaObj;
    ShowModal;
  end;
end;

function TFrmConContasReceber.Consultar : Boolean;
var  consContasReceber: ContasReceber;
begin
  inherited;
  consContasReceber := ContasReceber.CrieObjeto;
  consContasReceber.getUmCliente.setNome_RazaoSoCial(edt_Cliente.text);
  consContasReceber.setDataEmissao(edt_DataInicio.Date);
  consContasReceber.setDataPagamento(edt_DataFinal.Date);   //Uso a dataPagamento so pra jogar o valor

  if rg_TipoConsulta.ItemIndex = 0 then
    consContasReceber.setStatus('PENDENTE')
  else if rg_TipoConsulta.ItemIndex = 1 then
    consContasReceber.setStatus('RECEBIDA')
  else if rg_TipoConsulta.ItemIndex = 2 then
    consContasReceber.setStatus('CANCELADA');
  if not umaCtrlContasReceber.Buscar(consContasReceber) then
  begin
    MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
    Result := False;
  end
  else
    Result := True;
  consContasReceber.destrua_se;
end;

procedure TFrmConContasReceber.btn_RelatorioClick(Sender: TObject);
begin
  if (Self.Consultar) then
    umaDaoRelatorio.rl_ContasReceber;
end;

procedure TFrmConContasReceber.btn_ConsultarClick(Sender: TObject);
begin
  Self.Consultar;
end;

procedure TFrmConContasReceber.btn_NovoClick(Sender: TObject);
begin
  if umaContaReceber.getNumNota <> 0 then
    umaContaReceber.CrieObjeto;
   with umFrmCadContasReceber do
   begin
     btn_Receber.Caption := 'Salvar';
     ConhecaObj(umaContaReceber, umaCtrlContasReceber);
     ShowModal;
   end;
end;

procedure TFrmConContasReceber.btn_VisualizarClick(Sender: TObject);
begin
  Self.CarregaObj('VISUALIZAR', 'Visualizar');
end;

procedure TFrmConContasReceber.btn_ReceberClick(Sender: TObject);
begin
  Self.CarregaObj('RECEBIDA', 'Receber');
end;

procedure TFrmConContasReceber.btn_CancelarClick(Sender: TObject);
begin
  Self.CarregaObj('CANCELADA', 'Cancelar');
end;

procedure TFrmConContasReceber.FormActivate(Sender: TObject);
var count : Integer;
begin
  for count := 0 to Self.ComponentCount - 1 do
    if Self.Components[count] is TsEdit then
      TsEdit(Components[count]).CharCase := ecUpperCase;
end;

procedure TFrmConContasReceber.btn_SairClick(Sender: TObject);
begin
  Close;
end;

end.
