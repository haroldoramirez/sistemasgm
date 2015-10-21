unit UFrmCadProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCadastro, StdCtrls, Buttons, sBitBtn, sGroupBox, Mask, sMaskEdit,
  sCustomComboEdit, sTooledit, sEdit, sLabel, Grids, DBGrids, sMemo, UProduto,
  UFrmConMarca, UMarca, UFrmConCategoria, UCategoria, UCtrlMarca, UCtrlCategoria,
  UCtrlProduto, UUnidade, UFrmConUnidade, UCtrlUnidade, UComuns, UFrmViewFornecedor;

type
  TFrmCadProduto = class(TFrmCadastro)
    sGroupBox3: TsGroupBox;
    lbl_IdMarca: TsLabel;
    lbl_Marca: TsLabel;
    edt_IdMarca: TsEdit;
    edt_Marca: TsEdit;
    btn_BuscarMarca: TsBitBtn;
    lbl_IdProduto: TsLabel;
    lbl_Descricao: TsLabel;
    edt_IdProduto: TsEdit;
    edt_Descricao: TsEdit;
    edt_IdUnidade: TsEdit;
    lbl_IdUnidade: TsLabel;
    sGroupBox2: TsGroupBox;
    lbl1: TsLabel;
    lbl_Categoria: TsLabel;
    edt_IdCategoria: TsEdit;
    edt_Categoria: TsEdit;
    btn_BuscarCategoria: TsBitBtn;
    sGroupBox6: TsGroupBox;
    edt_PrecoVenda: TsEdit;
    lbl_PrecoVenda: TsLabel;
    lbl_Observacao: TsLabel;
    edt_Observacao: TsMemo;
    sGroupBox7: TsGroupBox;
    lbl_DataCadastro: TsLabel;
    lbl_DataUltAlteracao: TsLabel;
    edt_DataCadastro: TsDateEdit;
    edt_DataUltAlteracao: TsDateEdit;
    edt_Unidade: TsEdit;
    btn_BuscarUnidade: TsBitBtn;
    lbl_Unidade: TsLabel;
    sGroupBox8: TsGroupBox;
    edt_MediaValorCompra: TsEdit;
    lbl_PrecoCusto: TsLabel;
    edt_UltimoValorCompra: TsEdit;
    sLabel1: TsLabel;
    edt_Quantidade: TsEdit;
    lbl_Quantidade: TsLabel;
    edt_ICMS: TsEdit;
    lbl_ICMS: TsLabel;
    edt_IPI: TsEdit;
    lbl_IPI: TsLabel;
    procedure btn_BuscarMarcaClick(Sender: TObject);
    procedure btn_BuscarCategoriaClick(Sender: TObject);
    procedure edt_IdMarcaExit(Sender: TObject);
    procedure edt_IdCategoriaExit(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure btn_BuscarUnidadeClick(Sender: TObject);
    procedure edt_IdUnidadeExit(Sender: TObject);
    procedure edt_IdUnidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edt_IdMarcaKeyPress(Sender: TObject; var Key: Char);
    procedure edt_IdCategoriaKeyPress(Sender: TObject; var Key: Char);
    procedure edt_QuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edt_ICMSKeyPress(Sender: TObject; var Key: Char);
    procedure edt_IPIKeyPress(Sender: TObject; var Key: Char);
    procedure edt_MediaValorCompraKeyPress(Sender: TObject; var Key: Char);
    procedure edt_PrecoVendaKeyPress(Sender: TObject; var Key: Char);
    procedure edt_ICMSEnter(Sender: TObject);
    procedure edt_IPIEnter(Sender: TObject);
    procedure edt_PrecoVendaEnter(Sender: TObject);
    procedure btn_BuscarFornecedoresClick(Sender: TObject);
  private
    umProduto           : Produto;
    umaCtrlProduto      : CtrlProduto;
    umFrmConMarca       : TFrmConMarca;
    umaCtrlMarca        : CtrlMarca;
    umFrmConCategoria   : TFrmConCategoria;
    umaCtrlCategoria    : CtrlCategoria;
    umFrmConUnidade     : TFrmConUnidade;
    umaCtrlUnidade      : CtrlUnidade;
    umFrmViewFornecedor : TFrmViewFornecedor;
  public
      procedure ConhecaObj(vProduto: Produto; vCtrlProduto: CtrlProduto);
      procedure HabilitaCampos;
      procedure LimpaCampos;
      procedure CarregaObj;
  end;

var
  FrmCadProduto: TFrmCadProduto;

implementation

{$R *.dfm}

{ TFrmCadProduto }

procedure TFrmCadProduto.btn_BuscarCategoriaClick(Sender: TObject);
begin
  inherited;
      umFrmConCategoria := TFrmConCategoria.Create(nil);
      umFrmConCategoria.ConhecaObj(umProduto.getUmaCategoria);
      umFrmConCategoria.btn_Sair.Caption := 'Selecionar';
      umFrmConCategoria.ShowModal;
      self.edt_IdCategoria.Text  := inttostr(umProduto.getUmaCategoria.getId);
      self.edt_Categoria.Text    := umProduto.getUmaCategoria.getDescricao;
end;

procedure TFrmCadProduto.btn_BuscarMarcaClick(Sender: TObject);
begin
  inherited;
  umFrmConMarca := TFrmConMarca.Create(nil);
  umFrmConMarca.ConhecaObj(umProduto.getUmaMarca);
  umFrmConMarca.btn_Sair.Caption := 'Selecionar';
  umFrmConMarca.ShowModal;
  self.edt_IdMarca.Text  := inttostr(umProduto.getUmaMarca.getId);
  self.edt_Marca.Text    := umProduto.getUmaMarca.getDescricao;
end;

procedure TFrmCadProduto.btn_BuscarUnidadeClick(Sender: TObject);
begin
  inherited;
  umFrmConUnidade := TFrmConUnidade.Create(nil);
  umFrmConUnidade.ConhecaObj(umProduto.getUmaUnidade);
  umFrmConUnidade.btn_Sair.Caption := 'Selecionar';
  umFrmConUnidade.ShowModal;
  self.edt_IdUnidade.Text  := inttostr(umProduto.getUmaUnidade.getId);
  self.edt_Unidade.Text    := umProduto.getUmaUnidade.getDescricao;
end;

procedure TFrmCadProduto.btn_BuscarFornecedoresClick(Sender: TObject);
begin
  inherited;
  umFrmViewFornecedor.ConhecaObj(umProduto);
  umFrmViewFornecedor.ShowModal;
end;

procedure TFrmCadProduto.btn_SalvarClick(Sender: TObject);
var
  dataAtual : TDateTime;
  msg: string;
begin
    dataAtual := Date;
  inherited;
  if (edt_Descricao.Text = '') then
    begin
        ShowMessage('Campo Descrição não pode estar em branco!');
        edt_Descricao.SetFocus;
    end
  else
  if (edt_Unidade.Text = '') then
    begin
        ShowMessage('Campo Unidade não pode estar em branco!');
        edt_Descricao.SetFocus;
    end
  else
    if (edt_Marca.Text = '') then
      begin
          ShowMessage('É necessário adicionar uma marca para o produto!');
          edt_IdMarca.SetFocus;
      end
  else
    if (edt_Categoria.Text = '')then
      begin
          ShowMessage('É necessário adicionar uma categoria para o produto!');
          edt_IdCategoria.SetFocus;
      end
  else
    if (edt_PrecoVenda.Text = '') then
      begin
           ShowMessage('Favor definir um preço para o produto!');
           edt_PrecoVenda.SetFocus;
      end
  else
    if self.btn_Salvar.Caption = 'Salvar' then
      begin
          if (edt_ICMS.Text = '') then
            edt_ICMS.Text := IntToStr(0);
          if (edt_IPI.Text = '') then
            edt_IPI.Text := IntToStr(0);
          umProduto.getUmaMarca.setId(StrToInt(edt_IdMarca.Text));
          umProduto.getUmaCategoria.setId(StrToInt(edt_IdCategoria.Text));
          umProduto.getUmaUnidade.setId(StrToInt(edt_IdUnidade.Text));
          umProduto.setQuantidade(StrToFloat(edt_Quantidade.Text));
          umProduto.setICMS(StrToFloat(edt_ICMS.Text));
          umProduto.setIPI(StrToFloat(edt_IPI.Text));
          umProduto.setDescricao(edt_Descricao.Text);
          umProduto.setPrecoVenda(StrToFloat(edt_PrecoVenda.Text));
          umProduto.setObservacao(edt_Observacao.Text);
          umProduto.setDataCadastro(edt_DataCadastro.Date);
          if self.edt_DataUltAlteracao.Date <> dataAtual then
            umProduto.setDataAlteracao(dataAtual);
           msg := umaCtrlProduto.Salvar(umProduto);
          if Copy(msg,0,16) = 'Ocorreu um erro!' then
              Application.MessageBox(PChar(msg), 'Erro!', MB_OK + MB_ICONSTOP)
          else
              ShowMessage(msg);
          Close;
      end
    else
      if self.btn_Salvar.Caption = 'Excluir' then
        begin
            msg := umaCtrlProduto.Excluir(umProduto);
            showmessage(msg);
            close;
        end;
end;

procedure TFrmCadProduto.CarregaObj;
begin
    self.edt_IdProduto.Text         := inttostr(umProduto.getId);
    self.edt_Descricao.Text         := umProduto.getDescricao;
    self.edt_IdUnidade.Text         := inttostr(umProduto.getUmaUnidade.getId);
    self.edt_Unidade.Text           := umProduto.getUmaUnidade.getDescricao;
    self.edt_IdMarca.Text           := inttostr(umProduto.getUmaMarca.getId);
    self.edt_Marca.Text             := umProduto.getUmaMarca.getDescricao;
    self.edt_IdCategoria.Text       := inttostr(umProduto.getUmaCategoria.getId);
    self.edt_Categoria.Text         := umProduto.getUmaCategoria.getDescricao;
    self.edt_Quantidade.Text        := FormatFloat('#0.000', umProduto.getQuantidade);
    self.edt_ICMS.Text              := FormatFloat('#0.00', umProduto.getICMS);
    self.edt_IPI.Text               := FormatFloat('#0.00', umProduto.getIPI);
    self.edt_MediaValorCompra.Text  := FormatFloat('#0.00', umProduto.getPrecoCompra);
    self.edt_PrecoVenda.Text        := FormatFloat('#0.00', umProduto.getPrecoVenda);
    self.edt_UltimoValorCompra.Text := FormatFloat('#0.00', umProduto.getPrecoCompraAnt);
    self.edt_Observacao.Text        := umProduto.getObservacao;
end;

procedure TFrmCadProduto.ConhecaObj(vProduto: Produto; vCtrlProduto: CtrlProduto);
begin
  umProduto := vProduto;
  umaCtrlProduto := vCtrlProduto;
  umFrmViewFornecedor := TFrmViewFornecedor.Create(nil);
  Self.HabilitaCampos;
  self.LimpaCampos;
end;

procedure TFrmCadProduto.edt_IdCategoriaExit(Sender: TObject);
var  umaCategoria : Categoria;
begin
  inherited;
    if Self.edt_IdCategoria.Text <> '' then
      begin
        Self.edt_Categoria.Clear;
        umaCtrlCategoria := CtrlCategoria.CrieObjeto;
        umProduto.getUmaCategoria.setId(StrToInt(Self.edt_IdCategoria.Text));
        umProduto.getUmaCategoria.setDescricao(Self.edt_Categoria.Text);
        if not umaCtrlCategoria.Buscar(umProduto.getUmaCategoria) then
          begin
              MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
              self.edt_IdCategoria.Clear;
              self.edt_Categoria.Clear;
          end
        else
          begin
              umaCtrlCategoria.Carrega(umProduto.getUmaCategoria);
              Self.edt_IdCategoria.Text := IntToStr(umProduto.getUmaCategoria.getId);
              Self.edt_Categoria.Text := umProduto.getUmaCategoria.getDescricao;
          end;
        umaCategoria := Categoria.CrieObjeto;
        umaCtrlCategoria.Buscar(umaCategoria);
      end
    else
      begin
        self.edt_IdCategoria.Clear;
        self.edt_Categoria.Clear;
      end;
end;

procedure TFrmCadProduto.edt_IdMarcaExit(Sender: TObject);
var  umaMarca : Marca;
begin
  inherited;
  if Self.edt_IdMarca.Text <> '' then
    begin
      Self.edt_Marca.Clear;
      umaCtrlMarca := CtrlMarca.CrieObjeto;
      umProduto.getUmaMarca.setId(StrToInt(Self.edt_IdMarca.Text));
      umProduto.getUmaMarca.setDescricao(Self.edt_Marca.Text);
      if not umaCtrlMarca.Buscar(umProduto.getUmaMarca) then
        begin
            MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
            self.edt_IdMarca.Clear;
            self.edt_Marca.Clear;
        end
      else
        begin
            umaCtrlMarca.Carrega(umProduto.getUmaMarca);
            Self.edt_IdMarca.Text := IntToStr(umProduto.getUmaMarca.getId);
            Self.edt_Marca.Text := umProduto.getUmaMarca.getDescricao;
        end;
      umaMarca := Marca.CrieObjeto;
      umaCtrlMarca.Buscar(umaMarca);
    end
  else
    begin
      self.edt_IdMarca.Clear;
      self.edt_Marca.Clear;
    end;
end;

procedure TFrmCadProduto.edt_IdUnidadeExit(Sender: TObject);
var  umaUnidade : Unidade;
begin
  inherited;
  if Self.edt_IdUnidade.Text <> '' then
    begin
      Self.edt_Unidade.Clear;
      umaCtrlUnidade := CtrlUnidade.CrieObjeto;
      umProduto.getUmaUnidade.setId(StrToInt(Self.edt_IdUnidade.Text));
      umProduto.getUmaUnidade.setDescricao(Self.edt_Unidade.Text);
      if not umaCtrlUnidade.Buscar(umProduto.getUmaUnidade) then
        begin
            MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
            self.edt_IdUnidade.Clear;
            self.edt_Unidade.Clear;
        end
      else
        begin
            umaCtrlUnidade.Carrega(umProduto.getUmaUnidade);
            Self.edt_IdUnidade.Text := IntToStr(umProduto.getUmaUnidade.getId);
            Self.edt_Unidade.Text := umProduto.getUmaUnidade.getDescricao;
        end;
      umaUnidade := Unidade.CrieObjeto;
      umaCtrlUnidade.Buscar(umaUnidade);
    end
  else
    begin
      self.edt_IdUnidade.Clear;
      self.edt_Unidade.Clear;
    end;
end;

procedure TFrmCadProduto.HabilitaCampos;
begin
  Self.edt_Descricao.Enabled := True;
  Self.edt_IdMarca.Enabled := True;
  Self.edt_IdUnidade.Enabled := True;
  Self.edt_IdCategoria.Enabled := True;
  Self.edt_ICMS.Enabled := True;
  Self.edt_IPI.Enabled := True;
  Self.edt_PrecoVenda.Enabled := True;
  Self.edt_Observacao.Enabled := True;
  Self.btn_BuscarMarca.Enabled := True;
  Self.btn_BuscarCategoria.Enabled := True;
  Self.btn_BuscarUnidade.Enabled := True;
end;

procedure TFrmCadProduto.LimpaCampos;
var dataAtual : TDateTime;
begin
  dataAtual := Date;
  self.edt_IdProduto.Clear;
  self.edt_Descricao.Clear;
  Self.edt_IdUnidade.Clear;
  self.edt_Unidade.Clear;
  self.edt_IdMarca.Clear;
  self.edt_Marca.Clear;
  self.edt_IdCategoria.Clear;
  self.edt_Categoria.Clear;
  self.edt_Quantidade.Text := IntToStr(0);
  self.edt_ICMS.Text := IntToStr(0);
  self.edt_IPI.Text := IntToStr(0);
  self.edt_MediaValorCompra.Text := IntToStr(0);
  self.edt_UltimoValorCompra.Text := IntToStr(0);
  self.edt_PrecoVenda.Text := IntToStr(0);
  self.edt_Observacao.Clear;
  self.edt_DataCadastro.Date := dataAtual;
  self.edt_DataUltAlteracao.Date := dataAtual;
end;

procedure TFrmCadProduto.btn_SairClick(Sender: TObject);
begin
  inherited;
  Self.HabilitaCampos;
end;

procedure TFrmCadProduto.edt_IdUnidadeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CampoNumero(Sender, Key);
end;

procedure TFrmCadProduto.edt_IdMarcaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CampoNumero(Sender, Key);
end;

procedure TFrmCadProduto.edt_IdCategoriaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CampoNumero(Sender, Key);
end;

procedure TFrmCadProduto.edt_QuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CampoReal(Sender, Key, edt_Quantidade.Text);
end;

procedure TFrmCadProduto.edt_ICMSEnter(Sender: TObject);
begin
  inherited;
  if (edt_ICMS.Text = IntToStr(0)) then
    edt_ICMS.Clear;
end;

procedure TFrmCadProduto.edt_ICMSKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CampoReal(Sender, Key, edt_ICMS.Text);
end;

procedure TFrmCadProduto.edt_IPIEnter(Sender: TObject);
begin
  inherited;
  if (edt_IPI.Text = IntToStr(0)) then
    edt_IPI.Clear;
end;

procedure TFrmCadProduto.edt_IPIKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CampoReal(Sender, Key, edt_IPI.Text);
end;

procedure TFrmCadProduto.edt_MediaValorCompraKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CampoReal(Sender, Key, edt_MediaValorCompra.Text);
end;

procedure TFrmCadProduto.edt_PrecoVendaEnter(Sender: TObject);
begin
  inherited;
  if (edt_PrecoVenda.Text = IntToStr(0)) then
    edt_PrecoVenda.Clear;
end;

procedure TFrmCadProduto.edt_PrecoVendaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CampoReal(Sender, Key, edt_PrecoVenda.Text);
end;

end.
