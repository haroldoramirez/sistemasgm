unit UFrmConCfop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmConsulta, sSkinManager, Buttons, sBitBtn, StdCtrls, sButton,
  sEdit, sLabel, sGroupBox, Grids, DBGrids, UCfop, UCtrlCfop, uComuns, UFrmCadCfop;

type
  TFrmConCfop = class(TFrmConsulta)
    gridConsulta: TDBGrid;
    procedure btn_ConsultarClick(Sender: TObject);
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_EditarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
  private
    umFrmCadCfop : TFrmCadCfop;
    umaCtrlCfop : CtrlCfop;
    umCfop : Cfop;
  public
    { Public declarations }
    procedure ConhecaObj(vCfop:Cfop);
  end;

var
  FrmConCfop: TFrmConCfop;

implementation

{$R *.dfm}

{ TFrmConCfop }

procedure TFrmConCfop.btn_ConsultarClick(Sender: TObject);
var
    consCfop: Cfop;
begin
  inherited;
    consCfop := Cfop.CrieObjeto;
    consCfop.setNome(edt_Descricao.text);
    if edt_Id.Text <> '' then
        consCfop.setId(strtoint(edt_Id.Text));
    if not umaCtrlCfop.Buscar(consCfop) then
        MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
    consCfop.destrua_se;
    edt_Id.Clear;
    edt_Descricao.Clear;
end;

procedure TFrmConCfop.btn_EditarClick(Sender: TObject);
begin
  inherited;
  umCfop.setId(0);
  umFrmCadCfop := TFrmCadCfop.Create(nil);
  umaCtrlCfop.Carrega(umCfop);
  if (umCfop.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser editado!',mtWarning,[mbOK],0)
  else
    with umFrmCadCfop do
    begin
        ConhecaObj(umCfop,umaCtrlCfop);
        CarregaObj;
        ShowModal;
    end;
end;

procedure TFrmConCfop.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  umCfop.setId(0);
  umaCtrlCfop.Carrega(umCfop);
  if (umCfop.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser excluido!',mtWarning,[mbOK],0)
  else
  begin
    umFrmCadCfop.ConhecaObj(umCfop, umaCtrlCfop);
    umFrmCadCfop.btn_Salvar.Caption := 'Excluir';
    umFrmCadCfop.CarregaObj;
    umFrmCadCfop.edt_Numero.Enabled := False;
    umFrmCadCfop.edt_Nome.Enabled := false;
    umFrmCadCfop.ShowModal;
  end;

end;

procedure TFrmConCfop.btn_NovoClick(Sender: TObject);
begin
  inherited;
  if umCfop.getId <> 0 then
     umCfop.CrieObjeto;
  umFrmCadCfop.btn_Salvar.Caption := 'Salvar';
  umFrmCadCfop.ConhecaObj(umCfop, umaCtrlCfop);
  umFrmCadCfop.ShowModal;
end;

procedure TFrmConCfop.ConhecaObj(vCfop: Cfop);
begin
    umCfop := vCfop;
    umaCtrlCfop := CtrlCfop.CrieObjeto;
    umFrmCadCfop := TFrmCadCfop.Create(nil);
    Self.gridConsulta.DataSource := umaCtrlCfop.GetDS;
end;

end.
