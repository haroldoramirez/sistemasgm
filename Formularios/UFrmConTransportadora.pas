unit UFrmConTransportadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmConsulta, Grids, DBGrids, sSkinManager, Buttons, sBitBtn,
  StdCtrls, sButton, sEdit, sLabel, sGroupBox, UTransportadora, UFrmCadTransportadora,
  UCtrlTransportadora, Mask, sMaskEdit, UComuns;

type
  TFrmConTransportadora = class(TFrmConsulta)
    gridConsulta: TDBGrid;
    edt_Telefone: TsMaskEdit;
    lbl1: TsLabel;
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_EditarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure btn_ConsultarClick(Sender: TObject);
    procedure edt_IdKeyPress(Sender: TObject; var Key: Char);
  private
    umaTransportadora       : Transportadora;
    umFrmCadTransportadora : TFrmCadTransportadora;
    umaCtrlTransportadora  : CtrlTransportadora;
  public
    procedure ConhecaObj(vTransportadora : Transportadora);
  end;

var
  FrmConTransportadora: TFrmConTransportadora;

implementation

{$R *.dfm}

{ TFrmConTransportadora }

procedure TFrmConTransportadora.btn_ConsultarClick(Sender: TObject);
var consTransportadora: Transportadora;
begin
  inherited;
  consTransportadora := Transportadora.CrieObjeto;
  consTransportadora.setNome_RazaoSoCial(edt_Descricao.text);
  consTransportadora.setTelefone(edt_Telefone.text);
  if edt_Id.Text <> '' then
      consTransportadora.setId(strtoint(edt_Id.Text));
  if not umaCtrlTransportadora.Buscar(consTransportadora) then
      MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
  consTransportadora.destrua_se;
  edt_Id.Clear;
  edt_Descricao.Clear;
  edt_Telefone.Clear;
end;

procedure TFrmConTransportadora.btn_EditarClick(Sender: TObject);
begin
  inherited;
  umaTransportadora.setId(0);
  umFrmCadTransportadora := TFrmCadTransportadora.Create(nil);
  umaCtrlTransportadora.Carrega(umaTransportadora);
  if (umaTransportadora.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser editado!',mtWarning,[mbOK],0)
  else
    with umFrmCadTransportadora do
    begin
        ConhecaObj(umaTransportadora,umaCtrlTransportadora);
        CarregaObj;
        ShowModal;
    end;
end;

procedure TFrmConTransportadora.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  umaTransportadora.setId(0);
  umaCtrlTransportadora.Carrega(umaTransportadora);
  if (umaTransportadora.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser excluido!',mtWarning,[mbOK],0)
  else
  begin
    umFrmCadTransportadora.ConhecaObj(umaTransportadora, umaCtrlTransportadora);
    umFrmCadTransportadora.btn_Salvar.Caption := 'Excluir';
    umFrmCadTransportadora.CarregaObj;
    umFrmCadTransportadora.edt_Nome_RazaoSocial.Enabled := False;
    umFrmCadTransportadora.edt_Logradouro.Enabled := False;
    umFrmCadTransportadora.edt_Numero.Enabled := False;
    umFrmCadTransportadora.edt_CEP.Enabled := False;
    umFrmCadTransportadora.edt_Bairro.Enabled := False;
    umFrmCadTransportadora.edt_Complemento.Enabled := False;
    umFrmCadTransportadora.edt_IdCidade.Enabled := False;
    umFrmCadTransportadora.edt_Email.Enabled := False;
    umFrmCadTransportadora.edt_Telefone.Enabled := False;
    umFrmCadTransportadora.edt_Celular.Enabled := False;
    umFrmCadTransportadora.edt_CNPJ.Enabled := False;
    umFrmCadTransportadora.edt_IE.Enabled := False;
    umFrmCadTransportadora.edt_DataNasc_Fund.Enabled := False;
    umFrmCadTransportadora.edt_Observacao.Enabled := False;
    umFrmCadTransportadora.ShowModal;
  end;
end;

procedure TFrmConTransportadora.btn_NovoClick(Sender: TObject);
begin
  inherited;
  if umaTransportadora.getId <> 0 then
    umaTransportadora.CrieObjeto;
  umFrmCadTransportadora.btn_Salvar.Caption := 'Salvar';
  umFrmCadTransportadora.ConhecaObj(umaTransportadora, umaCtrlTransportadora);
  umFrmCadTransportadora.ShowModal;
end;

procedure TFrmConTransportadora.btn_SairClick(Sender: TObject);
begin
  inherited;
  if self.btn_Sair.Caption = 'Selecionar' then
  begin
    umaTransportadora.setId(0);
    umaTransportadora := Transportadora(umaCtrlTransportadora.Carrega(umaTransportadora));
  end;
  umFrmCadTransportadora.Free;
end;

procedure TFrmConTransportadora.ConhecaObj(vTransportadora: Transportadora);
begin
  umaTransportadora := vTransportadora;
  umaCtrlTransportadora := CtrlTransportadora.CrieObjeto;
  umFrmCadTransportadora := TFrmCadTransportadora.Create(nil);
  self.gridConsulta.DataSource := umaCtrlTransportadora.GetDS;
end;

procedure TFrmConTransportadora.edt_IdKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CampoNumero(Sender, Key);
end;

end.
