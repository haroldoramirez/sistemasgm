unit UFrmCadContasPagar;

interface

uses
  Windows, Messages, SysUtils, DateUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, Mask, sMaskEdit, sCustomComboEdit,
  sTooledit, sEdit, sLabel, sGroupBox, sMemo, UContasPagar, UCtrlContasPagar,
  Grids, UComuns, UCtrlFornecedor, UFornecedor, UFrmConFornecedor, UCondicaoPagamento,
  UCtrlCondicaoPagamento, UFrmConCondicaoPagamento, UUsuario, UCtrlUsuario, UFrmConUsuario, UFormaPagamento,
  UCtrlFormaPagamento, UFrmConFormaPagamento;

type
  TFrmCadContasPagar = class(TForm)
    sGroupBox11: TsGroupBox;
    btn_Pagar: TsBitBtn;
    btn_Sair: TsBitBtn;
    sGroupBox1: TsGroupBox;
    lbl_IdFormaPagamento: TsLabel;
    lbl_FormaPagamento: TsLabel;
    edt_IdFormaPagamento: TsEdit;
    edt_FormaPagamento: TsEdit;
    btn_BuscarFormaPagamento: TsBitBtn;
    sGroupBox7: TsGroupBox;
    lbl_DataVencimento: TsLabel;
    lbl_NumParcela: TsLabel;
    lbl_Valor: TsLabel;
    edt_DataVencimento: TsDateEdit;
    edt_NumParcela: TsEdit;
    edt_Valor: TsEdit;
    sGroupBox6: TsGroupBox;
    lbl_Descontos: TsLabel;
    lbl_Multa: TsLabel;
    lbl_Juros: TsLabel;
    edt_Multa: TsEdit;
    edt_Descontos: TsEdit;
    edt_Juros: TsEdit;
    sGroupBox9: TsGroupBox;
    lbl_ValorTotal: TsLabel;
    edt_ValorTotal: TsEdit;
    sGroupBox10: TsGroupBox;
    lbl_DataPagamento: TsLabel;
    edt_DataPagamento: TsDateEdit;
    sGroupBox4: TsGroupBox;
    edt_Observacao: TsMemo;
    sGroupBox5: TsGroupBox;
    edt_Status: TsEdit;
    sGroupBox8: TsGroupBox;
    lbl1: TsLabel;
    edt_DataEmissao: TsDateEdit;
    sGroupBox12: TsGroupBox;
    lbl_NumNota: TsLabel;
    lbl_SerieNota: TsLabel;
    lbl_IdFornecedor: TsLabel;
    lbl_Fornecedor: TsLabel;
    edt_NumNota: TsEdit;
    edt_SerieNota: TsEdit;
    edt_IdFavorecido: TsEdit;
    edt_Favorecido: TsEdit;
    btn_BuscarFavorecido: TsBitBtn;
    sGroupBox2: TsGroupBox;
    lbl_IdFuncionario: TsLabel;
    lbl_Funcionario: TsLabel;
    edt_IdFuncionario: TsEdit;
    edt_Funcionario: TsEdit;
    btn_BuscarFuncionario: TsBitBtn;
    sGroupBox3: TsGroupBox;
    lbl_IdCondicaoPagamento: TsLabel;
    lbl_CondicaoPagamento: TsLabel;
    edt_CondicaoPagamento: TsEdit;
    edt_IdCondicaoPagamento: TsEdit;
    btn_BuscarCondicaoPagamento: TsBitBtn;
    gridParcelas: TStringGrid;
    btn_GerarParcelas: TsBitBtn;
    btn_LimparParcelas: TsBitBtn;
    edt_DiasAtraso: TsEdit;
    lbl2: TsLabel;
    lbl3: TsLabel;
    procedure edt_NumNotaKeyPress(Sender: TObject; var Key: Char);
    procedure edt_IdFavorecidoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_IdFuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure edt_IdFormaPagamentoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_MultaKeyPress(Sender: TObject; var Key: Char);
    procedure edt_JurosKeyPress(Sender: TObject; var Key: Char);
    procedure edt_DescontosKeyPress(Sender: TObject; var Key: Char);
    procedure edt_IdCondicaoPagamentoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_ValorTotalKeyPress(Sender: TObject; var Key: Char);
    procedure edt_IdFavorecidoExit(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure btn_BuscarFavorecidoClick(Sender: TObject);
    procedure btn_BuscarFuncionarioClick(Sender: TObject);
    procedure edt_IdFuncionarioExit(Sender: TObject);
    procedure edt_IdFormaPagamentoExit(Sender: TObject);
    procedure btn_BuscarFormaPagamentoClick(Sender: TObject);
    procedure edt_IdCondicaoPagamentoExit(Sender: TObject);
    procedure btn_BuscarCondicaoPagamentoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_GerarParcelasClick(Sender: TObject);
    procedure btn_LimparParcelasClick(Sender: TObject);
    procedure edt_DescontosExit(Sender: TObject);
    procedure edt_JurosExit(Sender: TObject);
    procedure edt_MultaExit(Sender: TObject);
    procedure btn_PagarClick(Sender: TObject);
    procedure edt_ValorTotalKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_ValorTotalExit(Sender: TObject);
  private
    umaContaPagar             : ContasPagar;
    umaCtrlContasPagar        : CtrlContasPagar;
    umFornecedor              : Fornecedor;
    umaCtrlFornecedor         : CtrlFornecedor;
    umFrmConFornecedor        : TFrmConFornecedor;
    umUsuario                 : Usuario;
    umaCtrlUsuario            : CtrlUsuario;
    umFrmConUsuario           : TFrmConUsuario;
    umaFormaPagamento         : FormaPagamento;
    umaCtrlFormaPagamento     : CtrlFormaPagamento;
    umFrmConCondicaoPagamento : TFrmConCondicaoPagamento;
    umFrmConFormaPagamento    : TFrmConFormaPagamento;
    umaCondicaoPagamento      : CondicaoPagamento;
    umaCtrlCondicaoPagamento  : CtrlCondicaoPagamento;
  public
    MultaAux, MultaAnt       : Real;
    JurosAux, JurosAnt       : Real;
    DescontoAux, DescontoAnt : Real;
    procedure ConhecaObj(vContasPagar: ContasPagar; vCtrlContasPagar : CtrlContasPagar);
    procedure HabilitaCampos;
    procedure DesabilitaCampos;
    procedure LimpaCampos;
    procedure CarregaObj;
    procedure CalculoValorTotal(valorCampo:String; valorAux:Real; valorAnt:Real; campo:String);
    function VerificaNota(Sender:TObject) : Boolean;

    //Parcelas
    procedure LimpaGridParcelas(verifica : Boolean);
    procedure CarregaParcelas;
    procedure HabilitaParcelas;
    //Condicao Pagamento
    procedure addCondicaoPgto(vCondicaoPgto : CondicaoPagamento);
end;

var
  FrmCadContasPagar: TFrmCadContasPagar;

implementation

uses UAplicacao;

{$R *.dfm}

{ TFrmCadContasPagar }

procedure TFrmCadContasPagar.ConhecaObj(vContasPagar: ContasPagar; vCtrlContasPagar: CtrlContasPagar);
begin
  umaContaPagar := vContasPagar;
  umaCtrlContasPagar := vCtrlContasPagar;
  Self.DesabilitaCampos;
  if umaContaPagar.getNumNota = 0 then
  begin
    umaContaPagar.LimparListaParcelas;
    Self.LimpaGridParcelas(True);
  end;
  self.LimpaCampos;
  self.edt_IdFuncionario.Text := IntToStr(idLogado);
  self.edt_Funcionario.Text   := nomeLogado;
end;

procedure TFrmCadContasPagar.edt_IdFavorecidoExit(Sender: TObject);
begin
   if Self.edt_IdFavorecido.Text <> '' then
   begin
      Self.edt_Favorecido.Clear;
      umaCtrlFornecedor := CtrlFornecedor.CrieObjeto;
      umaContaPagar.getUmFornecedor.setId(StrToInt(Self.edt_IdFavorecido.Text));
      umaContaPagar.getUmFornecedor.setNome_RazaoSoCial(Self.edt_Favorecido.Text);
      umaContaPagar.getUmFornecedor.setTelefone('');
      umaContaPagar.getUmFornecedor.setCPF_CNPJ('');
      umaContaPagar.getUmFornecedor.setTipoFavorecido('');
      if not umaCtrlFornecedor.Buscar(umaContaPagar.getUmFornecedor) then
      begin
        MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
        self.edt_IdFavorecido.Clear;
        self.edt_Favorecido.Clear;
        Self.edt_IdCondicaoPagamento.Clear;
        Self.edt_CondicaoPagamento.Clear;
        umaContaPagar.getUmFornecedor.setId(0);
      end
      else
      begin
        LimpaGridParcelas(true);
        umaCtrlFornecedor.Carrega(umaContaPagar.getUmFornecedor);
        Self.edt_IdFavorecido.Text := IntToStr(umaContaPagar.getUmFornecedor.getId);
        Self.edt_Favorecido.Text := umaContaPagar.getUmFornecedor.getNome_RazaoSoCial;
        Self.edt_IdCondicaoPagamento.Text := IntToStr(umaContaPagar.getUmFornecedor.getUmaCondicaoPgto.getId);
        Self.edt_CondicaoPagamento.Text := umaContaPagar.getUmFornecedor.getUmaCondicaoPgto.getDescricao;
        //Adiciona a Condicao Pagamento na Compra
        addCondicaoPgto(umaContaPagar.getUmFornecedor.getUmaCondicaoPgto);
        VerificaNota(Sender);
      end;
      umFornecedor := Fornecedor.CrieObjeto;
      umaCtrlFornecedor.Buscar(umFornecedor);
   end
   else
   begin
     self.edt_IdFavorecido.Clear;
     self.edt_Favorecido.Clear;
     Self.edt_IdCondicaoPagamento.Clear;
     Self.edt_CondicaoPagamento.Clear;
   end;
end;

procedure TFrmCadContasPagar.btn_BuscarFavorecidoClick(Sender: TObject);
begin
  umFrmConFornecedor := TFrmConFornecedor.Create(nil);
  umFrmConFornecedor.ConhecaObj(umaContaPagar.getUmFornecedor, 'Favorecido');
  umFrmConFornecedor.btn_Sair.Caption := 'Selecionar';
  umFrmConFornecedor.ShowModal;
  if umaContaPagar.getUmFornecedor.getId <> 0 then
  begin
    LimpaGridParcelas(true);
    self.edt_IdFavorecido.Text  := inttostr(umaContaPagar.getUmFornecedor.getId);
    self.edt_Favorecido.Text    := umaContaPagar.getUmFornecedor.getNome_RazaoSoCial;
    Self.edt_IdCondicaoPagamento.Text := IntToStr(umaContaPagar.getUmFornecedor.getUmaCondicaoPgto.getId);
    Self.edt_CondicaoPagamento.Text := umaContaPagar.getUmFornecedor.getUmaCondicaoPgto.getDescricao;
    //Adiciona a Condicao Pagamento na Compra
    addCondicaoPgto(umaContaPagar.getUmFornecedor.getUmaCondicaoPgto);
    VerificaNota(Sender);
  end;
end;

procedure TFrmCadContasPagar.edt_IdFuncionarioExit(Sender: TObject);
begin
   if Self.edt_IdFuncionario.Text <> '' then
   begin
      Self.edt_Funcionario.Clear;
      umaCtrlUsuario := CtrlUsuario.CrieObjeto;
      umaContaPagar.getUmUsuario.getUmFuncionario.setId(StrToInt(Self.edt_IdFuncionario.Text));
      umaContaPagar.getUmUsuario.getUmFuncionario.setNome_RazaoSoCial(Self.edt_Funcionario.Text);
      umaContaPagar.getUmUsuario.getUmFuncionario.setCPF_CNPJ('');
      if not umaCtrlUsuario.Buscar(umaContaPagar.getUmUsuario) then
      begin
        MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
        self.edt_IdFuncionario.Clear;
        self.edt_Funcionario.Clear;
        umaContaPagar.getUmUsuario.getUmFuncionario.setId(0);
      end
      else
      begin
        umaCtrlUsuario.Carrega(umaContaPagar.getUmUsuario);
        Self.edt_IdFuncionario.Text := IntToStr(umaContaPagar.getUmUsuario.getUmFuncionario.getId);
        Self.edt_Funcionario.Text := umaContaPagar.getUmUsuario.getUmFuncionario.getNome_RazaoSoCial;
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

procedure TFrmCadContasPagar.btn_BuscarFuncionarioClick(Sender: TObject);
begin
  umFrmConUsuario := TFrmConUsuario.Create(nil);
  umFrmConUsuario.ConhecaObj(umaContaPagar.getUmUsuario);
  umFrmConUsuario.btn_Sair.Caption := 'Selecionar';
  umFrmConUsuario.ShowModal;
  if (umaContaPagar.getUmUsuario.getUmFuncionario.getId <> 0) then
  begin
    self.edt_IdFuncionario.Text := inttostr(umaContaPagar.getUmUsuario.getUmFuncionario.getId);
    self.edt_Funcionario.Text   := umaContaPagar.getUmUsuario.getUmFuncionario.getNome_RazaoSoCial;
  end;
end;

procedure TFrmCadContasPagar.edt_IdFormaPagamentoExit(Sender: TObject);
begin
   if Self.edt_IdFormaPagamento.Text <> '' then
   begin
      Self.edt_FormaPagamento.Clear;
      umaCtrlFormaPagamento := CtrlFormaPagamento.CrieObjeto;
      umaContaPagar.getUmaFormaPagamento.setId(StrToInt(Self.edt_IdFormaPagamento.Text));
      umaContaPagar.getUmaFormaPagamento.setDescricao(Self.edt_FormaPagamento.Text);
      if not umaCtrlFormaPagamento.Buscar(umaContaPagar.getUmaFormaPagamento) then
      begin
        MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
        self.edt_IdFormaPagamento.Clear;
        self.edt_FormaPagamento.Clear;
        umaContaPagar.getUmaFormaPagamento.setId(0);
      end
      else
      begin
        umaCtrlFormaPagamento.Carrega(umaContaPagar.getUmaFormaPagamento);
        Self.edt_IdFormaPagamento.Text := IntToStr(umaContaPagar.getUmaFormaPagamento.getId);
        Self.edt_FormaPagamento.Text := umaContaPagar.getUmaFormaPagamento.getDescricao;
      end;
      umaFormaPagamento:= FormaPagamento.CrieObjeto;
      umaCtrlFormaPagamento.Buscar(umaFormaPagamento);
   end
   else
   begin
     self.edt_IdFormaPagamento.Clear;
     self.edt_FormaPagamento.Clear;
   end;
end;

procedure TFrmCadContasPagar.btn_BuscarFormaPagamentoClick(Sender: TObject);
begin
  umFrmConFormaPagamento := TFrmConFormaPagamento.Create(nil);
  umFrmConFormaPagamento.ConhecaObj(umaContaPagar.getUmaFormaPagamento);
  umFrmConFormaPagamento.btn_Sair.Caption := 'Selecionar';
  umFrmConFormaPagamento.ShowModal;
  if (umaContaPagar.getUmaFormaPagamento.getId <> 0) then
  begin
    self.edt_IdFormaPagamento.Text := inttostr(umaContaPagar.getUmaFormaPagamento.getId);
    self.edt_FormaPagamento.Text   := umaContaPagar.getUmaFormaPagamento.getDescricao;
  end;
end;

procedure TFrmCadContasPagar.addCondicaoPgto(vCondicaoPgto: CondicaoPagamento);
begin
  umaContaPagar.setUmaCondicaoPagamento(vCondicaoPgto);
//  umaCtrlCondicaoPagamento := CtrlCondicaoPagamento.CrieObjeto;
//  umaCtrlCondicaoPagamento.Carrega(umaContaPagar.getUmaCondicaoPagamento);
end;

procedure TFrmCadContasPagar.edt_IdCondicaoPagamentoExit(Sender: TObject);
begin
  if Self.edt_IdCondicaoPagamento.Text <> '' then
  begin
    LimpaGridParcelas(true);
    Self.edt_CondicaoPagamento.Clear;
    umaCtrlCondicaoPagamento := CtrlCondicaoPagamento.CrieObjeto;
    umaContaPagar.getUmaCondicaoPagamento.setId(StrToInt(Self.edt_IdCondicaoPagamento.Text));
    umaContaPagar.getUmaCondicaoPagamento.setDescricao(Self.edt_CondicaoPagamento.Text);
    umaContaPagar.getUmaCondicaoPagamento.getUmaFormaPagamento.setId(0);
    if not umaCtrlCondicaoPagamento.Buscar(umaContaPagar.getUmaCondicaoPagamento) then
    begin
      MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
      self.edt_IdCondicaoPagamento.Clear;
      self.edt_CondicaoPagamento.Clear;
      umaContaPagar.getUmaCondicaoPagamento.setId(0);
    end
    else
    begin
      umaCtrlCondicaoPagamento.Carrega(umaContaPagar.getUmaCondicaoPagamento);
      Self.edt_IdCondicaoPagamento.Text := IntToStr(umaContaPagar.getUmaCondicaoPagamento.getId);
      Self.edt_CondicaoPagamento.Text := umaContaPagar.getUmaCondicaoPagamento.getDescricao;
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

procedure TFrmCadContasPagar.btn_BuscarCondicaoPagamentoClick(Sender: TObject);
begin
//LimpaGridParcelas(true);
  umFrmConCondicaoPagamento := TFrmConCondicaoPagamento.Create(nil);
  umFrmConCondicaoPagamento.ConhecaObj(umaContaPagar.getUmaCondicaoPagamento);
  umFrmConCondicaoPagamento.btn_Sair.Caption := 'Selecionar';
  umFrmConCondicaoPagamento.ShowModal;
  self.edt_IdCondicaoPagamento.Text := inttostr(umaContaPagar.getUmaCondicaoPagamento.getId);
  self.edt_CondicaoPagamento.Text   := umaContaPagar.getUmaCondicaoPagamento.getDescricao;
end;

function TFrmCadContasPagar.VerificaNota(Sender:TObject) : Boolean;
var consContasPagar : ContasPagar;
begin
  if (edt_NumNota.Text <> '') and (edt_SerieNota.Text <> '') and (edt_IdFavorecido.Text <> '') then
  begin
    consContasPagar := ContasPagar.CrieObjeto;
    consContasPagar.setNumNota(StrToInt(edt_NumNota.Text));
    consContasPagar.setSerieNota(edt_SerieNota.Text);
    consContasPagar.getUmFornecedor.setId(StrToInt(edt_IdFavorecido.Text));
    consContasPagar.getUmFornecedor.setNome_RazaoSoCial(edt_Favorecido.Text);

    if (umaCtrlContasPagar.VerificarNota(consContasPagar)) then
    begin
      MessageDlg('Esse Número, Série e Fornecedor da Contas a Pagar já foram cadastrados!', mtInformation, [mbOK], 0);
      self.edt_IdFormaPagamento.Clear;
      self.edt_FormaPagamento.Clear;
      Self.edt_Multa.Clear;
      Self.edt_Juros.Clear;
      Self.edt_Descontos.Clear;
      Self.edt_ValorTotal.Clear;
      Self.edt_Observacao.Clear;
      Self.edt_IdCondicaoPagamento.Clear;
      Self.edt_CondicaoPagamento.Clear;
      LimpaGridParcelas(True);
      Self.edt_IdCondicaoPagamentoExit(Sender);
      DesabilitaCampos;
      edt_NumNota.SetFocus;
      Result := False;
    end
    else
    begin
      HabilitaCampos;
      Result := True;
    end;
    consContasPagar.Destrua_Se;
  end;
end;

procedure TFrmCadContasPagar.CarregaObj;
var dia : Integer;
begin
  self.edt_NumNota.Text := IntToStr(umaContaPagar.getNumNota);
  self.edt_SerieNota.Text := umaContaPagar.getSerieNota;
  self.edt_NumParcela.Text := IntToStr(umaContaPagar.getNumParcela);
  self.edt_IdFavorecido.Text := IntToStr(umaContaPagar.getUmFornecedor.getId);
  self.edt_Favorecido.Text := umaContaPagar.getUmFornecedor.getNome_RazaoSoCial;
  if(Self.btn_Pagar.Caption = 'Visualizar') then
  begin
    self.edt_IdFuncionario.Text := IntToStr(umaContaPagar.getUmUsuario.getUmFuncionario.getId);
    self.edt_Funcionario.Text   := umaContaPagar.getUmUsuario.getUmFuncionario.getNome_RazaoSoCial;
  end;
  self.edt_IdFormaPagamento.Text := IntToStr(umaContaPagar.getUmaFormaPagamento.getId);
  self.edt_FormaPagamento.Text := umaContaPagar.getUmaFormaPagamento.getDescricao;
  self.edt_DataEmissao.Date := umaContaPagar.getDataEmissao;
  self.edt_DataVencimento.Date := umaContaPagar.getDataVencimento;
  if (Self.btn_Pagar.Caption = 'Cancelar') then
    self.edt_DataPagamento.Date := umaContaPagar.getDataPagamento;
  self.edt_Valor.Text := FormatFloat('#0.00', umaContaPagar.getValor);
  Self.edt_ValorTotal.Text := FormatFloat('#0.00', umaContaPagar.getValor);
  Self.edt_Multa.Text := FormatFloat('#0.00', umaContaPagar.getMulta);
  Self.edt_Juros.Text := FormatFloat('#0.00', umaContaPagar.getJuros);
  Self.edt_Descontos.Text := FormatFloat('#0.00', umaContaPagar.getDesconto);
  if (Self.edt_Multa.Text <> '') or (StrToFloat(Self.edt_Multa.Text) <> 0) then
    CalculoValorTotal(Self.edt_Multa.Text, 0, 0, 'multa');
  if (Self.edt_Juros.Text <> '') or (StrToFloat(Self.edt_Juros.Text) <> 0) then
    CalculoValorTotal(Self.edt_Juros.Text, 0, 0, 'juros');
  if (Self.edt_Descontos.Text <> '') or (StrToFloat(Self.edt_Descontos.Text) <> 0) then
    CalculoValorTotal(Self.edt_Descontos.Text, 0, 0, 'desconto');
  Self.edt_Observacao.Text := umaContaPagar.getObservacao;
  Self.edt_Status.Text := umaContaPagar.getStatus;
  if self.edt_DataPagamento.Date <= self.edt_DataVencimento.Date then
    Self.edt_DiasAtraso.Text := IntToStr(0)
  else
  begin
    dia := DaysBetween(self.edt_DataPagamento.Date, self.edt_DataVencimento.Date);
    Self.edt_DiasAtraso.Text := IntToStr(dia);
  end;
end;

procedure TFrmCadContasPagar.btn_GerarParcelasClick(Sender: TObject);
begin
  Self.CarregaParcelas;
end;

procedure TFrmCadContasPagar.CarregaParcelas;
var i : Integer;
    valorFinal, TotalNota : Real;
    valor : string;
begin
  valorFinal:= 0;
  if edt_ValorTotal.Text <> '' then
  begin
    TotalNota := StrToFloat(Self.edt_ValorTotal.text);
    for i := 1 to umaContaPagar.getUmaCondicaoPagamento.p do
    begin
       umaContaPagar.CrieObjetoParcela;
       umaContaPagar.addParcelas(umaContaPagar.getUmaCondicaoPagamento.getParcela(i-1));
       self.gridParcelas.RowCount := i+1;
       self.gridParcelas.Cells[0,i] := IntToStr(umaContaPagar.getUmaCondicaoPagamento.getParcela(i-1).getNumParcela);
       self.gridParcelas.Cells[1,i] := DateToStr(Date + (umaContaPagar.getUmaCondicaoPagamento.getParcela(i-1).getDias));
       self.gridParcelas.Cells[2,i] := FloatToStr(umaContaPagar.getUmaCondicaoPagamento.getParcela(i-1).getPorcentagem);
       valor := FormatFloat('#0.00',(StrToFloat(Self.gridParcelas.Cells[2,i])/100) * StrToFloat(Self.edt_ValorTotal.text));
       self.gridParcelas.Cells[3,i] := valor;

       valorFinal := valorFinal + StrToFloat(self.gridParcelas.Cells[3,i]);
       if (valorFinal > TotalNota) and (i = umaContaPagar.getUmaCondicaoPagamento.p) then
       begin
         valorFinal := TotalNota - valorFinal;
         self.gridParcelas.Cells[3,i] := FormatFloat('#0.00', StrToFloat(self.gridParcelas.Cells[3,i])+valorFinal);
       end
       else if (valorFinal < TotalNota) and (i = umaContaPagar.getUmaCondicaoPagamento.p) then
       begin
         valorFinal := TotalNota - valorFinal;
         self.gridParcelas.Cells[3,i] := FormatFloat('#0.00', StrToFloat(self.gridParcelas.Cells[3,i])+valorFinal);
       end;

//       if (i = umaContaPagar.getUmaCondicaoPagamento.p) then
//       begin
//         valorFinal := StrToFloat(Self.edt_ValorTotal.text) - valorFinal;
//         self.gridParcelas.Cells[3,1] := FormatFloat('#0.00', valorFinal);
//       end
//       else
//         valorFinal := valorFinal + StrToFloat(self.gridParcelas.Cells[3,i]);
    end;
    Self.edt_IdCondicaoPagamento.Enabled := False;
    Self.edt_CondicaoPagamento.Enabled := False;
    Self.btn_BuscarCondicaoPagamento.Enabled := False;
    Self.btn_GerarParcelas.Enabled := False;
  end;
end;

procedure TFrmCadContasPagar.btn_LimparParcelasClick(Sender: TObject);
begin
  HabilitaParcelas;
  Self.LimpaGridParcelas(True);
  Self.edt_IdCondicaoPagamentoExit(Sender);
end;

procedure TFrmCadContasPagar.btn_PagarClick(Sender: TObject);
var
  msg: string;
  verifica : Boolean;
begin
  verifica := False;
  if edt_Multa.Text = '' then
     edt_Multa.Text := '0';
  if edt_Juros.Text = '' then
     edt_Juros.Text := '0';
  if edt_Descontos.Text = '' then
     edt_Descontos.Text := '0';
  if edt_Valor.Text = '' then
     edt_Valor.Text := '0';
  if edt_NumParcela.Text = '' then
     edt_NumParcela.Text := '0';
  if edt_NumNota.Text = '' then
  begin
    ShowMessage('Campo Número da Nota não pode estar em branco!');
    edt_NumNota.SetFocus;
  end
  else if edt_SerieNota.Text = '' then
  begin
    ShowMessage('Campo Série da Nota não pode estar em branco!');
    edt_SerieNota.SetFocus;
  end
  else if edt_IdFavorecido.Text = '' then
  begin
    ShowMessage('Campo Fornecedor não pode estar em branco!');
    edt_IdFavorecido.SetFocus;
  end
  else if edt_IdFuncionario.Text = '' then
  begin
    ShowMessage('Campo Funcionário não pode estar em branco!');
    edt_IdFuncionario.SetFocus;
  end
  else if edt_IdFormaPagamento.Text = '' then
  begin
    ShowMessage('Campo Forma de Pagamento não pode estar em branco!');
    edt_IdFormaPagamento.SetFocus;
  end
  else if edt_ValorTotal.Text = '' then
  begin
    ShowMessage('Campo Valor Total não pode estar em branco!');
    edt_ValorTotal.SetFocus;
  end
  else if (gridParcelas.RowCount <= 1) and (self.btn_Pagar.Caption = 'Salvar') then
  begin
    ShowMessage('Favor gerar as parcelas!');
    btn_GerarParcelas.SetFocus;
  end
  else
  if self.btn_Pagar.Caption = 'Salvar' then
  begin
    verifica := True;
    umaContaPagar.setStatus('PENDENTE');
  end
  else if self.btn_Pagar.Caption = 'Pagar' then
  begin
    verifica := True;
    umaContaPagar.setStatus('PAGA');
  end
  else if self.btn_Pagar.Caption = 'Cancelar' then
    begin
      if Self.edt_Observacao.Text = '' then
        begin
          ShowMessage('Você deve informar o motivo do cancelamento no campo "Observação"!');
          Self.edt_Observacao.SetFocus;
        end
      else
        begin
          verifica := True;
          umaContaPagar.setStatus('CANCELADA');
        end;
    end;
  if (verifica) then
    begin
      umaContaPagar.setNumNota(StrToInt(edt_NumNota.Text));
      umaContaPagar.setSerieNota(edt_SerieNota.Text);
      umaContaPagar.setNumParcela(StrToInt(edt_NumParcela.Text));
      umaContaPagar.getUmFornecedor.setId(StrToInt(edt_IdFavorecido.Text));

      umaContaPagar.getUmUsuario.setIdUsuario(idUserLogado);
      umaContaPagar.getUmUsuario.getUmFuncionario.setId(idLogado);
      umaContaPagar.getUmUsuario.getUmFuncionario.setNome_RazaoSoCial(nomeLogado);

      umaContaPagar.getUmaFormaPagamento.setId(StrToInt(edt_IdFormaPagamento.Text));
      umaContaPagar.setValor(StrToFloat(edt_Valor.Text));
      umaContaPagar.setMulta(StrToFloat(edt_Multa.Text));
      umaContaPagar.setJuros(StrToFloat(edt_Juros.Text));
      umaContaPagar.setDesconto(StrToFloat(edt_Descontos.Text));
      umaContaPagar.setTotalAux(StrToFloat(edt_ValorTotal.Text));
      umaContaPagar.setDataEmissao(edt_DataEmissao.Date);
      umaContaPagar.setDataVencimento(edt_DataVencimento.Date);
      if (umaContaPagar.getStatus = 'PAGA') then
        umaContaPagar.setDataPagamento(edt_DataPagamento.Date);
      umaContaPagar.setObservacao(edt_Observacao.Text);

      msg := umaCtrlContasPagar.Salvar(UmaContaPagar);
      if Copy(msg,0,16) = 'Ocorreu um erro!' then
          Application.MessageBox(PChar(msg), 'Erro!', MB_OK + MB_ICONSTOP)
      else
          ShowMessage(msg);
      self.btn_Pagar.Caption := 'Pagar';
      Close;
    end;
end;

procedure TFrmCadContasPagar.DesabilitaCampos;
var i : Integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
    if Self.Components[i] is TsEdit then
        TsEdit(Self.Components[i]).Enabled := False
    else if (Self.Components[i] is TsBitBtn) and (Self.Components[i].Name <> 'btn_Sair') then
        TsBitBtn(Self.Components[i]).Enabled := False;

  Self.edt_Observacao.Enabled := False;

  if Self.btn_Pagar.Caption = 'Salvar' then
  begin
    Self.edt_NumNota.Enabled := True;
    Self.edt_SerieNota.Enabled := True;
    Self.edt_IdFavorecido.Enabled := True;
    Self.btn_BuscarFavorecido.Enabled := True;
  end
  else if Self.btn_Pagar.Caption = 'Pagar' then
  begin
    Self.edt_IdFormaPagamento.Enabled := True;
    Self.btn_BuscarFormaPagamento.Enabled := True;
    Self.edt_Multa.Enabled := True;
    Self.edt_Juros.Enabled := True;
    Self.edt_Observacao.Enabled := True;
    Self.edt_Descontos.Enabled := True;
    Self.btn_Pagar.Enabled := True;
  end
  else if ((Self.btn_Pagar.Caption = 'Cancelar') and (Self.edt_status.Text <> 'CANCELADA')) then
  begin
    Self.btn_Pagar.Enabled := True;
    Self.edt_Observacao.Enabled := True;
  end;
end;

procedure TFrmCadContasPagar.HabilitaCampos;
begin
  Self.btn_BuscarFormaPagamento.Enabled := True;
  Self.btn_Pagar.Enabled := True;
  Self.edt_IdFormaPagamento.Enabled := True;
  Self.edt_ValorTotal.Enabled := True;
  Self.edt_Observacao.Enabled := True;
  Self.HabilitaParcelas;
end;

procedure TFrmCadContasPagar.HabilitaParcelas;
begin
  Self.edt_IdCondicaoPagamento.Enabled := True;
  Self.btn_BuscarCondicaoPagamento.Enabled := True;
  Self.btn_GerarParcelas.Enabled := True;
  Self.btn_LimparParcelas.Enabled := True;
end;

procedure TFrmCadContasPagar.LimpaCampos;
var i : Integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
    if Self.Components[i] is TsEdit then
      TsEdit(Self.Components[i]).Clear;
  Self.edt_Observacao.Clear;
  Self.edt_DataEmissao.Date := Date;
//  Self.edt_DataVencimento.Date := Date;
  if (Self.btn_Pagar.Caption <> 'Salvar') then
    Self.edt_DataPagamento.Date := Date;
end;

procedure TFrmCadContasPagar.LimpaGridParcelas(verifica: Boolean);
var k,j,i : integer;
begin
  if (verifica) then
  for k := 0 to umaContaPagar.getUmaCondicaoPagamento.p -1 do
     umaContaPagar.getUmaCondicaoPagamento.removeParcela;

  umaContaPagar.LimparListaParcelas;

  for j := 0 to (gridParcelas.ColCount - 1) do
  for i := 1 to gridParcelas.RowCount do
    gridParcelas.Cells[j,i] := '';
  gridParcelas.RowCount := 0;
end;

procedure TFrmCadContasPagar.edt_MultaExit(Sender: TObject);
begin
  CalculoValorTotal(edt_Multa.Text, MultaAux, MultaAnt, 'multa');
end;

procedure TFrmCadContasPagar.edt_JurosExit(Sender: TObject);
begin
  CalculoValorTotal(edt_Juros.Text, JurosAux, JurosAnt, 'juros');
end;

procedure TFrmCadContasPagar.edt_DescontosExit(Sender: TObject);
begin
  if (edt_Descontos.Text <> '') and (StrToFloat(edt_Descontos.Text) > StrToFloat(edt_ValorTotal.Text)) then
  begin
    ShowMessage('O desconto não pode ser maior que o Valor!');
    edt_Descontos.SetFocus;
  end
  else
    CalculoValorTotal(edt_Descontos.Text, DescontoAux, DescontoAnt, 'desconto');
end;

procedure TFrmCadContasPagar.CalculoValorTotal(valorCampo: String; valorAux, valorAnt: Real; campo: String);
var valorTotal : Real;
begin
  if (valorCampo <> '' ) and (StrToFloat(valorCampo) <> 0 ) and (StrToFloat(valorCampo) <> valorAnt) then
  begin
    if campo <> 'desconto' then
      edt_ValorTotal.Text := FormatFloat('#0.00',StrtoFloat(edt_ValorTotal.Text) - valorAux)
    else
      edt_ValorTotal.Text := FormatFloat('#0.00',StrtoFloat(edt_ValorTotal.Text) + valorAux);
    valorTotal := StrToFloat(valorCampo);
    if campo = 'multa' then
    begin
      MultaAnt := StrToFloat(valorCampo);
//      MultaAux := StrToFloat(edt_ValorTotal.Text) * valorTotal;
      MultaAux := valorTotal;
      valorAux := MultaAux;
    end
    else if campo = 'juros' then
    begin
      JurosAnt := StrToFloat(valorCampo);
//      JurosAux := StrToFloat(edt_ValorTotal.Text) * valorTotal;
      JurosAux := valorTotal;
      valorAux := JurosAux;
    end
    else if campo = 'desconto' then
    begin
      DescontoAnt := StrToFloat(valorCampo);
//      DescontoAux := StrToFloat(edt_ValorTotal.Text) * valorTotal;
      DescontoAux := valorTotal;
      valorAux := DescontoAux;
    end;
    if campo <> 'desconto' then
      valorTotal := StrToFloat(edt_ValorTotal.Text) + valorAux
    else
      valorTotal := StrToFloat(edt_ValorTotal.Text) - valorAux;
    edt_ValorTotal.Text := FormatFloat('#0.00',valorTotal);
  end
  else if (valorCampo = '' ) or (StrToFloat(valorCampo) = 0 ) then
  begin
     if (campo <> 'desconto') and (edt_ValorTotal.Text <> '')  then
       edt_ValorTotal.Text := FormatFloat('#0.00',StrtoFloat(edt_ValorTotal.Text) - valorAux)
     else if (edt_ValorTotal.Text <> '') then          
       edt_ValorTotal.Text := FormatFloat('#0.00',StrtoFloat(edt_ValorTotal.Text) + valorAux);
     if campo = 'multa' then
      begin
        MultaAnt := 0;
        MultaAux := 0;
      end
      else if campo = 'juros' then
      begin
        JurosAux := 0;
        JurosAnt := 0;
      end
      else if campo = 'desconto' then
      begin
        DescontoAux := 0;
        DescontoAnt := 0;
      end;
  end;
end;

procedure TFrmCadContasPagar.edt_ValorTotalExit(Sender: TObject);
begin
   if (edt_ValorTotal.Text <> '') then
    edt_ValorTotal.Text := FormatFloat('#0.00', StrToFloat(edt_ValorTotal.Text));
end;

procedure TFrmCadContasPagar.edt_NumNotaKeyPress(Sender: TObject; var Key: Char);
begin
  CampoNumero(Sender, Key);
end;

procedure TFrmCadContasPagar.edt_IdFavorecidoKeyPress(Sender: TObject; var Key: Char);
begin
  CampoNumero(Sender, Key);
end;

procedure TFrmCadContasPagar.edt_IdFuncionarioKeyPress(Sender: TObject; var Key: Char);
begin
  CampoNumero(Sender, Key);
end;

procedure TFrmCadContasPagar.edt_IdFormaPagamentoKeyPress(Sender: TObject; var Key: Char);
begin
  CampoNumero(Sender, Key);
end;

procedure TFrmCadContasPagar.edt_MultaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Self.btn_Pagar.Caption = 'Salvar') then
    Self.btn_LimparParcelasClick(Sender);
  CampoReal(Sender, Key, edt_Multa.Text);
end;

procedure TFrmCadContasPagar.edt_JurosKeyPress(Sender: TObject; var Key: Char);
begin
  if (Self.btn_Pagar.Caption = 'Salvar') then
    Self.btn_LimparParcelasClick(Sender);
  CampoReal(Sender, Key, edt_Juros.Text);
end;

procedure TFrmCadContasPagar.edt_DescontosKeyPress(Sender: TObject; var Key: Char);
begin
  if (Self.btn_Pagar.Caption = 'Salvar') then
    Self.btn_LimparParcelasClick(Sender);
  CampoReal(Sender, Key, edt_Descontos.Text);
end;

procedure TFrmCadContasPagar.edt_IdCondicaoPagamentoKeyPress(Sender: TObject; var Key: Char);
begin
    CampoNumero(Sender, Key);
end;

procedure TFrmCadContasPagar.edt_ValorTotalKeyPress(Sender: TObject; var Key: Char);
begin
  Self.btn_LimparParcelasClick(Sender);
  CampoReal(Sender, Key, edt_ValorTotal.Text);
//  if ((Key = #8) or (Key = #0)) and ((Length(Self.edt_ValorTotal.Text) = 1) or (Self.edt_ValorTotal.Text = '')) then
//  begin
//    Self.edt_Multa.Enabled := False;
//    Self.edt_Juros.Enabled := False;
//    Self.edt_Descontos.Enabled := False;
//    Self.edt_Multa.Clear;
//    Self.edt_Juros.Clear;
//    Self.edt_Descontos.Clear;
//  end
//  else if (Length(Self.edt_ValorTotal.Text) >= 0) or (Self.edt_ValorTotal.Text <> '')then
//  begin
//    Self.edt_Multa.Enabled := True;
//    Self.edt_Juros.Enabled := True;
//    Self.edt_Descontos.Enabled := True;
//  end
end;

procedure TFrmCadContasPagar.edt_ValorTotalKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if (Self.edt_ValorTotal.Text = '') then
//  begin
//    Self.edt_Multa.Enabled := False;
//    Self.edt_Juros.Enabled := False;
//    Self.edt_Descontos.Enabled := False;
//    Self.edt_Multa.Clear;
//    Self.edt_Juros.Clear;
//    Self.edt_Descontos.Clear;
//  end;
end;

procedure TFrmCadContasPagar.FormActivate(Sender: TObject);
var count : Integer;
begin
  self.gridParcelas.Cells[0,0] := 'Nº Parcela';
  self.gridParcelas.Cells[1,0] := 'Data Vencimento';
  self.gridParcelas.Cells[2,0] := 'Porcentagem';
  self.gridParcelas.Cells[3,0] := 'Valor R$';

  for count := 0 to Self.ComponentCount - 1 do
    if Self.Components[count] is TsEdit then
      TsEdit(Components[count]).CharCase := ecUpperCase;
end;

procedure TFrmCadContasPagar.btn_SairClick(Sender: TObject);
begin
  Close;
end;

end.
