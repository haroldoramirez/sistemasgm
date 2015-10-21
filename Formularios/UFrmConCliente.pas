unit UFrmConCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmConsulta, StdCtrls, Grids, DBGrids, Mask, sMaskEdit, UCliente,
  UFrmCadCliente, UCtrlCliente, sEdit, Buttons, sBitBtn, sLabel, sGroupBox,
  sSpeedButton, sSkinManager, sButton, UComuns;

type
  TFrmConCliente = class(TFrmConsulta)
    gridConsulta: TDBGrid;
    lbl_Telefone: TsLabel;
    edt_Telefone: TsMaskEdit;
    procedure FormActivate(Sender: TObject);
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_EditarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure btn_ConsultarClick(Sender: TObject);
    procedure edt_IdKeyPress(Sender: TObject; var Key: Char);
  private
    umCliente       : Cliente;
    umaCtrlCliente  : CtrlCliente;
    umFrmCadCliente : TFrmCadCliente;
  public
    procedure ConhecaObj(vCliente : Cliente);
  end;

var
  FrmConCliente: TFrmConCliente;

implementation

{$R *.dfm}

{ TFrmConCliente }

procedure TFrmConCliente.btn_ConsultarClick(Sender: TObject);
  var
    consCliente: Cliente;
begin
  inherited;
    consCliente := Cliente.CrieObjeto;
    consCliente.setNome_RazaoSoCial(edt_Descricao.text);
    consCliente.setTelefone(edt_Telefone.text);
    if edt_Id.Text <> '' then
        consCliente.setId(strtoint(edt_Id.Text));
    if not umaCtrlCliente.Buscar(consCliente) then
        MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
    consCliente.destrua_se;
    edt_Id.Clear;
    edt_Descricao.Clear;
    edt_Telefone.Clear;
end;

procedure TFrmConCliente.btn_EditarClick(Sender: TObject);
begin
  inherited;
  umCliente.setId(0);
  umFrmCadCliente := TFrmCadCliente.Create(nil);
  umaCtrlCliente.Carrega(umCliente);
  if (umCliente.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser editado!',mtWarning,[mbOK],0)
  else
    with umFrmCadCliente do
    begin
        ConhecaObj(umCliente,umaCtrlCliente);
        CarregaObj;
        ShowModal;
    end;
end;

procedure TFrmConCliente.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  umCliente.setId(0);
  umaCtrlCliente.Carrega(umCliente);
  if (umCliente.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser excluido!',mtWarning,[mbOK],0)
  else
  begin
    umFrmCadCliente.ConhecaObj(umCliente, umaCtrlCliente);
    umFrmCadCliente.btn_Salvar.Caption := 'Excluir';
    umFrmCadCliente.CarregaObj;
    umFrmCadCliente.edt_Nome_RazaoSocial.Enabled := False;
    umFrmCadCliente.rg_TipoPessoa.Enabled := False;
    umFrmCadCliente.edt_Logradouro.Enabled := False;
    umFrmCadCliente.edt_Numero.Enabled := False;
    umFrmCadCliente.edt_CEP.Enabled := False;
    umFrmCadCliente.edt_Bairro.Enabled := False;
    umFrmCadCliente.edt_Complemento.Enabled := False;
    umFrmCadCliente.edt_IdCidade.Enabled := False;
    umFrmCadCliente.btn_BuscarCidade.Enabled := False;
    umFrmCadCliente.edt_UF.Enabled := False;
    umFrmCadCliente.edt_Pais.Enabled := False;
    umFrmCadCliente.edt_Email.Enabled := False;
    umFrmCadCliente.edt_Telefone.Enabled := False;
    umFrmCadCliente.edt_Celular.Enabled := False;
    umFrmCadCliente.edt_CPF_CNPJ.Enabled := False;
    umFrmCadCliente.edt_RG_IE.Enabled := False;
    umFrmCadCliente.edt_DataNasc_Fund.Enabled := False;
    umFrmCadCliente.edt_IdCondicaoPgto.Enabled := False;
    umFrmCadCliente.edt_Observacao.Enabled := False;
    umFrmCadCliente.btn_BuscarCondicaoPgto.Enabled := False;
    umFrmCadCliente.ShowModal;
  end;
end;

procedure TFrmConCliente.btn_NovoClick(Sender: TObject);
begin
  inherited;
    if umCliente.getId <> 0 then
        umCliente.CrieObjeto;
    umFrmCadCliente.ConhecaObj(umCliente, umaCtrlCliente);
    umFrmCadCliente.ShowModal;
end;

procedure TFrmConCliente.btn_SairClick(Sender: TObject);
begin
  inherited;
  if self.btn_Sair.Caption = 'Selecionar' then
  begin
      umCliente.setId(0);
      umCliente := Cliente(umaCtrlCliente.Carrega(umCliente));
  end;
  umFrmCadCliente.Free;
end;

procedure TFrmConCliente.ConhecaObj(vCliente: Cliente);
begin
  umCliente := vCliente;
  umaCtrlCliente := CtrlCliente.CrieObjeto;
  umFrmCadCliente := TFrmCadCliente.Create(nil);
  self.gridConsulta.DataSource := umaCtrlCliente.GetDS;
end;

procedure TFrmConCliente.FormActivate(Sender: TObject);
begin
  inherited;
  gridConsulta.columns[1].width:=235;
  gridConsulta.columns[2].width:=235;
end;

procedure TFrmConCliente.edt_IdKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CampoNumero(Sender, Key);
end;

end.
