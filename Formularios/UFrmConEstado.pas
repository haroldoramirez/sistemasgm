unit UFrmConEstado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmConsulta, StdCtrls, Grids, DBGrids, UEstado, UCtrlEstado, UFrmCadEstado,
  sEdit, Buttons, sBitBtn, sLabel, sGroupBox, sSkinManager, sButton, UComuns;

type
  TFrmConEstado = class(TFrmConsulta)
    gridConsulta: TDBGrid;
 
    procedure FormActivate(Sender: TObject);
    procedure btn_ConsultarClick(Sender: TObject);
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_EditarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure edt_IdKeyPress(Sender: TObject; var Key: Char);
  private
     umEstado : Estado;
     umFrmCadEstado : TFrmCadEstado;
     umaCtrlEstado : CtrlEstado;
  public
    procedure ConhecaObj(vEstado : Estado);
  end;

var
  FrmConEstado: TFrmConEstado;

implementation

{$R *.dfm}

procedure TFrmConEstado.btn_ConsultarClick(Sender: TObject);
var consEstado: Estado;
begin
  inherited;
  consEstado := Estado.CrieObjeto;
  consEstado.setDescricao(edt_Descricao.text);
  if edt_Id.Text <> '' then
      consEstado.setId(strtoint(edt_Id.Text));
  if not umaCtrlEstado.Buscar(consEstado) then
      MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
  consEstado.destrua_se;
  edt_Id.Clear;
  edt_Descricao.Clear;
end;

procedure TFrmConEstado.btn_EditarClick(Sender: TObject);
begin
  inherited;
  umEstado.setId(0);
  umFrmCadEstado := TFrmCadEstado.Create(nil);
  umaCtrlEstado.Carrega(umEstado);
  if (umEstado.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser editado!',mtWarning,[mbOK],0)
  else
    with umFrmCadEstado do
    begin
      ConhecaObj(umEstado,umaCtrlEstado);
      CarregaObj;
      ShowModal;
    end;
end;

procedure TFrmConEstado.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  umEstado.setId(0);
  umaCtrlEstado.Carrega(umEstado);
  if (umEstado.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser excluido!',mtWarning,[mbOK],0)
  else
  begin
    umFrmCadEstado.ConhecaObj(umEstado, umaCtrlEstado);
    umFrmCadEstado.btn_Salvar.Caption := 'Excluir';
    umFrmCadEstado.CarregaObj;
    umFrmCadEstado.edt_Estado.Enabled := False;
    umFrmCadEstado.edt_UF.Enabled := False;
    umFrmCadEstado.edt_IdPais.Enabled := False;
    umFrmCadEstado.edt_Pais.Enabled := False;
    umFrmCadEstado.btn_Buscar.Enabled := False;
    umFrmCadEstado.ShowModal;
  end;
end;

procedure TFrmConEstado.btn_NovoClick(Sender: TObject);
begin
  inherited;
  if umEstado.getId <> 0 then
     umEstado.CrieObjeto;
  umFrmCadEstado.btn_Salvar.Caption := 'Salvar';
  umFrmCadEstado.ConhecaObj(umEstado, umaCtrlEstado);
  umFrmCadEstado.ShowModal;
end;

procedure TFrmConEstado.btn_SairClick(Sender: TObject);
begin
  inherited;
  if self.btn_Sair.Caption = 'Selecionar' then
  begin
      umEstado.setId(0);
      umEstado := Estado(umaCtrlEstado.Carrega(umEstado));
  end;
  umFrmCadEstado.Free;
end;

procedure TFrmConEstado.ConhecaObj(vEstado: Estado);
begin
  umEstado := vEstado;
  umaCtrlEstado := CtrlEstado.CrieObjeto;
  umFrmCadEstado := TFrmCadEstado.Create(nil);
  self.gridConsulta.DataSource := umaCtrlEstado.GetDS;
end;

procedure TFrmConEstado.edt_IdKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CampoNumero(Sender, Key);
end;

procedure TFrmConEstado.FormActivate(Sender: TObject);
begin
  inherited;
//  gridConsulta.columns[1].width:=235;
//  gridConsulta.columns[2].width:=50;
  gridConsulta.Columns[6].Visible := False;
end;
end.
