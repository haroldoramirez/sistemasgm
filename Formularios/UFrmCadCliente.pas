unit UFrmCadCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCadastro, StdCtrls, ComCtrls, Mask, sMaskEdit, sCustomComboEdit,
  sTooledit, ExtCtrls, UCliente, UCtrlCliente, UFrmConCidade, UEndereco, Buttons,
  sBitBtn, sGroupBox, sMemo, sLabel, sEdit, UCtrlCidade, UCidade, UValidacao,
  UFrmConCondicaoPagamento, UCondicaoPagamento, UCtrlCondicaoPagamento, UComuns;

type
  TFrmCadCliente = class(TFrmCadastro)
    rg_TipoPessoa: TsRadioGroup;
    lbl_IdCliente: TsLabel;
    lbl_Nome_RazaoSocial: TsLabel;
    lbl_DataCadastro: TsLabel;
    edt_IdCliente: TsEdit;
    edt_DataCadastro: TsDateEdit;
    edt_Nome_RazaoSocial: TsEdit;
    sGroupBox2: TsGroupBox;
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
    lbl_Observacao: TsLabel;
    edt_CEP: TsMaskEdit;
    edt_Telefone: TsMaskEdit;
    edt_Celular: TsMaskEdit;
    sGroupBox5: TsGroupBox;
    lbl_DataUltAlteracao: TsLabel;
    edt_DataUltAlteracao: TsDateEdit;
    sGroupBox4: TsGroupBox;
    lbl_RG_IE: TsLabel;
    lbl_CPF_CNPJ: TsLabel;
    lbl_DataNasc_Fund: TsLabel;
    edt_DataNasc_Fund: TsDateEdit;
    edt_CPF_CNPJ: TsMaskEdit;
    edt_RG_IE: TsEdit;
    sGroupBox3: TsGroupBox;
    lbl_IdCondicaoPgto: TsLabel;
    lbl_CondicaoPgto: TsLabel;
    edt_IdCondicaoPgto: TsEdit;
    edt_CondicaoPgto: TsEdit;
    btn_BuscarCondicaoPgto: TsBitBtn;
    edt_Observacao: TsMemo;
    procedure rg_TipoPessoaClick(Sender: TObject);
    procedure edt_IdCidadeExit(Sender: TObject);
    procedure btn_BuscarCidadeClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure edt_CEPClick(Sender: TObject);
    procedure edt_TelefoneClick(Sender: TObject);
    procedure edt_CelularClick(Sender: TObject);
    procedure edt_CPF_CNPJClick(Sender: TObject);
    procedure edt_CPF_CNPJExit(Sender: TObject);
    procedure edt_IdCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edt_IdCondicaoPgtoKeyPress(Sender: TObject; var Key: Char);
    procedure btn_BuscarCondicaoPgtoClick(Sender: TObject);
    procedure edt_IdCondicaoPgtoExit(Sender: TObject);
    procedure edt_EmailExit(Sender: TObject);
    procedure edt_DataNasc_FundExit(Sender: TObject);
  private
      umCliente                 : Cliente;
      umaCtrlCliente            : CtrlCliente;
      umaCidade                 : Cidade;
      umFrmConCidade            : TFrmConCidade;
      umaCondicaoPagamento      : CondicaoPagamento;
      umFrmConCondicaoPagamento : TFrmConCondicaoPagamento;
      umaCtrlCondicaoPagamento  : CtrlCondicaoPagamento;
      umEndereco                : Endereco;
  public
      nomeAlterado : string;
      telAlterado  : string;
      procedure ConhecaObj(vCliente: Cliente; vCtrlCliente:CtrlCliente);
      procedure HabilitaCampos;
      procedure LimpaCampos;
      procedure CarregaObj;
  end;

var
  FrmCadCliente: TFrmCadCliente;

implementation

{$R *.dfm}

{ TFrmCadCliente }

procedure TFrmCadCliente.btn_BuscarCidadeClick(Sender: TObject);
begin
  inherited;
  umFrmConCidade := TFrmConCidade.Create(nil);
  umFrmConCidade.ConhecaObj(umCliente.getumEndereco.getumaCidade);
  umFrmConCidade.btn_Sair.Caption := 'Selecionar';
  umFrmConCidade.ShowModal;
  self.edt_IdCidade.Text := inttostr(umCliente.getumEndereco.getumaCidade.getId);
  self.edt_Cidade.Text   := umCliente.getumEndereco.getumaCidade.getDescricao;
  self.edt_UF.Text       := umCliente.getumEndereco.getumaCidade.getumEstado.getUF;
  Self.edt_Pais.Text     := umCliente.getumEndereco.getumaCidade.getumEstado.getumPais.getDescricao;
end;

procedure TFrmCadCliente.btn_BuscarCondicaoPgtoClick(Sender: TObject);
begin
  inherited;
  umFrmConCondicaoPagamento := TFrmConCondicaoPagamento.Create(nil);
  umFrmConCondicaoPagamento.ConhecaObj(umCliente.getUmaCondicaoPgto);
  umFrmConCondicaoPagamento.btn_Sair.Caption := 'Selecionar';
  umFrmConCondicaoPagamento.ShowModal;
  self.edt_IdCondicaoPgto.Text := inttostr(umCliente.getUmaCondicaoPgto.getId);
  self.edt_CondicaoPgto.Text    := umCliente.getUmaCondicaoPgto.getDescricao;
end;

procedure TFrmCadCliente.btn_SairClick(Sender: TObject);
begin
  inherited;
  self.HabilitaCampos;
end;

procedure TFrmCadCliente.btn_SalvarClick(Sender: TObject);
var
  dataAtual : TDateTime;
  msg : string;
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
    else if (edt_CPF_CNPJ.Text = '') and ((edt_Pais.Text = 'BRASIL') OR (edt_Pais.Text = 'BRAZIL'))then
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
              umCliente.verificaNome := True
            else
              umCliente.verificaNome := False;
            if (telAlterado <> edt_Telefone.Text) then
              umCliente.verificaTel := True
            else
              umCliente.verificaTel := False;
            umCliente.setNome_RazaoSoCial(edt_Nome_RazaoSocial.Text);

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
            umCliente.setumEndereco(umEndereco);

            umCliente.setTipoPessoa(rg_TipoPessoa.Items[rg_TipoPessoa.ItemIndex]);
            umCliente.setEmail(edt_Email.Text);
            umCliente.setTelefone(edt_Telefone.Text);
            umCliente.setCelular(edt_Celular.Text);
            if (edt_CPF_CNPJ.Text <> '') then
              umCliente.setCPF_CNPJ(addMascara(edt_CPF_CNPJ.Text,rg_TipoPessoa.ItemIndex));
            umCliente.setRG_IE(edt_RG_IE.Text);
            umCliente.setDataNasc_Fund(edt_DataNasc_Fund.Date);
            umCliente.setObservacao(edt_Observacao.Text);
            umCliente.getUmaCondicaoPgto.setId(StrToInt(edt_IdCondicaoPgto.Text));
            umCliente.getUmaCondicaoPgto.setDescricao(edt_CondicaoPgto.Text);
            UmCliente.setDataCadastro(edt_DataCadastro.Date);
            if self.edt_DataUltAlteracao.Date <> dataAtual then
              UmCliente.setDataUltAlteracao(dataAtual);
             msg := umaCtrlCliente.Salvar(UmCliente);
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
              msg := umaCtrlCliente.Excluir(UmCliente);
              showmessage(msg);
              self.btn_Salvar.Caption := 'Salvar';
              Close;
          end;
end;

procedure TFrmCadCliente.CarregaObj;
begin
    if (umCliente.getTipoPessoa = 'Física') then
      Self.rg_TipoPessoa.ItemIndex := 0
    else
      Self.rg_TipoPessoa.ItemIndex := 1;
    nomeAlterado                    := umCliente.getNome_RazaoSoCial;
    telAlterado                     := umCliente.getTelefone;
    Self.edt_IdCliente.Text         := IntToStr(umCliente.getId);
    Self.edt_Nome_RazaoSocial.Text  := nomeAlterado;
    Self.edt_Logradouro.Text        := umCliente.getumEndereco.getLogradouro;
    Self.edt_Numero.Text            := umCliente.getumEndereco.getNumero;
    Self.edt_CEP.Text               := umCliente.getumEndereco.getCEP;
    Self.edt_Bairro.Text            := umCliente.getumEndereco.getBairro;
    Self.edt_Complemento.Text       := umCliente.getumEndereco.getComplemento;
    Self.edt_IdCidade.Text          := IntToStr(umCliente.getumEndereco.getumaCidade.getId);
    Self.edt_Cidade.Text            := umCliente.getumEndereco.getumaCidade.getDescricao;
    Self.edt_UF.Text                := umCliente.getumEndereco.getumaCidade.getumEstado.getUF;
    Self.edt_Pais.Text              := umCliente.getumEndereco.getumaCidade.getumEstado.getumPais.getDescricao;
    Self.edt_Email.Text             := umCliente.getEmail;
    Self.edt_Telefone.Text          := telAlterado;
    Self.edt_Celular.Text           := umCliente.getCelular;
    Self.edt_CPF_CNPJ.Text          := removeMascara(umCliente.getCPF_CNPJ);
    Self.edt_RG_IE.Text             := umCliente.getRG_IE;
    Self.edt_DataNasc_Fund.Date     := umCliente.getDataNasc_Fund;
    Self.edt_Observacao.Text        := umCliente.getObservacao;
    Self.edt_IdCondicaoPgto.Text    := IntToStr(umCliente.getUmaCondicaoPgto.getId);
    Self.edt_CondicaoPgto.Text      := umCliente.getUmaCondicaoPgto.getDescricao;
    Self.edt_DataCadastro.Date      := umCliente.getDataCadastro;
    Self.edt_DataUltAlteracao.Date  := umCliente.getDataUltAlteracao;
end;
procedure TFrmCadCliente.ConhecaObj(vCliente: Cliente; vCtrlCliente:CtrlCliente);
begin
   umCliente := vCliente;
   umaCtrlCliente := vCtrlCliente;
   self.HabilitaCampos;
   self.LimpaCampos;
end;

procedure TFrmCadCliente.HabilitaCampos;
begin
  Self.edt_Nome_RazaoSocial.Enabled := True;
  Self.rg_TipoPessoa.Enabled := True;
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
  Self.edt_Observacao.Enabled := True;
end;

procedure TFrmCadCliente.LimpaCampos;
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
  Self.edt_DataUltAlteracao.Date :=dataAtual;
end;

procedure TFrmCadCliente.edt_IdCidadeExit(Sender: TObject);
var umaCtrlCidade  : CtrlCidade;
begin
  inherited;
   if Self.edt_IdCidade.Text <> '' then
     begin
        Self.edt_Cidade.Clear;
        umaCtrlCidade := CtrlCidade.CrieObjeto;
        umCliente.getumEndereco.getumaCidade.setId(StrToInt(Self.edt_IdCidade.Text));
        umCliente.getumEndereco.getumaCidade.setDescricao(Self.edt_Cidade.Text);
        if not umaCtrlCidade.Buscar(umCliente.getumEndereco.getumaCidade) then
          begin
            MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
            self.edt_IdCidade.Clear;
            self.edt_Cidade.Clear;
            Self.edt_UF.Clear;
            Self.edt_Pais.Clear;
            umCliente.getumEndereco.getumaCidade.setId(0);
          end
        else
          begin
            umaCtrlCidade.Carrega(umCliente.getumEndereco.getumaCidade);
            Self.edt_IdCidade.Text := IntToStr(umCliente.getumEndereco.getumaCidade.getId);
            Self.edt_Cidade.Text := umCliente.getumEndereco.getumaCidade.getDescricao;
            Self.edt_UF.Text := umCliente.getumEndereco.getumaCidade.getumEstado.getUF;
            Self.edt_Pais.Text   := umCliente.getumEndereco.getumaCidade.getumEstado.getumPais.getDescricao;
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

procedure TFrmCadCliente.edt_IdCondicaoPgtoExit(Sender: TObject);
var umaCtrlCondicaoPagamento  : CtrlCondicaoPagamento;
begin
  inherited;
   if Self.edt_IdCondicaoPgto.Text <> '' then
     begin
        Self.edt_CondicaoPgto.Clear;
        umaCtrlCondicaoPagamento := CtrlCondicaoPagamento.CrieObjeto;
        umCliente.getUmaCondicaoPgto.setId(StrToInt(Self.edt_IdCondicaoPgto.Text));
        umCliente.getUmaCondicaoPgto.setDescricao(Self.edt_CondicaoPgto.Text);
        umCliente.getUmaCondicaoPgto.getUmaFormaPagamento.setId(0);
        if not umaCtrlCondicaoPagamento.Buscar(umCliente.getUmaCondicaoPgto) then
          begin
            MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
            self.edt_IdCondicaoPgto.Clear;
            self.edt_CondicaoPgto.Clear;
            umCliente.getUmaCondicaoPgto.setId(0);
          end
        else
          begin
            umaCtrlCondicaoPagamento.Carrega(umCliente.getUmaCondicaoPgto);
            Self.edt_IdCondicaoPgto.Text := IntToStr(umCliente.getUmaCondicaoPgto.getId);
            Self.edt_CondicaoPgto.Text := umCliente.getUmaCondicaoPgto.getDescricao;
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

procedure TFrmCadCliente.edt_CPF_CNPJExit(Sender: TObject);
var cpf_cnpj : string;
begin
  inherited;
  cpf_cnpj := removeEspacos(self.edt_CPF_CNPJ.Text);
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
            MessageDlg('ATENÇÃO: CNPJ inválido!!',mtWarning,[mbOK],0);
            Self.edt_CPF_CNPJ.SetFocus;
          end;
        End;
end;

procedure TFrmCadCliente.edt_EmailExit(Sender: TObject);
begin
  inherited;
    if Self.edt_Email.Text <> '' then
    if (not validarEmail(Self.edt_Email.Text)) then
      begin
         ShowMessage('Email inválido!');
         self.edt_Email.SetFocus;
      end;
end;

procedure TFrmCadCliente.edt_DataNasc_FundExit(Sender: TObject);
begin
  inherited;
  if (edt_DataNasc_Fund.Text <> '  /  /    ') then
    if (validarData(edt_DataNasc_Fund.Date, rg_TipoPessoa.ItemIndex )) then
      edt_DataNasc_Fund.SetFocus;
end;

//////////////Funcionalidades dos Campos///////////////

procedure TFrmCadCliente.edt_IdCidadeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    CampoNumero(Sender,Key);
end;

procedure TFrmCadCliente.edt_IdCondicaoPgtoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    CampoNumero(Sender,Key);
end;

procedure TFrmCadCliente.rg_TipoPessoaClick(Sender: TObject);
  begin
    inherited;
    if rg_TipoPessoa.ItemIndex = 0 then
      begin
        lbl_Nome_RazaoSocial.Caption := 'Nome *';
        lbl_RG_IE.Caption := 'RG';
        lbl_CPF_CNPJ.Caption := 'CPF *';
        edt_CPF_CNPJ.Clear;
        edt_CPF_CNPJ.EditMask := '!999.999.999-99;0;';
        lbl_DataNasc_Fund.Caption := 'Data Nascimento *';
      end
    else
      begin
        lbl_Nome_RazaoSocial.Caption := 'Razão Social *';
        lbl_RG_IE.Caption := 'IE';
        lbl_CPF_CNPJ.Caption := 'CNPJ *';
        edt_CPF_CNPJ.Clear;
        edt_CPF_CNPJ.EditMask := '!99.999.999/9999-99;0;';
        lbl_DataNasc_Fund.Caption := 'Data Fundação *';
      end;

end;

procedure TFrmCadCliente.edt_TelefoneClick(Sender: TObject);
begin
  inherited;
      edt_Telefone.SelStart:=0;
end;

procedure TFrmCadCliente.edt_CelularClick(Sender: TObject);
begin
  inherited;
      edt_Celular.SelStart:=0;
end;

procedure TFrmCadCliente.edt_CEPClick(Sender: TObject);
begin
  inherited;
      edt_CEP.SelStart:=0;
end;

procedure TFrmCadCliente.edt_CPF_CNPJClick(Sender: TObject);
begin
  inherited;
    edt_CPF_CNPJ.SelStart:=0;
end;



//////////////////////////////////////////////////////

end.


