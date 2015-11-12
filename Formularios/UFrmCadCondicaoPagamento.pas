unit UFrmCadCondicaoPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCadastro, StdCtrls, Buttons, sBitBtn, sGroupBox, sEdit, sLabel,
  Grids, ComCtrls, sUpDown, Mask, sMaskEdit, sCustomComboEdit, sTooledit,
  UCondicaoPagamento, UFrmConFormaPagamento, UCtrlFormaPagamento,  UFormaPagamento,
  UCtrlCondicaoPagamento, UComuns, ExtCtrls;

type
  TFrmCadCondicaoPagamento = class(TFrmCadastro)
    lbl_Id: TsLabel;
    edt_Id: TsEdit;
    lbl_Descricao: TsLabel;
    edt_Descricao: TsEdit;
    lbl_IdFormaPagamento: TsLabel;
    edt_IdFormaPagamento: TsEdit;
    edt_FormaPagamento: TsEdit;
    lbl_FormaPagamento: TsLabel;
    btn_Buscar: TsBitBtn;
    sGroupBox2: TsGroupBox;
    lbl_Porcentagem: TsLabel;
    edt_NumParcela: TsEdit;
    lbl_NumParcelas: TsLabel;
    ud_NumParcela: TsUpDown;
    edt_NumDias: TsEdit;
    ud_NumDias: TsUpDown;
    lbl_DiasPrazo: TsLabel;
    gridParcelas: TStringGrid;
    lbl_DataUltAlteracao: TsLabel;
    edt_DataUltAlteracao: TsDateEdit;
    edt_DataCadastro: TsDateEdit;
    lbl_DataCadastro: TsLabel;
    btn_Limpar: TsBitBtn;
    btn_Add_Gerar: TsBitBtn;
    rg_GerarParcelas: TRadioGroup;
    edt_Porcentagem: TsEdit;
    procedure FormActivate(Sender: TObject);
    procedure btn_Add_GerarClick(Sender: TObject);
    procedure gridParcelasSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure btn_LimparClick(Sender: TObject);
    procedure rg_GerarParcelasClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
    procedure btn_BuscarClick(Sender: TObject);
    procedure edt_IdFormaPagamentoExit(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure edt_PorcentagemKeyPress(Sender: TObject; var Key: Char);
    procedure edt_NumParcelaKeyPress(Sender: TObject; var Key: Char);
  private
    UmaCondicaoPagamento        : CondicaoPagamento;
    umaCtrlCondicaoPagamento    : CtrlCondicaoPagamento;
    umFrmConFormaPagamento      : TFrmConFormaPagamento;
    function checaParcelas()    : Boolean;
    function checaPorcentagem() : Boolean;
    function checaData()        : Boolean;

  public
    linha: Integer;
    procedure ConhecaObj(vCondicaoPagamento: CondicaoPagamento; vCtrlCondicaoPagamento: CtrlCondicaoPagamento);
    procedure DesabilitaCampos;
    procedure HabilitaCampos;
    procedure LimpaCampos;
    procedure LimpaGrid;
    procedure CarregaObj;
  end;

var
  FrmCadCondicaoPagamento: TFrmCadCondicaoPagamento;

implementation

{$R *.dfm}
{ TFrmCadCondicaoPagamento }

procedure TFrmCadCondicaoPagamento.btn_Add_GerarClick(Sender: TObject);
var
  i, k, j, numparcela, dias: Integer;
  valor, resultado: string;
  porcentagem, valorFinal: Real;
begin
  if (self.edt_NumParcela.Text = '') or (StrToInt(self.edt_NumParcela.Text) = 0)then
  begin
    if self.edt_NumParcela.Text = '' then
      ShowMessage('Favor definir as parcelas! ')
    else
      ShowMessage('Número da Parcela não pode ser zero! ');
    edt_NumParcela.SetFocus;
  end
  else if self.edt_NumDias.Text = '' then
  begin
    ShowMessage('Favor definir os dias! ');
    edt_NumDias.SetFocus;
  end
  else if self.edt_Porcentagem.Text = '' then
  begin
    ShowMessage('Favor definir uma porcentagem! ');
    edt_Porcentagem.SetFocus;
  end
  else if (StrToFloat(self.edt_Porcentagem.Text) <= 0) or
    (StrToFloat(self.edt_Porcentagem.Text) > 100) then
  begin
    ShowMessage('Porcentagem não pode ser 0 ou maior que 100%! ');
    edt_Porcentagem.SetFocus;
  end
  else if rg_GerarParcelas.ItemIndex = 0 then
  begin
    self.gridParcelas.RowCount := StrToInt(self.edt_NumParcela.Text) + 1;
    if (checaData) then
    begin
      ShowMessage('Data nao poder ser menor que anterior! ');
      edt_NumDias.SetFocus;
    end
    else if (checaPorcentagem) then
    begin
      ShowMessage('O valor excede os 100%! ');
      edt_Porcentagem.SetFocus;
    end
    else
    begin
      for k := 1 to self.gridParcelas.RowCount - 1 do
      begin
        if (self.gridParcelas.Cells[0, k] = '') then
        begin
          self.gridParcelas.Cells[0, k] := IntToStr(k);
        end;
        if (self.gridParcelas.Cells[1, k] = '') then
        begin
          self.gridParcelas.Cells[1, k] := self.edt_NumDias.Text;
          if (self.gridParcelas.Cells[2, k] = '') then
          begin
            valor := FormatFloat('#0.00', StrToFloat(self.edt_Porcentagem.Text));
            self.gridParcelas.Cells[2, k] := valor;
            Break;
          end;
        end;
      end;
    end;
    if (checaParcelas) then
      DesabilitaCampos;
  end
  else
  begin
    if (MessageDlg('Lembrando que os dias serão calculados de acordo com a data inserida e a porcentagem será dividida de acordo com as parcelas. Deseja gerar as parcelas?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      self.gridParcelas.RowCount := StrToInt(self.edt_NumParcela.Text) + 1;
      numparcela := StrToInt(self.edt_NumParcela.Text);
      dias := 0;
      valorFinal := 0;
      porcentagem := StrToInt(self.edt_Porcentagem.Text);
      porcentagem := porcentagem / numparcela;
      resultado := FormatFloat('#0.00', porcentagem);
      self.gridParcelas.RowCount := StrToInt(self.edt_NumParcela.Text) + 1;
      for j := 0 to (gridParcelas.ColCount -1) do
        for i := 1 to (gridParcelas.RowCount - 1)do
        begin
          case j of
            0: gridParcelas.Cells[j, i] := IntToStr(i);
            1: begin
                 dias := dias + StrToInt(self.edt_NumDias.Text);
                 gridParcelas.Cells[j, i] := IntToStr(dias);
               end;
            2: begin
                  gridParcelas.Cells[j, i] := resultado;
                  valorFinal := valorFinal + StrToFloat(self.gridParcelas.Cells[j,i]);
                  if (valorFinal <  100) and (i = gridParcelas.RowCount -1)then
                     begin
                        valorFinal := 100 - valorFinal;
                        self.gridParcelas.Cells[2,i] := FloatToStr(StrToFloat(Self.gridParcelas.Cells[2,i]) + valorFinal);
                     end
                  else if (valorFinal >  100) and (i = gridParcelas.RowCount -1)then
                      begin
                        valorFinal := 100 - valorFinal;
                        self.gridParcelas.Cells[2,i] := FloatToStr(StrToFloat(Self.gridParcelas.Cells[2,i]) + valorFinal);
                      end;
               end;
          end;

         end;
      if (checaParcelas) then
        DesabilitaCampos;
    end;
  end;
end;

procedure TFrmCadCondicaoPagamento.btn_BuscarClick(Sender: TObject);
begin
  inherited;
  umFrmConFormaPagamento := TFrmConFormaPagamento.Create(nil);
  umFrmConFormaPagamento.ConhecaObj(UmaCondicaoPagamento.getUmaFormaPagamento);
  umFrmConFormaPagamento.btn_Sair.Caption := 'Selecionar';
  umFrmConFormaPagamento.ShowModal;
  self.edt_IdFormaPagamento.Text := IntToStr(UmaCondicaoPagamento.getUmaFormaPagamento.getId);
  self.edt_FormaPagamento.Text :=  UmaCondicaoPagamento.getUmaFormaPagamento.getDescricao;
end;

procedure TFrmCadCondicaoPagamento.btn_LimparClick(Sender: TObject);
var
  i, j: Integer;
begin
  HabilitaCampos;
  if linha = 0 then
  begin
    for j := 0 to (gridParcelas.ColCount - 1) do
      for i := 1 to gridParcelas.RowCount do
        gridParcelas.Cells[j, i] := '';
    gridParcelas.RowCount := 0;
  end
  else
    for i := linha to linha do
      for j := 0 to gridParcelas.ColCount - 1 do
        gridParcelas.Cells[j, i] := '';
  gridParcelas.Row := 0;
end;

procedure TFrmCadCondicaoPagamento.btn_SairClick(Sender: TObject);
begin
  inherited;
  self.HabilitaCampos;
  self.LimpaGrid;
end;

procedure TFrmCadCondicaoPagamento.btn_SalvarClick(Sender: TObject);
var
  dataAtual: TDateTime;
  msg: string;
  i: Integer;
  valorPorcentagem : Real;
begin
  inherited;
  dataAtual := Date;
  valorPorcentagem := 0;
  if edt_Descricao.Text = '' then
    begin
      ShowMessage('Campo Descrição não pode estar em branco!');
      edt_Descricao.SetFocus;
    end
  else if edt_IdFormaPagamento.Text = '' then
    begin
      ShowMessage('Essa condição deve ter uma forma de pagamento!');
      edt_IdFormaPagamento.SetFocus;
    end
  else if self.btn_Salvar.Caption = 'Salvar' then
    begin
      //Verificar porcentagem
      for i := 1 to gridParcelas.RowCount - 1 do
        if self.gridParcelas.Cells[2, i] <> '' then
           valorPorcentagem := valorPorcentagem + StrToFloat(self.gridParcelas.Cells[2, i]);
      if valorPorcentagem < 100 then
          ShowMessage('A soma das porcentagens não atinge 100%!')
      else if FloatToStr(valorPorcentagem) > '100,00' then
          ShowMessage('A soma das porcentagens ultrapassa 100%!')
      else
        begin
          UmaCondicaoPagamento.setDescricao(edt_Descricao.Text);
          UmaCondicaoPagamento.getUmaFormaPagamento.setId(StrToInt(edt_IdFormaPagamento.Text));
          UmaCondicaoPagamento.setDataCadastro(edt_DataCadastro.Date);
          if self.edt_DataUltAlteracao.Date <> dataAtual then
            UmaCondicaoPagamento.setDataAlteracao(dataAtual);

          if edt_Id.Text <> '' then
            for i := 0 to UmaCondicaoPagamento.p - 1 do
              UmaCondicaoPagamento.removeParcela;

          for i := 1 to gridParcelas.RowCount - 1 do
          begin
            if self.gridParcelas.Cells[2, i] <> '' then
            begin
              UmaCondicaoPagamento.addParcela;
              UmaCondicaoPagamento.getParcela.setNumParcela(StrToInt(gridParcelas.Cells[0, i]));
              UmaCondicaoPagamento.getParcela.setDias(StrToInt(gridParcelas.Cells[1, i]));
              UmaCondicaoPagamento.getParcela.setPorcentagem(StrToFloat(gridParcelas.Cells[2, i]));
            end;
          end;
          msg := umaCtrlCondicaoPagamento.Salvar(UmaCondicaoPagamento);

          if Copy(msg, 0, 16) = 'Ocorreu um erro!' then
            Application.MessageBox(PChar(msg), 'Erro!', MB_OK + MB_ICONSTOP)
          else
            ShowMessage(msg);
          Close;
          self.LimpaGrid;
        end;
    end
  else if self.btn_Salvar.Caption = 'Excluir' then
    begin
      msg := umaCtrlCondicaoPagamento.Excluir(UmaCondicaoPagamento);
      ShowMessage(msg);
      self.HabilitaCampos;
      self.btn_Salvar.Caption := 'Salvar';
      Close;
      self.LimpaGrid;
    end;

end;

procedure TFrmCadCondicaoPagamento.CarregaObj;
var
  k: Integer;
begin
  self.edt_Id.Text := IntToStr(UmaCondicaoPagamento.getId);
  self.edt_Descricao.Text := UmaCondicaoPagamento.getDescricao;
  self.edt_IdFormaPagamento.Text := IntToStr(UmaCondicaoPagamento.getUmaFormaPagamento.getId);
  self.edt_FormaPagamento.Text := UmaCondicaoPagamento.getUmaFormaPagamento.getDescricao;
  self.edt_DataCadastro.Date := UmaCondicaoPagamento.getDataCadastro;
  self.edt_DataUltAlteracao.Date := UmaCondicaoPagamento.getDataAlteracao;

  self.edt_NumParcela.Text := IntToStr(UmaCondicaoPagamento.p);
  for k := 1 to UmaCondicaoPagamento.p do
  begin
    self.gridParcelas.RowCount := k + 1;
    self.gridParcelas.Cells[0, k] := IntToStr(UmaCondicaoPagamento.getParcela(k - 1).getNumParcela);
    self.gridParcelas.Cells[1, k] := IntToStr(UmaCondicaoPagamento.getParcela(k - 1).getDias);
    self.gridParcelas.Cells[2, k] := FloatToStr(UmaCondicaoPagamento.getParcela(k - 1).getPorcentagem);
  end;
end;

function TFrmCadCondicaoPagamento.checaData: Boolean;
var
  data, i: Integer;
begin
  if self.edt_NumDias.Text <> '' then
  begin
    data := StrToInt(self.edt_NumDias.Text);
    for i := 1 to self.gridParcelas.RowCount - 1 do
    begin
      if (self.gridParcelas.Cells[1, 1]) = '' then
        Result := false
      else if (self.gridParcelas.Cells[1, i]) = '' then
      begin
        if (data < StrToInt(self.gridParcelas.Cells[1, i - 1])) then
        begin
          Result := true;
          Break;
        end;
        Break;
      end;
    end;
  end;
end;

function TFrmCadCondicaoPagamento.checaParcelas: Boolean;
var
  qtdParcela, x, cont: Integer;
begin
  if self.edt_NumParcela.Text <> '' then
  begin
    qtdParcela := StrToInt(self.edt_NumParcela.Text);
    cont := 0;
    for x := 1 to self.gridParcelas.RowCount - 1 do
    begin
      if (self.gridParcelas.Cells[0, x] <> '') then
        cont := cont + 1;
      if (cont = qtdParcela) then
        Result := true
      else
        Result := false;
    end;
  end;
end;

function TFrmCadCondicaoPagamento.checaPorcentagem: Boolean;
var
  y: Integer;
  porc: Real;
begin
  if self.edt_Porcentagem.Text <> '' then
  begin
    porc := StrToFloat(self.edt_Porcentagem.Text);
    for y := 1 to self.gridParcelas.RowCount - 1 do
    begin
      if (self.gridParcelas.Cells[2, y] <> '') then
        porc := porc + StrToFloat(self.gridParcelas.Cells[2, y]);
      if (porc > 100) then
        Result := true
      else
        Result := false;
    end;
  end;
end;

procedure TFrmCadCondicaoPagamento.ConhecaObj
  (vCondicaoPagamento: CondicaoPagamento;
  vCtrlCondicaoPagamento: CtrlCondicaoPagamento);
begin
  UmaCondicaoPagamento := vCondicaoPagamento;
  umaCtrlCondicaoPagamento := vCtrlCondicaoPagamento;
  Self.HabilitaCampos;
  Self.LimpaCampos;
end;

procedure TFrmCadCondicaoPagamento.DesabilitaCampos;
begin
  edt_NumParcela.Enabled := false;
  edt_NumDias.Enabled := false;
  edt_Porcentagem.Enabled := false;
  btn_Add_Gerar.Enabled := false;
  rg_GerarParcelas.Enabled := false;
end;

procedure TFrmCadCondicaoPagamento.edt_IdFormaPagamentoExit(Sender: TObject);
var
  umaCtrlFormaPagamento: CtrlFormaPagamento;
  umaFormaPagamento: FormaPagamento;
begin
  inherited;
  if self.edt_IdFormaPagamento.Text <> '' then
  begin
    // umEstado := Estado.CrieObjeto;
    self.edt_FormaPagamento.Clear;
    umaCtrlFormaPagamento := CtrlFormaPagamento.CrieObjeto;
    UmaCondicaoPagamento.getUmaFormaPagamento.setId(StrToInt(self.edt_IdFormaPagamento.Text));
    UmaCondicaoPagamento.getUmaFormaPagamento.setDescricao(self.edt_FormaPagamento.Text);
    if not umaCtrlFormaPagamento.Buscar(UmaCondicaoPagamento.getUmaFormaPagamento) then
    begin
      MessageDlg('Nenhum registro encontrado!', mtInformation, [mbOK], 0);
      self.edt_IdFormaPagamento.Clear;
      self.edt_FormaPagamento.Clear;
    end
    else
    begin
      umaCtrlFormaPagamento.Carrega(UmaCondicaoPagamento.getUmaFormaPagamento);
      self.edt_IdFormaPagamento.Text := IntToStr(UmaCondicaoPagamento.getUmaFormaPagamento.getId);
      self.edt_FormaPagamento.Text :=  UmaCondicaoPagamento.getUmaFormaPagamento.getDescricao;
    end;
    umaFormaPagamento := FormaPagamento.CrieObjeto;
    umaCtrlFormaPagamento.Buscar(umaFormaPagamento);
  end
  else
  begin
    self.edt_IdFormaPagamento.Clear;
    self.edt_FormaPagamento.Clear;
  end;
end;

procedure TFrmCadCondicaoPagamento.edt_NumParcelaKeyPress
  (Sender: TObject; var Key: Char);
begin
  inherited;
  CampoNumero(Sender, Key);
end;

procedure TFrmCadCondicaoPagamento.edt_PorcentagemKeyPress
  (Sender: TObject; var Key: Char);
begin
  inherited;
  CampoReal(Sender, Key, edt_Porcentagem.Text);
end;

procedure TFrmCadCondicaoPagamento.FormActivate(Sender: TObject);
begin
  inherited;
  self.gridParcelas.Cells[0, 0] := 'Nº Parcela';
  self.gridParcelas.Cells[1, 0] := 'Dia';
  self.gridParcelas.Cells[2, 0] := 'Porcentagem';
end;

procedure TFrmCadCondicaoPagamento.gridParcelasSelectCell
  (Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  linha := ARow;
end;

procedure TFrmCadCondicaoPagamento.HabilitaCampos;
begin
  edt_Descricao.Enabled := true;
  edt_IdFormaPagamento.Enabled := true;
  edt_NumParcela.Enabled := true;
  edt_NumDias.Enabled := true;
  edt_Porcentagem.Enabled := true;
  btn_Add_Gerar.Enabled := true;
  btn_Limpar.Enabled := true;
  btn_Buscar.Enabled := true;
  rg_GerarParcelas.Enabled := true;
  rg_GerarParcelas.ItemIndex := 0;
  gridParcelas.Enabled := true;
end;

procedure TFrmCadCondicaoPagamento.LimpaCampos;
var
  dataAtual: TDateTime;
begin
  dataAtual := Date;
  self.edt_Id.Clear;
  self.edt_Descricao.Clear;
  self.edt_IdFormaPagamento.Clear;
  self.edt_FormaPagamento.Clear;
  self.edt_NumParcela.Clear;
  self.edt_NumDias.Clear;
  self.edt_Porcentagem.Clear;
  self.edt_Porcentagem.Clear;
  self.edt_DataCadastro.Date := dataAtual;
  self.edt_DataUltAlteracao.Date := dataAtual;

  if UmaCondicaoPagamento.getId = 0 then
     LimpaGrid;
end;

procedure TFrmCadCondicaoPagamento.LimpaGrid;
var
  i, j, k: Integer;
begin
  for k := 0 to UmaCondicaoPagamento.p - 1 do
    UmaCondicaoPagamento.removeParcela;

  for j := 0 to (gridParcelas.ColCount - 1) do
    for i := 1 to gridParcelas.RowCount do
      gridParcelas.Cells[j, i] := '';
  gridParcelas.RowCount := 1;
end;

procedure TFrmCadCondicaoPagamento.rg_GerarParcelasClick(Sender: TObject);
begin
  inherited;
  if rg_GerarParcelas.ItemIndex = 0 then
  begin
    btn_Add_Gerar.Caption := 'Adicionar';
    edt_Porcentagem.Text := '';
    edt_Porcentagem.Enabled := true;
  end
  else
  begin
    btn_Add_Gerar.Caption := 'Gerar';
    edt_Porcentagem.Text := '100';
    edt_Porcentagem.Enabled := false;
  end;
end;

end.
