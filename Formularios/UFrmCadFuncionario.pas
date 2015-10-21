unit UFrmCadFuncionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCadastro, StdCtrls, sEdit, sGroupBox, sMemo, sCustomComboEdit,
  sTooledit, Mask, sMaskEdit, sLabel, Buttons, sBitBtn, UFuncionario, UCidade,
  UFrmConCidade, UCargo, UFrmConCargo, UCtrlFuncionario, UCtrlCargo, UEndereco,
  UCtrlCidade, UValidacao, UComuns;

type
  TFrmCadFuncionario = class(TFrmCadastro)
    lbl_IdFuncionario: TsLabel;
    lbl_Nome: TsLabel;
    lbl_DataCadastro: TsLabel;
    lbl_Observacao: TsLabel;
    edt_Observacao: TsMemo;
    edt_IdFuncionario: TsEdit;
    edt_DataCadastro: TsDateEdit;
    edt_Nome: TsEdit;
    sGroupBox4: TsGroupBox;
    lbl_idCargo: TsLabel;
    lbl_Cargo: TsLabel;
    edt_IdCargo: TsEdit;
    edt_Cargo: TsEdit;
    btn_BuscarCargo: TsBitBtn;
    sGroupBox3: TsGroupBox;
    edt_DataAdmissao: TsDateEdit;
    edt_DataDemissao: TsDateEdit;
    lbl_DataAdmissao: TsLabel;
    lbl_DataDemissao: TsLabel;
    edt_DataAlteracao: TsDateEdit;
    lbl_DataUltAlteracao: TsLabel;
    sGroupBox5: TsGroupBox;
    lbl1: TsLabel;
    edt_DataNascimento: TsDateEdit;
    lbl2: TsLabel;
    lbl3: TsLabel;
    edt_CTPS: TsEdit;
    edt_CNH: TsEdit;
    edt_CPF: TsMaskEdit;
    lbl_RG: TsLabel;
    lbl_CPF: TsLabel;
    edt_DataVencimento: TsDateEdit;
    lbl4: TsLabel;
    edt_RG: TsEdit;
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
    procedure btn_SalvarClick(Sender: TObject);
    procedure btn_BuscarCargoClick(Sender: TObject);
    procedure edt_IdCargoExit(Sender: TObject);
    procedure edt_IdCidadeExit(Sender: TObject);
    procedure btn_BuscarCidadeClick(Sender: TObject);
    procedure edt_CPFExit(Sender: TObject);
    procedure edt_CPFClick(Sender: TObject);
    procedure edt_CEPClick(Sender: TObject);
    procedure edt_EmailExit(Sender: TObject);
    procedure edt_IdCargoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_IdCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edt_CTPSKeyPress(Sender: TObject; var Key: Char);
    procedure edt_CNHKeyPress(Sender: TObject; var Key: Char);
    procedure edt_TelefoneClick(Sender: TObject);
    procedure edt_CelularClick(Sender: TObject);
    procedure edt_DataVencimentoExit(Sender: TObject);
    procedure edt_DataNascimentoExit(Sender: TObject);
    procedure edt_DataAdmissaoExit(Sender: TObject);
    procedure edt_DataDemissaoExit(Sender: TObject);
  private
    umFuncionario         : Funcionario;
    umaCtrlFuncionario    : CtrlFuncionario;
    umaCidade             : Cidade;
    umFrmConCidade        : TFrmConCidade;
    umCargo               : Cargo;
    umFrmConCargo         : TFrmConCargo;
    umaCtrlCargo          : CtrlCargo;
    umEndereco            : Endereco;
  public
      nomeAlterado : string;
      procedure ConhecaObj(vFuncionario: Funcionario; vCtrlFuncionario: CtrlFuncionario);
      procedure HabilitaCampos;
      procedure LimpaCampos;
      procedure CarregaObj;
  end;

var
  FrmCadFuncionario: TFrmCadFuncionario;

implementation

{$R *.dfm}

{ TFrmCadFuncionario }

procedure TFrmCadFuncionario.btn_BuscarCargoClick(Sender: TObject);
begin
  inherited;
    umFrmConCargo := TFrmConCargo.Create(nil);
    umFrmConCargo.ConhecaObjeto(umFuncionario.getUmCargo);
    umFrmConCargo.btn_Sair.Caption := 'Selecionar';
    umFrmConCargo.ShowModal;
    self.edt_IdCargo.Text  := inttostr(umFuncionario.getUmCargo.getId);
    self.edt_Cargo.Text    := umFuncionario.getUmCargo.getDescricao;
end;

procedure TFrmCadFuncionario.btn_BuscarCidadeClick(Sender: TObject);
begin
  inherited;
    umFrmConCidade := TFrmConCidade.Create(nil);
    umFrmConCidade.ConhecaObj(umFuncionario.getumEndereco.getumaCidade);
    umFrmConCidade.btn_Sair.Caption := 'Selecionar';
    umFrmConCidade.ShowModal;
    self.edt_IdCidade.Text := inttostr(umFuncionario.getumEndereco.getumaCidade.getId);
    self.edt_Cidade.Text   := umFuncionario.getumEndereco.getumaCidade.getDescricao;
    self.edt_UF.Text       := umFuncionario.getumEndereco.getumaCidade.getumEstado.getUF;
    Self.edt_Pais.Text     := umFuncionario.getumEndereco.getumaCidade.getumEstado.getumPais.getDescricao;
end;

procedure TFrmCadFuncionario.btn_SalvarClick(Sender: TObject);
var
  dataAtual : TDateTime;
  msg       : string;
begin
    inherited;
    dataAtual := Date;
    if edt_Nome.Text = '' then
      begin
        ShowMessage('Campo Nome não pode estar em branco!');
        edt_Nome.SetFocus;
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
    else if edt_IdCargo.Text = '' then
      begin
          ShowMessage('Favor definir um cargo para o funcinário!');
          edt_Numero.SetFocus;
      end
    else if (edt_CPF.Text = '') and ((Self.edt_Pais.Text = 'BRASIL') OR (Self.edt_Pais.Text = 'BRAZIL'))then
      begin
          ShowMessage('Campo CPF é obrigatório!');
          edt_CPF.SetFocus
      end
    else if edt_DataNascimento.Date = StrToDate('30/12/1899')  then
      begin
          ShowMessage('Favor informar a Data de Nascimento!');
          edt_DataNascimento.SetFocus
      end
    else if edt_CTPS.Text = ''  then
    begin
        ShowMessage('Favor informar o número da Carteira de Trabalho!');
        edt_CTPS.SetFocus
    end
    else if (edt_DataVencimento.Date = StrToDate('30/12/1899')) and (edt_CNH.Text <> '') then
    begin
        ShowMessage('Favor inserir a validade da CNH!');
        edt_DataVencimento.SetFocus
    end
    else if self.btn_Salvar.Caption = 'Salvar' then
      begin
          if (nomeAlterado <> edt_Nome.Text) then
            umFuncionario.verificaNome := True
          else
            umFuncionario.verificaNome := False;
          umFuncionario.setNome_RazaoSoCial(edt_Nome.Text);

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

          umFuncionario.setumEndereco(umEndereco);

          umFuncionario.setEmail(edt_Email.Text);
          umFuncionario.setTelefone(edt_Telefone.Text);
          umFuncionario.setCelular(edt_Celular.Text);
          if (edt_CPF.Text <> '') then
            umFuncionario.setCPF_CNPJ(addMascara(edt_CPF.Text,0));
          umFuncionario.setRG_IE(edt_RG.Text);
          umFuncionario.setCTPS(edt_CTPS.Text);
          umFuncionario.setCNH(edt_CNH.Text);
          umFuncionario.setDataVencimento(edt_DataVencimento.Date);
          umFuncionario.setDataNasc_Fund(edt_DataNascimento.Date);
          umFuncionario.setObservacao(edt_Observacao.Text);
          umFuncionario.getUmCargo.setId(StrToInt(edt_IdCargo.Text));
          umFuncionario.getUmCargo.setDescricao(edt_Cargo.Text);
          umFuncionario.setDataAdmissao(edt_DataAdmissao.Date);
          umFuncionario.setDataDemissao(edt_DataDemissao.Date);
          UmFuncionario.setDataCadastro(edt_DataCadastro.Date);
          if self.edt_DataAlteracao.Date <> dataAtual then
            UmFuncionario.setDataUltAlteracao(dataAtual);
           msg := umaCtrlFuncionario.Salvar(UmFuncionario);
          if (Copy(msg,0,9) = 'Já existe')then
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
    else if self.btn_Salvar.Caption = 'Excluir' then
      begin
          msg := umaCtrlFuncionario.Excluir(UmFuncionario);
          showmessage(msg);
          self.HabilitaCampos;
          self.btn_Salvar.Caption := 'Salvar';
          close;
      end;
end;

procedure TFrmCadFuncionario.CarregaObj;
begin
    nomeAlterado                  := umFuncionario.getNome_RazaoSoCial;
    Self.edt_IdFuncionario.Text   := IntToStr(umFuncionario.getId);
    Self.edt_Nome.Text            := nomeAlterado;
    Self.edt_Logradouro.Text      := umFuncionario.getumEndereco.getLogradouro;
    Self.edt_Numero.Text          := umFuncionario.getumEndereco.getNumero;
    Self.edt_CEP.Text             := umFuncionario.getumEndereco.getCEP;
    Self.edt_Bairro.Text          := umFuncionario.getumEndereco.getBairro;
    Self.edt_Complemento.Text     := umFuncionario.getumEndereco.getComplemento;
    Self.edt_IdCidade.Text        := IntToStr(umFuncionario.getumEndereco.getumaCidade.getId);
    Self.edt_Cidade.Text          := umFuncionario.getumEndereco.getumaCidade.getDescricao;
    Self.edt_UF.Text              := umFuncionario.getumEndereco.getumaCidade.getumEstado.getUF;
    Self.edt_Pais.Text            := umFuncionario.getumEndereco.getumaCidade.getumEstado.getumPais.getDescricao;
    Self.edt_Email.Text           := umFuncionario.getEmail;
    Self.edt_Telefone.Text        := umFuncionario.getTelefone;
    Self.edt_Celular.Text         := umFuncionario.getCelular;
    Self.edt_CPF.Text             := removeMascara(umFuncionario.getCPF_CNPJ);
    Self.edt_RG.Text              := umFuncionario.getRG_IE;
    Self.edt_DataNascimento.Date  := umFuncionario.getDataNasc_Fund;
    Self.edt_CTPS.Text            := umFuncionario.getCTPS;
    Self.edt_CNH.Text             := umFuncionario.getCNH;
    Self.edt_DataVencimento.Date  := umFuncionario.getDataVencimento;
    Self.edt_DataAdmissao.Date    := umFuncionario.getDataAdmissao;
    Self.edt_DataDemissao.Date    := umFuncionario.getDataDemissao;
    Self.edt_Observacao.Text      := umFuncionario.getObservacao;
    Self.edt_IdCargo.Text         := IntToStr(umFuncionario.getUmCargo.getId);
    Self.edt_Cargo.Text           := umFuncionario.getUmCargo.getDescricao;
    Self.edt_DataCadastro.Date    := umFuncionario.getDataCadastro;
    Self.edt_DataAlteracao.Date   := umFuncionario.getDataUltAlteracao;
end;

procedure TFrmCadFuncionario.ConhecaObj(vFuncionario: Funcionario; vCtrlFuncionario : CtrlFuncionario);
begin
   umFuncionario := vFuncionario;
   umaCtrlFuncionario := vCtrlFuncionario;
   HabilitaCampos;
   self.LimpaCampos;
end;

procedure TFrmCadFuncionario.edt_CelularClick(Sender: TObject);
begin
  inherited;
  edt_Celular.SelStart:=0;
end;

procedure TFrmCadFuncionario.edt_CEPClick(Sender: TObject);
begin
  inherited;
    edt_CEP.SelStart:=0
end;

procedure TFrmCadFuncionario.edt_CNHKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CampoNumero(Sender, Key);
end;

procedure TFrmCadFuncionario.edt_CPFClick(Sender: TObject);
begin
  inherited;
    edt_CPF.SelStart:=0
end;

procedure TFrmCadFuncionario.edt_CPFExit(Sender: TObject);
var cpf : String;
begin
  inherited;
  cpf := removeEspacos(edt_CPF.Text);
  if self.edt_CPF.Text <> '' then
    if (Length(cpf) < 11) then
    begin
      MessageDlg('ATENÇÃO: O número informado NÃO representa os 11 digitos válido do CPF.',mtWarning,[mbOK],0);
      Self.edt_CPF.SetFocus;
    end
    else if validar_CPF_CNPJ(cpf) = False Then
    begin
      MessageDlg('ATENÇÃO: CPF inválido!',mtWarning,[mbOK],0);
      Self.edt_CPF.SetFocus;
    end;
end;

procedure TFrmCadFuncionario.edt_CTPSKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CampoNumero(Sender, Key);
end;

procedure TFrmCadFuncionario.edt_DataAdmissaoExit(Sender: TObject);
begin
  inherited;
  if (edt_DataAdmissao.Text <> '  /  /    ') then
    if (validarData(edt_DataAdmissao.Date, 3)) then
      edt_DataAdmissao.SetFocus;
end;

procedure TFrmCadFuncionario.edt_DataDemissaoExit(Sender: TObject);
begin
  inherited;
  if (edt_DataDemissao.Text <> '  /  /    ') then
  begin
    if (validarData(edt_DataDemissao.Date, 3)) then
      edt_DataDemissao.SetFocus
    else if (edt_DataDemissao.Date < edt_DataAdmissao.Date) then
    begin
      MessageDlg('ATENÇÃO: A data de demissão não pode ser menor que a data de admissão.',mtWarning,[mbOK],0);
      Self.edt_DataVencimento.SetFocus;
    end;
  end;
end;

procedure TFrmCadFuncionario.edt_DataNascimentoExit(Sender: TObject);
begin
  inherited;
  if (edt_DataNascimento.Text <> '  /  /    ') then
    if (validarData(edt_DataNascimento.Date, 0)) then
      edt_DataNascimento.SetFocus;
end;

procedure TFrmCadFuncionario.edt_DataVencimentoExit(Sender: TObject);
var DataAtual : TDateTime;
begin
  inherited;
  DataAtual := Date;
  if (edt_DataVencimento.Text <> '  /  /    ') then
  begin
    if (validarData(edt_DataVencimento.Date, 3)) then
      edt_DataVencimento.SetFocus
    else if (edt_DataVencimento.Date < DataAtual) then
    begin
      MessageDlg('ATENÇÃO: Essa CNH está com a Data Vencida.',mtWarning,[mbOK],0);
      Self.edt_DataVencimento.SetFocus;
    end;
  end;
end;

procedure TFrmCadFuncionario.edt_EmailExit(Sender: TObject);
begin
  inherited;
  if Self.edt_Email.Text <> '' then
  if (not validarEmail(Self.edt_Email.Text)) then
    begin
       ShowMessage('Email inválido!');
       self.edt_Email.SetFocus;
    end;
end;

procedure TFrmCadFuncionario.edt_IdCargoExit(Sender: TObject);
var umaCtrlCargo  : CtrlCargo;
begin
  inherited;
  if Self.edt_IdCargo.Text <> '' then
  begin
    Self.edt_Cargo.Clear;
    umaCtrlCargo := CtrlCargo.CrieObjeto;
    umFuncionario.getUmCargo.setId(StrToInt(Self.edt_IdCargo.Text));
    umFuncionario.getUmCargo.setDescricao(Self.edt_Cargo.Text);
    if not umaCtrlCargo.Buscar(umFuncionario.getUmCargo) then
      begin
        MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
        self.edt_IdCargo.Clear;
        self.edt_Cargo.Clear;
        umFuncionario.getUmCargo.setId(0);
      end
    else
      begin
        umaCtrlCargo.Carrega(umFuncionario.getUmCargo);
        Self.edt_IdCargo.Text := IntToStr(umFuncionario.getUmCargo.getId);
        Self.edt_Cargo.Text := umFuncionario.getUmCargo.getDescricao;
      end;
    umCargo := Cargo.CrieObjeto;
    umaCtrlCargo.Buscar(umCargo);
  end
  else
  begin
     self.edt_IdCargo.Clear;
     self.edt_Cargo.Clear;
  end;
end;

procedure TFrmCadFuncionario.edt_IdCargoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  CampoNumero(Sender, Key);
end;

procedure TFrmCadFuncionario.edt_IdCidadeExit(Sender: TObject);
var umaCtrlCidade  : CtrlCidade;
begin
  inherited;
  if Self.edt_IdCidade.Text <> '' then
  begin
    Self.edt_Cidade.Clear;
    umaCtrlCidade := CtrlCidade.CrieObjeto;
    umFuncionario.getumEndereco.getumaCidade.setId(StrToInt(Self.edt_IdCidade.Text));
    umFuncionario.getumEndereco.getumaCidade.setDescricao(Self.edt_Cidade.Text);
    if not umaCtrlCidade.Buscar(umFuncionario.getumEndereco.getumaCidade) then
      begin
        MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
        self.edt_IdCidade.Clear;
        self.edt_Cidade.Clear;
        Self.edt_UF.Clear;
        Self.edt_Pais.Clear;
        umFuncionario.getumEndereco.getumaCidade.setId(0);
      end
    else
      begin
        umaCtrlCidade.Carrega(umFuncionario.getumEndereco.getumaCidade);
        Self.edt_IdCidade.Text := IntToStr(umFuncionario.getumEndereco.getumaCidade.getId);
        Self.edt_Cidade.Text := umFuncionario.getumEndereco.getumaCidade.getDescricao;
        Self.edt_UF.Text := umFuncionario.getumEndereco.getumaCidade.getumEstado.getUF;
        Self.edt_Pais.Text   := umFuncionario.getumEndereco.getumaCidade.getumEstado.getumPais.getDescricao;
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

procedure TFrmCadFuncionario.edt_IdCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  CampoNumero(Sender, Key);
end;

procedure TFrmCadFuncionario.edt_TelefoneClick(Sender: TObject);
begin
  inherited;
  edt_Telefone.SelStart:=0;
end;

procedure TFrmCadFuncionario.HabilitaCampos;
begin
  Self.edt_Nome.Enabled := True;
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
  Self.edt_CPF.Enabled := True;
  Self.edt_RG.Enabled := True;
  Self.edt_CTPS.Enabled := True;
  Self.edt_CNH.Enabled := True;
  Self.edt_DataVencimento.Enabled := True;
  Self.edt_DataNascimento.Enabled := True;
  Self.edt_IdCargo.Enabled := True;
  Self.btn_BuscarCargo.Enabled := True;
  Self.edt_Observacao.Enabled := True;
end;

procedure TFrmCadFuncionario.LimpaCampos;
var i : Integer;
    dataAtual : TDateTime;
begin
    dataAtual := Date;
    for i := 0 to Self.ComponentCount - 1 do
      if (Self.Components[i] is TsEdit) or (Self.Components[i] is TsMaskEdit) then
       begin
         TsEdit(Self.Components[i]).Clear;
         TsMaskEdit(Self.Components[i]).Clear;
       end;
    Self.edt_Observacao.Clear;
//    Self.edt_DataAdmissao.Date  := dataAtual;
    Self.edt_DataCadastro.Date  := dataAtual;
    Self.edt_DataAlteracao.Date :=dataAtual;
end;

end.
