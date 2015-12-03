unit UFrmConContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, sBitBtn, Grids, DBGrids, Mask, sMaskEdit, sCustomComboEdit,
  sTooledit, StdCtrls, sButton, sEdit, sLabel, sGroupBox, UContasPagar,
  UFrmCadContasPagar, UCtrlContasPagar, UDaoRelatorio, UCtrlFornecedor;

type
  TFrmConContasPagar = class(TForm)
    sGroupBox1: TsGroupBox;
    lbl_Cliente: TsLabel;
    lbl_DataInicio: TsLabel;
    lbl_DataFinal: TsLabel;
    edt_Fornecedor: TsEdit;
    btn_Consultar: TsButton;
    edt_DataInicio: TsDateEdit;
    edt_DataFinal: TsDateEdit;
    rg_TipoConsulta: TsRadioGroup;
    gridConsulta: TDBGrid;
    sGroupBox2: TsGroupBox;
    btn_Visualizar: TsBitBtn;
    btn_Pagar: TsBitBtn;
    btn_Relatorio: TsBitBtn;
    btn_Cancelar: TsBitBtn;
    btn_Novo: TsBitBtn;
    sBitBtn1: TsBitBtn;
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_PagarClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure btn_CancelarClick(Sender: TObject);
    procedure btn_VisualizarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_RelatorioClick(Sender: TObject);
    procedure btn_ConsultarClick(Sender: TObject);
  private
    umaContaPagar       : ContasPagar;
    umFrmCadContasPagar : TFrmCadContasPagar;
    umaCtrlContasPagar  : CtrlContasPagar;
    umaDaoRelatorio     : DaoRelatorio;
    umaCtrlFornecedor    : CtrlFornecedor;
  public
    procedure ConhecaObj(vContasPagar:ContasPagar);
    procedure CarregaObj(status:String; botao:String);
    function  Consultar : Boolean;
  end;

var
  FrmConContasPagar: TFrmConContasPagar;

implementation

{$R *.dfm}

{ TFrmConContasPagar }

procedure TFrmConContasPagar.ConhecaObj(vContasPagar: ContasPagar);
begin
  umaContaPagar       := vContasPagar;
  umaCtrlContasPagar  := CtrlContasPagar.CrieObjeto;
  umaDaoRelatorio     := DaoRelatorio.CrieObjeto;
  umaCtrlFornecedor   := CtrlFornecedor.CrieObjeto;
  umFrmCadContasPagar := TFrmCadContasPagar.Create(nil);
  Self.gridConsulta.DataSource := umaCtrlContasPagar.GetDS;
end;

procedure TFrmConContasPagar.CarregaObj(status: String; botao:String);
var verifica : Boolean;
begin
  verifica := False;
  umaContaPagar.setNumNota(0);
  umaContaPagar.LimparListaParcelas;
  umFrmCadContasPagar := TFrmCadContasPagar.Create(nil);
  umaCtrlContasPagar.Carrega(umaContaPagar);

  if (umaContaPagar.getNumNota = 0) then
    MessageDlg('ATENÇÃO: Não há conta para '+botao+' !',mtWarning,[mbOK],0)
  else
  if (umaContaPagar.getIdCompra <> 0) and (status = 'CANCELADA') then
    MessageDlg('ATENÇÃO: O cancelamento dessa conta deve ser realizado somente pela Compra!',mtWarning,[mbOK],0)
  else
  if (umaContaPagar.getStatus = status) or ((umaContaPagar.getStatus = 'CANCELADA') and (botao <> 'Visualizar')) then
    ShowMessage('Essa Conta já foi '+umaContaPagar.getStatus+'!')
  else
  if (botao = 'Cancelar') then
  begin
    umaContaPagar.setStatus('PAGA');
    if umaCtrlContasPagar.VerificarContas(umaContaPagar) then
     ShowMessage('Essa parcela não pode ser Cancelada porque 1 ou mais parcelas já foram Pagas!')
    else
     begin
      verifica := True;
      umaContaPagar.setStatus('PENDENTE');
     end;
  end
  else
  if (not umaCtrlContasPagar.VerificarParcelas(umaContaPagar)) and (botao = 'Pagar') then
    ShowMessage('As parcelas devem ser pagas sequencialmente!')
  else
     verifica := True;

  if (verifica) then
    with umFrmCadContasPagar do
    begin
      btn_Pagar.Caption := botao;
      ConhecaObj(umaContaPagar,umaCtrlContasPagar);
      CarregaObj;
      group_Condicao.Hide;
      lbl_NumParcela.Show;
      edt_NumParcela.Show;
      ShowModal;
    end;
end;

function TFrmConContasPagar.Consultar : Boolean;
var  consContasPagar: ContasPagar;
begin
  inherited;
  consContasPagar := ContasPagar.CrieObjeto;
  consContasPagar.getUmFornecedor.setNome_RazaoSoCial(edt_Fornecedor.text);
  consContasPagar.setDataEmissao(edt_DataInicio.Date);
  consContasPagar.setDataPagamento(edt_DataFinal.Date);   //Uso a dataPagamento so pra jogar o valor

  if rg_TipoConsulta.ItemIndex = 0 then
    consContasPagar.setStatus('PENDENTE')
  else if rg_TipoConsulta.ItemIndex = 1 then
    consContasPagar.setStatus('PAGA')
  else if rg_TipoConsulta.ItemIndex = 2 then
    consContasPagar.setStatus('CANCELADA');
  if not umaCtrlContasPagar.Buscar(consContasPagar) then
  begin
    MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
    Result := False;
  end
  else
    Result := True;
  consContasPagar.destrua_se;
end;

procedure TFrmConContasPagar.btn_RelatorioClick(Sender: TObject);
begin
  if (Self.Consultar) then
    umaDaoRelatorio.rl_ContasPagar;
end;

procedure TFrmConContasPagar.btn_ConsultarClick(Sender: TObject);
begin
    Self.Consultar;
end;

procedure TFrmConContasPagar.btn_NovoClick(Sender: TObject);
begin
  if umaContaPagar.getNumNota <> 0 then
    umaContaPagar.CrieObjeto;
   with umFrmCadContasPagar do
   begin
     btn_Pagar.Caption := 'Salvar';
     ConhecaObj(umaContaPagar, umaCtrlContasPagar);
     group_Condicao.Show;
     ShowModal;
   end;
end;

procedure TFrmConContasPagar.btn_VisualizarClick(Sender: TObject);
begin
  Self.CarregaObj('VISUALIZAR', 'Visualizar');
end;

procedure TFrmConContasPagar.btn_PagarClick(Sender: TObject);
begin
  Self.CarregaObj('PAGA', 'Pagar');
end;

procedure TFrmConContasPagar.btn_CancelarClick(Sender: TObject);
begin
  Self.CarregaObj('CANCELADA', 'Cancelar');
end;

procedure TFrmConContasPagar.FormActivate(Sender: TObject);
var count : Integer;
begin
  for count := 0 to Self.ComponentCount - 1 do
    if Self.Components[count] is TsEdit then
      TsEdit(Components[count]).CharCase := ecUpperCase;
end;

procedure TFrmConContasPagar.btn_SairClick(Sender: TObject);
begin
  Close;
end;
end.
