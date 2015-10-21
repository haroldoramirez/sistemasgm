unit UFrmConCargo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmConsulta, Grids, DBGrids, sSkinManager, Buttons, sBitBtn,
  StdCtrls, sButton, sEdit, sLabel, sGroupBox, UCargo, UFrmCadCargo, UCtrlCargo,
  UComuns;

type
  TFrmConCargo = class(TFrmConsulta)
    gridConsulta: TDBGrid;
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_EditarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edt_IdKeyPress(Sender: TObject; var Key: Char);
    procedure btn_ConsultarClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
  private
    umCargo       : Cargo;
    umFrmCadCargo : TFrmCadCargo;
    umaCtrlCargo  : CtrlCargo;
  public
    procedure ConhecaObjeto(vCargo:Cargo);
  end;

var
  FrmConCargo: TFrmConCargo;

implementation

{$R *.dfm}

{ TFrmConCargo }

procedure TFrmConCargo.btn_ConsultarClick(Sender: TObject);
var consCargo: Cargo;
begin
  inherited;
  consCargo := Cargo.CrieObjeto;
  consCargo.setDescricao(edt_Descricao.text);
  if edt_Id.Text <> '' then
      consCargo.setId(strtoint(edt_Id.Text));
  if not umaCtrlCargo.Buscar(consCargo) then
      MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
  consCargo.destrua_se;
  edt_Id.Clear;
  edt_Descricao.Clear;
end;

procedure TFrmConCargo.btn_EditarClick(Sender: TObject);
begin
  inherited;
  umCargo.setId(0);
  umFrmCadCargo := TFrmCadCargo.Create(nil);
  umaCtrlCargo.Carrega(umCargo);
  if (umCargo.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser editado!',mtWarning,[mbOK],0)
  else
    with umFrmCadCargo do
    begin
      ConhecaObjeto(umCargo,umaCtrlCargo);
      CarregaObj;
      ShowModal;
    end;
end;

procedure TFrmConCargo.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  umCargo.setId(0);
  umaCtrlCargo.Carrega(umCargo);
  if (umCargo.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser excluido!',mtWarning,[mbOK],0)
  else
  begin
    umFrmCadCargo.ConhecaObjeto(umCargo, umaCtrlCargo);
    umFrmCadCargo.btn_Salvar.Caption := 'Excluir';
    umFrmCadCargo.CarregaObj;
    umFrmCadCargo.edt_Cargo.Enabled := False;
    umFrmCadCargo.ShowModal;
  end;
end;

procedure TFrmConCargo.btn_NovoClick(Sender: TObject);
begin
  inherited;
  if umCargo.getId <> 0 then
     umCargo.CrieObjeto;
  umFrmCadCargo.ConhecaObjeto(umCargo, umaCtrlCargo);
  umFrmCadCargo.ShowModal;
end;

procedure TFrmConCargo.btn_SairClick(Sender: TObject);
begin
  inherited;
  if self.btn_Sair.Caption = 'Selecionar' then
  begin
      umCargo.setId(0);
      umCargo := Cargo(umaCtrlCargo.carrega(umCargo));
  end;
  umFrmCadCargo.Free;
end;

procedure TFrmConCargo.ConhecaObjeto(vCargo: Cargo);
begin
  umCargo := vCargo;
  umaCtrlCargo := CtrlCargo.CrieObjeto;
  umFrmCadCargo := TFrmCadCargo.Create(nil);
  Self.gridConsulta.DataSource := umaCtrlCargo.GetDS;
end;

procedure TFrmConCargo.edt_IdKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CampoNumero(Sender,Key);
end;

procedure TFrmConCargo.FormActivate(Sender: TObject);
begin
  inherited;
//  gridConsulta.columns[1].width:=235;
//  gridConsulta.columns[2].width:=50;
end;

end.
