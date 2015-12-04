unit UFrmCadVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Mask, sMaskEdit, sCustomComboEdit, sTooledit, StdCtrls,
  Buttons, sBitBtn, sEdit, sLabel, sGroupBox, UVenda, UFrmConCliente,
  UFrmConProduto, UFrmConUsuario, UFrmConCondicaoPagamento, UCtrlCliente,
  UCtrlProduto, UCtrlUsuario, UCtrlCondicaoPagamento, UCliente, UUsuario,
  UProdutoVenda, UProduto, UCondicaoPagamento, UCtrlVenda, UComuns, sMemo, UCalcProduto;
type
  TFrmCadVenda = class(TForm)
    sGroupBox_Produto: TsGroupBox;
    sGroupBox2: TsGroupBox;
    lbl_IdCliente: TsLabel;
    lbl_Fornecedor: TsLabel;
    edt_IdCliente: TsEdit;
    edt_Cliente: TsEdit;
    btn_BuscarCliente: TsBitBtn;
    sGroupBox11: TsGroupBox;
    btn_Salvar: TsBitBtn;
    btn_Sair: TsBitBtn;
    edt_IdProduto: TsEdit;
    lbl_IdProduto: TsLabel;
    lbl_Produto: TsLabel;
    btn_BuscarProduto: TsBitBtn;
    edt_Produto: TsEdit;
    gridProduto: TStringGrid;
    edt_Quantidade: TsEdit;
    edt_Valor: TsEdit;
    lbl_Quantidade: TsLabel;
    lbl_Valor: TsLabel;
    btn_Add_Produto: TsBitBtn;
    btn_LimparProdutos: TsBitBtn;
    edt_Total: TsEdit;
    lbl_Total: TsLabel;
    sGroupBox4: TsGroupBox;
    lbl_IdCondicaoPagamento: TsLabel;
    lbl_CondicaoPagamento: TsLabel;
    edt_CondicaoPagamento: TsEdit;
    edt_IdCondicaoPagamento: TsEdit;
    btn_BuscarCondicaoPagamento: TsBitBtn;
    gridParcelas: TStringGrid;
    btn_LimparParcelas: TsBitBtn;
    sGroupBox3: TsGroupBox;
    lbl_IdNumeroNota: TsLabel;
    lbl_SerieNota: TsLabel;
    lbl_DataVenda: TsLabel;
    lbl_DataEmissao: TsLabel;
    edt_NumeroNota: TsEdit;
    edt_SerieNota: TsEdit;
    edt_DataVenda: TsDateEdit;
    edt_DataEmissao: TsDateEdit;
    edt_Desconto: TsEdit;
    lbl_Desconto: TsLabel;
    btn_GerarParcelas: TsBitBtn;
    sGroupBox5: TsGroupBox;
    edt_Observacao: TsMemo;
    lbl_Observacao: TsLabel;
    sGroupBox6: TsGroupBox;
    edt_status: TsEdit;
    lbl3: TsLabel;
    edt_IdFuncionario: TsEdit;
    edt_Funcionario: TsEdit;
    btn_BuscarFuncionario: TsBitBtn;
    sGroupBox7: TsGroupBox;
    lbl_DataAltertacao: TsLabel;
    lbl_DataCadastro: TsLabel;
    edt_DataAlteracao: TsDateEdit;
    edt_DataCadastro: TsDateEdit;
    lbl_ValorTotal: TLabel;
    edt_ValorTotal: TEdit;
    procedure btn_BuscarClienteClick(Sender: TObject);
    procedure edt_IdClienteExit(Sender: TObject);
    procedure btn_BuscarCondicaoPagamentoClick(Sender: TObject);
    procedure edt_IdCondicaoPagamentoExit(Sender: TObject);
    procedure btn_BuscarProdutoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_LimparParcelasClick(Sender: TObject);
    procedure btn_Add_ProdutoClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
    procedure btn_LimparProdutosClick(Sender: TObject);
    procedure edt_IdProdutoExit(Sender: TObject);
    procedure btn_GerarParcelasClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure edt_IdFuncionarioExit(Sender: TObject);
    procedure btn_BuscarFuncionarioClick(Sender: TObject);
    procedure edt_IdClienteKeyPress(Sender: TObject; var Key: Char);
    procedure edt_IdFuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure edt_ValorKeyPress(Sender: TObject; var Key: Char);
    procedure edt_DescontoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_QuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edt_IdCondicaoPagamentoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_IdProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_QuantidadeExit(Sender: TObject);
    procedure edt_DescontoExit(Sender: TObject);
  private
      umaVenda                  : Venda;
      umaCtrlVenda              : CtrlVenda;
      umCliente                 : Cliente;
      umFrmConCliente           : TFrmConCliente;
      umaCtrlCliente            : CtrlCliente;
      umUsuario                 : Usuario;
      umFrmConUsuario           : TFrmConUsuario;
      umaCtrlUsuario            : CtrlUsuario;
      umProduto                 : Produto;
      umFrmConProduto           : TFrmConProduto;
      umaCtrlProduto            : CtrlProduto;
      umaCondicaoPagamento      : CondicaoPagamento;
      umFrmConCondicaoPagamento : TFrmConCondicaoPagamento;
      umaCtrlCondicaoPagamento  : CtrlCondicaoPagamento;
  public
      totalItemAnt, descItemAnt, descItemAux : Real;
      procedure ConhecaObj(vVenda: Venda; vCtrlVenda: CtrlVenda);
      procedure HabilitaCampos;
      procedure DesbilitaCampos;
      procedure LimpaCampos;
      procedure CarregaObj;

      //Produto
      procedure LimpaGridProduto;
      procedure CarregaGridProduto;
      procedure SomaQuantidadeProduto(idProd: Integer; qtdProd : Real);
      function VerificaProduto : Boolean;
      procedure CalcItemProduto;

      //Parcelas
      procedure LimpaGridParcelas(verifica : Boolean);
      procedure CarregaParcelas;
      procedure HabilitaParcelas;
      //Condicao Pagamento
      procedure addCondicaoPgto(vCondicaoPgto : CondicaoPagamento);
  end;

var
  FrmCadVenda: TFrmCadVenda;

implementation

uses UAplicacao;

{$R *.dfm}

{ TFrmCadVenda }

procedure TFrmCadVenda.addCondicaoPgto(vCondicaoPgto: CondicaoPagamento);
begin
  umaVenda.setUmaCondicaoPagamento(vCondicaoPgto);
end;

procedure TFrmCadVenda.btn_Add_ProdutoClick(Sender: TObject);
begin
  if edt_IdProduto.Text = '' then
    begin
        ShowMessage('Favor selecionar um produto!');
        edt_IdProduto.SetFocus;
    end
  else if (edt_Quantidade.Text = '') or (StrToFloat(edt_Quantidade.Text) = 0)then
    begin
        ShowMessage('Campo quantidade não pode estar em branco ou zerado!');
        edt_Quantidade.SetFocus;
    end
  else if StrToFloat(edt_Quantidade.Text) > umaVenda.getUmProdutoVenda.getQuantidade then
    begin
        ShowMessage('Quantidade não pode ser maior que o estoque do produto!');
        edt_Quantidade.SetFocus;
    end
  else if StrToFloat(edt_Valor.Text) <= 0 then
    begin
        ShowMessage('Impossível adicionar um produto com valor zero!');
    end
  else if StrToFloat(edt_ValorTotal.Text) <= 0 then
    begin
        ShowMessage('Não é possível adicionar um produto com valor zero!');
    end
  else if (edt_Desconto.Text <> '') and (StrToFloat(edt_Desconto.Text) > StrToFloat(edt_Valor.Text) ) then
    begin
        ShowMessage('Desconto não pode ser maior que o valor!');
        edt_Desconto.SetFocus;
    end
  else
    begin
        umaVenda.getUmProdutoVenda.setQtdProduto(StrToFloat(Self.edt_Quantidade.Text));
        umaVenda.getUmProdutoVenda.setValorUnitario(StrToFloat(Self.edt_Valor.Text));
        if Self.edt_Desconto.Text <> '' then
            umaVenda.getUmProdutoVenda.setDesconto(StrToFloat(Self.edt_Desconto.Text));

        umaVenda.addProdutoVenda(umaVenda.getUmProdutoVenda);

        CarregaGridProduto;

        LimpaGridParcelas(True);

        Self.edt_IdCondicaoPagamentoExit(Sender);
        HabilitaParcelas;

        Self.edt_IdProduto.Clear;
        Self.edt_Produto.Clear;
        Self.edt_Quantidade.Clear;
        Self.edt_Valor.Clear;
        Self.edt_Desconto.Clear;
        self.edt_ValorTotal.Text := FormatFloat('#0.00', 0);
    end;
end;

procedure TFrmCadVenda.btn_BuscarClienteClick(Sender: TObject);
begin
  // HabilitaParcelas;
  umFrmConCliente := TFrmConCliente.Create(nil);
  umFrmConCliente.ConhecaObj(umaVenda.getUmCliente);
  umFrmConCliente.btn_Sair.Caption := 'Selecionar';
  umFrmConCliente.ShowModal;
  if umaVenda.getUmCliente.getId <> 0 then
  begin
    LimpaGridParcelas(true);
    HabilitaCampos;
    self.edt_IdCliente.Text  := inttostr(umaVenda.getUmCliente.getId);
    self.edt_Cliente.Text    := umaVenda.getUmCliente.getNome_RazaoSoCial;
    Self.edt_IdCondicaoPagamento.Text := IntToStr(umaVenda.getUmCliente.getUmaCondicaoPgto.getId);
    Self.edt_CondicaoPagamento.Text := umaVenda.getUmCliente.getUmaCondicaoPgto.getDescricao;
    //Adiciona a Condicao Pagamento na Venda
    addCondicaoPgto(umaVenda.getUmCliente.getUmaCondicaoPgto);
  end;
end;

procedure TFrmCadVenda.btn_BuscarCondicaoPagamentoClick(Sender: TObject);
begin
//  LimpaGridParcelas(true);
    umFrmConCondicaoPagamento := TFrmConCondicaoPagamento.Create(nil);
    umFrmConCondicaoPagamento.ConhecaObj(umaVenda.getUmaCondicaoPagamento);
    umFrmConCondicaoPagamento.btn_Sair.Caption := 'Selecionar';
    umFrmConCondicaoPagamento.ShowModal;
    if (umaVenda.getUmaCondicaoPagamento.getId <> 0) then
    begin
      self.edt_IdCondicaoPagamento.Text := inttostr(umaVenda.getUmaCondicaoPagamento.getId);
      self.edt_CondicaoPagamento.Text    := umaVenda.getUmaCondicaoPagamento.getDescricao;
    end;
end;

procedure TFrmCadVenda.btn_BuscarFuncionarioClick(Sender: TObject);
begin
    umFrmConUsuario := TFrmConUsuario.Create(nil);
    umFrmConUsuario.ConhecaObj(umaVenda.getUmUsuario);
    umFrmConUsuario.btn_Sair.Caption := 'Selecionar';
    umFrmConUsuario.ShowModal;
    if (umaVenda.getUmUsuario.getUmFuncionario.getId <> 0) then
    begin
      self.edt_IdFuncionario.Text := inttostr(umaVenda.getUmUsuario.getUmFuncionario.getId);
      self.edt_Funcionario.Text    := umaVenda.getUmUsuario.getUmFuncionario.getNome_RazaoSoCial;
    end;
end;

procedure TFrmCadVenda.btn_BuscarProdutoClick(Sender: TObject);
begin
  if (umaVenda.getUmProdutoVenda = nil) or (umaVenda.getUmProdutoVenda.getId <> 0)then
      umaVenda.CrieObejtoProduto;

  umFrmConProduto := TFrmConProduto.Create(nil);
  umFrmConProduto.ConhecaObj(umaVenda.getUmProdutoVenda);
  umFrmConProduto.btn_Sair.Caption := 'Selecionar';
  umFrmConProduto.ShowModal;
//  if (Self.VerificaProduto) then
    if umaVenda.getUmProdutoVenda.getId <> 0 then
     begin
      self.edt_IdProduto.Text := inttostr(umaVenda.getUmProdutoVenda.getId);
      self.edt_Produto.Text    := umaVenda.getUmProdutoVenda.getDescricao;
      Self.edt_Quantidade.Text := inttostr(1);
      Self.edt_Valor.Text := floattostr(umaVenda.getUmProdutoVenda.getPrecoVenda);

      Self.edt_ValorTotal.Text :=    FormatFloat('#0.00', StrToFloat(edt_Valor.Text) * StrToFloat(edt_Quantidade.Text));
     end;
end;

procedure TFrmCadVenda.btn_GerarParcelasClick(Sender: TObject);
begin
    CarregaParcelas;
end;

procedure TFrmCadVenda.btn_LimparProdutosClick(Sender: TObject);
var i,j : Integer;
begin
  if gridProduto.Row <> 0 then
  begin
    umaVenda.removeItemProdutoVenda(Self.gridProduto.Row -1);
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

procedure TFrmCadVenda.btn_LimparParcelasClick(Sender: TObject);
begin
  LimpaGridParcelas(True);
  Self.edt_IdCondicaoPagamentoExit(Sender);
  HabilitaParcelas;
end;

procedure TFrmCadVenda.btn_SalvarClick(Sender: TObject);
var msg       : string;
    verifica  : Boolean;
    dataAtual : TDateTime;
begin
  verifica  := False;
  dataAtual := Date;
  if self.edt_SerieNota.Text = '' then
  begin
    ShowMessage('Favor inserir a serie da Nota! ');
    edt_SerieNota.SetFocus;
  end
  else if self.edt_IdCliente.Text = '' then
  begin
    ShowMessage('Favor inserir um cliente! ');
    edt_IdCliente.SetFocus;
  end
  else if self.edt_IdFuncionario.Text = '' then
  begin
    ShowMessage('Campo funcionário não pode estar me branco! ');
    edt_IdFuncionario.SetFocus;
  end
  else if self.gridProduto.RowCount <= 1then
  begin
    ShowMessage('Venda tem que ter no minímo 1 produto! ');
    edt_IdProduto.SetFocus;
  end
  else if self.gridParcelas.RowCount <= 1then
  begin
    ShowMessage('Favor gerar as parcelas! ');
    btn_GerarParcelas.SetFocus;
  end
  else
    begin
      if (self.btn_Salvar.Caption = 'Salvar') or (self.btn_Salvar.Caption = 'Finalizar') then
      begin
        verifica := True;
        umaVenda.setStatus('FINALIZADA')
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
          umaVenda.setStatus('CANCELADA');
        end;
      end;
      if (verifica) then
      begin
        umaVenda.setSerieNota(edt_SerieNota.Text);
        umaVenda.getUmCliente.setId(StrToInt(edt_IdCliente.Text));
        umaVenda.getUmCliente.setNome_RazaoSoCial(edt_Cliente.Text);

        umaVenda.getUmUsuario.setIdUsuario(idUserLogado);
        umaVenda.getUmUsuario.getUmFuncionario.setId(idLogado);
        umaVenda.getUmUsuario.getUmFuncionario.setNome_RazaoSoCial(nomeLogado);
        umaVenda.setTotalAux(StrToFloat(edt_Total.Text));

        umaVenda.setDataCadastro(edt_DataCadastro.Date);
        if self.edt_DataAlteracao.Date <> dataAtual then
          umaVenda.setDataAlteracao(dataAtual);
        umaVenda.setDataEmissao(edt_DataEmissao.Date);
        if self.edt_DataVenda.Date <> dataAtual then
          umaVenda.setDataVenda(edt_DataVenda.Date);
        umaVenda.setObservacao(edt_Observacao.Text);

        umaVenda.setTipo(True); //Garantir que os dados vem de uma Venda

        msg := umaCtrlVenda.Salvar(UmaVenda);
        if Copy(msg,0,16) = 'Ocorreu um erro!' then
            Application.MessageBox(PChar(msg), 'Erro!', MB_OK + MB_ICONSTOP)
        else
            ShowMessage(msg);
        self.btn_Salvar.Caption := 'Salvar';
        umaVenda.LimparListaProduto;
        Close;
      end;
    end;
end;

procedure TFrmCadVenda.CarregaGridProduto;
var i, idProd : Integer;
    total, desc, valor, qtdProd : Real;
begin
  total := 0;
  if ((self.gridProduto.RowCount - 1) = 1 ) and (umaVenda.CountProdutos = 0)then
    begin
        for i := 0 to  self.gridProduto.ColCount -1  do
           self.gridProduto.Cells[i,1] := EmptyStr;
        Self.edt_Total.Text := '';
        self.gridProduto.RowCount := 1;
    end
  else
    begin
      for i := 1 to umaVenda.CountProdutos do
      begin
        self.gridProduto.RowCount := i + 1;
        if (self.gridProduto.Cells[0, i] = '') then
          begin
            idProd  := umaVenda.getProdutoVenda(i-1).getId;

            self.gridProduto.Cells[0, i] := IntToStr(idProd);
            self.gridProduto.Cells[1, i] := umaVenda.getProdutoVenda(i-1).getDescricao;
            self.gridProduto.Cells[2, i] := FormatFloat('#0.000', umaVenda.getProdutoVenda(i-1).getQtdProduto);
            qtdProd := StrToFloat(self.gridProduto.Cells[2, i]);
            SomaQuantidadeProduto(idProd, qtdProd);
            self.gridProduto.Cells[3, i] := FormatFloat('#0.00', umaVenda.getProdutoVenda(i-1).getValorUnitario);
            self.gridProduto.Cells[4, i] := FormatFloat('#0.00', umaVenda.getProdutoVenda(i-1).getDesconto);
            valor := StrToFloat(self.gridProduto.Cells[2, i]) * StrToFloat(self.gridProduto.Cells[3, i]);
            if umaVenda.getProdutoVenda(i-1).getDesconto <> 0 then
                desc := (umaVenda.getProdutoVenda(i-1).getDesconto)
            else
                desc := 0;
            self.gridProduto.Cells[5, i] := FormatFloat('#0.00', valor - desc);
          end;
         total := total +  Strtofloat(self.gridProduto.Cells[5, i]);
      end;
      Self.edt_Total.Text := FormatFloat('#0.00', total);
    end;

end;

procedure TFrmCadVenda.SomaQuantidadeProduto(idProd: Integer; qtdProd : Real);
var i, j : Integer;
    flag : Boolean;
    resultCalc : Real;
    objCalcProduto : CalcProduto;
begin
    if (umaVenda.CountCalcProduto = 0) then
    begin
        umaVenda.CrieObjetoCalcProduto;
        objCalcProduto := umaVenda.getUmCalcProduto;
        objCalcProduto.setId(idProd);
        objCalcProduto.setTotalProduto(qtdProd);
        umaVenda.addCalcProduto(objCalcProduto);
    end
    else
    begin
        for i := 1 to umaVenda.CountCalcProduto do
        begin
            if (umaVenda.getCalcProduto(i-1).getId = idProd) then
            begin
                resultCalc := umaVenda.getCalcProduto(i-1).getTotalProduto;
                resultCalc := resultCalc + qtdProd;
                umaVenda.getCalcProduto(i-1).setTotalProduto(resultCalc);
            end
            else
            begin
                flag := true;
                for j := 1 to umaVenda.CountCalcProduto do
                begin
                  if (umaVenda.getCalcProduto(j-1).getId = idProd) then
                    flag := False;
                end;
                if (flag) then
                begin
                  umaVenda.CrieObjetoCalcProduto;
                  objCalcProduto := umaVenda.getUmCalcProduto;
                  objCalcProduto.setId(idProd);
                  objCalcProduto.setTotalProduto(qtdProd);
                  umaVenda.addCalcProduto(objCalcProduto);
                end;
            end;
        end;
    end;
end;

procedure TFrmCadVenda.CarregaObj;
begin
  self.edt_NumeroNota.Text    := IntToStr(umaVenda.getNumNota);
  self.edt_SerieNota.Text     := umaVenda.getSerieNota;
  self.edt_IdCliente.Text     := IntToStr(umaVenda.getUmCliente.getId);
  self.edt_Cliente.Text       := umaVenda.getUmCliente.getNome_RazaoSoCial;
  self.edt_IdFuncionario.Text := IntToStr(idLogado);
  self.edt_Funcionario.Text   := nomeLogado;
  self.edt_status.Text        := umaVenda.getStatus;
  self.edt_Observacao.Text    := umaVenda.getObservacao;
  self.edt_DataCadastro.Date  := umaVenda.getDataCadastro;
  self.edt_DataAlteracao.Date := umaVenda.getDataAlteracao;
  self.edt_DataEmissao.Date   := umaVenda.getDataEmissao;
  self.edt_DataVenda.Date     := umaVenda.getDataVenda;

  if(Self.btn_Salvar.Caption = 'Finalizar') and (Self.btn_Salvar.Enabled = False)then
  begin
    self.edt_IdFuncionario.Text := IntToStr(umaVenda.getUmUsuario.getUmFuncionario.getId);
    self.edt_Funcionario.Text   := umaVenda.getUmUsuario.getUmFuncionario.getNome_RazaoSoCial;
  end;

  CarregaGridProduto;

  self.edt_IdCondicaoPagamento.Text := IntToStr(umaVenda.getUmaCondicaoPagamento.getId);
  self.edt_CondicaoPagamento.Text := umaVenda.getUmaCondicaoPagamento.getDescricao;
  CarregaParcelas;
  DesbilitaCampos;
end;

procedure TFrmCadVenda.CarregaParcelas;
var i : Integer;
    valorFinal, valor, TotalNota : Real;
begin
  valorFinal:= 0;
  if edt_Total.Text <> '' then
  begin
  TotalNota := StrToFloat(Self.edt_Total.text);
    for i := 1 to umaVenda.getUmaCondicaoPagamento.p do
      begin
         umaVenda.CrieObjetoParcela;
         umaVenda.addParcelas(umaVenda.getUmaCondicaoPagamento.getParcela(i-1));
         self.gridParcelas.RowCount := i+1;
         self.gridParcelas.Cells[0,i] := IntToStr(umaVenda.getUmaCondicaoPagamento.getParcela(i-1).getNumParcela);
         self.gridParcelas.Cells[1,i] := DateToStr(Date + (umaVenda.getUmaCondicaoPagamento.getParcela(i-1).getDias));
         self.gridParcelas.Cells[2,i] := FloatToStr(umaVenda.getUmaCondicaoPagamento.getParcela(i-1).getPorcentagem);
         valor := (StrToFloat(Self.gridParcelas.Cells[2,i])/100) * StrToFloat(Self.edt_Total.text);
         self.gridParcelas.Cells[3,i] := FormatFloat('#0.00', valor);

         valorFinal := valorFinal + StrToFloat(self.gridParcelas.Cells[3,i]);
         if (valorFinal > TotalNota) and (i = umaVenda.getUmaCondicaoPagamento.p) then
         begin
           valorFinal := TotalNota - valorFinal;
           self.gridParcelas.Cells[3,i] := FormatFloat('#0.00', StrToFloat(self.gridParcelas.Cells[3,i])+valorFinal);
         end
         else if (valorFinal < TotalNota) and (i = umaVenda.getUmaCondicaoPagamento.p) then
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

procedure TFrmCadVenda.ConhecaObj(vVenda: Venda; vCtrlVenda: CtrlVenda);
begin
   umaVenda     := vVenda;
   umaCtrlVenda := vCtrlVenda;
   Self.DesbilitaCampos;
   self.LimpaCampos;
   umaVenda.LimparListaCalcProduto;
   if umaVenda.getNumNota = 0 then
   begin
      umaVenda.LimparListaProduto;
      umaVenda.LimparListaParcelas;
      Self.LimpaGridProduto;
      Self.LimpaGridParcelas(True)
   end;
  self.edt_IdFuncionario.Text := IntToStr(idLogado);
  self.edt_Funcionario.Text   := nomeLogado;
  self.edt_ValorTotal.Text    := FormatFloat('#0.00', 0);
end;

procedure TFrmCadVenda.DesbilitaCampos;
begin
  Self.edt_SerieNota.Enabled := False;
  Self.edt_IdCliente.Enabled := False;
  Self.edt_IdFuncionario.Enabled := False;
  Self.btn_BuscarCliente.Enabled := False;
  Self.btn_BuscarFuncionario.Enabled := False;
  Self.edt_IdProduto.Enabled := False;
  Self.btn_BuscarProduto.Enabled := False;
  Self.edt_Quantidade.Enabled := False;
  Self.edt_Valor.Enabled := False;
  Self.edt_Observacao.Enabled := False;
  Self.edt_status.Enabled := False;
  Self.edt_Desconto.Enabled := False;
  Self.btn_BuscarProduto.Enabled := False;
  Self.btn_Add_Produto.Enabled := False;
  Self.btn_LimparProdutos.Enabled := False;
  Self.edt_IdCondicaoPagamento.Enabled := False;
  Self.btn_BuscarCondicaoPagamento.Enabled := False;
  Self.btn_GerarParcelas.Enabled := False;
  Self.btn_LimparParcelas.Enabled := False;
  self.gridProduto.Enabled := True;
  self.gridParcelas.Enabled := True;
  Self.btn_Salvar.Enabled := False;
  Self.edt_ValorTotal.Enabled := False;

  if Self.btn_Salvar.Caption = 'Salvar' then
  begin
    Self.edt_SerieNota.Enabled := True;
    Self.edt_IdCliente.Enabled := True;
    Self.btn_BuscarCliente.Enabled := True;
    Self.btn_Salvar.Enabled := True;
  end
  else if Self.btn_Salvar.Caption = 'Finalizar' then
  begin
     if (umaVenda.getStatus = 'FINALIZADA') or (umaVenda.getStatus = 'CANCELADA')then
      Self.btn_Salvar.Enabled := False
     else
      Self.btn_Salvar.Enabled := True;
  end
  else if ((Self.btn_Salvar.Caption = 'Cancelar') and (Self.edt_status.Text <> 'CANCELADA')) then
  begin
    Self.btn_Salvar.Enabled := True;
    Self.edt_Observacao.Enabled := True;
  end;
end;

procedure TFrmCadVenda.edt_IdClienteExit(Sender: TObject);
begin
  inherited;
   if Self.edt_IdCliente.Text <> '' then
   begin
      Self.edt_Cliente.Clear;
      umaCtrlCliente := CtrlCliente.CrieObjeto;
      umaVenda.getUmCliente.setId(StrToInt(Self.edt_IdCliente.Text));
      umaVenda.getUmCliente.setNome_RazaoSoCial(Self.edt_Cliente.Text);
      umaVenda.getUmCliente.setTelefone('');
      umaVenda.getUmCliente.setCPF_CNPJ('');
      if not umaCtrlCliente.Buscar(umaVenda.getUmCliente) then
      begin
        MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
        self.edt_IdCliente.Clear;
        self.edt_Cliente.Clear;
        Self.edt_IdCondicaoPagamento.Clear;
        Self.edt_CondicaoPagamento.Clear;
        umaVenda.getUmCliente.setId(0);
        DesbilitaCampos;
      end
      else
      begin
        LimpaGridParcelas(true);
        HabilitaCampos;
        umaCtrlCliente.Carrega(umaVenda.getUmCliente);
        Self.edt_IdCliente.Text := IntToStr(umaVenda.getUmCliente.getId);
        Self.edt_Cliente.Text := umaVenda.getUmCliente.getNome_RazaoSoCial;
        Self.edt_IdCondicaoPagamento.Text := IntToStr(umaVenda.getUmCliente.getUmaCondicaoPgto.getId);
        Self.edt_CondicaoPagamento.Text := umaVenda.getUmCliente.getUmaCondicaoPgto.getDescricao;
        //Adiciona a Condicao Pagamento na Venda
        addCondicaoPgto(umaVenda.getUmCliente.getUmaCondicaoPgto)
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
     DesbilitaCampos
   end;
end;

procedure TFrmCadVenda.edt_IdCondicaoPagamentoExit(Sender: TObject);
begin
   if Self.edt_IdCondicaoPagamento.Text <> '' then
   begin
      LimpaGridParcelas(true);
      Self.edt_CondicaoPagamento.Clear;
      umaCtrlCondicaoPagamento := CtrlCondicaoPagamento.CrieObjeto;
      umaVenda.getUmaCondicaoPagamento.setId(StrToInt(Self.edt_IdCondicaoPagamento.Text));
      umaVenda.getUmaCondicaoPagamento.setDescricao(Self.edt_CondicaoPagamento.Text);
      umaVenda.getUmaCondicaoPagamento.getUmaFormaPagamento.setId(0);
      if not umaCtrlCondicaoPagamento.Buscar(umaVenda.getUmaCondicaoPagamento) then
      begin
        MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
        self.edt_IdCondicaoPagamento.Clear;
        self.edt_CondicaoPagamento.Clear;
        umaVenda.getUmaCondicaoPagamento.setId(0);
      end
      else
      begin
        umaCtrlCondicaoPagamento.Carrega(umaVenda.getUmaCondicaoPagamento);
        Self.edt_IdCondicaoPagamento.Text := IntToStr(umaVenda.getUmaCondicaoPagamento.getId);
        Self.edt_CondicaoPagamento.Text := umaVenda.getUmaCondicaoPagamento.getDescricao;
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

procedure TFrmCadVenda.edt_IdFuncionarioExit(Sender: TObject);
begin
   if Self.edt_IdFuncionario.Text <> '' then
   begin
      Self.edt_Funcionario.Clear;
      umaCtrlUsuario := CtrlUsuario.CrieObjeto;
      umaVenda.getUmUsuario.getUmFuncionario.setId(StrToInt(Self.edt_IdFuncionario.Text));
      umaVenda.getUmUsuario.getUmFuncionario.setNome_RazaoSoCial(Self.edt_Funcionario.Text);
      umaVenda.getUmUsuario.getUmFuncionario.setCPF_CNPJ('');
      if not umaCtrlUsuario.Buscar(umaVenda.getUmUsuario) then
      begin
        MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
        self.edt_IdFuncionario.Clear;
        self.edt_Funcionario.Clear;
        umaVenda.getUmUsuario.getUmFuncionario.setId(0);
      end
      else
      begin
        umaCtrlUsuario.Carrega(umaVenda.getUmUsuario);
        Self.edt_IdFuncionario.Text := IntToStr(umaVenda.getUmUsuario.getUmFuncionario.getId);
        Self.edt_Funcionario.Text := umaVenda.getUmUsuario.getUmFuncionario.getNome_RazaoSoCial;
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

procedure TFrmCadVenda.edt_IdProdutoExit(Sender: TObject);
begin
   if Self.edt_IdProduto.Text <> '' then
   begin
     if (umaVenda.getUmProdutoVenda = nil) or (umaVenda.getUmProdutoVenda.getId <> 0)then
        umaVenda.CrieObejtoProduto;

      Self.edt_Produto.Clear;
      umaCtrlProduto := CtrlProduto.CrieObjeto;
      umaVenda.getUmProdutoVenda.setId(StrToInt(Self.edt_IdProduto.Text));
      umaVenda.getUmProdutoVenda.setDescricao(Self.edt_Produto.Text);
      if not umaCtrlProduto.Buscar(umaVenda.getUmProdutoVenda) then
      begin
        MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
        self.edt_IdProduto.Clear;
        self.edt_Produto.Clear;
        Self.edt_Quantidade.Clear;
        Self.edt_Valor.Clear;
        umaVenda.getUmProdutoVenda.setId(0);
      end
      else //if (Self.VerificaProduto) then
      begin
        umaCtrlProduto.Carrega(umaVenda.getUmProdutoVenda);
        self.edt_IdProduto.Text := inttostr(umaVenda.getUmProdutoVenda.getId);
        self.edt_Produto.Text    := umaVenda.getUmProdutoVenda.getDescricao;
        Self.edt_Quantidade.Text := inttostr(1);
        Self.edt_Valor.Text := floattostr(umaVenda.getUmProdutoVenda.getPrecoVenda);

        Self.edt_ValorTotal.Text := FormatFloat('#0.00', StrToFloat(edt_Valor.Text) * StrToFloat(edt_Quantidade.Text));
      end;
      umProduto := Produto.CrieObjeto;
      umaCtrlProduto.Buscar(umProduto);
   end
   else
   begin
      self.edt_IdProduto.Clear;
      self.edt_Produto.Clear;
      Self.edt_Quantidade.Clear;
      Self.edt_Valor.Clear;
   end;
end;

procedure TFrmCadVenda.HabilitaCampos;
begin
  Self.edt_IdProduto.Enabled := True;
  Self.btn_BuscarProduto.Enabled := True;
  Self.edt_Quantidade.Enabled := True;
  Self.edt_Desconto.Enabled := True;
  Self.edt_Observacao.Enabled := True;
  Self.btn_BuscarProduto.Enabled := True;
  Self.btn_Add_Produto.Enabled := True;
  Self.btn_LimparProdutos.Enabled := True;
  self.gridProduto.Enabled := True;
  self.gridParcelas.Enabled := True;
  HabilitaParcelas;
end;

procedure TFrmCadVenda.HabilitaParcelas;
begin
  Self.edt_IdCondicaoPagamento.Enabled := True;
  Self.btn_BuscarCondicaoPagamento.Enabled := True;
  Self.btn_GerarParcelas.Enabled := True;
  Self.btn_LimparParcelas.Enabled := True;
end;

procedure TFrmCadVenda.LimpaCampos;
var dataAtual : TDateTime;
    i : Integer;
begin
  dataAtual := Date;
  for i := 0 to Self.ComponentCount - 1 do
    if (Self.Components[i] is TsEdit)then
        TsEdit(Self.Components[i]).Clear;
  Self.edt_DataCadastro.Date  := dataAtual;
  Self.edt_DataAlteracao.Date := dataAtual;
  Self.edt_DataEmissao.Date   := dataAtual;
  Self.edt_DataVenda.Date     := dataAtual;
end;

procedure TFrmCadVenda.LimpaGridParcelas(verifica : Boolean);
var k,j,i : integer;
begin
  if (verifica) then
    for k := 0 to umaVenda.getUmaCondicaoPagamento.p -1 do
      umaVenda.getUmaCondicaoPagamento.removeParcela;

  umaVenda.LimparListaParcelas;

  for j := 0 to (gridParcelas.ColCount - 1) do
    for i := 1 to gridParcelas.RowCount do
      gridParcelas.Cells[j,i] := '';
  gridParcelas.RowCount := 0;
end;

procedure TFrmCadVenda.LimpaGridProduto;
var j,i : integer;
begin
  for j := 0 to (gridProduto.ColCount - 1) do
    for i := 1 to gridProduto.RowCount do
      gridProduto.Cells[j,i] := '';
  gridProduto.RowCount := 0;
end;

function TFrmCadVenda.VerificaProduto: Boolean;
var i : Integer;
begin
  if (gridProduto.RowCount = 1) then
    Result := True;
  for i:= 1 to umaVenda.CountProdutos do
    if (Self.gridProduto.Cells[0,i] = IntToStr(umaVenda.getumProdutoVenda.getId))then
    begin
      MessageDlg('Esse Produto já está adicionado na Lista!', mtInformation, [mbOK], 0);
      Self.edt_IdProduto.SetFocus;
      Self.edt_IdProduto.Clear;
      self.edt_Produto.Clear;
      Self.edt_Quantidade.Clear;
      Self.edt_Valor.Clear;
      Result := False;
      Exit;
    end
    else
      Result:= True;
end;

procedure TFrmCadVenda.FormActivate(Sender: TObject);
var count : Integer;
begin
  self.gridParcelas.ColWidths[0] := 88;
  self.gridParcelas.Cells[0,0] := 'Nº Parcela';
  self.gridParcelas.Cells[1,0] := 'Data Vencimento';
  self.gridParcelas.Cells[2,0] := 'Porcentagem';
  self.gridParcelas.Cells[3,0] := 'Valor R$';

  self.gridProduto.ColWidths[1] := 321;
  self.gridProduto.Cells[0,0] := 'Código';
  self.gridProduto.Cells[1,0] := 'Descrição';
  self.gridProduto.Cells[2,0] := 'Quantidade';
  self.gridProduto.Cells[3,0] := 'Valor';
  self.gridProduto.Cells[4,0] := 'Desconto';
  self.gridProduto.Cells[5,0] := 'Total';

  for count := 0 to Self.ComponentCount - 1 do
    if Self.Components[count] is TsEdit then
      TsEdit(Components[count]).CharCase := ecUpperCase;
end;

//Calcula Item Produto
procedure TFrmCadVenda.CalcItemProduto;
var qtdItem, valorProdutoItem, descontoItem, totalItem : Real;
begin
    qtdItem := StrToFloat(edt_Quantidade.Text);
    valorProdutoItem := StrToFloat(edt_Valor.Text);
    totalItem := valorProdutoItem * qtdItem;
    totalItemAnt := totalItem;
    edt_ValorTotal.Text := FormatFloat('#0.00', totalItem);
end;

procedure TFrmCadVenda.edt_IdClienteKeyPress(Sender: TObject; var Key: Char);
begin
   CampoNumero(Sender, Key);
end;

procedure TFrmCadVenda.edt_IdFuncionarioKeyPress(Sender: TObject; var Key: Char);
begin
   CampoNumero(Sender, Key);
end;


procedure TFrmCadVenda.edt_ValorKeyPress(Sender: TObject; var Key: Char);
begin
   CampoReal(Sender, Key, Self.edt_Valor.Text);
end;


procedure TFrmCadVenda.edt_QuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
   CampoReal(Sender, Key, Self.edt_Quantidade.Text);
end;

procedure TFrmCadVenda.edt_QuantidadeExit(Sender: TObject);
begin
     if (edt_Quantidade.Text = '') then
      edt_Quantidade.Text := FormatFloat('#0.00', 0)
    else
      edt_Quantidade.Text := FormatFloat('#0.00', StrToFloat(edt_Quantidade.Text));
    if (edt_Valor.Text <> '') then
      Self.CalcItemProduto;
end;

procedure TFrmCadVenda.edt_DescontoKeyPress(Sender: TObject; var Key: Char);
begin
   CampoReal(Sender, Key, Self.edt_Desconto.Text);
end;

procedure TFrmCadVenda.edt_DescontoExit(Sender: TObject);
var  vTotal, vDesc : Real;
begin
  if (edt_Desconto.Text = '') then
  begin
    if (edt_Quantidade.Text = '') then
      edt_Quantidade.Text := FormatFloat('#0.00', 0);
    if (edt_Valor.Text = '') then
      edt_Valor.Text := FormatFloat('#0.00', 0);
    edt_Desconto.Text := FormatFloat('#0.00', 0);
    Self.CalcItemProduto;
    descItemAnt := 0;
    descItemAux := 0;
  end
  else if (edt_Desconto.Text <> '' ) and (StrToFloat(edt_Desconto.Text) <> 0 ) and (StrToFloat(edt_Desconto.Text) <> descItemAnt) then
  begin
    if (edt_Desconto.Text <> '') and (StrToFloat(edt_Desconto.Text) > StrToFloat(edt_Valor.Text)) then
    begin
        ShowMessage('Desconto não pode ser maior que o valor do produto!');
        edt_Desconto.SetFocus;
    end
    else
    begin
      edt_Desconto.Text := FormatFloat('#0.00', StrToFloat(edt_Desconto.Text));
      edt_ValorTotal.Text    := FormatFloat('#0.00', StrToFloat(edt_ValorTotal.Text)+descItemAnt);
      descItemAnt       := StrToFloat(edt_Desconto.Text);
      descItemAux       := StrToFloat(edt_ValorTotal.Text)- StrToFloat(edt_Desconto.Text);
      totalItemAnt      := descItemAux;
      edt_ValorTotal.Text    :=  FormatFloat('#0.00', descItemAux);
    end;
  end;
end;

procedure TFrmCadVenda.edt_IdCondicaoPagamentoKeyPress(Sender: TObject; var Key: Char);
begin
   CampoNumero(Sender, Key);
end;

procedure TFrmCadVenda.edt_IdProdutoKeyPress(Sender: TObject; var Key: Char);
begin
   CampoNumero(Sender, Key);
end;

procedure TFrmCadVenda.btn_SairClick(Sender: TObject);
begin
  close;
end;

end.
