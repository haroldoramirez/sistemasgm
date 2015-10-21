unit UFrmConCategoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmConsulta, Grids, DBGrids, sSkinManager, Buttons, sBitBtn,
  StdCtrls, sButton, sEdit, sLabel, sGroupBox, UCategoria, UFrmCadCategoria,
  UCtrlCategoria, UComuns;

type
  TFrmConCategoria = class(TFrmConsulta)
    gridConsulta: TDBGrid;
    procedure btn_ConsultarClick(Sender: TObject);
    procedure btn_EditarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure edt_IdKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    umaCategoria : Categoria;
    umFrmCadCategoria : TFrmCadCategoria;
    umaCtrlCategoria : CtrlCategoria;
  public
    procedure ConhecaObj(vCategoria:Categoria);
  end;

var
  FrmConCategoria: TFrmConCategoria;

implementation

{$R *.dfm}

procedure TFrmConCategoria.btn_ConsultarClick(Sender: TObject);
var
    consCategoria: Categoria;
begin
  inherited;
  consCategoria := Categoria.CrieObjeto;
  consCategoria.setDescricao(edt_Descricao.text);
  if edt_Id.Text <> '' then
      consCategoria.setId(strtoint(edt_Id.Text));
  if not umaCtrlCategoria.Buscar(consCategoria) then
      MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
  consCategoria.destrua_se;
  edt_Id.Clear;
  edt_Descricao.Clear;
end;

procedure TFrmConCategoria.btn_EditarClick(Sender: TObject);
begin
  inherited;
  umaCategoria.setId(0);
  umFrmCadCategoria := TFrmCadCategoria.Create(nil);
  umaCtrlCategoria.Carrega(umaCategoria);
  if (umaCategoria.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser editado!',mtWarning,[mbOK],0)
  else
    with umFrmCadCategoria do
    begin
      ConhecaObj(umaCategoria,umaCtrlCategoria);
      CarregaObj;
      ShowModal;
    end;
end;

procedure TFrmConCategoria.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  umaCategoria.setId(0);
  umaCtrlCategoria.Carrega(umaCategoria);
  if (umaCategoria.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser excluido!',mtWarning,[mbOK],0)
  else
  begin
    umFrmCadCategoria.ConhecaObj(umaCategoria, umaCtrlCategoria);
    umFrmCadCategoria.btn_Salvar.Caption := 'Excluir';
    umFrmCadCategoria.CarregaObj;
    umFrmCadCategoria.edt_Categoria.Enabled := False;
    umFrmCadCategoria.ShowModal;
  end;
end;

procedure TFrmConCategoria.btn_NovoClick(Sender: TObject);
begin
  inherited;
  if umaCategoria.getId <> 0 then
    umaCategoria.CrieObjeto;
  umFrmCadCategoria.ConhecaObj(umaCategoria, umaCtrlCategoria);
  umFrmCadCategoria.ShowModal;
end;

procedure TFrmConCategoria.btn_SairClick(Sender: TObject);
begin
  inherited;
  if self.btn_Sair.Caption = 'Selecionar' then
  begin
    umaCategoria.setId(0);
    umaCategoria := Categoria(umaCtrlCategoria.carrega(umaCategoria));
  end;
  umFrmCadCategoria.Free;
end;

procedure TFrmConCategoria.ConhecaObj(vCategoria: Categoria);
begin
  umaCategoria := vCategoria;
  umaCtrlCategoria := CtrlCategoria.CrieObjeto;
  umFrmCadCategoria := TFrmCadCategoria.Create(nil);
  Self.gridConsulta.DataSource := umaCtrlCategoria.GetDS;
end;

procedure TFrmConCategoria.edt_IdKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CampoNumero(Sender, Key);
end;

procedure TFrmConCategoria.FormActivate(Sender: TObject);
begin
  inherited;
//  gridConsulta.columns[1].width:=270;
//  gridConsulta.columns[2].width:=100;
//  gridConsulta.columns[3].width:=100;
end;
end.
