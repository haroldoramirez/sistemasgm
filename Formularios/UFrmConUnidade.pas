unit UFrmConUnidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmConsulta, Grids, DBGrids, sSkinManager, Buttons, sBitBtn,
  StdCtrls, sButton, sEdit, sLabel, sGroupBox, UUnidade, UFrmCadUnidade, UCtrlUnidade, UDM,
  DB, DBTables;

type
  TFrmConUnidade = class(TFrmConsulta)
    gridConsulta: TDBGrid;
    procedure btn_ConsultarClick(Sender: TObject);
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_EditarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure gridConsultaDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
  private
    umaUnidade      : Unidade;
    umFrmCadUnidade : TFrmCadUnidade;
    umaCtrlUnidade  : CtrlUnidade;
  public
    procedure ConhecaObj(vUnidade:Unidade);
  end;

var
  FrmConUnidade: TFrmConUnidade;

implementation

{$R *.dfm}

procedure TFrmConUnidade.ConhecaObj(vUnidade: Unidade);
begin
  umaUnidade := vUnidade;
  umaCtrlUnidade := CtrlUnidade.CrieObjeto;
  umFrmCadUnidade := TFrmCadUnidade.Create(nil);
  Self.gridConsulta.DataSource := umaCtrlUnidade.GetDS;


end;

procedure TFrmConUnidade.gridConsultaDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
  var i : Integer;
begin
  inherited;
  for i := 1 to 4 do
  begin
    if Rect.Top = TStringGrid(gridConsulta).CellRect(0,i).Top then
    begin
      gridConsulta.Canvas.FillRect(Rect);
      gridConsulta.Canvas.Brush.Color := cl3DLight;
      gridConsulta.Canvas.Font.Color := clblue;
      gridConsulta.DefaultDrawDataCell(Rect,Field,State);
    end;
  end;
end;

procedure TFrmConUnidade.btn_NovoClick(Sender: TObject);
begin
  inherited;
  MessageDlg('ATENÇÃO: Novas Unidades de Medida cadastradas após a 4º em destaque será considerada nos cálculos do sistema como uma Unidade(UNI)!',mtWarning,[mbOK],0);
  if umaUnidade.getId <> 0 then
    umaUnidade.CrieObjeto;
  with umFrmCadUnidade do
  begin
    btn_Salvar.Caption := 'Salvar';
    ConhecaObj(umaUnidade, umaCtrlUnidade);
    ShowModal;
  end;
end;

procedure TFrmConUnidade.btn_EditarClick(Sender: TObject);
begin
  inherited;
  umaUnidade.setId(0);
  umFrmCadUnidade := TFrmCadUnidade.Create(nil);
  umaCtrlUnidade.Carrega(umaUnidade);
  if (umaUnidade.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser editado!',mtWarning,[mbOK],0)
  else
    with umFrmCadUnidade do
    begin
        ConhecaObj(umaUnidade,umaCtrlUnidade);
        CarregaObj;
        ShowModal;
    end;
end;

procedure TFrmConUnidade.btn_ExcluirClick(Sender: TObject);
begin
  inherited;

  umaUnidade.setId(0);
  umaCtrlUnidade.Carrega(umaUnidade);
  if (umaUnidade.getId <= 4) then
    MessageDlg('ATENÇÃO: As unidades não podem ser excluídas, pois a referência necessária para efetuar os cálculos será perdida!',mtWarning,[mbOK],0)
  else
    with umFrmCadUnidade do
    begin
      ConhecaObj(umaUnidade, umaCtrlUnidade);
      btn_Salvar.Caption := 'Excluir';
      CarregaObj;
      edt_Unidade.Enabled := False;
      ShowModal;
    end;
end;

procedure TFrmConUnidade.btn_ConsultarClick(Sender: TObject);
var  consUnidade: Unidade;
begin
  inherited;
  consUnidade := Unidade.CrieObjeto;
  consUnidade.setDescricao(edt_Descricao.text);
  if edt_Id.Text <> '' then
      consUnidade.setId(strtoint(edt_Id.Text));
  if not umaCtrlUnidade.Buscar(consUnidade) then
      MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
  consUnidade.destrua_se;
  edt_Id.Clear;
  edt_Descricao.Clear;
end;

procedure TFrmConUnidade.btn_SairClick(Sender: TObject);
begin
  inherited;
  if self.btn_Sair.Caption = 'Selecionar' then
  begin
    umaUnidade.setId(0);
    umaUnidade := Unidade(umaCtrlUnidade.carrega(umaUnidade));
  end;
  umFrmCadUnidade.Free;
end;

procedure TFrmConUnidade.FormActivate(Sender: TObject);
begin
  inherited;
//  gridConsulta.columns[1].width:=270;
//  gridConsulta.columns[2].width:=100;
//  gridConsulta.columns[3].width:=100;
end;

end.
