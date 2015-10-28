unit UFrmCadCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, sBitBtn, Mask, sMaskEdit, sCustomComboEdit,
  sTooledit, sEdit, sLabel, sGroupBox, Menus, UCompra, UCtrlCompra, UFornecedor,
  UFrmConFornecedor, UCtrlFornecedor, UFuncionario, UFrmConFuncionario,
  UCtrlFuncionario, UProduto, UFrmConProduto, UCtrlProduto, UCondicaoPagamento,
  UFrmConCondicaoPagamento, UCtrlCondicaoPagamento, sMemo, ExtCtrls, UComuns,
  UProdutoCompra, UUsuario, UCtrlUsuario, UFrmConUsuario, UTransportadora,
  UCtrlTransportadora, UFrmConTransportadora, UValidacao;

type
  TFrmCadCompra = class(TForm)
    sGroupBox3: TsGroupBox;
    lbl_IdPlanoContas: TsLabel;
    lbl_SerieNota: TsLabel;
    edt_NumeroNota: TsEdit;
    edt_SerieNota: TsEdit;
    sGroupBox1: TsGroupBox;
    lbl_IdProduto: TsLabel;
    lbl_Produto: TsLabel;
    lbl_Quantidade: TsLabel;
    lbl_Preco: TsLabel;
    edt_Produto: TsEdit;
    edt_IdProduto: TsEdit;
    btn_BuscarProduto: TsBitBtn;
    gridProduto: TStringGrid;
    edt_ICMS: TsEdit;
    edt_PrecoCusto: TsEdit;
    sGroupBox2: TsGroupBox;
    sGroupBox11: TsGroupBox;
    btn_Salvar: TsBitBtn;
    btn_Sair: TsBitBtn;
    sGroupBox4: TsGroupBox;
    lbl_IdCondicaoPagamento: TsLabel;
    lbl_CondicaoPagamento: TsLabel;
    edt_CondicaoPagamento: TsEdit;
    edt_IdCondicaoPagamento: TsEdit;
    btn_BuscarCondicaoPagamento: TsBitBtn;
    gridParcelas: TStringGrid;
    lbl_ICMS: TsLabel;
    lbl_IPI: TsLabel;
    edt_IPI: TsEdit;
    edt_Quantidade: TsEdit;
    btn_Add_Produto: TsBitBtn;
    btn_LimparProdutos: TsBitBtn;
    btn_GerarParcelas: TsBitBtn;
    btn_LimparParcelas: TsBitBtn;
    edt_IdFornecedor: TsEdit;
    lbl_IdFornecedor: TsLabel;
    lbl_Fornecedor: TsLabel;
    edt_Fornecedor: TsEdit;
    btn_BuscarFornecedor: TsBitBtn;
    lbl_DataEmissao: TsLabel;
    edt_DataEmissao: TsDateEdit;
    sGroupBox5: TsGroupBox;
    lbl_IdFuncionario: TsLabel;
    edt_IdFuncionario: TsEdit;
    lbl_Funcionario: TsLabel;
    edt_Funcionario: TsEdit;
    btn_BuscarFuncionario: TsBitBtn;
    sGroupBox6: TsGroupBox;
    edt_Observacao: TsMemo;
    sGroupBox7: TsGroupBox;
    edt_status: TsEdit;
    lbl_DataCompra: TsLabel;
    edt_DataCompra: TsDateEdit;
    lbl_Unidade: TsLabel;
    edt_Unidade: TsEdit;
    lbl_CPOF: TsLabel;
    edt_CPOF: TsEdit;
    lbl3: TsLabel;
    sGroupBox8: TsGroupBox;
    edt_ValorFrete: TsEdit;
    lbl_Frete: TsLabel;
    lbl_BaseICMS: TsLabel;
    edt_BaseICMS: TsEdit;
    lbl_TotalICMS: TsLabel;
    edt_TotalICMS: TsEdit;
    lbl_ValorDesconto: TsLabel;
    edt_ValorDesconto: TsEdit;
    lbl_TotalIPI: TsLabel;
    edt_TotalIpi: TsEdit;
    rg_TipoFrete: TsRadioGroup;
    sGroupBox12: TsGroupBox;
    lbl_IdTransportadora: TsLabel;
    lbl_Transportadora: TsLabel;
    edt_IdTransportadora: TsEdit;
    edt_transportadora: TsEdit;
    btn_BuscarTransportadora: TsBitBtn;
    lbl2: TsLabel;
    edt_TotalProduto: TsEdit;
    lbl1: TsLabel;
    edt_TotalNota: TsEdit;
    lbl_Desconto: TsLabel;
    edt_Desconto: TsEdit;
    edt_Total: TsEdit;
    lbl_Total: TsLabel;
    edt_BCICMS: TsEdit;
    lbl_BCIMCMS: TsLabel;
    edt_ValorICMS: TsEdit;
    lbl_ValorICMS: TsLabel;
    edt_ValorIPI: TsEdit;
    lbl_ValorIPI: TsLabel;
    sGroupBox9: TsGroupBox;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    edt_DataCadastro: TsDateEdit;
    edt_DataAlteracao: TsDateEdit;
    edt_NCM: TsEdit;
    edt_CST: TsEdit;
    lbl_NCM: TsLabel;
    lbl_CST: TsLabel;
    procedure btn_SairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edt_NumeroNotaKeyPress(Sender: TObject; var Key: Char);
    procedure edt_IdFornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure edt_IdFuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure edt_BaseICMSKeyPress(Sender: TObject; var Key: Char);
    procedure edt_TotalICMSKeyPress(Sender: TObject; var Key: Char);
    procedure edt_ValorFreteKeyPress(Sender: TObject; var Key: Char);
    procedure edt_ValorDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_TotalIpiKeyPress(Sender: TObject; var Key: Char);
    procedure edt_IdTransportadoraKeyPress(Sender: TObject; var Key: Char);
    procedure edt_IdProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_CPOFKeyPress(Sender: TObject; var Key: Char);
    procedure edt_QuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edt_PrecoCustoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_ICMSKeyPress(Sender: TObject; var Key: Char);
    procedure edt_IPIKeyPress(Sender: TObject; var Key: Char);
    procedure edt_DescontoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_IdCondicaoPagamentoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_TotalProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_TotalNotaKeyPress(Sender: TObject; var Key: Char);
    procedure edt_IdFornecedorExit(Sender: TObject);
    procedure btn_BuscarFornecedorClick(Sender: TObject);
    procedure edt_NumeroNotaExit(Sender: TObject);
    procedure edt_SerieNotaExit(Sender: TObject);
    procedure edt_IdFuncionarioExit(Sender: TObject);
    procedure btn_BuscarFuncionarioClick(Sender: TObject);
    procedure edt_IdTransportadoraExit(Sender: TObject);
    procedure btn_BuscarTransportadoraClick(Sender: TObject);
    procedure edt_IdProdutoExit(Sender: TObject);
    procedure btn_BuscarProdutoClick(Sender: TObject);
    procedure btn_Add_ProdutoClick(Sender: TObject);
    procedure edt_TotalKeyPress(Sender: TObject; var Key: Char);
    procedure edt_BCICMSKeyPress(Sender: TObject; var Key: Char);
    procedure edt_ValorICMSKeyPress(Sender: TObject; var Key: Char);
    procedure edt_ValorIPIKeyPress(Sender: TObject; var Key: Char);
    procedure btn_LimparProdutosClick(Sender: TObject);
    procedure edt_IdCondicaoPagamentoExit(Sender: TObject);
    procedure btn_BuscarCondicaoPagamentoClick(Sender: TObject);
    procedure btn_GerarParcelasClick(Sender: TObject);
    procedure btn_LimparParcelasClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
    procedure edt_DataEmissaoExit(Sender: TObject);
    procedure edt_DataCompraExit(Sender: TObject);
    procedure edt_TotalNotaExit(Sender: TObject);
    procedure edt_ValorFreteExit(Sender: TObject);
    procedure edt_ValorDescontoExit(Sender: TObject);
    procedure edt_BaseICMSExit(Sender: TObject);
    procedure edt_TotalICMSExit(Sender: TObject);
    procedure edt_TotalIpiExit(Sender: TObject);
    procedure edt_TotalProdutoExit(Sender: TObject);
    procedure rg_TipoFreteClick(Sender: TObject);
    procedure edt_QuantidadeExit(Sender: TObject);
    procedure edt_PrecoCustoExit(Sender: TObject);
    procedure edt_DescontoExit(Sender: TObject);
    procedure edt_TotalExit(Sender: TObject);
    procedure edt_TotalNotaChange(Sender: TObject);
    procedure edt_ICMSExit(Sender: TObject);
  private
      umaCompra                 : Compra;
      umaCtrlCompra             : CtrlCompra;
      umFornecedor              : Fornecedor;
      umFrmConFornecedor        : TFrmConFornecedor;
      umaCtrlFornecedor         : CtrlFornecedor;
      umUsuario                 : Usuario;
      umaCtrlUsuario            : CtrlUsuario;
      umFrmConUsuario           : TFrmConUsuario;
      umFrmConFuncionario       : TFrmConFuncionario;
      umProdutoCompra           : ProdutoCompra;
      umProduto                 : Produto;
      umFrmConProduto           : TFrmConProduto;
      umaCtrlProduto            : CtrlProduto;
      umaCondicaoPagamento      : CondicaoPagamento;
      umFrmConCondicaoPagamento : TFrmConCondicaoPagamento;
      umaCtrlCondicaoPagamento  : CtrlCondicaoPagamento;
      umaTransportadora         : Fornecedor;
      umFrmConTransportadora    : TFrmConTransportadora;
      umaCtrlTransportadora     : CtrlTransportadora;
  public
      desconto, total, baseicms, valoricms, valoripi, valordesconto, valorfrete, totalnota, valordescontoAux, valorfreteAux  : Real;
      totalItemAnt, descItemAnt, descItemAux : Real;
      procedure ConhecaObj(vCompra: Compra; vCtrlCompra: CtrlCompra);
      procedure HabilitaCampos;
      procedure DesbilitaCampos;
      procedure LimpaCampos;
      procedure CarregaObj;
      function VerificaNota : Boolean;
      procedure BuscarFavorecido(T:string; Tipo:String);
      procedure CalcItemProduto;

      //Produto
      procedure LimpaGridProduto;
      procedure CarregaGridProduto;
      function VerificaProduto : Boolean;
      procedure MediaPonderada(qtdCompra : Real; precoCompra : Real);
      //Parcelas
      procedure LimpaGridParcelas(verifica : Boolean);
      procedure CarregaParcelas;
      procedure HabilitaParcelas;
      //Condicao Pagamento
      procedure addCondicaoPgto(vCondicaoPgto : CondicaoPagamento);
  end;

var
  FrmCadCompra: TFrmCadCompra;

implementation

uses UAplicacao;

{$R *.dfm}

{ TFrmCadCompra }

procedure TFrmCadCompra.ConhecaObj(vCompra: Compra; vCtrlCompra: CtrlCompra);
begin
   umaCompra := vCompra;
   umaCtrlCompra := vCtrlCompra;
   Self.DesbilitaCampos;
   self.LimpaCampos;
   if umaCompra.getNumNota = 0 then
   begin
      umaCompra.LimparListaProduto;
      umaCompra.LimparListaParcelas;
      Self.LimpaGridProduto;
      Self.LimpaGridParcelas(True);
   end;
  self.edt_IdFuncionario.Text := IntToStr(idLogado);
  self.edt_Funcionario.Text   := nomeLogado;
end;

procedure TFrmCadCompra.addCondicaoPgto(vCondicaoPgto: CondicaoPagamento);
begin
  umaCompra.setUmaCondicaoPagamento(vCondicaoPgto);
  umaCtrlCondicaoPagamento := CtrlCondicaoPagamento.CrieObjeto;
  umaCtrlCondicaoPagamento.Carrega(umaCompra.getUmaCondicaoPagamento);
end;

procedure TFrmCadCompra.CarregaObj;
var i : Integer;
begin
  self.edt_NumeroNota.Text          := IntToStr(umaCompra.getNumNota);
  self.edt_SerieNota.Text           := umaCompra.getSerieNota;
  self.edt_IdFornecedor.Text        := IntToStr(umaCompra.getUmFornecedor.getId);
  self.edt_Fornecedor.Text          := umaCompra.getUmFornecedor.getNome_RazaoSoCial;
  if(Self.btn_Salvar.Caption = 'Visualizar') then
  begin
    self.edt_IdFuncionario.Text := IntToStr(umaCompra.getUmUsuario.getUmFuncionario.getId);
    self.edt_Funcionario.Text   := umaCompra.getUmUsuario.getUmFuncionario.getNome_RazaoSoCial;
  end;
  if (umaCompra.getUmaTransportadora.getId <> 0) then
  begin
    self.edt_IdTransportadora.Text    := IntToStr(umaCompra.getUmaTransportadora.getId);
    self.edt_Transportadora.Text      := umaCompra.getUmaTransportadora.getNome_RazaoSoCial;
  end;
  Self.rg_TipoFrete.ItemIndex       := umaCompra.getTipoFrete;
  Self.edt_BaseICMS.Text            := FormatFloat('#0.00', umaCompra.getBaseICMS);
  Self.edt_TotalICMS.Text           := FormatFloat('#0.00', umaCompra.getTotalICMS);
  Self.edt_ValorFrete.Text          := FormatFloat('#0.00', umaCompra.getValorFrete);
  Self.edt_ValorDesconto.Text       := FormatFloat('#0.00', umaCompra.getValorDesconto);
  Self.edt_TotalIpi.Text            := FormatFloat('#0.00', umaCompra.getTotalIPI);
  Self.edt_TotalProduto.Text        := FormatFloat('#0.00', umaCompra.getTotalProduto);
  Self.edt_TotalNota.Text           := FormatFloat('#0.00', umaCompra.getTotalNota);
  self.edt_IdCondicaoPagamento.Text := IntToStr(umaCompra.getUmaCondicaoPagamento.getId);
  self.edt_CondicaoPagamento.Text   := umaCompra.getUmaCondicaoPagamento.getDescricao;
  self.edt_status.Text              := umaCompra.getStatus;
  self.edt_Observacao.Text          := umaCompra.getObservacao;
  self.edt_DataEmissao.Date         := umaCompra.getDataEmissao;
  self.edt_DataCompra.Date          := umaCompra.getDataCompra;
  self.edt_DataCadastro.Date        := umaCompra.getDataCadastro;
  self.edt_DataAlteracao.Date       := umaCompra.getDataAlteracao;

  CarregaGridProduto;
  CarregaParcelas;
  DesbilitaCampos;
end;

procedure TFrmCadCompra.DesbilitaCampos;
var i : Integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
    if Self.Components[i] is TsEdit then
        TsEdit(Self.Components[i]).Enabled := False
    else if (Self.Components[i] is TsBitBtn) and (Self.Components[i].Name <> 'btn_Sair') then
        TsBitBtn(Self.Components[i]).Enabled := False;

  Self.rg_TipoFrete.Enabled := False;
  Self.edt_DataEmissao.Enabled := False;
  Self.edt_DataCompra.Enabled := False;
  Self.edt_Observacao.Enabled := False;

  if Self.btn_Salvar.Caption = 'Salvar' then
  begin
    Self.edt_NumeroNota.Enabled := True;
    Self.edt_SerieNota.Enabled := True;
    Self.edt_IdFornecedor.Enabled := True;
    Self.btn_BuscarFornecedor.Enabled := True;
    Self.btn_Salvar.Enabled := True;
  end
  else if ((Self.btn_Salvar.Caption = 'Cancelar') and (Self.edt_status.Text <> 'CANCELADA')) then
  begin
    Self.btn_Salvar.Enabled := True;
    Self.edt_Observacao.Enabled := True;
  end;
end;

procedure TFrmCadCompra.HabilitaCampos;
begin
   Self.edt_IdFuncionario.Enabled := True;
   Self.btn_BuscarFuncionario.Enabled := True;
   Self.edt_BaseICMS.Enabled := True;
   Self.edt_TotalICMS.Enabled := True;
   Self.edt_ValorFrete.Enabled := True;
   Self.edt_ValorDesconto.Enabled := True;
   Self.edt_TotalIpi.Enabled := True;
   Self.edt_IdTransportadora.Enabled := True;
   Self.btn_BuscarTransportadora.Enabled := True;
   Self.edt_IdProduto.Enabled := True;
   Self.btn_BuscarProduto.Enabled := True;
   Self.edt_CPOF.Enabled := True;
   Self.edt_Quantidade.Enabled := True;
   Self.edt_PrecoCusto.Enabled := True;
   Self.edt_Desconto.Enabled := True;
   Self.edt_BCICMS.Enabled := True;
   Self.edt_ValorICMS.Enabled := True;
   Self.edt_ValorIPI.Enabled := True;
   Self.edt_ICMS.Enabled := True;
   Self.edt_IPI.Enabled := True;
   Self.btn_Add_Produto.Enabled := True;
   Self.btn_LimparProdutos.Enabled := True;
   Self.edt_TotalProduto.Enabled := True;
   Self.edt_TotalNota.Enabled := True;
   Self.rg_TipoFrete.Enabled := True;
   Self.edt_Observacao.Enabled := True;
   Self.edt_DataEmissao.Enabled := True;
   Self.edt_DataCompra.Enabled := True;
   HabilitaParcelas;
end;

procedure TFrmCadCompra.HabilitaParcelas;
begin
    Self.edt_IdCondicaoPagamento.Enabled := True;
    Self.btn_BuscarCondicaoPagamento.Enabled := True;
    Self.btn_GerarParcelas.Enabled := True;
    Self.btn_LimparParcelas.Enabled := True;
end;

function TFrmCadCompra.VerificaNota : Boolean;
var consCompra : Compra;
begin
  if (edt_NumeroNota.Text <> '') and (edt_SerieNota.Text <> '') and (edt_IdFornecedor.Text <> '') then
  begin
    consCompra := Compra.CrieObjeto;
    consCompra.setNumNota(StrToInt(edt_NumeroNota.Text));
    consCompra.setSerieNota(edt_SerieNota.Text);
    consCompra.getUmFornecedor.setId(StrToInt(edt_IdFornecedor.Text));
    consCompra.getUmFornecedor.setNome_RazaoSoCial(edt_Fornecedor.Text);
    consCompra.setStatus('FINALIZADA');

    if (umaCtrlCompra.VerificarNota(consCompra)) and (consCompra.getStatus <> 'CANCELADA') then
    begin
      MessageDlg('Esse Número, Série e Fornecedor da Nota já foram cadastrados!', mtInformation, [mbOK], 0);
      edt_NumeroNota.SetFocus;
      Result := False;
    end
    else
    begin
      HabilitaCampos;
      Result := True;
    end;
    consCompra.Destrua_Se;
  end;
end;

function TFrmCadCompra.VerificaProduto : Boolean;
var i : Integer;
begin
  if (gridProduto.RowCount = 1) then
    Result := True;
  for i:= 1 to umaCompra.CountProdutos do
    if (Self.gridProduto.Cells[0,i] = IntToStr(umaCompra.getumProdutoCompra.getId))then
    begin
      MessageDlg('Esse Produto já foi adicionado na Lista!', mtInformation, [mbOK], 0);
      Self.edt_IdProduto.SetFocus;
      Self.edt_IdProduto.Clear;
      self.edt_Produto.Clear;
      self.edt_Unidade.Clear;
      Self.edt_Quantidade.Clear;
      Self.edt_PrecoCusto.Clear;
      Self.edt_ICMS.Clear;
      Self.edt_IPI.Clear;
      Result := False;
      Exit;
    end
    else
      Result:= True;
end;

procedure TFrmCadCompra.LimpaCampos;
var dataAtual : TDateTime;
    i : Integer;
begin
    dataAtual := Date;
    for i := 0 to Self.ComponentCount - 1 do
      if Self.Components[i] is TsEdit then
          TsEdit(Self.Components[i]).Clear;
    Self.edt_Observacao.Clear;
    Self.edt_DataEmissao.Date := dataAtual;
    Self.edt_DataCompra.Date := dataAtual;
    Self.edt_DataCadastro.Date := dataAtual;
    Self.edt_DataAlteracao.Date := dataAtual;
    desconto  := 0;
    total     := 0;
    baseicms  := 0;
    valoricms := 0;
    valoripi  := 0;
end;

procedure TFrmCadCompra.edt_IdFornecedorExit(Sender: TObject);
begin
   if Self.edt_IdFornecedor.Text <> '' then
   begin
      Self.edt_Fornecedor.Clear;
      umaCtrlFornecedor := CtrlFornecedor.CrieObjeto;
      umaCompra.getUmFornecedor.setId(StrToInt(Self.edt_IdFornecedor.Text));
      umaCompra.getUmFornecedor.setNome_RazaoSoCial(Self.edt_Fornecedor.Text);
      umaCompra.getUmFornecedor.setTelefone('');
      umaCompra.getUmFornecedor.setCPF_CNPJ('');
      umaCompra.getUmFornecedor.setTipoFavorecido('F');
      if not umaCtrlFornecedor.Buscar(umaCompra.getUmFornecedor) then
      begin
        MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
        self.edt_IdFornecedor.Clear;
        self.edt_Fornecedor.Clear;
        Self.edt_IdCondicaoPagamento.Clear;
        Self.edt_CondicaoPagamento.Clear;
        umaCompra.getUmFornecedor.setId(0);
        Self.DesbilitaCampos;
      end
      else
      begin
        LimpaGridParcelas(true);
        umaCtrlFornecedor.Carrega(umaCompra.getUmFornecedor);
        Self.edt_IdFornecedor.Text := IntToStr(umaCompra.getUmFornecedor.getId);
        Self.edt_Fornecedor.Text := umaCompra.getUmFornecedor.getNome_RazaoSoCial;
        Self.edt_IdCondicaoPagamento.Text := IntToStr(umaCompra.getUmFornecedor.getUmaCondicaoPgto.getId);
        Self.edt_CondicaoPagamento.Text := umaCompra.getUmFornecedor.getUmaCondicaoPgto.getDescricao;

        //Adiciona a Condicao Pagamento na Compra
        addCondicaoPgto(umaCompra.getUmFornecedor.getUmaCondicaoPgto);
        VerificaNota;
      end;
      umFornecedor := Fornecedor.CrieObjeto;
      umaCtrlFornecedor.Buscar(umFornecedor);
   end
   else
   begin
     self.edt_IdFornecedor.Clear;
     self.edt_Fornecedor.Clear;
   end;
end;

procedure TFrmCadCompra.BuscarFavorecido(T:string; Tipo:String);
begin
  umaCtrlFornecedor := CtrlFornecedor.CrieObjeto;
  umFrmConFornecedor := TFrmConFornecedor.Create(nil);
  umFrmConFornecedor.ConhecaObj(umaCompra.getUmFornecedor, Tipo);
  umFrmConFornecedor.btn_Sair.Caption := 'Selecionar';
  umaCtrlFornecedor.FiltroFavorecido(T);
  umFrmConFornecedor.ShowModal;
  if umaCompra.getUmFornecedor.getId <> 0 then
  begin
    if (T = 'F') then
    begin
      LimpaGridParcelas(true);
      self.edt_IdFornecedor.Text  := inttostr(umaCompra.getUmFornecedor.getId);
      self.edt_Fornecedor.Text    := umaCompra.getUmFornecedor.getNome_RazaoSoCial;
      Self.edt_IdCondicaoPagamento.Text := IntToStr(umaCompra.getUmFornecedor.getUmaCondicaoPgto.getId);
      Self.edt_CondicaoPagamento.Text := umaCompra.getUmFornecedor.getUmaCondicaoPgto.getDescricao;

      //Adiciona a Condicao Pagamento na Compra
      addCondicaoPgto(umaCompra.getUmFornecedor.getUmaCondicaoPgto);
      VerificaNota;
    end
    else if (T = 'T') then
    begin
      self.edt_IdTransportadora.Text  := inttostr(umaCompra.getUmFornecedor.getId);
      self.edt_Transportadora.Text    := umaCompra.getUmFornecedor.getNome_RazaoSoCial;
    end;
  end;
end;

procedure TFrmCadCompra.btn_BuscarFornecedorClick(Sender: TObject);
begin
   BuscarFavorecido('F', 'Fornecedor');
end;

procedure TFrmCadCompra.LimpaGridParcelas(verifica: Boolean);
var k,j,i : integer;
begin
    if (verifica) then
    for k := 0 to umaCompra.getUmaCondicaoPagamento.p -1 do
      umaCompra.getUmaCondicaoPagamento.removeParcela;

   umaCompra.LimparListaParcelas;

   for j := 0 to (gridParcelas.ColCount - 1) do
    for i := 1 to gridParcelas.RowCount do
      gridParcelas.Cells[j,i] := '';
   gridParcelas.RowCount := 0;
end;

procedure TFrmCadCompra.edt_IdFuncionarioExit(Sender: TObject);
begin
   if Self.edt_IdFuncionario.Text <> '' then
   begin
      Self.edt_Funcionario.Clear;
      umaCtrlUsuario := CtrlUsuario.CrieObjeto;
      umaCompra := Compra.CrieObjeto;
      umaCompra.getUmUsuario.getUmFuncionario.setId(StrToInt(Self.edt_IdFuncionario.Text));
      umaCompra.getUmUsuario.getUmFuncionario.setNome_RazaoSoCial(Self.edt_Funcionario.Text);
      umaCompra.getUmUsuario.getUmFuncionario.setCPF_CNPJ('');
      if not umaCtrlUsuario.Buscar(umaCompra.getUmUsuario) then
      begin
        MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
        self.edt_IdFuncionario.Clear;
        self.edt_Funcionario.Clear;
        umaCompra.getUmUsuario.getUmFuncionario.setId(0);
      end
      else
      begin
        umaCtrlUsuario.Carrega(umaCompra.getUmUsuario);
        Self.edt_IdFuncionario.Text := IntToStr(umaCompra.getUmUsuario.getUmFuncionario.getId);
        Self.edt_Funcionario.Text := umaCompra.getUmUsuario.getUmFuncionario.getNome_RazaoSoCial;
      end;
      umUsuario := Usuario.CrieObjeto;
      umaCtrlUsuario.Buscar(umUsuario);
   end
   else
   begin
     self.edt_IdFuncionario.Clear;
     self.edt_Funcionario.Clear;
   end;
end;

procedure TFrmCadCompra.btn_BuscarFuncionarioClick(Sender: TObject);
begin
  umFrmConUsuario := TFrmConUsuario.Create(nil);
  umFrmConUsuario.ConhecaObj(umaCompra.getUmUsuario);
  umFrmConUsuario.btn_Sair.Caption := 'Selecionar';
  umFrmConUsuario.ShowModal;
  if (umaCompra.getUmUsuario.getUmFuncionario.getId <> 0) then
  begin
    self.edt_IdFuncionario.Text := inttostr(umaCompra.getUmUsuario.getUmFuncionario.getId);
    self.edt_Funcionario.Text   := umaCompra.getUmUsuario.getUmFuncionario.getNome_RazaoSoCial;
  end;
end;

procedure TFrmCadCompra.edt_IdTransportadoraExit(Sender: TObject);
begin
  if Self.edt_IdTransportadora.Text <> '' then
  begin
    Self.edt_Transportadora.Clear;
    umaCtrlTransportadora := CtrlTransportadora.CrieObjeto;
    umaCompra := Compra.CrieObjeto;
    umaCompra.getUmaTransportadora.setId(StrToInt(Self.edt_IdTransportadora.Text));
    umaCompra.getUmaTransportadora.setNome_RazaoSoCial(Self.edt_Transportadora.Text);
    umaCompra.getUmaTransportadora.setTelefone('');
    umaCompra.getUmaTransportadora.setCPF_CNPJ('');
    umaCompra.getUmaTransportadora.setTipoFavorecido('T');
    if not umaCtrlFornecedor.Buscar(umaCompra.getUmaTransportadora) then
    begin
      MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
      self.edt_IdTransportadora.Clear;
      self.edt_Transportadora.Clear;
      umaCompra.getUmaTransportadora.setId(0);
    end
    else
    begin
      umaCtrlFornecedor.Carrega(umaCompra.getUmaTransportadora);
      Self.edt_IdTransportadora.Text := IntToStr(umaCompra.getUmaTransportadora.getId);
      Self.edt_Transportadora.Text := umaCompra.getUmaTransportadora.getNome_RazaoSoCial;
    end;
    umaTransportadora := Fornecedor.CrieObjeto;
    umaCtrlFornecedor.Buscar(umaTransportadora);
  end
  else
  begin
   self.edt_IdTransportadora.Clear;
   self.edt_Transportadora.Clear;
  end;
end;

procedure TFrmCadCompra.btn_BuscarTransportadoraClick(Sender: TObject);
begin
      BuscarFavorecido('T', 'Transportadora');
end;

procedure TFrmCadCompra.edt_IdProdutoExit(Sender: TObject);
begin
   if Self.edt_IdProduto.Text <> '' then
   begin
     if (umaCompra.getUmProdutoCompra = nil) or (umaCompra.getUmProdutoCompra.getId <> 0)then
        umaCompra.CrieObejtoProduto;

      Self.edt_Produto.Clear;
      umaCtrlProduto := CtrlProduto.CrieObjeto;
      umaCompra.getUmProdutoCompra.setId(StrToInt(Self.edt_IdProduto.Text));
      umaCompra.getUmProdutoCompra.setDescricao(Self.edt_Produto.Text);
      if not umaCtrlProduto.Buscar(umaCompra.getUmProdutoCompra) then
      begin
        MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
        self.edt_IdProduto.Clear;
        self.edt_Produto.Clear;
        self.edt_Unidade.Clear;
        Self.edt_Quantidade.Clear;
        Self.edt_PrecoCusto.Clear;
        Self.edt_ICMS.Clear;
        Self.edt_IPI.Clear;
        Self.edt_IdProduto.SetFocus;
        umaCompra.getUmProdutoCompra.setId(0);
      end
      else if (Self.VerificaProduto) then
      begin
        umaCtrlProduto.Carrega(umaCompra.getUmProdutoCompra);
        self.edt_IdProduto.Text  := inttostr(umaCompra.getUmProdutoCompra.getId);
        self.edt_Produto.Text    := umaCompra.getUmProdutoCompra.getDescricao;
        self.edt_Unidade.Text    := umaCompra.getumProdutoCompra.getUnidade;
        self.edt_CPOF.Text       := IntToStr(umaCompra.getumProdutoCompra.getCPOF);
        self.edt_CST.Text        := umaCompra.getumProdutoCompra.getCST;
      end;
      umProduto := Produto.CrieObjeto;
      umaCtrlProduto.Buscar(umProduto);
   end
   else
   begin
      self.edt_IdProduto.Clear;
      self.edt_Produto.Clear;
      self.edt_Unidade.Clear;
      Self.edt_Quantidade.Clear;
      Self.edt_PrecoCusto.Clear;
      Self.edt_ICMS.Clear;
      Self.edt_IPI.Clear;
   end;
end;

procedure TFrmCadCompra.btn_BuscarProdutoClick(Sender: TObject);
begin
  if (umaCompra.getUmProdutoCompra = nil) or (umaCompra.getUmProdutoCompra.getId <> 0)then
      umaCompra.CrieObejtoProduto;

  umFrmConProduto := TFrmConProduto.Create(nil);
  umFrmConProduto.ConhecaObj(umaCompra.getUmProdutoCompra);
  umFrmConProduto.btn_Sair.Caption := 'Selecionar';
  umFrmConProduto.ShowModal;
  if (Self.VerificaProduto) then
    if umaCompra.getUmProdutoCompra.getId <> 0 then
    begin
      self.edt_IdProduto.Text  := inttostr(umaCompra.getUmProdutoCompra.getId);
      self.edt_Produto.Text    := umaCompra.getUmProdutoCompra.getDescricao;
      self.edt_Unidade.Text    := umaCompra.getumProdutoCompra.getUnidade;
      self.edt_CST.Text        := umaCompra.getumProdutoCompra.getCST;
      self.edt_NCM.Text        := IntToStr(umaCompra.getumProdutoCompra.getUmNcm.getNumero);
    end;
end;

procedure TFrmCadCompra.btn_Add_ProdutoClick(Sender: TObject);
begin
    if edt_IdProduto.Text = '' then
    begin
        ShowMessage('Favor selecionar um produto!');
        edt_IdProduto.SetFocus;
    end
    else if edt_Quantidade.Text = '' then
    begin
        ShowMessage('Campo quantidade não pode estar em branco!');
        edt_Quantidade.SetFocus;
    end
    else if StrToFloat(edt_Quantidade.Text) = 0 then
    begin
        ShowMessage('Quantidade não pode ser 0!');
        edt_Quantidade.SetFocus;
    end
    else if (edt_PrecoCusto.Text = '')then
    begin
        ShowMessage('Campo valor unitário não pode estar em branco!');
        edt_PrecoCusto.SetFocus;
    end
    else if (StrToFloat(edt_PrecoCusto.Text) <= 0)then
    begin
        ShowMessage('Valor muito baixo!');
        edt_PrecoCusto.SetFocus;
    end
    else if (edt_Desconto.Text <> '') and (StrToFloat(edt_Desconto.Text) > 100) then
    begin
        ShowMessage('Desconto não pode ser maior que o valor!');
        edt_Desconto.SetFocus;
    end
    else if (edt_Total.Text = '') then
    begin
        ShowMessage('Favor adicionar o Total do produto!');
        edt_Total.SetFocus;
    end
    else if (edt_BCICMS.Text = '') then
    begin
        ShowMessage('Favor adicionar a Base cálculo do produto!');
        edt_BCICMS.SetFocus;
    end
    else
    begin
      if Self.edt_Desconto.Text = '' then
        edt_Desconto.Text := FloatToStr(0);
      if Self.edt_ICMS.Text = '' then
        edt_ICMS.Text := FloatToStr(0);
      if Self.edt_IPI.Text = '' then
        edt_IPI.Text := FloatToStr(0);
      if (edt_ValorICMS.Text = '') then
        edt_ValorICMS.Text := FloatToStr(0);
      if (edt_ValorIPI.Text = '') then
        edt_ValorIPI.Text := FloatToStr(0);
      if Self.edt_CPOF.Text <> '' then
        umaCompra.getUmProdutoCompra.setCPOF(StrToInt(Self.edt_CPOF.Text));

      umaCompra.getUmProdutoCompra.setNCMSH(Self.edt_NCM.Text);
      umaCompra.getUmProdutoCompra.setCST(Self.edt_CST.Text);
      umaCompra.getUmProdutoCompra.setUnidadeCompra(Self.edt_Unidade.Text);
      umaCompra.getUmProdutoCompra.setQuantidadeCompra(StrToFloat(Self.edt_Quantidade.Text));
      umaCompra.getUmProdutoCompra.setValorUnitarioCompra(StrToFloat(Self.edt_PrecoCusto.Text));
      umaCompra.getUmProdutoCompra.setDescontoCompra(StrToFloat(Self.edt_Desconto.Text));
      umaCompra.getUmProdutoCompra.setValorTotalCompra(StrToFloat(Self.edt_Total.Text));
      umaCompra.getUmProdutoCompra.setBaseIcmsCompra(StrToFloat(Self.edt_BCICMS.Text));
      umaCompra.getUmProdutoCompra.setValorIcmsCompra(StrToFloat(Self.edt_ValorICMS.Text));
      umaCompra.getUmProdutoCompra.setValorIpiCompra(StrToFloat(Self.edt_ValorIPI.Text));
      umaCompra.getUmProdutoCompra.setICMSCompra(StrToFloat(Self.edt_ICMS.Text));
      umaCompra.getUmProdutoCompra.setIPICompra(StrToFloat(Self.edt_IPI.Text));
      umaCompra.getUmProdutoCompra.setDescontoCompra(StrToFloat(Self.edt_Desconto.Text));

      if (umaCompra.getumProdutoCompra.getPrecoCompra <> 0) and (umaCompra.getumProdutoCompra.getQuantidade <> 0) then
      begin
          umaCompra.getumProdutoCompra.setICMSAnterior(umaCompra.getUmProdutoCompra.getICMS);
          umaCompra.getumProdutoCompra.setIPIAnterior(umaCompra.getUmProdutoCompra.getIPI);
          umaCompra.getumProdutoCompra.setPrecoCompraAnt(umaCompra.getUmProdutoCompra.getValorUnitarioCompra);
      end;

      umaCompra.addProdutoCompra(umaCompra.getUmProdutoCompra);

      CarregaGridProduto;

      LimpaGridParcelas(True);
      Self.edt_IdCondicaoPagamentoExit(Sender);
      HabilitaParcelas;

      Self.edt_IdProduto.Clear;
      Self.edt_Produto.Clear;
      Self.edt_NCM.Clear;
      Self.edt_CST.Clear;
      Self.edt_CPOF.Clear;
      Self.edt_Unidade.Clear;
      Self.edt_Quantidade.Clear;
      Self.edt_PrecoCusto.Clear;
      Self.edt_Desconto.Clear;
      Self.edt_Total.Clear;
      Self.edt_BCICMS.Clear;
      Self.edt_ValorICMS.Clear;
      Self.edt_ValorIPI.Clear;
      Self.edt_ICMS.Clear;
      Self.edt_IPI.Clear;
    end;
end;

procedure TFrmCadCompra.btn_LimparProdutosClick(Sender: TObject);
var i,j : Integer;
begin
  if gridProduto.Row <> 0 then
  begin
    desconto  := 0;
    total     := 0;
    baseicms  := 0;
    valoricms := 0;
    valoripi  := 0;
    umaCompra.removeItemProdutoCompra(Self.gridProduto.Row -1);
    for j := 0 to (gridProduto.ColCount - 1) do
      for i := 1 to gridProduto.RowCount - 1do
        gridProduto.Cells[j, i] := '';
    gridProduto.Row := 1;
    CarregaGridProduto;
    LimpaGridParcelas(True);
    Self.edt_IdCondicaoPagamentoExit(Sender);
    HabilitaParcelas;
  end;
end;

procedure TFrmCadCompra.CarregaGridProduto;
var i : Integer;
    qtdAnt, precoAnt, totalAnt, qtdRec, precoRec, totalRec, resultQtd : Double;
     resultAnt, resultRec : String;
begin
  if ((self.gridProduto.RowCount - 1) = 1 ) and (umaCompra.CountProdutos = 0)then
  begin
    for i := 0 to  self.gridProduto.ColCount -1  do
       self.gridProduto.Cells[i,1] := EmptyStr;
    self.gridProduto.RowCount := 1;
  end
  else
  begin
    for i := 1 to umaCompra.CountProdutos do
    begin
      self.gridProduto.RowCount := i + 1;
      if (self.gridProduto.Cells[0, i] = '') then
      begin
        self.gridProduto.Cells[0, i]  := IntToStr(umaCompra.getProdutoCompra(i-1).getId);
        self.gridProduto.Cells[1, i]  := umaCompra.getProdutoCompra(i-1).getDescricao;
        self.gridProduto.Cells[2, i]  := umaCompra.getProdutoCompra(i-1).getNCMSH;
        self.gridProduto.Cells[3, i]  := umaCompra.getProdutoCompra(i-1).getCST;
        self.gridProduto.Cells[4, i]  := IntToStr(umaCompra.getProdutoCompra(i-1).getCPOF);
        self.gridProduto.Cells[5, i]  := umaCompra.getProdutoCompra(i-1).getUnidadeCompra;
        self.gridProduto.Cells[6, i]  := FormatFloat('#0.000', umaCompra.getProdutoCompra(i-1).getQuantidadeCompra);
        self.gridProduto.Cells[7, i]  := FormatFloat('#0.00', umaCompra.getProdutoCompra(i-1).getValorUnitarioCompra);
        self.gridProduto.Cells[8, i]  := FormatFloat('#0.00', umaCompra.getProdutoCompra(i-1).getDescontoCompra);
        self.gridProduto.Cells[9, i]  := FormatFloat('#0.00', umaCompra.getProdutoCompra(i-1).getValorTotalCompra);
        self.gridProduto.Cells[10, i]  := FormatFloat('#0.00', umaCompra.getProdutoCompra(i-1).getBaseIcmsCompra);
        self.gridProduto.Cells[11, i]  := FormatFloat('#0.00', umaCompra.getProdutoCompra(i-1).getValorIcmsCompra);
        self.gridProduto.Cells[12, i] := FormatFloat('#0.00', umaCompra.getProdutoCompra(i-1).getValorIpiCompra);
        self.gridProduto.Cells[13, i] := FormatFloat('#0.00', umaCompra.getProdutoCompra(i-1).getICMSCompra);
        self.gridProduto.Cells[14, i] := FormatFloat('#0.00', umaCompra.getProdutoCompra(i-1).getIPICompra);

        desconto  := desconto  + umaCompra.getProdutoCompra(i-1).getDescontoCompra;
        total     := total     + umaCompra.getProdutoCompra(i-1).getValorTotalCompra;
        baseicms  := baseicms  + umaCompra.getProdutoCompra(i-1).getBaseIcmsCompra;
        valoricms := valoricms + umaCompra.getProdutoCompra(i-1).getValorIcmsCompra;
        valoripi  := valoripi  + umaCompra.getProdutoCompra(i-1).getValorIpiCompra;

        //Calculo para a media ponderada
        if self.btn_Salvar.Caption = 'Cancelar' then
        begin
          qtdRec   := StrToFloat(FormatFloat('#0.00',umaCompra.getProdutoCompra(i-1).getQuantidadeCompra));
          precoRec := StrToFloat(FormatFloat('#0.00',umaCompra.getProdutoCompra(i-1).getValorUnitarioCompra));
          totalRec := qtdRec * precoRec;
          qtdAnt   := StrToFloat(FormatFloat('#0.00',umaCompra.getProdutoCompra(i-1).getQuantidade));
          precoAnt := umaCompra.getProdutoCompra(i-1).getPrecoCompra;
          totalAnt := qtdAnt * precoAnt;

          resultAnt := FloatToStr(totalAnt);
          resultRec := FloatToStr(totalRec);
          resultQtd := qtdAnt-qtdRec;
          if ((resultAnt = resultRec) and (resultQtd = 0)) or ((resultAnt <> resultRec) and (resultQtd = 0))then
            umaCompra.getProdutoCompra(i-1).setPrecoCompra(0)
          else
            umaCompra.getProdutoCompra(i-1).setPrecoCompra((totalAnt-totalRec)/(qtdAnt-qtdRec));
        end
        else if self.btn_Salvar.Caption = 'Salvar' then
        begin
          qtdRec   := StrToFloat(FormatFloat('#0.00',umaCompra.getProdutoCompra(i-1).getQuantidadeCompra));
          precoRec := StrToFloat(FormatFloat('#0.00',umaCompra.getProdutoCompra(i-1).getValorUnitarioCompra));
          totalRec := qtdRec * precoRec;
          qtdAnt   := StrToFloat(FormatFloat('#0.00',umaCompra.getProdutoCompra(i-1).getQuantidade));
          precoAnt := StrToFloat(FormatFloat('#0.00',umaCompra.getProdutoCompra(i-1).getPrecoCompra));
          totalAnt := qtdAnt * precoAnt;
          umaCompra.getProdutoCompra(i-1).setPrecoCompra((totalAnt+totalRec)/(qtdAnt+qtdRec));
        end;
      end;
    end;
  end;
end;

procedure TFrmCadCompra.edt_IdCondicaoPagamentoExit(Sender: TObject);
begin
  if Self.edt_IdCondicaoPagamento.Text <> '' then
  begin
    LimpaGridParcelas(true);
    Self.edt_CondicaoPagamento.Clear;
    umaCtrlCondicaoPagamento := CtrlCondicaoPagamento.CrieObjeto;
    umaCompra.getUmaCondicaoPagamento.setId(StrToInt(Self.edt_IdCondicaoPagamento.Text));
    umaCompra.getUmaCondicaoPagamento.setDescricao(Self.edt_CondicaoPagamento.Text);
    umaCompra.getUmaCondicaoPagamento.getUmaFormaPagamento.setId(0);
    if not umaCtrlCondicaoPagamento.Buscar(umaCompra.getUmaCondicaoPagamento) then
    begin
      MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
      self.edt_IdCondicaoPagamento.Clear;
      self.edt_CondicaoPagamento.Clear;
      umaCompra.getUmaCondicaoPagamento.setId(0);
    end
    else
    begin
      umaCtrlCondicaoPagamento.Carrega(umaCompra.getUmaCondicaoPagamento);
      Self.edt_IdCondicaoPagamento.Text := IntToStr(umaCompra.getUmaCondicaoPagamento.getId);
      Self.edt_CondicaoPagamento.Text := umaCompra.getUmaCondicaoPagamento.getDescricao;
    end;
    umaCondicaoPagamento := CondicaoPagamento.CrieObjeto;
    umaCtrlCondicaoPagamento.Buscar(umaCondicaoPagamento);
  end
  else
  begin
   self.edt_IdCondicaoPagamento.Clear;
   self.edt_CondicaoPagamento.Clear;
  end;
end;

procedure TFrmCadCompra.btn_BuscarCondicaoPagamentoClick(Sender: TObject);
begin
  umFrmConCondicaoPagamento := TFrmConCondicaoPagamento.Create(nil);
  umFrmConCondicaoPagamento.ConhecaObj(umaCompra.getUmaCondicaoPagamento);
  umFrmConCondicaoPagamento.btn_Sair.Caption := 'Selecionar';
  umFrmConCondicaoPagamento.ShowModal;
  self.edt_IdCondicaoPagamento.Text := inttostr(umaCompra.getUmaCondicaoPagamento.getId);
  self.edt_CondicaoPagamento.Text   := umaCompra.getUmaCondicaoPagamento.getDescricao;
end;

procedure TFrmCadCompra.btn_GerarParcelasClick(Sender: TObject);
begin
  if (Self.edt_TotalNota.Text = '') or (StrToFloat(Self.edt_TotalNota.Text) = 0)then
  begin
    ShowMessage('O campo V. Total da Nota não pode estar em branco ou igual a 0! ');
    edt_TotalNota.SetFocus;
  end
  else
    CarregaParcelas;
end;

procedure TFrmCadCompra.CarregaParcelas;
var i : Integer;
    valorFinal,TotalNota : Real;
    valor : string;
begin
  valorFinal:= 0;
  if edt_TotalNota.Text <> '' then
  begin
    TotalNota := StrToFloat(Self.edt_TotalNota.text);
    for i := 1 to umaCompra.getUmaCondicaoPagamento.p do
    begin
       umaCompra.CrieObjetoParcela;
       umaCompra.addParcelas(umaCompra.getUmaCondicaoPagamento.getParcela(i-1));
       self.gridParcelas.RowCount := i+1;
       self.gridParcelas.Cells[0,i] := IntToStr(umaCompra.getUmaCondicaoPagamento.getParcela(i-1).getNumParcela);
       self.gridParcelas.Cells[1,i] := DateToStr(Date + (umaCompra.getUmaCondicaoPagamento.getParcela(i-1).getDias));
       self.gridParcelas.Cells[2,i] := FloatToStr(umaCompra.getUmaCondicaoPagamento.getParcela(i-1).getPorcentagem);
       valor := FormatFloat('#0.00',(StrToFloat(Self.gridParcelas.Cells[2,i])/100) * StrToFloat(Self.edt_TotalNota.text));
       self.gridParcelas.Cells[3,i] := valor;

       valorFinal := valorFinal + StrToFloat(self.gridParcelas.Cells[3,i]);
       if (valorFinal > TotalNota) and (i = umaCompra.getUmaCondicaoPagamento.p) then
       begin
         valorFinal := TotalNota - valorFinal;
         self.gridParcelas.Cells[3,i] := FormatFloat('#0.00', StrToFloat(self.gridParcelas.Cells[3,i])+valorFinal);
       end
       else if (valorFinal < TotalNota) and (i = umaCompra.getUmaCondicaoPagamento.p) then
       begin
         valorFinal := TotalNota - valorFinal;
         self.gridParcelas.Cells[3,i] := FormatFloat('#0.00', StrToFloat(self.gridParcelas.Cells[3,i])+valorFinal);
       end;
    end;
    Self.edt_IdCondicaoPagamento.Enabled := False;
    Self.edt_CondicaoPagamento.Enabled := False;
    Self.btn_BuscarCondicaoPagamento.Enabled := False;
    Self.btn_GerarParcelas.Enabled := False;
  end;
end;

procedure TFrmCadCompra.btn_LimparParcelasClick(Sender: TObject);
begin
    HabilitaParcelas;
    Self.LimpaGridParcelas(True);
    Self.edt_IdCondicaoPagamentoExit(Sender);
end;

procedure TFrmCadCompra.LimpaGridProduto;
var j,i : integer;
begin
   for j := 0 to (gridProduto.ColCount - 1) do
    for i := 1 to gridProduto.RowCount do
      gridProduto.Cells[j,i] := '';
   gridProduto.RowCount := 0;
end;

procedure TFrmCadCompra.MediaPonderada(qtdCompra : Real; precoCompra : Real);
var totalAnt : Real;
begin
    totalAnt := precoCompra * qtdCompra;
end;

procedure TFrmCadCompra.rg_TipoFreteClick(Sender: TObject);
begin
  if (rg_TipoFrete.ItemIndex = 3) then
  begin
    edt_IdTransportadora.Enabled := False;
    btn_BuscarTransportadora.Enabled := False;
    edt_ValorFrete.Enabled := False;
    edt_IdTransportadora.Clear;
    edt_transportadora.Clear;
    edt_ValorFrete.Clear;
    edt_ValorFreteExit(Sender);
  end
  else
  begin
    edt_IdTransportadora.Enabled := True;
    btn_BuscarTransportadora.Enabled := True;
    edt_ValorFrete.Enabled := True;
  end;
end;

procedure TFrmCadCompra.btn_SalvarClick(Sender: TObject);
var msg: string;
    verifica : Boolean;
    descontoAux, totalAux, baseicmsAux, valoricmsAux, valoripiAux : Real;
    dataAtual : TDateTime;
begin
   dataAtual := Date;
  if (self.edt_BaseICMS.Text = '') then
    Self.edt_BaseICMS.Text := IntToStr(0);
  if (self.edt_ValorDesconto.Text = '') then
   Self.edt_ValorDesconto.Text := IntToStr(0);
  if (self.edt_TotalICMS.Text = '') then
    Self.edt_TotalICMS.Text := IntToStr(0);
  if (self.edt_TotalIpi.Text = '') then
    Self.edt_TotalIpi.Text := IntToStr(0);
  if (self.edt_TotalProduto.Text = '') then
    Self.edt_TotalProduto.Text := IntToStr(0);
  if (self.edt_ValorFrete.Text = '') then
    Self.edt_ValorFrete.Text := IntToStr(0);

  verifica     := False;
  baseicmsAux  := StrToFloat(self.edt_BaseICMS.Text);
  descontoAux  := StrToFloat(self.edt_ValorDesconto.Text);
  totalAux     := StrToFloat(self.edt_TotalProduto.Text);
  valoricmsAux := StrToFloat(self.edt_TotalICMS.Text);
  valoripiAux  := StrToFloat(self.edt_TotalIpi.Text);

  if self.edt_NumeroNota.Text = '' then
  begin
    ShowMessage('Favor inserir o número da Nota! ');
    edt_SerieNota.SetFocus;
  end
  else if self.edt_SerieNota.Text = '' then
  begin
    ShowMessage('Favor inserir a serie da Nota! ');
    edt_SerieNota.SetFocus;
  end
  else if self.edt_Fornecedor.Text = '' then
  begin
    ShowMessage('Favor inserir um Fornecedor! ');
    edt_IdFornecedor.SetFocus;
  end
  else if self.edt_IdFuncionario.Text = '' then
  begin
    ShowMessage('Campo funcionário não pode estar me branco! ');
    edt_IdFuncionario.SetFocus;
  end
  else if edt_DataEmissao.Date = StrToDate('30/12/1899') then
  begin
    ShowMessage('Favor informar a Data de Emissão!');
    edt_DataEmissao.SetFocus
  end
  else if edt_DataCompra.Date = StrToDate('30/12/1899') then
  begin
    ShowMessage('Favor informar a Data de Compra!');
    edt_DataCompra.SetFocus
  end
  else if self.edt_BaseICMS.Text = '' then
  begin
    ShowMessage('Favor informar o valor da Base de Cálculo ICMS da Nota! ');
    edt_BaseICMS.SetFocus;
  end
  else if self.edt_TotalICMS.Text = '' then
  begin
    ShowMessage('Favor informar o valor Total do ICMS da Nota! ');
    edt_TotalICMS.SetFocus;
  end
  else if self.edt_TotalIpi.Text = '' then
  begin
    ShowMessage('Favor informar o valor Total do IPI da Nota! ');
    edt_TotalIPI.SetFocus;
  end
  else if self.edt_TotalProduto.Text = '' then
  begin
    ShowMessage('Favor informar o valor Total do Produto da Nota! ');
    edt_TotalProduto.SetFocus;
  end
  else if self.edt_TotalNota.Text = '' then
  begin
    ShowMessage('Favor informar o valor Total da Nota! ');
    edt_TotalNota.SetFocus;
  end
  else if self.gridProduto.RowCount <= 1then
  begin
    ShowMessage('Compra tem que ter no minímo 1 produto! ');
    edt_IdProduto.SetFocus;
  end
  else if self.gridParcelas.RowCount <= 1then
  begin
    ShowMessage('Favor gerar as parcelas! ');
    btn_GerarParcelas.SetFocus;
  end
  else if baseicmsAux <> baseicms then
  begin
    MessageDlg('A soma da base de cálculo de cada produto não confere com a base de cálculo da nota!', mtInformation, [mbOK], 0);
    edt_BaseICMS.SetFocus;
  end
  else if valoricmsAux <> valoricms then
  begin
    MessageDlg('A soma do valor do ICMS de cada produto não confere com o valor total do ICMS da nota!', mtInformation, [mbOK], 0);
    edt_TotalICMS.SetFocus;
  end
  else if descontoAux <> desconto then
  begin
    MessageDlg('A soma do valor do Desconto de cada produto não confere com o valor total do Desconto da nota!', mtInformation, [mbOK], 0);
    edt_ValorDesconto.SetFocus;
  end
  else if valoripiAux <> valoripi then
  begin
    MessageDlg('A soma do valor do IPI de cada produto não confere com o valor total do IPI da nota!', mtInformation, [mbOK], 0);
    edt_TotalIPI.SetFocus;
  end
  else if totalAux <> total then
  begin
    MessageDlg('A soma do Total de cada produto não confere com o valor total do Produto da nota!', mtInformation, [mbOK], 0);
    edt_TotalProduto.SetFocus;
  end
  else
    begin
      if self.btn_Salvar.Caption = 'Salvar' then
        begin
          verifica := True;
          umaCompra.setStatus('FINALIZADA')
        end
      else if self.btn_Salvar.Caption = 'Cancelar' then
        begin
          if Self.edt_Observacao.Text = '' then
            begin
              ShowMessage('Você deve informar o motivo do cancelamento no campo "Observação"!');
              Self.edt_Observacao.SetFocus;
            end
          else
            begin
              verifica := True;
              umaCompra.setStatus('CANCELADA');
            end;
        end;
      if (verifica) then
        begin
          umaCompra.setNumNota(StrToInt(edt_NumeroNota.Text));
          umaCompra.setSerieNota(edt_SerieNota.Text);
          umaCompra.getUmFornecedor.setId(StrToInt(edt_IdFornecedor.Text));

          umaCompra.getUmUsuario.setIdUsuario(idUserLogado);
          umaCompra.getUmUsuario.getUmFuncionario.setId(idLogado);
          umaCompra.getUmUsuario.getUmFuncionario.setNome_RazaoSoCial(nomeLogado);

          if (Self.edt_IdTransportadora.Text <> '') then
            umaCompra.getUmaTransportadora.setId(StrToInt(edt_IdTransportadora.Text));

          umaCompra.setTipoFrete(rg_TipoFrete.ItemIndex);
          umaCompra.setBaseICMS(StrToFloat(edt_BaseICMS.Text));
          umaCompra.setTotalICMS(StrToFloat(edt_TotalICMS.Text));
          umaCompra.setValorFrete(StrToFloat(edt_ValorFrete.Text));
          umaCompra.setValorDesconto(StrToFloat(edt_ValorDesconto.Text));
          umaCompra.setTotalIPI(StrToFloat(edt_TotalIPI.Text));
          umaCompra.setTotalProduto(StrToFloat(edt_TotalProduto.Text));
          umaCompra.setTotalNota(StrToFloat(edt_TotalNota.Text));

          umaCompra.setDataEmissao(edt_DataEmissao.Date);
          umaCompra.setDataCompra(edt_DataCompra.Date);
          umaCompra.setDataCadastro(edt_DataCadastro.Date);
          if self.edt_DataAlteracao.Date <> dataAtual then
            umaCompra.setDataAlteracao(dataAtual);
          umaCompra.setObservacao(edt_Observacao.Text);

          umaCompra.setTipo(True); //Garantir que os dados vem de um Compra

          msg := umaCtrlCompra.Salvar(UmaCompra);
          if (Copy(msg,0,11) = 'Esse Número') then
            ShowMessage(msg)
          else
          begin
            if Copy(msg,0,16) = 'Ocorreu um erro!' then
                Application.MessageBox(PChar(msg), 'Erro!', MB_OK + MB_ICONSTOP)
            else
                ShowMessage(msg);
            self.btn_Salvar.Caption := 'Salvar';
            umaCompra.LimparListaProduto;
            Close;
          end;
        end;
    end;
end;

//----Validar Data----//
procedure TFrmCadCompra.edt_DataCompraExit(Sender: TObject);
var DataAtual : TDateTime;
begin
  DataAtual := Date;
  if (edt_DataCompra.Text <> '  /  /    ') then
  begin
    if (validarData(edt_DataCompra.Date, 3)) then
      edt_DataCompra.SetFocus
    else if (edt_DataCompra.Date < DataAtual) then
    begin
      MessageDlg('ATENÇÃO: Data de Compra não pode ser menor que a Data de Emissão.',mtWarning,[mbOK],0);
      Self.edt_DataCompra.SetFocus;
    end;
  end;

end;

procedure TFrmCadCompra.edt_DataEmissaoExit(Sender: TObject);
var DataAtual : TDateTime;
begin
  DataAtual := Date;
  if (edt_DataEmissao.Text <> '  /  /    ') then
  begin
    if (validarData(edt_DataEmissao.Date, 3)) then
      edt_DataEmissao.SetFocus
    else if (edt_DataEmissao.Date > DataAtual) then
    begin
      MessageDlg('ATENÇÃO: Data de Emissão não pode ser maior que Atual.',mtWarning,[mbOK],0);
      Self.edt_DataEmissao.SetFocus;
    end;
  end;
end;

//-----------------//

procedure TFrmCadCompra.edt_ValorFreteExit(Sender: TObject);
begin
  if (Self.edt_ValorFrete.Text = '') then
    valorfrete := 0
  else
    valorfrete := StrToFloat(Self.edt_ValorFrete.Text);
  Self.edt_ValorFrete.Text := FormatFloat('#0.00', valorfrete);
  if (Self.edt_TotalNota.Text <> '') then
    Self.edt_TotalNotaExit(Sender);
end;

procedure TFrmCadCompra.edt_ValorDescontoExit(Sender: TObject);
begin
  if (Self.edt_ValorDesconto.Text = '') then
    valordesconto := 0
  else
    valordesconto := StrToFloat(Self.edt_ValorDesconto.Text);
  Self.edt_ValorDesconto.Text := FormatFloat('#0.00', valordesconto);
  if (Self.edt_TotalNota.Text <> '') then
    Self.edt_TotalNotaExit(Sender);
end;

procedure TFrmCadCompra.edt_TotalNotaChange(Sender: TObject);
begin
  if (Self.edt_NumeroNota.Text <> '') and (Self.btn_Salvar.Caption = 'Salvar')then
  begin
    HabilitaParcelas;
    Self.LimpaGridParcelas(True);
    Self.edt_IdCondicaoPagamentoExit(Sender);
  end;
end;

procedure TFrmCadCompra.edt_TotalNotaExit(Sender: TObject);
var verifica     : Boolean;
    totalProduto, totalNota : Real;
begin
    verifica := True;

    if (Self.edt_TotalNota.Text = '') then
    begin
       totalNota := 0;
       if (Self.edt_TotalProduto.Text = '' ) then
         Self.edt_TotalProduto.Text := FormatFloat('#0.00', 0);
    end
    else
      totalNota := StrToFloat(Self.edt_TotalNota.Text);
    if (valordesconto > totalNota) and ((Self.edt_TotalNota.Text = '' ) or (Self.edt_TotalNota.Text = '0,00' )) then
    begin
      MessageDlg('O Desconto não pode ser maior que o valor da nota!',mtWarning,[mbOK],0);
      Self.edt_ValorDesconto.SetFocus;
    end
    else
    begin
      if (valordesconto <> 0) and (valordescontoAux <> valordesconto)then
      begin
        valordescontoAux := valordesconto;
        verifica := False;
        totalnota     := StrToFloat(Self.edt_TotalNota.Text);
        valordesconto := StrToFloat(Self.edt_ValorDesconto.Text);
        Self.edt_TotalNota.Text := FormatFloat('#0.00', totalnota - valordesconto);
      end;
      if (valorfrete <> 0) and (valorfreteAux <> valorfrete)then
      begin
        valorfreteAux := valorfrete;
        verifica := False;
        totalnota     := StrToFloat(Self.edt_TotalNota.Text);
        valorfrete := StrToFloat(Self.edt_ValorFrete.Text);
        Self.edt_TotalNota.Text := FormatFloat('#0.00', totalnota + valorfrete);
      end;
      if (verifica) and (valordesconto = 0) and (valorfrete = 0)then
        Self.edt_TotalNota.Text := Self.edt_TotalProduto.Text
      else
      begin
        totalProduto := StrToFloat(Self.edt_TotalProduto.Text);
        Self.edt_TotalNota.Text := FormatFloat('#0.00', totalProduto + valorfrete - valordesconto);
      end;
    end;
end;

procedure TFrmCadCompra.CalcItemProduto;
var qtdItem, valorProdutoItem, descontoItem, totalItem : Real;
begin
    qtdItem := StrToFloat(edt_Quantidade.Text);
    valorProdutoItem := StrToFloat(edt_PrecoCusto.Text);
    totalItem :=  valorProdutoItem * qtdItem;
    totalItemAnt := totalItem;
    edt_Total.Text := FormatFloat('#0.00', totalItem);
    edt_BCICMS.Text := FormatFloat('#0.00', totalItem);
end;

//-----Campos dos Calculos-----//
procedure TFrmCadCompra.edt_QuantidadeExit(Sender: TObject);
begin
    if (edt_Quantidade.Text = '') then
      edt_Quantidade.Text := FormatFloat('#0.00', 0)
    else
      edt_Quantidade.Text := FormatFloat('#0.00', StrToFloat(edt_Quantidade.Text));
    if (edt_PrecoCusto.Text <> '') then
      Self.CalcItemProduto;
end;

procedure TFrmCadCompra.edt_PrecoCustoExit(Sender: TObject);
begin
  if (edt_Quantidade.Text = '') then
    edt_Quantidade.Text := FormatFloat('#0.00', 0);
  if (edt_PrecoCusto.Text = '') then
    edt_PrecoCusto.Text := FormatFloat('#0.00', 0)
  else
    edt_PrecoCusto.Text := FormatFloat('#0.00', StrToFloat(edt_PrecoCusto.Text));
  Self.CalcItemProduto;
end;

procedure TFrmCadCompra.edt_DescontoExit(Sender: TObject);
var  vTotal, vDesc : Real;
begin
  if (edt_Desconto.Text = '') then
  begin
    if (edt_Quantidade.Text = '') then
      edt_Quantidade.Text := FormatFloat('#0.00', 0);
    if (edt_PrecoCusto.Text = '') then
      edt_PrecoCusto.Text := FormatFloat('#0.00', 0);
    edt_Desconto.Text := FormatFloat('#0.00', 0);
    Self.CalcItemProduto;
    descItemAnt := 0;
    descItemAux := 0;
  end
  else if (edt_Desconto.Text <> '' ) and (StrToFloat(edt_Desconto.Text) <> 0 ) and (StrToFloat(edt_Desconto.Text) <> descItemAnt) then
  begin
    if (edt_Desconto.Text <> '') and (StrToFloat(edt_Desconto.Text) > StrToFloat(edt_Total.Text)) then
    begin
        ShowMessage('Desconto não pode ser maior que o valor total!');
        edt_Desconto.SetFocus;
    end
    else
    begin
      edt_Desconto.Text := FormatFloat('#0.00', StrToFloat(edt_Desconto.Text));
      edt_Total.Text := FormatFloat('#0.00', StrToFloat(edt_Total.Text)+descItemAnt);
      descItemAnt := StrToFloat(edt_Desconto.Text);
      descItemAux := StrToFloat(edt_Total.Text)- StrToFloat(edt_Desconto.Text);
      totalItemAnt := descItemAux;
      edt_Total.Text :=  FormatFloat('#0.00', descItemAux);
    end;
  end;
end;

procedure TFrmCadCompra.edt_TotalExit(Sender: TObject);
begin
    if (edt_Total.Text = '') or (StrToFloat(edt_Total.Text) = 0) then
      edt_Total.Text := FormatFloat('#0.00', totalItemAnt); ;
end;

//-----Campos dos Calculos Fim-----//

//-------------Campos Numéricos-------------//
procedure TFrmCadCompra.edt_NumeroNotaExit(Sender: TObject);
begin
  VerificaNota;
end;

procedure TFrmCadCompra.edt_SerieNotaExit(Sender: TObject);
begin
   VerificaNota;
end;

procedure TFrmCadCompra.edt_NumeroNotaKeyPress(Sender: TObject; var Key: Char);
begin
  CampoReal(Sender,Key,edt_NumeroNota.Text);
end;

procedure TFrmCadCompra.edt_IdFornecedorKeyPress(Sender: TObject; var Key: Char);
begin
  CampoNumero(Sender,Key);
end;

procedure TFrmCadCompra.edt_IdFuncionarioKeyPress(Sender: TObject; var Key: Char);
begin
  CampoNumero(Sender,Key);
end;

procedure TFrmCadCompra.edt_BaseICMSExit(Sender: TObject);
begin
  if (Self.edt_BaseICMS.Text = '') then
    Self.edt_BaseICMS.Text := IntToStr(0);
  Self.edt_BaseICMS.Text := FormatFloat('#0.00', StrToFloat(Self.edt_BaseICMS.Text));
end;

procedure TFrmCadCompra.edt_TotalICMSExit(Sender: TObject);
begin
  if (Self.edt_TotalICMS.Text = '') then
    Self.edt_TotalICMS.Text := IntToStr(0);
  Self.edt_TotalICMS.Text := FormatFloat('#0.00', StrToFloat(Self.edt_TotalICMS.Text));
end;

procedure TFrmCadCompra.edt_TotalIpiExit(Sender: TObject);
begin
  if (Self.edt_TotalIPI.Text = '') then
    Self.edt_TotalIPI.Text := IntToStr(0);
  Self.edt_TotalIPI.Text := FormatFloat('#0.00', StrToFloat(Self.edt_TotalIPI.Text));
end;

procedure TFrmCadCompra.edt_TotalProdutoExit(Sender: TObject);
begin
  if (Self.edt_TotalProduto.Text = '') then
    Self.edt_TotalProduto.Text := IntToStr(0);
  Self.edt_TotalProduto.Text := FormatFloat('#0.00', StrToFloat(Self.edt_TotalProduto.Text));
  if (Self.edt_TotalProduto.Text = '0,00') and (Self.edt_TotalNota.Text <> '') then
    Self.edt_TotalNota.Text :=  Self.edt_TotalProduto.Text;
  edt_TotalNotaExit(Sender);
end;

procedure TFrmCadCompra.edt_BaseICMSKeyPress(Sender: TObject; var Key: Char);
begin
  CampoReal(Sender,Key,edt_BaseICMS.Text);
end;

procedure TFrmCadCompra.edt_BCICMSKeyPress(Sender: TObject; var Key: Char);
begin
  CampoReal(Sender,Key,edt_BCICMS.Text);
end;

procedure TFrmCadCompra.edt_TotalICMSKeyPress(Sender: TObject; var Key: Char);
begin
   CampoReal(Sender,Key,edt_TotalICMS.Text);
end;

procedure TFrmCadCompra.edt_ValorFreteKeyPress(Sender: TObject; var Key: Char);
begin
  CampoReal(Sender,Key,edt_ValorFrete.Text);
end;

procedure TFrmCadCompra.edt_ValorICMSKeyPress(Sender: TObject; var Key: Char);
begin
  CampoReal(Sender,Key,edt_ValorICMS.Text);
end;

procedure TFrmCadCompra.edt_ValorIPIKeyPress(Sender: TObject; var Key: Char);
begin
  CampoReal(Sender,Key,edt_ValorIPI.Text);
end;

procedure TFrmCadCompra.edt_ValorDescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
  CampoReal(Sender,Key,edt_ValorDesconto.Text);
end;

procedure TFrmCadCompra.edt_TotalIpiKeyPress(Sender: TObject; var Key: Char);
begin
  CampoReal(Sender,Key,edt_TotalIpi.Text);
end;

procedure TFrmCadCompra.edt_TotalKeyPress(Sender: TObject; var Key: Char);
begin
  CampoReal(Sender,Key,edt_Total.Text);
end;

procedure TFrmCadCompra.edt_IdTransportadoraKeyPress(Sender: TObject;
  var Key: Char);
begin
  CampoNumero(Sender,Key);
end;

procedure TFrmCadCompra.edt_IdProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  CampoNumero(Sender,Key);
end;

procedure TFrmCadCompra.edt_CPOFKeyPress(Sender: TObject; var Key: Char);
begin
  CampoNumero(Sender,Key);
end;

procedure TFrmCadCompra.edt_QuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  CampoReal(Sender,Key,edt_Quantidade.Text);
end;

procedure TFrmCadCompra.edt_PrecoCustoKeyPress(Sender: TObject; var Key: Char);
begin
  CampoReal(Sender,Key,edt_PrecoCusto.Text);
end;

procedure TFrmCadCompra.edt_ICMSExit(Sender: TObject);
var totAux, icmsTot,resultAux : Real;
begin
    if (edt_ICMS.Text <> '') then
    begin
      icmsTot := StrToFloat(edt_ICMS.Text)/100;
      totAux :=  StrToFloat(edt_Total.Text) * icmsTot;
      edt_ValorICMS.Text := FormatFloat('#0.00', totAux);
    end;
end;

procedure TFrmCadCompra.edt_ICMSKeyPress(Sender: TObject; var Key: Char);
begin
  CampoReal(Sender,Key,edt_ICMS.Text);
end;

procedure TFrmCadCompra.edt_IPIKeyPress(Sender: TObject; var Key: Char);
begin
  CampoReal(Sender,Key,edt_IPI.Text);
end;

procedure TFrmCadCompra.edt_DescontoKeyPress(Sender: TObject; var Key: Char);
begin
  CampoReal(Sender,Key,edt_Desconto.Text);
end;

procedure TFrmCadCompra.edt_IdCondicaoPagamentoKeyPress(Sender: TObject; var Key: Char);
begin
  CampoNumero(Sender,Key);
end;

procedure TFrmCadCompra.edt_TotalNotaKeyPress(Sender: TObject; var Key: Char);
begin
  CampoReal(Sender,Key,edt_TotalNota.Text);
end;

procedure TFrmCadCompra.edt_TotalProdutoKeyPress(Sender: TObject; var Key: Char);
begin
   CampoReal(Sender,Key,edt_TotalProduto.Text);
end;

//------------------------------------------//

procedure TFrmCadCompra.FormActivate(Sender: TObject);
var count : Integer;
begin
    self.gridParcelas.Cells[0,0] := 'Nº Parcela';
    self.gridParcelas.Cells[1,0] := 'Data Vencimento';
    self.gridParcelas.Cells[2,0] := 'Porcentagem';
    self.gridParcelas.Cells[3,0] := 'Valor R$';

    self.gridProduto.ColWidths[1] := 260;
    self.gridProduto.ColWidths[2] := 51;
    self.gridProduto.ColWidths[3] := 35;
    self.gridProduto.ColWidths[4] := 39;
    self.gridProduto.ColWidths[5] := 40;
    self.gridProduto.ColWidths[6] := 49;
    self.gridProduto.ColWidths[7] := 57;
    self.gridProduto.ColWidths[8] := 41;
    self.gridProduto.ColWidths[9] := 57;
    self.gridProduto.ColWidths[10] := 57;
    self.gridProduto.ColWidths[11] := 40;
    self.gridProduto.ColWidths[12] := 40;
    self.gridProduto.ColWidths[13] := 40;
    self.gridProduto.ColWidths[14] := 40;

    self.gridProduto.Cells[0,0] := 'Código';
    self.gridProduto.Cells[1,0] := 'Decrição';
    self.gridProduto.Cells[2,0] := 'NCM';
    self.gridProduto.Cells[3,0] := 'CST';
    self.gridProduto.Cells[4,0] := 'CPOF';
    self.gridProduto.Cells[5,0] := 'Unid.';
    self.gridProduto.Cells[6,0] := 'Quant.';
    self.gridProduto.Cells[7,0] := 'V.Unitário';
    self.gridProduto.Cells[8,0] := 'V.Desc.';
    self.gridProduto.Cells[9,0] := 'V.Total';
    self.gridProduto.Cells[10,0] := 'BC.ICMS';
    self.gridProduto.Cells[11,0] := 'V.ICMS';
    self.gridProduto.Cells[12,0] := 'V.IPI';
    self.gridProduto.Cells[13,0] := 'ICMS%';
    self.gridProduto.Cells[14,0] := 'IPI%';

    for count := 0 to Self.ComponentCount - 1 do
      if Self.Components[count] is TsEdit then
        TsEdit(Components[count]).CharCase := ecUpperCase;
end;

procedure TFrmCadCompra.btn_SairClick(Sender: TObject);
begin
    Close;
end;

end.
