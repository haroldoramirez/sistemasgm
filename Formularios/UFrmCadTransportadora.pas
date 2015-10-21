unit UFrmCadTransportadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCadastro, StdCtrls, Buttons, sBitBtn, sGroupBox, sLabel, Mask,
  sMaskEdit, sCustomComboEdit, sTooledit, sEdit, sMemo, UTransportadora,
  UCidade, UCtrlTransportadora, UCtrlCidade, UFrmConCidade, UFrmConCondicaoPagamento,
  UCtrlCondicaoPagamento, UCondicaoPagamento, UComuns, UEndereco, UValidacao;

type
  TFrmCadTransportadora = class(TFrmCadastro)
    lbl_IdCliente: TsLabel;
    lbl_Nome_RazaoSocial: TsLabel;
    lbl_DataCadastro: TsLabel;
    lbl_Observacao: TsLabel;
    edt_Observacao: TsMemo;
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
    lbl_IE: TsLabel;
    lbl_CNPJ: TsLabel;
    lbl_DataNasc_Fund: TsLabel;
    edt_DataNasc_Fund: TsDateEdit;
    edt_CNPJ: TsMaskEdit;
    sGroupBox5: TsGroupBox;
    lbl_DataUltAlteracao: TsLabel;
    edt_DataUltAlteracao: TsDateEdit;
    sGroupBox6: TsGroupBox;
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
    edt_IE: TsEdit;
    procedure btn_SalvarClick(Sender: TObject);
    procedure btn_BuscarCidadeClick(Sender: TObject);
    procedure btn_BuscarCondicaoPgtoClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure edt_CEPClick(Sender: TObject);
    procedure edt_TelefoneClick(Sender: TObject);
    procedure edt_CelularClick(Sender: TObject);
    procedure edt_CNPJClick(Sender: TObject);
    procedure edt_CNPJExit(Sender: TObject);
    procedure edt_EmailExit(Sender: TObject);
    procedure edt_IdCidadeExit(Sender: TObject);
    procedure edt_IdCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edt_IdCondicaoPgtoExit(Sender: TObject);
    procedure edt_IdCondicaoPgtoKeyPress(Sender: TObject; var Key: Char);
  private
    umaTransportadora         : Transportadora;
    umaCidade                 : Cidade;
    umaCtrlTransportadora     : CtrlTransportadora;
    umaCtrlCidade             : CtrlCidade;
    umFrmConCidade            : TFrmConCidade;
    umaCondicaoPagamento      : CondicaoPagamento;
    umFrmConCondicaoPagamento : TFrmConCondicaoPagamento;
    umaCtrlCondicaoPagamento  : CtrlCondicaoPagamento;
  public
    nomeAlterado : string;
    telAlterado  : string;
    procedure ConhecaObj(vTransportadora: Transportadora; vCtrlTransportadora : CtrlTransportadora);
    procedure HabilitaCampos;
    procedure LimpaCampos;
    procedure CarregaObj;
  end;

var
  FrmCadTransportadora: TFrmCadTransportadora;

implementation

{$R *.dfm}

{ TFrmCadTransportadora }

procedure TFrmCadTransportadora.ConhecaObj(vTransportadora: Transportadora; vCtrlTransportadora: CtrlTransportadora);
begin
   umaTransportadora := vTransportadora;
   umaCtrlTransportadora := vCtrlTransportadora;
   self.LimpaCampos;
end;

procedure TFrmCadTransportadora.btn_BuscarCidadeClick(Sender: TObject);
begin
  inherited;
  umFrmConCidade := TFrmConCidade.Create(nil);
  umFrmConCidade.ConhecaObj(umaTransportadora.getumEndereco.getumaCidade);
  umFrmConCidade.btn_Sair.Caption := 'Selecionar';
  umFrmConCidade.ShowModal;
  self.edt_IdCidade.Text  := inttostr(umaTransportadora.getumEndereco.getumaCidade.getId);
  self.edt_Cidade.Text    := umaTransportadora.getumEndereco.getumaCidade.getDescricao;
  self.edt_UF.Text        := umaTransportadora.getumEndereco.getumaCidade.getumEstado.getUF;
  Self.edt_Pais.Text      := umaTransportadora.getumEndereco.getumaCidade.getumEstado.getumPais.getDescricao;
end;

procedure TFrmCadTransportadora.btn_BuscarCondicaoPgtoClick(Sender: TObject);
begin
  inherited;
  umFrmConCondicaoPagamento := TFrmConCondicaoPagamento.Create(nil);
  umFrmConCondicaoPagamento.ConhecaObj(umaTransportadora.getUmaCondicaoPgto);
  umFrmConCondicaoPagamento.btn_Sair.Caption := 'Selecionar';
  umFrmConCondicaoPagamento.ShowModal;
  self.edt_IdCondicaoPgto.Text  := inttostr(umaTransportadora.getUmaCondicaoPgto.getId);
  self.edt_CondicaoPgto.Text    := umaTransportadora.getUmaCondicaoPgto.getDescricao;
end;

procedure TFrmCadTransportadora.btn_SairClick(Sender: TObject);
begin
  inherited;
  Self.HabilitaCampos;
end;

procedure TFrmCadTransportadora.btn_SalvarClick(Sender: TObject);
var
  dataAtual : TDateTime;
  msg: string;
  umEndereco : Endereco;
begin
    inherited;
    dataAtual := Date;

    if edt_Nome_RazaoSocial.Text = '' then
      begin
          ShowMessage('Campo RazãoSocial não pode estar em branco!');
          edt_Nome_RazaoSocial.SetFocus;
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
    else if edt_IdCondicaoPgto.Text = '' then
      begin
          ShowMessage('Deve ser definido uma Condição de Pagamento!');
          edt_Numero.SetFocus;
      end
    else if (edt_CNPJ.Text = '') and ((edt_Pais.Text = 'BRASIL') OR (edt_Pais.Text = 'BRAZIL'))then
      begin
          ShowMessage('Campo CNPJ é obrigatório!');
          edt_CNPJ.SetFocus;
      end
    else if edt_DataNasc_Fund.Date = StrToDate('30/12/1899') then
      begin
          ShowMessage('Favor informar a Data de Fundação');
          edt_DataNasc_Fund.SetFocus;
      end
    else
      if self.btn_Salvar.Caption = 'Salvar' then
      begin
          if (nomeAlterado <> edt_Nome_RazaoSocial.Text) then
            umaTransportadora.verificaNome := True
          else
            umaTransportadora.verificaNome := False;
          if (telAlterado <> edt_Telefone.Text) then
            umaTransportadora.verificaTel := True
          else
            umaTransportadora.verificaTel := False;
          umaTransportadora.setNome_RazaoSoCial(edt_Nome_RazaoSocial.Text);

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

          umaTransportadora.setumEndereco(umEndereco);

          umaTransportadora.setEmail(edt_Email.Text);
          umaTransportadora.setTelefone(edt_Telefone.Text);
          umaTransportadora.setCelular(edt_Celular.Text);
          umaTransportadora.setCPF_CNPJ(addMascara(edt_CNPJ.Text, 1));
          umaTransportadora.setRG_IE(edt_IE.Text);
          umaTransportadora.setDataNasc_Fund(edt_DataNasc_Fund.Date);
          umaTransportadora.setObservacao(edt_Observacao.Text);
          umaTransportadora.getUmaCondicaoPgto.setId(StrToInt(edt_IdCondicaoPgto.Text));
          umaTransportadora.getUmaCondicaoPgto.setDescricao(edt_CondicaoPgto.Text);
          umaTransportadora.setDataCadastro(edt_DataCadastro.Date);
          if self.edt_DataUltAlteracao.Date <> dataAtual then
            umaTransportadora.setDataUltAlteracao(dataAtual);
           msg := umaCtrlTransportadora.Salvar(umaTransportadora);
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
            msg := umaCtrlTransportadora.Excluir(umaTransportadora);
            showmessage(msg);
            close;
        end;
end;

procedure TFrmCadTransportadora.CarregaObj;
begin
  nomeAlterado                    := umaTransportadora.getNome_RazaoSoCial;
  telAlterado                     := umaTransportadora.getTelefone;
  Self.edt_IdCliente.Text         := IntToStr(umaTransportadora.getId);
  Self.edt_Nome_RazaoSocial.Text  := nomeAlterado;
  Self.edt_Logradouro.Text        := umaTransportadora.getumEndereco.getLogradouro;
  Self.edt_Numero.Text            := umaTransportadora.getumEndereco.getNumero;
  Self.edt_CEP.Text               := umaTransportadora.getumEndereco.getCEP;
  Self.edt_Bairro.Text            := umaTransportadora.getumEndereco.getBairro;
  Self.edt_Complemento.Text       := umaTransportadora.getumEndereco.getComplemento;
  Self.edt_IdCidade.Text          := IntToStr(umaTransportadora.getumEndereco.getumaCidade.getId);
  Self.edt_Cidade.Text            := umaTransportadora.getumEndereco.getumaCidade.getDescricao;
  Self.edt_UF.Text                := umaTransportadora.getumEndereco.getumaCidade.getumEstado.getUF;
  Self.edt_Pais.Text              := umaTransportadora.getumEndereco.getumaCidade.getumEstado.getumPais.getDescricao;
  Self.edt_Email.Text             := umaTransportadora.getEmail;
  Self.edt_Telefone.Text          := telAlterado;
  Self.edt_Celular.Text           := umaTransportadora.getCelular;
  Self.edt_CNPJ.Text              := removeMascara(umaTransportadora.getCPF_CNPJ);
  Self.edt_IE.Text                := umaTransportadora.getRG_IE;
  Self.edt_DataNasc_Fund.Date     := umaTransportadora.getDataNasc_Fund;
  Self.edt_Observacao.Text        := umaTransportadora.getObservacao;
  Self.edt_IdCondicaoPgto.Text    := IntToStr(umaTransportadora.getUmaCondicaoPgto.getId);
  Self.edt_CondicaoPgto.Text      := umaTransportadora.getUmaCondicaoPgto.getDescricao;
  Self.edt_DataCadastro.Date      := umaTransportadora.getDataCadastro;
  Self.edt_DataUltAlteracao.Date  := umaTransportadora.getDataUltAlteracao;
end;

procedure TFrmCadTransportadora.HabilitaCampos;
begin
  Self.edt_Nome_RazaoSocial.Enabled := True;
  Self.edt_Logradouro.Enabled := True;
  Self.edt_Numero.Enabled := True;
  Self.edt_CEP.Enabled := True;
  Self.edt_Bairro.Enabled := True;
  Self.edt_Complemento.Enabled := True;
  Self.edt_IdCidade.Enabled := True;
  Self.edt_Email.Enabled := True;
  Self.edt_Telefone.Enabled := True;
  Self.edt_Celular.Enabled := True;
  Self.edt_CNPJ.Enabled := True;
  Self.edt_IE.Enabled := True;
  Self.edt_DataNasc_Fund.Enabled := True;
  Self.edt_IdCondicaoPgto.Enabled := True;
  Self.edt_Observacao.Enabled := True;
end;

procedure TFrmCadTransportadora.LimpaCampos;
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
    Self.edt_CNPJ.Clear;
    Self.edt_IE.Clear;
    Self.edt_DataNasc_Fund.Clear;
    Self.edt_Observacao.Clear;
    Self.edt_IdCondicaoPgto.Clear;
    Self.edt_CondicaoPgto.Clear;
    Self.edt_DataCadastro.Date := dataAtual;
    Self.edt_DataUltAlteracao.Date :=dataAtual;
end;

procedure TFrmCadTransportadora.edt_CNPJExit(Sender: TObject);
begin
  inherited;
  If self.edt_CNPJ.Text <> '' then
    if (Length(Trim(self.edt_CNPJ.Text)) < 11) and (Length(Trim(self.edt_CNPJ.Text)) < 14) then
       begin
         MessageDlg('ATENÇÃO: O número informado NÃO representa os 14 digitos válido do CNPJ.',mtWarning,[mbOK],0);
         Self.edt_CNPJ.SetFocus;
       end
    else
      If validar_CPF_CNPJ(self.edt_CNPJ.Text) = False Then
        Begin
          MessageDlg('ATENÇÃO: O CNPJ informado é incorreto!',mtWarning,[mbOK],0);
          Self.edt_CNPJ.SetFocus;
        End;
end;

procedure TFrmCadTransportadora.edt_EmailExit(Sender: TObject);
begin
  inherited;
  if Self.edt_Email.Text <> '' then
    if (not validarEmail(Self.edt_Email.Text)) then
      begin
         ShowMessage('Email inválido!');
         self.edt_Email.SetFocus;
      end;
end;

procedure TFrmCadTransportadora.edt_IdCidadeExit(Sender: TObject);
begin
  inherited;
   if Self.edt_IdCidade.Text <> '' then
     begin
        Self.edt_Cidade.Clear;
        umaCtrlCidade := CtrlCidade.CrieObjeto;
        umaTransportadora.getumEndereco.getumaCidade.setId(StrToInt(Self.edt_IdCidade.Text));
        umaTransportadora.getumEndereco.getumaCidade.setDescricao(Self.edt_Cidade.Text);
        if not umaCtrlCidade.Buscar(umaTransportadora.getumEndereco.getumaCidade) then
          begin
              MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
              self.edt_IdCidade.Clear;
              self.edt_Cidade.Clear;
              Self.edt_UF.Clear;
              Self.edt_Pais.Clear;
          end
        else
          begin
              umaCtrlCidade.Carrega(umaTransportadora.getumEndereco.getumaCidade);
              Self.edt_IdCidade.Text := IntToStr(umaTransportadora.getumEndereco.getumaCidade.getId);
              Self.edt_Cidade.Text := umaTransportadora.getumEndereco.getumaCidade.getDescricao;
              Self.edt_UF.Text := umaTransportadora.getumEndereco.getumaCidade.getumEstado.getUF;
              Self.edt_Pais.Text   := umaTransportadora.getumEndereco.getumaCidade.getumEstado.getumPais.getDescricao;
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

procedure TFrmCadTransportadora.edt_IdCondicaoPgtoExit(Sender: TObject);
begin
  inherited;
  if Self.edt_IdCondicaoPgto.Text <> '' then
   begin
      Self.edt_CondicaoPgto.Clear;
      umaCtrlCondicaoPagamento := CtrlCondicaoPagamento.CrieObjeto;
      umaTransportadora.getUmaCondicaoPgto.setId(StrToInt(Self.edt_IdCondicaoPgto.Text));
      umaTransportadora.getUmaCondicaoPgto.setDescricao(Self.edt_CondicaoPgto.Text);
      umaTransportadora.getUmaCondicaoPgto.getUmaFormaPagamento.setId(0);
      if not umaCtrlCondicaoPagamento.Buscar(umaTransportadora.getUmaCondicaoPgto) then
        begin
          MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
          self.edt_IdCondicaoPgto.Clear;
          self.edt_CondicaoPgto.Clear;
          umaTransportadora.getUmaCondicaoPgto.setId(0);
        end
      else
        begin
          umaCtrlCondicaoPagamento.Carrega(umaTransportadora.getUmaCondicaoPgto);
          Self.edt_IdCondicaoPgto.Text := IntToStr(umaTransportadora.getUmaCondicaoPgto.getId);
          Self.edt_CondicaoPgto.Text := umaTransportadora.getUmaCondicaoPgto.getDescricao;
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

procedure TFrmCadTransportadora.edt_IdCondicaoPgtoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CampoNumero(Sender,Key);
end;

procedure TFrmCadTransportadora.edt_IdCidadeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CampoNumero(Sender,Key);
end;

procedure TFrmCadTransportadora.edt_CEPClick(Sender: TObject);
begin
  inherited;
  edt_CEP.SelStart := 0;
end;

procedure TFrmCadTransportadora.edt_TelefoneClick(Sender: TObject);
begin
  inherited;
  edt_Telefone.SelStart := 0;
end;

procedure TFrmCadTransportadora.edt_CelularClick(Sender: TObject);
begin
  inherited;
  edt_Celular.SelStart := 0;
end;

procedure TFrmCadTransportadora.edt_CNPJClick(Sender: TObject);
begin
  inherited;
  edt_CNPJ.SelStart := 0;
end;

end.
