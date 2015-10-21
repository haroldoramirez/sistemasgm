unit UFrmConMarca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmConsulta, Grids, DBGrids, sSkinManager, Buttons, sBitBtn,
  StdCtrls, sButton, sEdit, sLabel, sGroupBox, UMarca, UFrmCadMarca, UCtrlMarca,
  UComuns;

type
  TFrmConMarca = class(TFrmConsulta)
    gridConsulta: TDBGrid;
    procedure btn_NovoClick(Sender: TObject);
    procedure edt_IdKeyPress(Sender: TObject; var Key: Char);
    procedure btn_ConsultarClick(Sender: TObject);
    procedure btn_EditarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    umaMarca      : Marca;
    umFrmCadMarca : TFrmCadMarca;
    umaCtrlMarca  : CtrlMarca;
  public
    procedure ConhecaObj(vMarca:Marca);
  end;

var
  FrmConMarca: TFrmConMarca;

implementation

{$R *.dfm}

procedure TFrmConMarca.ConhecaObj(vMarca: Marca);
begin
  umaMarca := vMarca;
  umaCtrlMarca := CtrlMarca.CrieObjeto;
  umFrmCadMarca := TFrmCadMarca.Create(nil);
  Self.gridConsulta.DataSource := umaCtrlMarca.GetDS;
end;

procedure TFrmConMarca.btn_ConsultarClick(Sender: TObject);
var  consMarca: Marca;
begin
  inherited;
  consMarca := Marca.CrieObjeto;
  consMarca.setDescricao(edt_Descricao.text);
  if edt_Id.Text <> '' then
      consMarca.setId(strtoint(edt_Id.Text));
  if not umaCtrlMarca.Buscar(consMarca) then
      MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
  consMarca.destrua_se;
  edt_Id.Clear;
  edt_Descricao.Clear;
end;

procedure TFrmConMarca.btn_EditarClick(Sender: TObject);
begin
  inherited;
  umaMarca.setId(0);
  umFrmCadMarca := TFrmCadMarca.Create(nil);
  umaCtrlMarca.Carrega(umaMarca);
  if (umaMarca.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser editado!',mtWarning,[mbOK],0)
  else
    with umFrmCadMarca do
    begin
        ConhecaObj(umaMarca,umaCtrlMarca);
        CarregaObj;
        ShowModal;
    end;
end;

procedure TFrmConMarca.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  umaMarca.setId(0);
  umaCtrlMarca.Carrega(umaMarca);
  if (umaMarca.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser excluido!',mtWarning,[mbOK],0)
  else
    with umFrmCadMarca do
    begin
      ConhecaObj(umaMarca, umaCtrlMarca);
      btn_Salvar.Caption := 'Excluir';
      CarregaObj;
      edt_Marca.Enabled := False;
      ShowModal;
    end;
end;

procedure TFrmConMarca.btn_NovoClick(Sender: TObject);
begin
  inherited;
  if umaMarca.getId <> 0 then
    umaMarca.CrieObjeto;
  with umFrmCadMarca do
  begin
    btn_Salvar.Caption := 'Salvar';
    ConhecaObj(umaMarca, umaCtrlMarca);
    ShowModal;
  end;
end;

procedure TFrmConMarca.btn_SairClick(Sender: TObject);
begin
  inherited;
  if self.btn_Sair.Caption = 'Selecionar' then
  begin
    umaMarca.setId(0);
    umaMarca := Marca(umaCtrlMarca.carrega(umaMarca));
  end;
  umFrmCadMarca.Free;
end;

procedure TFrmConMarca.edt_IdKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CampoNumero(Sender, Key);
end;

procedure TFrmConMarca.FormActivate(Sender: TObject);
begin
  inherited;
//  gridConsulta.columns[1].width:=250;
//  gridConsulta.columns[2].width:=90;
//  gridConsulta.columns[3].width:=90;
end;

end.
