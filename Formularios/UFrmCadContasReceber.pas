unit UFrmCadContasReceber;

interface

uses
  Windows, Messages, SysUtils, DateUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, sEdit, sLabel, sGroupBox, Mask,
  sMaskEdit, sCustomComboEdit, sTooledit, sMemo, UContasReceber, UCtrlContasReceber,
  UCliente, UCtrlCliente, UFrmConCliente, UUsuario, UCtrlUsuario, UFrmConUsuario,
  UFormaPagamento, UCtrlFormaPagamento, UFrmConFormaPagamento, UCondicaoPagamento,
  UCtrlCondicaoPagamento, UFrmConCondicaoPagamento, UComuns, Grids;

type
  TFrmCadContasReceber = class(TForm)
    sGroupBox11: TsGroupBox;
    btn_Receber: TsBitBtn;
    btn_Sair: TsBitBtn;
    group_FormaPagamento: TsGroupBox;
    lbl_IdFormaPagamento: TsLabel;
    lbl_FormaPagamento: TsLabel;
    edt_IdFormaPagamento: TsEdit;
    edt_FormaPagamento: TsEdit;
    btn_BuscarFormaPagamento: TsBitBtn;
    sGroupBox7: TsGroupBox;
    lbl_DataVencimento: TsLabel;
    lbl_NumParcela: TsLabel;
    lbl_Valor: TsLabel;
    lbl2: TsLabel;
    edt_DataVencimento: TsDateEdit;
    edt_NumParcela: TsEdit;
    edt_Valor: TsEdit;
    edt_DiasAtraso: TsEdit;
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
    lbl_IdCliente: TsLabel;
    lbl_Cliente: TsLabel;
    lbl3: TsLabel;
    edt_NumNota: TsEdit;
    edt_SerieNota: TsEdit;
    edt_IdCliente: TsEdit;
    edt_Cliente: TsEdit;
    btn_BuscarCliente: TsBitBtn;
    sGroupBox2: TsGroupBox;
    lbl_IdFuncionario: TsLabel;
    lbl_Funcionario: TsLabel;
    edt_IdFuncionario: TsEdit;
    edt_Funcionario: TsEdit;
    btn_BuscarFuncionario: TsBitBtn;
    group_Condicao: TsGroupBox;
    lbl_IdCondicaoPagamento: TsLabel;
    lbl_CondicaoPagamento: TsLabel;
    edt_CondicaoPagamento: TsEdit;
    edt_IdCondicaoPagamento: TsEdit;
    btn_BuscarCondicaoPagamento: TsBitBtn;
    gridParcelas: TStringGrid;
    btn_GerarParcelas: TsBitBtn;
    btn_LimparParcelas: TsBitBtn;
    procedure edt_NumNotaKeyPress(Sender: TObject; var Key: Char);
    procedure edt_IdClienteKeyPress(Sender: TObject; var Key: Char);
    procedure edt_IdFuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure edt_IdFormaPagamentoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_MultaKeyPress(Sender: TObject; var Key: Char);
    procedure edt_JurosKeyPress(Sender: TObject; var Key: Char);
    procedure edt_DescontosKeyPress(Sender: TObject; var Key: Char);
    procedure edt_ValorTotalKeyPress(Sender: TObject; var Key: Char);
    procedure edt_IdCondicaoPagamentoKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure edt_IdClienteExit(Sender: TObject);
    procedure btn_BuscarClienteClick(Sender: TObject);
    procedure edt_IdFuncionarioExit(Sender: TObject);
    procedure btn_BuscarFuncionarioClick(Sender: TObject);
    procedure edt_IdFormaPagamentoExit(Sender: TObject);
    procedure btn_BuscarFormaPagamentoClick(Sender: TObject);
    procedure edt_IdCondicaoPagamentoExit(Sender: TObject);
    procedure btn_BuscarCondicaoPagamentoClick(Sender: TObject);
    procedure btn_GerarParcelasClick(Sender: TObject);
    procedure btn_LimparParcelasClick(Sender: TObject);
    procedure edt_MultaExit(Sender: TObject);
    procedure edt_JurosExit(Sender: TObject);
    procedure edt_DescontosExit(Sender: TObject);
    procedure btn_ReceberClick(Sender: TObject);
  private
    umaContaReceber           : ContasReceber;
    umaCtrlContasReceber      : CtrlContasReceber;
    umCliente                 : Cliente;
    umaCtrlCliente            : CtrlCliente;
    umFrmConCliente           : TFrmConCliente;
    umUsuario                 : Usuario;
    umaCtrlUsuario            : CtrlUsuario;
    umFrmConUsuario           : TFrmConUsuario;
    umaFormaPagamento         : FormaPagamento;
    umaCtrlFormaPagamento     : CtrlFormaPagamento;
    umFrmConFormaPagamento    : TFrmConFormaPagamento;
    umaCondicaoPagamento      : CondicaoPagamento;
    umaCtrlCondicaoPagamento  : CtrlCondicaoPagamento;
    umFrmConCondicaoPagamento : TFrmConCondicaoPagamento;
  public
    MultaAux, MultaAnt       : Real;
    JurosAux, JurosAnt       : Real;
    DescontoAux, DescontoAnt : Real;
    procedure ConhecaObj(vContasReceber: ContasReceber; vCtrlContasReceber : CtrlContasReceber);
    procedure HabilitaCampos;
    procedure DesabilitaCampos;
    procedure LimpaCampos;
    procedure CarregaObj;
    procedure CalculoValorTotal(valorCampo:String; valorAux:Real; valorAnt:Real; campo:String);
    function VerificaNota : Boolean;

    //Parcelas
    procedure LimpaGridParcelas(verifica : Boolean);
    procedure CarregaParcelas;
    procedure HabilitaParcelas;
    //Condicao Pagamento
    procedure addCondicaoPgto(vCondicaoPgto : CondicaoPagamento);
  end;

var
  FrmCadContasReceber: TFrmCadContasReceber;

implementation

uses UAplicacao;

{$R *.dfm}

{ TFrmCadContasReceber }

procedure TFrmCadContasReceber.ConhecaObj(vContasReceber: ContasReceber; vCtrlContasReceber: CtrlContasReceber);
begin
  umaContaReceber := vContasReceber;
  umaCtrlContasReceber := vCtrlContasReceber;
  Self.DesabilitaCampos;
  if umaContaReceber.getNumNota = 0 then
    Self.LimpaGridParcelas(True);
  self.LimpaCampos;
  self.edt_IdFuncionario.Text := IntToStr(idLogado);
  self.edt_Funcionario.Text   := nomeLogado;
  self.lbl_NumParcela.Hide;
  Self.edt_NumParcela.Hide;
end;

procedure TFrmCadContasReceber.edt_IdClienteExit(Sender: TObject);
begin
   if Self.edt_IdCliente.Text <> '' then
   begin
      Self.edt_Cliente.Clear;
      umaCtrlCliente := CtrlCliente.CrieObjeto;
      umaContaReceber.getUmCliente.setId(StrToInt(Self.edt_IdCliente.Text));
      umaContaReceber.getUmCliente.setNome_RazaoSoCial(Self.edt_Cliente.Text);
      umaContaReceber.getUmCliente.setTelefone('');
      umaContaReceber.getUmCliente.setCPF_CNPJ('');
      if not umaCtrlCliente.Buscar(umaContaReceber.getUmCliente) then
      begin
        MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
        self.edt_IdCliente.Clear;
        self.edt_Cliente.Clear;
        Self.edt_IdCondicaoPagamento.Clear;
        Self.edt_CondicaoPagamento.Clear;
        umaContaReceber.getUmCliente.setId(0);
      end
      else
      begin
        LimpaGridParcelas(true);
        umaCtrlCliente.Carrega(umaContaReceber.getUmCliente);
        Self.edt_IdCliente.Text := IntToStr(umaContaReceber.getUmCliente.getId);
        Self.edt_Cliente.Text := umaContaReceber.getUmCliente.getNome_RazaoSoCial;
        Self.edt_IdCondicaoPagamento.Text := IntToStr(umaContaReceber.getUmCliente.getUmaCondicaoPgto.getId);
        Self.edt_CondicaoPagamento.Text := umaContaReceber.getUmCliente.getUmaCondicaoPgto.getDescricao;
        //Adiciona a Condicao Pagamento na Compra
        addCondicaoPgto(umaContaReceber.getUmCliente.getUmaCondicaoPgto);
        VerificaNota;
      end;
      umCliente := Cliente.CrieObjeto;
      umaCtrlCliente.Buscar(umCliente);
   end
   else
   begin
     self.edt_IdCliente.Clear;
     self.edt_Cliente.Clear;
     Self.edt_IdCondicaoPagamento.Clear;
     Self.edt_CondicaoPagamento.Clear;
   end;
end;

procedure TFrmCadContasReceber.btn_BuscarClienteClick(Sender: TObject);
begin
  umFrmConCliente := TFrmConCliente.Create(nil);
  umFrmConCliente.ConhecaObj(umaContaReceber.getUmCliente);
  umFrmConCliente.btn_Sair.Caption := 'Selecionar';
  umFrmConCliente.ShowModal;
  if umaContaReceber.getUmCliente.getId <> 0 then
  begin
    LimpaGridParcelas(true);
    self.edt_IdCliente.Text  := inttostr(umaContaReceber.getUmCliente.getId);
    self.edt_Cliente.Text    := umaContaReceber.getUmCliente.getNome_RazaoSoCial;
    Self.edt_IdCondicaoPagamento.Text := IntToStr(umaContaReceber.getUmCliente.getUmaCondicaoPgto.getId);
    Self.edt_CondicaoPagamento.Text := umaContaReceber.getUmCliente.getUmaCondicaoPgto.getDescricao;
    //Adiciona a Condicao Pagamento na Venda
    addCondicaoPgto(umaContaReceber.getUmCliente.getUmaCondicaoPgto);
    VerificaNota;
  end;
end;

procedure TFrmCadContasReceber.edt_IdFuncionarioExit(Sender: TObject);
begin
  if Self.edt_IdFuncionario.Text <> '' then
  begin
    Self.edt_Funcionario.Clear;
    umaCtrlUsuario := CtrlUsuario.CrieObjeto;
    umaContaReceber.getUmUsuario.getUmFuncionario.setId(StrToInt(Self.edt_IdFuncionario.Text));
    umaContaReceber.getUmUsuario.getUmFuncionario.setNome_RazaoSoCial(Self.edt_Funcionario.Text);
    umaContaReceber.getUmUsuario.getUmFuncionario.setCPF_CNPJ('');
    if not umaCtrlUsuario.Buscar(umaContaReceber.getUmUsuario) then
    begin
      MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
      self.edt_IdFuncionario.Clear;
      self.edt_Funcionario.Clear;
      umaContaReceber.getUmUsuario.getUmFuncionario.setId(0);
    end
    else
    begin
      umaCtrlUsuario.Carrega(umaContaReceber.getUmUsuario);
      Self.edt_IdFuncionario.Text := IntToStr(umaContaReceber.getUmUsuario.getUmFuncionario.getId);
      Self.edt_Funcionario.Text := umaContaReceber.getUmUsuario.getUmFuncionario.getNome_RazaoSoCial;
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

procedure TFrmCadContasReceber.btn_BuscarFuncionarioClick(Sender: TObject);
begin
  umFrmConUsuario := TFrmConUsuario.Create(nil);
  umFrmConUsuario.ConhecaObj(umaContaReceber.getUmUsuario);
  umFrmConUsuario.btn_Sair.Caption := 'Selecionar';
  umFrmConUsuario.ShowModal;
  self.edt_IdFuncionario.Text := inttostr(umaContaReceber.getUmUsuario.getUmFuncionario.getId);
  self.edt_Funcionario.Text   := umaContaReceber.getUmUsuario.getUmFuncionario.getNome_RazaoSoCial;
end;

procedure TFrmCadContasReceber.edt_IdFormaPagamentoExit(Sender: TObject);
begin
  if Self.edt_IdFormaPagamento.Text <> '' then
  begin
    Self.edt_FormaPagamento.Clear;
    umaCtrlFormaPagamento := CtrlFormaPagamento.CrieObjeto;
    umaContaReceber.getUmaFormaPagamento.setId(StrToInt(Self.edt_IdFormaPagamento.Text));
    umaContaReceber.getUmaFormaPagamento.setDescricao(Self.edt_FormaPagamento.Text);
    if not umaCtrlFormaPagamento.Buscar(umaContaReceber.getUmaFormaPagamento) then
    begin
      MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
      self.edt_IdFormaPagamento.Clear;
      self.edt_FormaPagamento.Clear;
      umaContaReceber.getUmaFormaPagamento.setId(0);
    end
    else
    begin
      umaCtrlFormaPagamento.Carrega(umaContaReceber.getUmaFormaPagamento);
      Self.edt_IdFormaPagamento.Text := IntToStr(umaContaReceber.getUmaFormaPagamento.getId);
      Self.edt_FormaPagamento.Text := umaContaReceber.getUmaFormaPagamento.getDescricao;
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

procedure TFrmCadContasReceber.btn_BuscarFormaPagamentoClick(Sender: TObject);
begin
  umFrmConFormaPagamento := TFrmConFormaPagamento.Create(nil);
  umFrmConFormaPagamento.ConhecaObj(umaContaReceber.getUmaFormaPagamento);
  umFrmConFormaPagamento.btn_Sair.Caption := 'Selecionar';
  umFrmConFormaPagamento.ShowModal;
  self.edt_IdFormaPagamento.Text := inttostr(umaContaReceber.getUmaFormaPagamento.getId);
  self.edt_FormaPagamento.Text   := umaContaReceber.getUmaFormaPagamento.getDescricao;
end;

procedure TFrmCadContasReceber.addCondicaoPgto(vCondicaoPgto: CondicaoPagamento);
begin
  umaContaReceber.setUmaCondicaoPagamento(vCondicaoPgto);
end;

procedure TFrmCadContasReceber.edt_IdCondicaoPagamentoExit(Sender: TObject);
begin
  if Self.edt_IdCondicaoPagamento.Text <> '' then
  begin
    LimpaGridParcelas(true);
    umaCtrlCondicaoPagamento := CtrlCondicaoPagamento.CrieObjeto;
    umaContaReceber.getUmaCondicaoPagamento.setId(StrToInt(Self.edt_IdCondicaoPagamento.Text));
    umaContaReceber.getUmaCondicaoPagamento.setDescricao(Self.edt_CondicaoPagamento.Text);
    umaContaReceber.getUmaCondicaoPagamento.getUmaFormaPagamento.setId(0);
    if not umaCtrlCondicaoPagamento.Buscar(umaContaReceber.getUmaCondicaoPagamento) then
    begin
      MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
      self.edt_IdCondicaoPagamento.Clear;
      self.edt_CondicaoPagamento.Clear;
      umaContaReceber.getUmaCondicaoPagamento.setId(0);
    end
    else
    begin
      umaCtrlCondicaoPagamento.Carrega(umaContaReceber.getUmaCondicaoPagamento);
      Self.edt_IdCondicaoPagamento.Text := IntToStr(umaContaReceber.getUmaCondicaoPagamento.getId);
      Self.edt_CondicaoPagamento.Text := umaContaReceber.getUmaCondicaoPagamento.getDescricao;
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

procedure TFrmCadContasReceber.btn_BuscarCondicaoPagamentoClick(Sender: TObject);
begin
//  LimpaGridParcelas(true);
  umFrmConCondicaoPagamento := TFrmConCondicaoPagamento.Create(nil);
  umFrmConCondicaoPagamento.ConhecaObj(umaContaReceber.getUmaCondicaoPagamento);
  umFrmConCondicaoPagamento.btn_Sair.Caption := 'Selecionar';
  umFrmConCondicaoPagamento.ShowModal;
  self.edt_IdCondicaoPagamento.Text := inttostr(umaContaReceber.getUmaCondicaoPagamento.getId);
  self.edt_CondicaoPagamento.Text   := umaContaReceber.getUmaCondicaoPagamento.getDescricao;
end;

function TFrmCadContasReceber.VerificaNota: Boolean;
var consContasReceber : ContasReceber;
begin
  if (edt_NumNota.Text <> '') and (edt_SerieNota.Text <> '') and (edt_IdCliente.Text <> '') then
  begin
    consContasReceber := ContasReceber.CrieObjeto;
    consContasReceber.setNumNota(StrToInt(edt_NumNota.Text));
    consContasReceber.setSerieNota(edt_SerieNota.Text);
    consContasReceber.getUmCliente.setId(StrToInt(edt_IdCliente.Text));
    consContasReceber.getUmCliente.setNome_RazaoSoCial(edt_Cliente.Text);
    if umaCtrlContasReceber.VerificarNota(consContasReceber) then
    begin
      MessageDlg('Esse Número, Série e Cliente da Contas a Receber já foram cadastrados!', mtInformation, [mbOK], 0);
      self.edt_IdFormaPagamento.Clear;
      self.edt_FormaPagamento.Clear;
      Self.edt_Multa.Clear;
      Self.edt_Juros.Clear;
      Self.edt_Descontos.Clear;
      Self.edt_ValorTotal.Clear;
      Self.edt_Observacao.Clear;
      Self.edt_IdCondicaoPagamento.Clear;
      Self.edt_CondicaoPagamento.Clear;
      LimpaGridParcelas(False);
      DesabilitaCampos;
      edt_NumNota.SetFocus;
      Result := False;
    end
    else
    begin
      HabilitaCampos;
      Result := True;
    end;
    consContasReceber.Destrua_Se;
  end;
end;

procedure TFrmCadContasReceber.CarregaObj;
var dia : Integer;
begin
  self.edt_NumNota.Text := IntToStr(umaContaReceber.getNumNota);
  self.edt_SerieNota.Text := umaContaReceber.getSerieNota;
  self.edt_NumParcela.Text := IntToStr(umaContaReceber.getNumParcela);
  self.edt_IdCliente.Text := IntToStr(umaContaReceber.getUmCliente.getId);
  self.edt_Cliente.Text := umaContaReceber.getUmCliente.getNome_RazaoSoCial;
  if(Self.btn_Receber.Caption = 'Visualizar') then
  begin
    self.edt_IdFuncionario.Text := IntToStr(umaContaReceber.getUmUsuario.getUmFuncionario.getId);
    self.edt_Funcionario.Text   := umaContaReceber.getUmUsuario.getUmFuncionario.getNome_RazaoSoCial;
  end;
  self.edt_IdFormaPagamento.Text := IntToStr(umaContaReceber.getUmaFormaPagamento.getId);
  self.edt_FormaPagamento.Text := umaContaReceber.getUmaFormaPagamento.getDescricao;
  self.edt_DataEmissao.Date := umaContaReceber.getDataEmissao;
  self.edt_DataVencimento.Date := umaContaReceber.getDataVencimento;
  if (Self.btn_Receber.Caption = 'Cancelar') then
    self.edt_DataPagamento.Date := umaContaReceber.getDataPagamento;
  self.edt_Valor.Text := FormatFloat('#0.00', umaContaReceber.getValor);
  Self.edt_ValorTotal.Text := FormatFloat('#0.00', umaContaReceber.getValor);
  Self.edt_Multa.Text := FormatFloat('#0.00', umaContaReceber.getMulta);
  Self.edt_Juros.Text := FormatFloat('#0.00', umaContaReceber.getJuros);
  Self.edt_Descontos.Text := FormatFloat('#0.00', umaContaReceber.getDesconto);
  if (Self.edt_Multa.Text <> '') or (StrToFloat(Self.edt_Multa.Text) <> 0) then
    CalculoValorTotal(Self.edt_Multa.Text, 0, 0, 'multa');
  if (Self.edt_Juros.Text <> '') or (StrToFloat(Self.edt_Juros.Text) <> 0) then
    CalculoValorTotal(Self.edt_Juros.Text, 0, 0, 'juros');
  if (Self.edt_Descontos.Text <> '') or (StrToFloat(Self.edt_Descontos.Text) <> 0) then
    CalculoValorTotal(Self.edt_Descontos.Text, 0, 0, 'desconto');
  Self.edt_Observacao.Text := umaContaReceber.getObservacao;
  Self.edt_Status.Text := umaContaReceber.getStatus;
  if self.edt_DataPagamento.Date <= self.edt_DataVencimento.Date then
    Self.edt_DiasAtraso.Text := IntToStr(0)
  else
  begin
    dia := DaysBetween(self.edt_DataPagamento.Date, self.edt_DataVencimento.Date);
    Self.edt_DiasAtraso.Text := IntToStr(dia);
  end;
end;

procedure TFrmCadContasReceber.btn_GerarParcelasClick(Sender: TObject);
begin
  Self.CarregaParcelas;
end;

procedure TFrmCadContasReceber.CarregaParcelas;
var i : Integer;
    valorFinal : Real;
    valor : string;
begin
  valorFinal:= 0;
  if edt_ValorTotal.Text <> '' then
  begin
    for i := 1 to umaContaReceber.getUmaCondicaoPagamento.p do
    begin
       umaContaReceber.CrieObjetoParcela;
       umaContaReceber.addParcelas(umaContaReceber.getUmaCondicaoPagamento.getParcela(i-1));
       self.gridParcelas.RowCount := i+1;
       self.gridParcelas.Cells[0,i] := IntToStr(umaContaReceber.getUmaCondicaoPagamento.getParcela(i-1).getNumParcela);
       self.gridParcelas.Cells[1,i] := DateToStr(Date + (umaContaReceber.getUmaCondicaoPagamento.getParcela(i-1).getDias));
       self.gridParcelas.Cells[2,i] := FloatToStr(umaContaReceber.getUmaCondicaoPagamento.getParcela(i-1).getPorcentagem);
       valor := FormatFloat('#0.00',(StrToFloat(Self.gridParcelas.Cells[2,i])/100) * StrToFloat(Self.edt_ValorTotal.text));
       self.gridParcelas.Cells[3,i] := valor;
       if (i = umaContaReceber.getUmaCondicaoPagamento.p)then
       begin
         valorFinal := StrToFloat(Self.edt_ValorTotal.text) - valorFinal;
         self.gridParcelas.Cells[3,1] := FloatToStr(valorFinal);
       end
       else
         valorFinal := valorFinal + StrToFloat(self.gridParcelas.Cells[3,i]);
    end;
    Self.edt_IdCondicaoPagamento.Enabled := False;
    Self.edt_CondicaoPagamento.Enabled := False;
    Self.btn_BuscarCondicaoPagamento.Enabled := False;
    Self.btn_GerarParcelas.Enabled := False;
  end;
end;

procedure TFrmCadContasReceber.btn_LimparParcelasClick(Sender: TObject);
begin
  HabilitaParcelas;
  Self.LimpaGridParcelas(False);
end;

procedure TFrmCadContasReceber.btn_ReceberClick(Sender: TObject);
var msg: string;
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
  else if edt_IdCliente.Text = '' then
  begin
    ShowMessage('Campo Cliente não pode estar em branco!');
    edt_IdCliente.SetFocus;
  end
  else if edt_IdFuncionario.Text = '' then
  begin
    ShowMessage('Campo Funcionário não pode estar em branco!');
    edt_IdFuncionario.SetFocus;
  end
  else if (edt_IdFormaPagamento.Text = '') then
  begin
    ShowMessage('Campo Forma de Pagamento não pode estar em branco!');
    edt_IdFormaPagamento.SetFocus;
  end
  else if edt_ValorTotal.Text = '' then
  begin
    ShowMessage('Campo Valor Total não pode estar em branco!');
    edt_ValorTotal.SetFocus;
  end
  else if (gridParcelas.RowCount <= 1) and (self.btn_Receber.Caption = 'Salvar') then
  begin
    ShowMessage('Favor gerar as parcelas!');
    btn_GerarParcelas.SetFocus;
  end
  else
  if self.btn_Receber.Caption = 'Salvar' then
  begin
    verifica := True;
    umaContaReceber.setStatus('PENDENTE');
  end
  else if self.btn_Receber.Caption = 'Receber' then
  begin
    verifica := True;
    umaContaReceber.setStatus('RECEBIDA');
  end
  else if self.btn_Receber.Caption = 'Cancelar' then
    begin
      if Self.edt_Observacao.Text = '' then
        begin
          ShowMessage('Você deve informar o motivo do cancelamento no campo "Observação"!');
          Self.edt_Observacao.SetFocus;
        end
      else
        begin
          verifica := True;
          umaContaReceber.setStatus('CANCELADA');
        end;
    end;
  if (verifica) then
    begin
      umaContaReceber.setNumNota(StrToInt(edt_NumNota.Text));
      umaContaReceber.setSerieNota(edt_SerieNota.Text);
      umaContaReceber.setNumParcela(StrToInt(edt_NumParcela.Text));
      umaContaReceber.getUmCliente.setId(StrToInt(edt_IdCliente.Text));

      umaContaReceber.getUmUsuario.setIdUsuario(idUserLogado);
      umaContaReceber.getUmUsuario.getUmFuncionario.setId(idLogado);
      umaContaReceber.getUmUsuario.getUmFuncionario.setNome_RazaoSoCial(nomeLogado);

      umaContaReceber.getUmaFormaPagamento.setId(StrToInt(edt_IdFormaPagamento.Text));

      umaContaReceber.setValor(StrToFloat(edt_Valor.Text));
      umaContaReceber.setMulta(StrToFloat(edt_Multa.Text));
      umaContaReceber.setJuros(StrToFloat(edt_Juros.Text));
      umaContaReceber.setDesconto(StrToFloat(edt_Descontos.Text));
      umaContaReceber.setTotalAux(StrToFloat(edt_ValorTotal.Text));
      umaContaReceber.setDataEmissao(edt_DataEmissao.Date);
      umaContaReceber.setDataVencimento(edt_DataVencimento.Date);
      umaContaReceber.setDataPagamento(edt_DataPagamento.Date);
      umaContaReceber.setObservacao(edt_Observacao.Text);


      msg := umaCtrlContasReceber.Salvar(UmaContaReceber);
      if Copy(msg,0,16) = 'Ocorreu um erro!' then
          Application.MessageBox(PChar(msg), 'Erro!', MB_OK + MB_ICONSTOP)
      else
          ShowMessage(msg);
      self.btn_Receber.Caption := 'Receber';
      Close;
    end;
end;

procedure TFrmCadContasReceber.DesabilitaCampos;
var i : Integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
    if Self.Components[i] is TsEdit then
        TsEdit(Self.Components[i]).Enabled := False
    else if (Self.Components[i] is TsBitBtn) and (Self.Components[i].Name <> 'btn_Sair') then
        TsBitBtn(Self.Components[i]).Enabled := False;

  Self.edt_Observacao.Enabled := False;

  if Self.btn_Receber.Caption = 'Salvar' then
  begin
    Self.edt_IdFormaPagamento.Enabled := True;
    Self.btn_BuscarFormaPagamento.Enabled := True;
    Self.edt_NumNota.Enabled := True;
    Self.edt_SerieNota.Enabled := True;
    Self.edt_IdCliente.Enabled := True;
    Self.btn_BuscarCliente.Enabled := True;
  end
  else if Self.btn_Receber.Caption = 'Receber' then
  begin
    Self.edt_IdFormaPagamento.Enabled := True;
    Self.btn_BuscarFormaPagamento.Enabled := True;
    Self.edt_Multa.Enabled := True;
    Self.edt_Juros.Enabled := True;
    Self.edt_Observacao.Enabled := True;
    Self.edt_Descontos.Enabled := True;
    Self.btn_Receber.Enabled := True;
  end
  else if ((Self.btn_Receber.Caption = 'Cancelar') and (Self.edt_status.Text <> 'CANCELADA')) then
  begin
    Self.btn_Receber.Enabled := True;
    Self.edt_Observacao.Enabled := True;
  end;
end;

procedure TFrmCadContasReceber.HabilitaCampos;
begin
  Self.edt_IdFormaPagamento.Enabled := True;
  Self.btn_Receber.Enabled    := True;
  Self.edt_ValorTotal.Enabled := True;
  Self.edt_Observacao.Enabled := True;
  Self.HabilitaParcelas;
end;

procedure TFrmCadContasReceber.HabilitaParcelas;
begin
  Self.edt_IdCondicaoPagamento.Enabled := True;
  Self.btn_BuscarCondicaoPagamento.Enabled := True;
  Self.btn_GerarParcelas.Enabled := True;
  Self.btn_LimparParcelas.Enabled := True;
end;

procedure TFrmCadContasReceber.LimpaCampos;
var i : Integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
    if Self.Components[i] is TsEdit then
      TsEdit(Self.Components[i]).Clear;
  Self.edt_Observacao.Clear;
  Self.edt_DataEmissao.Date := Date;
  Self.edt_DataVencimento.Date := Date;
  if (Self.btn_Receber.Caption <> 'Salvar') then
    Self.edt_DataPagamento.Date := Date;
end;

procedure TFrmCadContasReceber.LimpaGridParcelas(verifica: Boolean);
var k,j,i : integer;
begin
  if (verifica) then
  for k := 0 to umaContaReceber.getUmaCondicaoPagamento.p -1 do
     umaContaReceber.getUmaCondicaoPagamento.removeParcela;

  for j := 0 to (gridParcelas.ColCount - 1) do
  for i := 1 to gridParcelas.RowCount do
    gridParcelas.Cells[j,i] := '';
  gridParcelas.RowCount := 0;
end;

procedure TFrmCadContasReceber.edt_MultaExit(Sender: TObject);
begin
  CalculoValorTotal(edt_Multa.Text, MultaAux, MultaAnt, 'multa');
end;

procedure TFrmCadContasReceber.edt_JurosExit(Sender: TObject);
begin
  CalculoValorTotal(edt_Juros.Text, JurosAux, JurosAnt, 'juros');
end;

procedure TFrmCadContasReceber.edt_DescontosExit(Sender: TObject);
begin
  if (edt_Descontos.Text <> '') and (StrToFloat(edt_Descontos.Text) > StrToFloat(edt_ValorTotal.Text)) then
  begin
    ShowMessage('O desconto não pode ser maior que o Valor!');
    edt_Descontos.SetFocus;
  end
  else
    CalculoValorTotal(edt_Descontos.Text, DescontoAux, DescontoAnt, 'desconto');
end;

procedure TFrmCadContasReceber.CalculoValorTotal(valorCampo: String; valorAux, valorAnt: Real; campo: String);
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
//    DescontoAux := StrToFloat(edt_ValorTotal.Text) * valorTotal;
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
     if campo <> 'desconto' then
       edt_ValorTotal.Text := FormatFloat('#0.00',StrtoFloat(edt_ValorTotal.Text) - valorAux)
     else
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

procedure TFrmCadContasReceber.edt_NumNotaKeyPress(Sender: TObject; var Key: Char);
begin
  CampoNumero(Sender, Key);
end;

procedure TFrmCadContasReceber.edt_IdClienteKeyPress(Sender: TObject; var Key: Char);
begin
  CampoNumero(Sender, Key);
end;

procedure TFrmCadContasReceber.edt_IdFuncionarioKeyPress(Sender: TObject; var Key: Char);
begin
  CampoNumero(Sender, Key);
end;

procedure TFrmCadContasReceber.edt_IdFormaPagamentoKeyPress(Sender: TObject; var Key: Char);
begin
  CampoNumero(Sender, Key);
end;

procedure TFrmCadContasReceber.edt_MultaKeyPress(Sender: TObject; var Key: Char);
begin
  HabilitaParcelas;
  Self.LimpaGridParcelas(False);
  CampoReal(Sender, Key, edt_Multa.Text);
end;

procedure TFrmCadContasReceber.edt_JurosKeyPress(Sender: TObject; var Key: Char);
begin
  HabilitaParcelas;
  Self.LimpaGridParcelas(False);
  CampoReal(Sender, Key, edt_Juros.Text);
end;

procedure TFrmCadContasReceber.edt_DescontosKeyPress(Sender: TObject; var Key: Char);
begin
  HabilitaParcelas;
  Self.LimpaGridParcelas(False);
  CampoReal(Sender, Key, edt_Descontos.Text);
end;

procedure TFrmCadContasReceber.edt_ValorTotalKeyPress(Sender: TObject; var Key: Char);
begin
  HabilitaParcelas;
  Self.LimpaGridParcelas(False);
  CampoReal(Sender, Key, edt_ValorTotal.Text);
  if ((Key = #8) or (Key = #0)) and ((Length(Self.edt_ValorTotal.Text) = 1) or (Self.edt_ValorTotal.Text = '')) then
  begin
    Self.edt_Multa.Enabled := False;
    Self.edt_Juros.Enabled := False;
    Self.edt_Descontos.Enabled := False;
    Self.edt_Multa.Clear;
    Self.edt_Juros.Clear;
    Self.edt_Descontos.Clear;
  end
  else if (Length(Self.edt_ValorTotal.Text) >= 0) or (Self.edt_ValorTotal.Text <> '')then
  begin
    Self.edt_Multa.Enabled := True;
    Self.edt_Juros.Enabled := True;
    Self.edt_Descontos.Enabled := True;
  end;
end;

procedure TFrmCadContasReceber.edt_IdCondicaoPagamentoKeyPress(Sender: TObject; var Key: Char);
begin
  CampoNumero(Sender, Key);
end;

procedure TFrmCadContasReceber.FormActivate(Sender: TObject);
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

procedure TFrmCadContasReceber.btn_SairClick(Sender: TObject);
begin
  Close;
end;

end.
