unit UFrmCadCidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCadastro, ComCtrls, StdCtrls, UCidade, UEstado, UCtrlCidade, UCtrlEstado, UFrmConEstado,
  Buttons, sBitBtn, sGroupBox, sLabel, Mask, sMaskEdit, sCustomComboEdit,
  sTooledit, sEdit, UComuns;

type
  TFrmCadCidade = class(TFrmCadastro)
    lbl_IdCidade: TsLabel;
    lbl9: TsLabel;
    lbl10: TsLabel;
    lbl11: TsLabel;
    lbl1: TsLabel;
    lbl_DataCadastro: TsLabel;
    lbl_DataUltAlteracao: TsLabel;
    edt_IdCidade: TsEdit;
    edt_Cidade: TsEdit;
    edt_DDD: TsEdit;
    edt_IdEstado: TsEdit;
    edt_Estado: TsEdit;
    edt_DataCadastro: TsDateEdit;
    edt_DataUltAlteracao: TsDateEdit;
    btn_Buscar: TsBitBtn;
    procedure btn_SalvarClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure btn_BuscarClick(Sender: TObject);
    procedure edt_IdEstadoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_IdEstadoExit(Sender: TObject);

  private
    { Private declarations }
    umaCidade : Cidade;
    umaCtrlCidade : CtrlCidade;
    umFrmConEstado : TFrmConEstado;
  public
    { Public declarations }
      procedure ConhecaObj(vCidade: Cidade; vCtrlCidade : CtrlCidade);
      procedure HabilitaCampos;
      procedure LimpaCampos;
      procedure CarregaObj;
  end;

var
  FrmCadCidade: TFrmCadCidade;

implementation

{$R *.dfm}

{ TFrmCadCidade }

procedure TFrmCadCidade.btn_BuscarClick(Sender: TObject);
begin
  inherited;
      umFrmConEstado := TFrmConEstado.Create(nil);
      umFrmConEstado.ConhecaObj(umaCidade.getUmEstado);
      umFrmConEstado.btn_Sair.Caption := 'Selecionar';
      umFrmConEstado.ShowModal;
      self.edt_IdEstado.Text  := inttostr(umaCidade.getUmEstado.getId);
      self.edt_Estado.Text    := umaCidade.getUmEstado.getDescricao;
end;

procedure TFrmCadCidade.btn_SairClick(Sender: TObject);
begin
  inherited;
  self.HabilitaCampos;
end;

procedure TFrmCadCidade.btn_SalvarClick(Sender: TObject);
var
  dataAtual : TDateTime;
  msg: string;
begin
    dataAtual := Date;
  inherited;
  if edt_Cidade.Text = '' then
    begin
        ShowMessage('Campo Cidade não pode estar em branco!');
        edt_Cidade.SetFocus;
    end
  else
    if edt_Estado.Text = '' then
      begin
          ShowMessage('Campo Estado não pode estar em branco!');
          edt_IdEstado.SetFocus;
      end
  else
    if self.btn_Salvar.Caption = 'Salvar' then
      begin
        UmaCidade.setDescricao(edt_Cidade.Text);
        UmaCidade.setDDD(edt_DDD.Text);
        UmaCidade.getUmEstado.setId(StrToInt(edt_IdEstado.Text));
        UmaCidade.getUmEstado.setDescricao(edt_Estado.Text);
        UmaCidade.setDataCadastro(edt_DataCadastro.Date);
        if self.edt_DataUltAlteracao.Date <> dataAtual then
          UmaCidade.setDataAlteracao(dataAtual);

        msg := umaCtrlCidade.Salvar(UmaCidade);
        if Copy(msg,0,4) = 'Esse' then
        begin
            ShowMessage(msg);
            edt_Cidade.SetFocus;
        end
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
          msg := umaCtrlCidade.Excluir(UmaCidade);
          showmessage(msg);
          Close;
        end;
end;

procedure TFrmCadCidade.CarregaObj;
begin
  self.edt_IdCidade.Text              := inttostr(umaCidade.getId);
  self.edt_Cidade.Text                := umaCidade.getDescricao;
  self.edt_DDD.Text                   := umaCidade.getDDD;
  self.edt_IdEstado.Text              := inttostr(umaCidade.getumEstado.getId);
  self.edt_Estado.Text                := umaCidade.getumEstado.getDescricao;
  self.edt_DataCadastro.Date          := umaCidade.getDataCadastro;
  self.edt_DataUltAlteracao.Date      := umaCidade.getDataAlteracao;
end;

procedure TFrmCadCidade.ConhecaObj(vCidade: Cidade; vCtrlCidade: CtrlCidade);
begin
   umaCidade := vCidade;
   umaCtrlCidade := vCtrlCidade;
   self.HabilitaCampos;
   self.LimpaCampos;
end;

procedure TFrmCadCidade.edt_IdEstadoExit(Sender: TObject);
var umaCtrlEstado : CtrlEstado;
    umEstado : Estado;
begin
  inherited;
  if Self.edt_IdEstado.Text <> '' then
    begin
      Self.edt_Estado.Clear;
      umaCtrlEstado := CtrlEstado.CrieObjeto;
      umaCidade.getUmEstado.setId(StrToInt(Self.edt_IdEstado.Text));
      umaCidade.getUmEstado.setDescricao(Self.edt_Estado.Text);
      umaCidade.getUmEstado.getUmPais.setId(0);
      if not umaCtrlEstado.Buscar(umaCidade.getUmEstado) then
        begin
          MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
          self.edt_IdEstado.Clear;
          self.edt_Estado.Clear;
        end
      else
        begin
          umaCtrlEstado.Carrega(umaCidade.getUmEstado);
          Self.edt_IdEstado.Text := IntToStr(umaCidade.getUmEstado.getId);
          Self.edt_Estado.Text := umaCidade.getUmEstado.getDescricao;
        end;
      umEstado := Estado.CrieObjeto;
      umaCtrlEstado.Buscar(umEstado);
    end
  else
    begin
      self.edt_IdEstado.Clear;
      self.edt_Estado.Clear;
    end;
end;

procedure TFrmCadCidade.edt_IdEstadoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CampoNumero(Sender,Key);
end;

procedure TFrmCadCidade.HabilitaCampos;
begin
  Self.btn_Salvar.Caption  := 'Salvar';
  self.edt_Cidade.Enabled   := True;
  self.edt_DDD.Enabled      := True;
  self.edt_IdEstado.Enabled := True;
  Self.btn_Buscar.Enabled   := True;
end;

procedure TFrmCadCidade.LimpaCampos;
var dataAtual : TDateTime;
begin
  dataAtual := Date;
  Self.edt_IdCidade.Clear;
  Self.edt_Cidade.Clear;
  Self.edt_DDD.Clear;
  self.edt_IdEstado.Clear;
  self.edt_Estado.Clear;
  Self.edt_DataCadastro.Date     := dataAtual;
  Self.edt_DataUltAlteracao.Date :=dataAtual;
end;

end.
