unit UFrmCadFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCadastro, Mask, sMaskEdit, StdCtrls, sEdit, sLabel, Buttons,
  sBitBtn, sGroupBox, sCustomComboEdit, sTooledit, sMemo, UFornecedor,
  UCtrlFornecedor, UFrmConCidade, UEndereco, UCidade, UCtrlCidade, UValidacao,
  UFrmConCondicaoPagamento, UCtrlCondicaoPagamento, UCondicaoPagamento, UComuns,
  UCtrlProduto, UProduto, UFrmConProduto, Grids;

type
  TFrmCadFornecedor = class(TFrmCadastro)
    lbl_IdCliente: TsLabel;
    lbl_Nome_RazaoSocial: TsLabel;
    lbl_DataCadastro: TsLabel;
    lbl_Observacao: TsLabel;
    edt_Observacao: TsMemo;
    rg_TipoPessoa: TsRadioGroup;
    edt_IdCliente: TsEdit;
    edt_DataCadastro: TsDateEdit;
    edt_Nome_RazaoSocial: TsEdit;
    sGroupBox3: TsGroupBox;
    lbl_IdCondicaoPgto: TsLabel;
    lbl_CondicaoPgto: TsLabel;
    edt_IdCondicaoPgto: TsEdit;
    edt_CondicaoPgto: TsEdit;
    btn_BuscarCondicaoPgto: TsBitBtn;
    sGroupBox4: TsGroupBox;
    lbl_RG_IE: TsLabel;
    lbl_CPF_CNPJ: TsLabel;
    lbl_DataNasc_Fund: TsLabel;
    edt_DataNasc_Fund: TsDateEdit;
    edt_CPF_CNPJ: TsMaskEdit;
    sGroupBox5: TsGroupBox;
    edt_DataUltAlteracao: TsDateEdit;
    lbl_DataUltAlteracao: TsLabel;
    sGroupBox2: TsGroupBox;
    lbl_Logradouro: TsLabel;
    lbl_Numero: TsLabel;
    lbl_Bairro: TsLabel;
    lbl_CEP: TsLabel;
    lbl_Complemento: TsLabel;
    lbl_IdCidade: TsLabel;
    lbl_Cidade: TsLabel;
    lbl_UF: TsLabel;
    lbl_Pais: TsLabel;
    lbl_Email: TsLabel;
    lbl_Telefone: TsLabel;
    lbl_Celular: TsLabel;
    edt_Logradouro: TsEdit;
    edt_Numero: TsEdit;
    edt_Bairro: TsEdit;
    edt_Complemento: TsEdit;
    edt_IdCidade: TsEdit;
    edt_Cidade: TsEdit;
    edt_UF: TsEdit;
    edt_Pais: TsEdit;
    edt_Email: TsEdit;
    btn_BuscarCidade: TsBitBtn;
    edt_CEP: TsMaskEdit;
    edt_Telefone: TsMaskEdit;
    edt_Celular: TsMaskEdit;
    edt_RG_IE: TsEdit;
    grpBox_Produtos: TsGroupBox;
    lbl_IdCondicaoPagamento: TsLabel;
    lbl_CondicaoPagamento: TsLabel;
    edt_Produto: TsEdit;
    edt_IdProduto: TsEdit;
    btn_BuscarProduto: TsBitBtn;
    gridProduto: TStringGrid;
    btn_LimparProduto: TsBitBtn;
    btn_Add_Produto: TsBitBtn;
    procedure btn_SalvarClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure btn_BuscarCidadeClick(Sender: TObject);
    procedure edt_IdCidadeExit(Sender: TObject);
    procedure edt_CPF_CNPJExit(Sender: TObject);
    procedure edt_CEPClick(Sender: TObject);
    procedure edt_TelefoneClick(Sender: TObject);
    procedure edt_CelularClick(Sender: TObject);
    procedure edt_CPF_CNPJClick(Sender: TObject);
    procedure edt_RG_IEClick(Sender: TObject);
    procedure rg_TipoPessoaClick(Sender: TObject);
    procedure edt_IdCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure btn_BuscarCondicaoPgtoClick(Sender: TObject);
    procedure edt_EmailExit(Sender: TObject);
    procedure edt_IdCondicaoPgtoExit(Sender: TObject);
    procedure edt_IdCondicaoPgtoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_DataNasc_FundExit(Sender: TObject);
    procedure edt_IdProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_IdProdutoExit(Sender: TObject);
    procedure btn_BuscarProdutoClick(Sender: TObject);
    procedure btn_Add_ProdutoClick(Sender: TObject);
    procedure btn_LimparProdutoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    umFornecedor              : Fornecedor;
    umaCidade                 : Cidade;
    umaCtrlFornecedor         : CtrlFornecedor;
    umaCtrlCidade             : CtrlCidade;
    umFrmConCidade            : TFrmConCidade;
    umaCondicaoPagamento      : CondicaoPagamento;
    umFrmConCondicaoPagamento : TFrmConCondicaoPagamento;
    umaCtrlCondicaoPagamento  : CtrlCondicaoPagamento;
    umProduto                 : Produto;
    umFrmConProduto           : TFrmConProduto;
    umaCtrlProduto             : CtrlProduto;
  public
    nomeAlterado : string;
    telAlterado  : string;
    procedure ConhecaObj(vFornecedor:Fornecedor; vCtrlFornecedor:CtrlFornecedor; TipoFavorecido:String);
    procedure HabilitaCampos;
    procedure LimpaCampos;
    procedure CarregaObj;
    procedure CarregaGridProduto;
    function VerificaProduto : Boolean;
  end;

var
  FrmCadFornecedor: TFrmCadFornecedor;

implementation

{$R *.dfm}

{ TFrmCadFornecedor }

procedure TFrmCadFornecedor.btn_BuscarCidadeClick(Sender: TObject);
begin
  inherited;
  umFrmConCidade := TFrmConCidade.Create(nil);
  umFrmConCidade.ConhecaObj(umFornecedor.getumEndereco.getumaCidade);
  umFrmConCidade.btn_Sair.Caption := 'Selecionar';
  umFrmConCidade.ShowModal;
  self.edt_IdCidade.Text  := inttostr(umFornecedor.getumEndereco.getumaCidade.getId);
  self.edt_Cidade.Text    := umFornecedor.getumEndereco.getumaCidade.getDescricao;
  self.edt_UF.Text        := umFornecedor.getumEndereco.getumaCidade.getumEstado.getUF;
  Self.edt_Pais.Text      := umFornecedor.getumEndereco.getumaCidade.getumEstado.getumPais.getDescricao;
end;

procedure TFrmCadFornecedor.btn_BuscarCondicaoPgtoClick(Sender: TObject);
begin
  inherited;
  umFrmConCondicaoPagamento := TFrmConCondicaoPagamento.Create(nil);
  umFrmConCondicaoPagamento.ConhecaObj(umFornecedor.getUmaCondicaoPgto);
  umFrmConCondicaoPagamento.btn_Sair.Caption := 'Selecionar';
  umFrmConCondicaoPagamento.ShowModal;
  self.edt_IdCondicaoPgto.Text  := inttostr(umFornecedor.getUmaCondicaoPgto.getId);
  self.edt_CondicaoPgto.Text    := umFornecedor.getUmaCondicaoPgto.getDescricao;
end;

procedure TFrmCadFornecedor.btn_SairClick(Sender: TObject);
begin
  inherited;
  self.HabilitaCampos;
end;

procedure TFrmCadFornecedor.btn_SalvarClick(Sender: TObject);
var
  dataAtual : TDateTime;
  msg: string;
  umEndereco : Endereco;
begin
    inherited;
    dataAtual := Date;
    if edt_Nome_RazaoSocial.Text = '' then
      begin
          if Self.rg_TipoPessoa.ItemIndex = 0 then
            begin
              ShowMessage('Campo Nome não pode estar em branco!');
              edt_Nome_RazaoSocial.SetFocus;
            end
          else
            begin
                ShowMessage('Campo RazãoSocial não pode estar em branco!');
                edt_Nome_RazaoSocial.SetFocus;
            end;
      end
  else if edt_Logradouro.Text = '' then
      begin
          ShowMessage('Campo Logradouro não pode estar em branco!');
          edt_Logradouro.SetFocus;
      end
    else if edt_Numero.Text = '' then
      begin
          ShowMessage('Campo Número não pode estar em branco!');
          edt_Numero.SetFocus;
      end
    else if edt_Bairro.Text = ''  then
      begin
          ShowMessage('Campo Bairro não pode estar em branco!');
          edt_Bairro.SetFocus;
      end
    else if edt_IdCidade.Text = '' then
      begin
          ShowMessage('Deve ser informado uma Cidade!');
          edt_IdCidade.SetFocus;
      end
    else if (edt_CPF_CNPJ.Text = '') and ((Self.edt_Pais.Text = 'BRASIL') OR (Self.edt_Pais.Text = 'BRAZIL'))then
      begin
          if Self.rg_TipoPessoa.ItemIndex = 0 then
            begin
              ShowMessage('Campo CPF é obrigatório!');
              edt_CPF_CNPJ.SetFocus
            end
          else
            begin
                ShowMessage('Campo CNPJ é obrigatório!');
                edt_CPF_CNPJ.SetFocus
            end;
      end
    else if edt_DataNasc_Fund.Date = StrToDate('30/12/1899') then
      begin
          if Self.rg_TipoPessoa.ItemIndex = 0 then
            begin
              ShowMessage('Favor informar a Data de Nascimento!');
              edt_DataNasc_Fund.SetFocus
            end
          else
            begin
                ShowMessage('Favor informar a Data de Fundação');
                edt_DataNasc_Fund.SetFocus
            end;
      end
    else if edt_IdCondicaoPgto.Text = '' then
    begin
        ShowMessage('Deve ser definido uma Condição de Pagamento!');
        edt_Numero.SetFocus;
    end
    else
      if self.btn_Salvar.Caption = 'Salvar' then
        begin
            if (nomeAlterado <> edt_Nome_RazaoSocial.Text) then
              umFornecedor.verificaNome := True
            else
              umFornecedor.verificaNome := False;
            if (telAlterado <> edt_Telefone.Text) then
              umFornecedor.verificaTel := True
            else
              umFornecedor.verificaTel := False;

            if (Self.Caption = 'Cadastro Fornecedor') then
              umFornecedor.setTipoFavorecido('F')
            else
              umFornecedor.setTipoFavorecido('T');

            umFornecedor.setNome_RazaoSoCial(edt_Nome_RazaoSocial.Text);

            umEndereco := Endereco.CrieObjeto;

            umEndereco.setLogradouro(edt_Logradouro.Text);
            umEndereco.setNumero(edt_Numero.Text);
            umEndereco.setCEP(edt_CEP.Text);
            umEndereco.setBairro(edt_Bairro.Text);
            umEndereco.setComplemento(edt_Complemento.Text);
            umEndereco.getumaCidade.setId(StrToInt(edt_IdCidade.Text));
            umEndereco.getumaCidade.setDescricao(edt_Cidade.Text);
            umEndereco.getumaCidade.getumEstado.setUF(edt_UF.Text);
            umEndereco.getumaCidade.getumEstado.getumPais.setDescricao(edt_Pais.Text);

            umFornecedor.setumEndereco(umEndereco);

            umFornecedor.setTipoPessoa(rg_TipoPessoa.Items[rg_TipoPessoa.ItemIndex]);
            umFornecedor.setEmail(edt_Email.Text);
            umFornecedor.setTelefone(edt_Telefone.Text);
            umFornecedor.setCelular(edt_Celular.Text);
            if (edt_CPF_CNPJ.Text <> '') then
              umFornecedor.setCPF_CNPJ(addMascara(edt_CPF_CNPJ.Text, rg_TipoPessoa.ItemIndex));
            umFornecedor.setRG_IE(edt_RG_IE.Text);
            umFornecedor.setDataNasc_Fund(edt_DataNasc_Fund.Date);
            umFornecedor.setObservacao(edt_Observacao.Text);
            umFornecedor.getUmaCondicaoPgto.setId(StrToInt(edt_IdCondicaoPgto.Text));
            umFornecedor.getUmaCondicaoPgto.setDescricao(edt_CondicaoPgto.Text);
            umFornecedor.setDataCadastro(edt_DataCadastro.Date);
            if self.edt_DataUltAlteracao.Date <> dataAtual then
              umFornecedor.setDataUltAlteracao(dataAtual);
             msg := umaCtrlFornecedor.Salvar(umFornecedor);
            if (Copy(msg,0,8) = 'Esse CPF') or (Copy(msg,0,9) = 'Esse CNPJ')then
               ShowMessage(msg)
            else
            begin
              if Copy(msg,0,16) = 'Ocorreu um erro!' then
                  Application.MessageBox(PChar(msg), 'Erro!', MB_OK + MB_ICONSTOP)
              else
                  ShowMessage(msg);
              Close;
            end;
        end
      else
        if self.btn_Salvar.Caption = 'Excluir' then
          begin
              msg := umaCtrlFornecedor.Excluir(umFornecedor);
              showmessage(msg);
              close;
          end;
end;

procedure TFrmCadFornecedor.CarregaObj;
begin
  if (umFornecedor.getTipoPessoa = 'Física') then
    Self.rg_TipoPessoa.ItemIndex := 0
  else
    Self.rg_TipoPessoa.ItemIndex := 1;
  nomeAlterado                    := umFornecedor.getNome_RazaoSoCial;
  telAlterado                     := umFornecedor.getTelefone;
  Self.edt_IdCliente.Text         := IntToStr(umFornecedor.getId);
  Self.edt_Nome_RazaoSocial.Text  := nomeAlterado;
  Self.edt_Logradouro.Text        := umFornecedor.getumEndereco.getLogradouro;
  Self.edt_Numero.Text            := umFornecedor.getumEndereco.getNumero;
  Self.edt_CEP.Text               := umFornecedor.getumEndereco.getCEP;
  Self.edt_Bairro.Text            := umFornecedor.getumEndereco.getBairro;
  Self.edt_Complemento.Text       := umFornecedor.getumEndereco.getComplemento;
  Self.edt_IdCidade.Text          := IntToStr(umFornecedor.getumEndereco.getumaCidade.getId);
  Self.edt_Cidade.Text            := umFornecedor.getumEndereco.getumaCidade.getDescricao;
  Self.edt_UF.Text                := umFornecedor.getumEndereco.getumaCidade.getumEstado.getUF;
  Self.edt_Pais.Text              := umFornecedor.getumEndereco.getumaCidade.getumEstado.getumPais.getDescricao;
  Self.edt_Email.Text             := umFornecedor.getEmail;
  Self.edt_Telefone.Text          := telAlterado;
  Self.edt_Celular.Text           := umFornecedor.getCelular;
  Self.edt_CPF_CNPJ.Text          := removeMascara(umFornecedor.getCPF_CNPJ);
  Self.edt_RG_IE.Text             := umFornecedor.getRG_IE;
  Self.edt_DataNasc_Fund.Date     := umFornecedor.getDataNasc_Fund;
  Self.edt_Observacao.Text        := umFornecedor.getObservacao;
  Self.edt_IdCondicaoPgto.Text    := IntToStr(umFornecedor.getUmaCondicaoPgto.getId);
  Self.edt_CondicaoPgto.Text      := umFornecedor.getUmaCondicaoPgto.getDescricao;
  Self.edt_DataCadastro.Date      := umFornecedor.getDataCadastro;
  Self.edt_DataUltAlteracao.Date  := umFornecedor.getDataUltAlteracao;
  CarregaGridProduto;
end;

procedure TFrmCadFornecedor.ConhecaObj(vFornecedor:Fornecedor; vCtrlFornecedor:CtrlFornecedor; TipoFavorecido:String);
begin
  Self.Caption      := TipoFavorecido;
  umFornecedor      := vFornecedor;
  umaCtrlFornecedor := vCtrlFornecedor;
  Self.HabilitaCampos;
  Self.LimpaCampos;
  Self.grpBox_Produtos.Hide;
  if umFornecedor.getId = 0 then
    umFornecedor.LimparListaProduto;
//  if TipoFavorecido = 'Cadastro Transportadora' then
//    Self.grpBox_Produtos.Hide;
end;

procedure TFrmCadFornecedor.HabilitaCampos;
begin
  Self.edt_Nome_RazaoSocial.Enabled := True;
  Self.edt_Logradouro.Enabled := True;
  Self.edt_Numero.Enabled := True;
  Self.edt_CEP.Enabled := True;
  Self.edt_Bairro.Enabled := True;
  Self.edt_Complemento.Enabled := True;
  Self.edt_IdCidade.Enabled := True;
  Self.btn_BuscarCidade.Enabled := True;
  Self.edt_Email.Enabled := True;
  Self.edt_Telefone.Enabled := True;
  Self.edt_Celular.Enabled := True;
  Self.edt_CPF_CNPJ.Enabled := True;
  Self.edt_RG_IE.Enabled := True;
  Self.edt_DataNasc_Fund.Enabled := True;
  Self.edt_IdCondicaoPgto.Enabled := True;
  Self.btn_BuscarCondicaoPgto.Enabled := True;
  Self.edt_IdProduto.Enabled := True;
  Self.btn_BuscarProduto.Enabled := True;
  Self.btn_Add_Produto.Enabled := True;
  Self.btn_LimparProduto.Enabled := True;
  Self.gridProduto.Enabled := True;
  Self.edt_Observacao.Enabled := True;
end;

procedure TFrmCadFornecedor.LimpaCampos;
var dataAtual : TDateTime;
begin
    dataAtual := Date;
    Self.edt_IdCliente.Clear;
    Self.edt_Nome_RazaoSocial.Clear;
    Self.edt_Logradouro.Clear;
    Self.edt_Numero.Clear;
    Self.edt_CEP.Clear;
    Self.edt_Bairro.Clear;
    Self.edt_Complemento.Clear;
    Self.edt_IdCidade.Clear;
    Self.edt_Cidade.Clear;
    Self.edt_UF.Clear;
    Self.edt_Pais.Clear;
    Self.edt_Email.Clear;
    Self.edt_Telefone.Clear;
    Self.edt_Celular.Clear;
    Self.edt_CPF_CNPJ.Clear;
    Self.edt_RG_IE.Clear;
    Self.edt_DataNasc_Fund.Clear;
    Self.edt_Observacao.Clear;
    Self.edt_IdCondicaoPgto.Clear;
    Self.edt_CondicaoPgto.Clear;
    Self.edt_DataCadastro.Date := dataAtual;
    Self.edt_DataUltAlteracao.Date := dataAtual;
end;

procedure TFrmCadFornecedor.edt_IdCidadeExit(Sender: TObject);
begin
  inherited;
   if Self.edt_IdCidade.Text <> '' then
     begin
        Self.edt_Cidade.Clear;
        umaCtrlCidade := CtrlCidade.CrieObjeto;
        umFornecedor.getumEndereco.getumaCidade.setId(StrToInt(Self.edt_IdCidade.Text));
        umFornecedor.getumEndereco.getumaCidade.setDescricao(Self.edt_Cidade.Text);
        if not umaCtrlCidade.Buscar(umFornecedor.getumEndereco.getumaCidade) then
          begin
              MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
              self.edt_IdCidade.Clear;
              self.edt_Cidade.Clear;
              Self.edt_UF.Clear;
              Self.edt_Pais.Clear;
          end
        else
          begin
              umaCtrlCidade.Carrega(umFornecedor.getumEndereco.getumaCidade);
              Self.edt_IdCidade.Text := IntToStr(umFornecedor.getumEndereco.getumaCidade.getId);
              Self.edt_Cidade.Text := umFornecedor.getumEndereco.getumaCidade.getDescricao;
              Self.edt_UF.Text := umFornecedor.getumEndereco.getumaCidade.getumEstado.getUF;
              Self.edt_Pais.Text   := umFornecedor.getumEndereco.getumaCidade.getumEstado.getumPais.getDescricao;
          end;
        umaCidade := Cidade.CrieObjeto;
        umaCtrlCidade.Buscar(umaCidade);
     end
   else
     begin
       self.edt_IdCidade.Clear;
       self.edt_Cidade.Clear;
     end;
end;

procedure TFrmCadFornecedor.edt_IdCondicaoPgtoExit(Sender: TObject);
var umaCtrlCondicaoPagamento  : CtrlCondicaoPagamento;
begin
  inherited;
  if Self.edt_IdCondicaoPgto.Text <> '' then
   begin
      Self.edt_CondicaoPgto.Clear;
      umaCtrlCondicaoPagamento := CtrlCondicaoPagamento.CrieObjeto;
      umFornecedor.getUmaCondicaoPgto.setId(StrToInt(Self.edt_IdCondicaoPgto.Text));
      umFornecedor.getUmaCondicaoPgto.setDescricao(Self.edt_CondicaoPgto.Text);
      umFornecedor.getUmaCondicaoPgto.getUmaFormaPagamento.setId(0);
      if not umaCtrlCondicaoPagamento.Buscar(umFornecedor.getUmaCondicaoPgto) then
        begin
          MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
          self.edt_IdCondicaoPgto.Clear;
          self.edt_CondicaoPgto.Clear;
          umFornecedor.getUmaCondicaoPgto.setId(0);
        end
      else
        begin
          umaCtrlCondicaoPagamento.Carrega(umFornecedor.getUmaCondicaoPgto);
          Self.edt_IdCondicaoPgto.Text := IntToStr(umFornecedor.getUmaCondicaoPgto.getId);
          Self.edt_CondicaoPgto.Text := umFornecedor.getUmaCondicaoPgto.getDescricao;
        end;
      umaCondicaoPagamento := CondicaoPagamento.CrieObjeto;
      umaCtrlCondicaoPagamento.Buscar(umaCondicaoPagamento);
   end
  else
   begin
     self.edt_IdCondicaoPgto.Clear;
     self.edt_CondicaoPgto.Clear;
   end;
end;

//Grid e Buscar Produto
procedure TFrmCadFornecedor.edt_IdProdutoExit(Sender: TObject);
begin
  inherited;
   if Self.edt_IdProduto.Text <> '' then
   begin
      if (umFornecedor.getUmProduto = nil) or (umFornecedor.getUmProduto.getId <> 0)then
        umFornecedor.CrieObejtoProduto;

      Self.edt_Produto.Clear;
      umaCtrlProduto := CtrlProduto.CrieObjeto;
      umFornecedor.getUmProduto.setId(StrToInt(Self.edt_IdProduto.Text));
      umFornecedor.getUmProduto.setDescricao(Self.edt_Produto.Text);
      if not umaCtrlProduto.Buscar(umFornecedor.getUmProduto) then
      begin
        MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
        self.edt_IdProduto.Clear;
        self.edt_Produto.Clear;
        umFornecedor.getUmProduto.setId(0);
      end
      else if (Self.VerificaProduto) then
      begin
        umaCtrlProduto.Carrega(umFornecedor.getUmProduto);
        self.edt_IdProduto.Text := inttostr(umFornecedor.getUmProduto.getId);
        self.edt_Produto.Text    := umFornecedor.getUmProduto.getDescricao;
      end;
      umProduto := Produto.CrieObjeto;
      umaCtrlProduto.Buscar(umProduto);
   end
   else
   begin
      self.edt_IdProduto.Clear;
      self.edt_Produto.Clear;
   end;
end;

procedure TFrmCadFornecedor.btn_BuscarProdutoClick(Sender: TObject);
begin
  inherited;
  if (umFornecedor.getUmProduto = nil) or (umFornecedor.getUmProduto.getId <> 0)then
      umFornecedor.CrieObejtoProduto;

  umFrmConProduto := TFrmConProduto.Create(nil);
  umFrmConProduto.ConhecaObj(umFornecedor.getUmProduto);
  umFrmConProduto.btn_Sair.Caption := 'Selecionar';
  umFrmConProduto.ShowModal;
  if (Self.VerificaProduto) then
    if umFornecedor.getUmProduto.getId <> 0 then
    begin
      self.edt_IdProduto.Text := inttostr(umFornecedor.getUmProduto.getId);
      self.edt_Produto.Text   := umFornecedor.getUmProduto.getDescricao;
    end;
end;

procedure TFrmCadFornecedor.btn_Add_ProdutoClick(Sender: TObject);
begin
  inherited;
  if edt_IdProduto.Text = '' then
  begin
      ShowMessage('Favor selecionar um produto!');
      edt_IdProduto.SetFocus;
  end
  else
  begin
    umFornecedor.addProduto(umFornecedor.getUmProduto);
    CarregaGridProduto;
    Self.edt_IdProduto.Clear;
    Self.edt_Produto.Clear
  end;
end;

procedure TFrmCadFornecedor.btn_LimparProdutoClick(Sender: TObject);
var i,j : Integer;
begin
  inherited;
  if gridProduto.Row <> 0 then
  begin
    umFornecedor.removeItemProdutoVenda(Self.gridProduto.Row -1);
    for j := 0 to (gridProduto.ColCount - 1) do
      for i := 1 to gridProduto.RowCount - 1do
        gridProduto.Cells[j, i] := '';
    gridProduto.Row := 1;
    CarregaGridProduto;
  end;
end;

procedure TFrmCadFornecedor.CarregaGridProduto;
var i : Integer;
begin
  if ((self.gridProduto.RowCount - 1) = 1 ) and (umFornecedor.CountProdutos = 0)then
  begin
    for i := 0 to  self.gridProduto.ColCount -1  do
       self.gridProduto.Cells[i,1] := EmptyStr;
    self.gridProduto.RowCount := 1;
  end
  else
  begin
    for i := 1 to umFornecedor.CountProdutos do
    begin
      self.gridProduto.RowCount := i + 1;
      if (self.gridProduto.Cells[0, i] = '') then
        begin
          self.gridProduto.Cells[0, i] := IntToStr(umFornecedor.getProduto(i-1).getId);
          self.gridProduto.Cells[1, i] := umFornecedor.getProduto(i-1).getDescricao;
          self.gridProduto.Cells[2, i] := FormatFloat('#0.000', umFornecedor.getProduto(i-1).getQuantidade);
          self.gridProduto.Cells[3, i] := FloatToStr(umFornecedor.getProduto(i-1).getPrecoVenda);
        end;
    end;
  end;
end;

function TFrmCadFornecedor.VerificaProduto: Boolean;
var i : Integer;
begin
  if (gridProduto.RowCount = 1) then
    Result := True;
  for i:= 1 to umFornecedor.CountProdutos do
    if (Self.gridProduto.Cells[0,i] = IntToStr(umFornecedor.getumProduto.getId))then
    begin
      MessageDlg('Esse Produto já está adicionado na Lista!', mtInformation, [mbOK], 0);
      Self.edt_IdProduto.SetFocus;
      Self.edt_IdProduto.Clear;
      self.edt_Produto.Clear;
      Result := False;
      Exit;
    end
    else
      Result:= True;
end;

procedure TFrmCadFornecedor.edt_CPF_CNPJExit(Sender: TObject);
var cpf_cnpj : String;
begin
  inherited;
  cpf_cnpj := removeEspacos(Self.edt_CPF_CNPJ.Text);
  If self.edt_CPF_CNPJ.Text <> '' then
    if (Length(cpf_cnpj) < 11) and (Length(cpf_cnpj) < 14) then
       begin
         if Self.rg_TipoPessoa.ItemIndex = 0 then
         begin
            MessageDlg('ATENÇÃO: O número informado NÃO representa os 11 digitos válido do CPF.',mtWarning,[mbOK],0);
            Self.edt_CPF_CNPJ.SetFocus;
         end
         else
         begin
            MessageDlg('ATENÇÃO: O número informado NÃO representa os 14 digitos válido do CNPJ.',mtWarning,[mbOK],0);
            Self.edt_CPF_CNPJ.SetFocus;
         end;
       end
    else
      If validar_CPF_CNPJ(cpf_cnpj) = False Then
        Begin
          if Self.rg_TipoPessoa.ItemIndex = 0 then
          begin
            MessageDlg('ATENÇÃO: CPF inválido!',mtWarning,[mbOK],0);
            Self.edt_CPF_CNPJ.SetFocus;
          end
          else
          begin
            MessageDlg('ATENÇÃO: CNPJ inválido!',mtWarning,[mbOK],0);
            Self.edt_CPF_CNPJ.SetFocus;
          end;
        End;
end;

procedure TFrmCadFornecedor.edt_DataNasc_FundExit(Sender: TObject);
begin
  inherited;
  if (edt_DataNasc_Fund.Text <> '  /  /    ') then
    if (validarData(edt_DataNasc_Fund.Date, rg_TipoPessoa.ItemIndex )) then
      edt_DataNasc_Fund.SetFocus;
end;

procedure TFrmCadFornecedor.edt_EmailExit(Sender: TObject);
begin
  inherited;
  if Self.edt_Email.Text <> '' then
    if (not validarEmail(Self.edt_Email.Text)) then
      begin
         ShowMessage('Email inválido!');
         self.edt_Email.SetFocus;
      end;
end;

procedure TFrmCadFornecedor.rg_TipoPessoaClick(Sender: TObject);
  begin
    inherited;
    //rg_TipoPessoa.Items[0];
    if rg_TipoPessoa.ItemIndex = 0 then
      begin
        lbl_Nome_RazaoSocial.Caption := 'Nome *';
        lbl_RG_IE.Caption := 'RG';
        lbl_CPF_CNPJ.Caption := 'CPF';
        edt_CPF_CNPJ.Clear;
        edt_CPF_CNPJ.EditMask := '999.999.999.99!;0;';
        lbl_DataNasc_Fund.Caption := 'Data Nascimento *';
      end
    else
      begin
        lbl_Nome_RazaoSocial.Caption := 'Razão Social *';
        lbl_RG_IE.Caption := 'IE';
        lbl_CPF_CNPJ.Caption := 'CNPJ';
        edt_CPF_CNPJ.Clear;
        edt_CPF_CNPJ.EditMask := '99.999.999/9999-99!;0;';
        lbl_DataNasc_Fund.Caption := 'Data Fundação *';
      end;

  end;

//////////////Funcionalidades dos Campos///////////////

procedure TFrmCadFornecedor.edt_IdProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CampoNumero(Sender, Key);
end;

procedure TFrmCadFornecedor.edt_IdCidadeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    CampoNumero(Sender,Key);
end;

procedure TFrmCadFornecedor.edt_RG_IEClick(Sender: TObject);
begin
  inherited;
    edt_RG_IE.SelStart:=0;
end;

procedure TFrmCadFornecedor.edt_TelefoneClick(Sender: TObject);
begin
  inherited;
    edt_Telefone.SelStart:=0;
end;

procedure TFrmCadFornecedor.edt_CelularClick(Sender: TObject);
begin
  inherited;
   edt_Celular.SelStart:=0;
end;

procedure TFrmCadFornecedor.edt_CEPClick(Sender: TObject);
begin
  inherited;
    edt_CEP.SelStart:=0;
end;

procedure TFrmCadFornecedor.edt_CPF_CNPJClick(Sender: TObject);
begin
  inherited;
    edt_CPF_CNPJ.SelStart:=0;
end;

procedure TFrmCadFornecedor.edt_IdCondicaoPgtoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CampoNumero(Sender, Key);
end;

procedure TFrmCadFornecedor.FormActivate(Sender: TObject);
begin
  inherited;
  self.gridProduto.ColWidths[1] := 252;
  self.gridProduto.Cells[0,0] := 'Código';
  self.gridProduto.Cells[1,0] := 'Descrição';
  self.gridProduto.Cells[2,0] := 'Quantidade';
  self.gridProduto.Cells[3,0] := 'Valor';
end;

end.
