unit UFrmConVeiculo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmConsulta, sSkinManager, Buttons, sBitBtn, StdCtrls, sButton,
  sEdit, sLabel, sGroupBox, UVeiculo, UCtrlVeiculo, UFrmCadVeiculo, Grids,
  DBGrids;

type
  TFrmConVeiculo = class(TFrmConsulta)
    gridConsulta: TDBGrid;
    procedure btn_ConsultarClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_EditarClick(Sender: TObject);
    procedure btn_NovoClick(Sender: TObject);
  private
    { Private declarations }
    umVeiculo : Veiculo;
    umFrmCadVeiculo : TFrmCadVeiculo;
    umaCtrlVeiculo : CtrlVeiculo;
  public
    { Public declarations }
    procedure ConhecaObj(vVeiculo:Veiculo);
  end;

var
  FrmConVeiculo: TFrmConVeiculo;

implementation

{$R *.dfm}

{ TFrmConVeiculo }

procedure TFrmConVeiculo.btn_ConsultarClick(Sender: TObject);
  var
    consVeiculo: Veiculo;
begin
  inherited;
    consVeiculo := Veiculo.CrieObjeto;
    consVeiculo.setAntt(edt_Descricao.text);
    if edt_Id.Text <> '' then
        consVeiculo.setId(strtoint(edt_Id.Text));
    if not umaCtrlVeiculo.Buscar(consVeiculo) then
        MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
    consVeiculo.destrua_se;
    edt_Id.Clear;
    edt_Descricao.Clear;
end;

procedure TFrmConVeiculo.btn_EditarClick(Sender: TObject);
begin
  inherited;
  umVeiculo.setId(0);
  umFrmCadVeiculo := TFrmCadVeiculo.Create(nil);
  umaCtrlVeiculo.Carrega(umVeiculo);
  if (umVeiculo.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser editado!',mtWarning,[mbOK],0)
  else
    with umFrmCadVeiculo do
    begin
        ConhecaObj(umVeiculo,umaCtrlVeiculo);
        CarregaObj;
        ShowModal;
    end;
end;

procedure TFrmConVeiculo.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  umVeiculo.setId(0);
  umaCtrlVeiculo.Carrega(umVeiculo);
  if (umVeiculo.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser excluido!',mtWarning,[mbOK],0)
  else
  begin
    umFrmCadVeiculo.ConhecaObj(umVeiculo, umaCtrlVeiculo);
    umFrmCadVeiculo.btn_Salvar.Caption := 'Excluir';
    umFrmCadVeiculo.CarregaObj;
    umFrmCadVeiculo.edt_Antt.Enabled := False;
    umFrmCadVeiculo.edt_IdVeiculo.Enabled := false;
    umFrmCadVeiculo.edt_Uf.Enabled := false;
    umFrmCadVeiculo.edt_Placa.Enabled := false;
    umFrmCadVeiculo.ShowModal;
  end;
end;

procedure TFrmConVeiculo.btn_NovoClick(Sender: TObject);
begin
  inherited;
  if umVeiculo.getId <> 0 then
     umVeiculo.CrieObjeto;
  umFrmCadVeiculo.btn_Salvar.Caption := 'Salvar';
  umFrmCadVeiculo.ConhecaObj(umVeiculo, umaCtrlVeiculo);
  umFrmCadVeiculo.ShowModal;
end;

procedure TFrmConVeiculo.btn_SairClick(Sender: TObject);
begin
  inherited;
  if self.btn_Sair.Caption = 'Selecionar' then
  begin
      umVeiculo.setId(0);
      umVeiculo := Veiculo(umaCtrlVeiculo.carrega(umVeiculo));
  end;
  umFrmCadVeiculo.Free;
end;

procedure TFrmConVeiculo.ConhecaObj(vVeiculo: Veiculo);
begin
    umVeiculo := vVeiculo;
    umaCtrlVeiculo := CtrlVeiculo.CrieObjeto;
    umFrmCadVeiculo := TFrmCadVeiculo.Create(nil);
    Self.gridConsulta.DataSource := umaCtrlVeiculo.GetDS;
end;

end.
