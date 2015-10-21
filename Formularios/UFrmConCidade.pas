unit UFrmConCidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmConsulta, StdCtrls, Grids, DBGrids,UCidade, UCtrlCidade, UFrmCadCidade,
  sEdit, Buttons, sBitBtn, sLabel, sGroupBox, sSpeedButton, sSkinManager,
  sButton, UComuns;

type
  TFrmConCidade = class(TFrmConsulta)
    gridConsulta: TDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure btn_ConsultarClick(Sender: TObject);
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_EditarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure edt_IdKeyPress(Sender: TObject; var Key: Char);
 private
    umaCidade : Cidade;
    umFrmCadCidade : TFrmCadCidade;
    umaCtrlCidade : CtrlCidade;
  public
    procedure ConhecaObj(vCidade : Cidade);
  end;

var
  FrmConCidade: TFrmConCidade;

implementation

{$R *.dfm}

{ TFrmConCidade }

procedure TFrmConCidade.btn_ConsultarClick(Sender: TObject);
  var
    consCidade: Cidade;
begin
  inherited;
    consCidade := Cidade.CrieObjeto;
    consCidade.setDescricao(edt_Descricao.text);
    if edt_Id.Text <> '' then
        consCidade.setId(strtoint(edt_Id.Text));
    if not umaCtrlCidade.Buscar(consCidade) then
        MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
    consCidade.destrua_se;
    edt_Id.Clear;
    edt_Descricao.Clear;
end;

procedure TFrmConCidade.btn_EditarClick(Sender: TObject);
begin
  inherited;
  umaCidade.setId(0);
  umFrmCadCidade := TFrmCadCidade.Create(nil);
  umaCtrlCidade.Carrega(umaCidade);
  if (umaCidade.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser editado!',mtWarning,[mbOK],0)
  else
  with umFrmCadCidade do
  begin
    ConhecaObj(umaCidade,umaCtrlCidade);
    CarregaObj;
    ShowModal;
  end;
end;

procedure TFrmConCidade.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  umaCidade.setId(0);
  umaCtrlCidade.Carrega(umaCidade);
  if (umaCidade.getId = 0) then
  MessageDlg('ATENÇÃO: Não há cadastro para ser excluido!',mtWarning,[mbOK],0)
  else
  begin
    umFrmCadCidade.ConhecaObj(umaCidade, umaCtrlCidade);
    umFrmCadCidade.btn_Salvar.Caption := 'Excluir';
    umFrmCadCidade.CarregaObj;
    umFrmCadCidade.edt_Cidade.Enabled := False;
    umFrmCadCidade.edt_DDD.Enabled := False;
    umFrmCadCidade.edt_IdEstado.Enabled := False;
    umFrmCadCidade.btn_Buscar.Enabled := False;
    umFrmCadCidade.ShowModal;
  end;
end;

procedure TFrmConCidade.btn_NovoClick(Sender: TObject);
begin
  inherited;
    if umaCidade.getId <> 0 then
      umaCidade.CrieObjeto;
    umFrmCadCidade.btn_Salvar.Caption := 'Salvar';
    umFrmCadCidade.ConhecaObj(umaCidade, umaCtrlCidade);
    umFrmCadCidade.ShowModal;
end;

procedure TFrmConCidade.btn_SairClick(Sender: TObject);
begin
  inherited;
  if self.btn_Sair.Caption = 'Selecionar' then
    begin
      umaCidade.setId(0);
      umaCidade := Cidade(umaCtrlCidade.Carrega(umaCidade));
    end;
  umFrmCadCidade.Free;
end;

procedure TFrmConCidade.ConhecaObj(vCidade: Cidade);
begin
      umaCidade := vCidade;
      umaCtrlCidade := CtrlCidade.CrieObjeto;
      umFrmCadCidade := TFrmCadCidade.Create(nil);
      self.gridConsulta.DataSource := umaCtrlCidade.GetDS;
end;

procedure TFrmConCidade.edt_IdKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CampoNumero(Sender, Key);
end;

procedure TFrmConCidade.FormActivate(Sender: TObject);
begin
  inherited;
//  gridConsulta.columns[1].width:=235;
//  gridConsulta.columns[2].width:=50;
  gridConsulta.Columns[6].Visible := False;
end;

end.
