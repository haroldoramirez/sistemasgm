unit UFrmConNcm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmConsulta, sSkinManager, Buttons, sBitBtn, StdCtrls, sButton,
  sEdit, sLabel, sGroupBox, UNcm, UFrmCadNcm, UCtrlNcm, Grids, DBGrids, uComuns;

type
  TFrmConNcm = class(TFrmConsulta)
    gridConsulta: TDBGrid;
    procedure btn_ConsultarClick(Sender: TObject);
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_EditarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
  private
    { Private declarations }
    umNcm : Ncm;
    umFrmCadNcm : TFrmCadNcm;
    umaCtrlNcm : CtrlNcm;
  public
    { Public declarations }
    procedure ConhecaObj(vNcm:Ncm);
  end;

var
  FrmConNcm: TFrmConNcm;

implementation

{$R *.dfm}

{ TFrmConNcm }

procedure TFrmConNcm.btn_ConsultarClick(Sender: TObject);
var
    consNcm: Ncm;
begin
  inherited;
    consNcm := Ncm.CrieObjeto;
    if edt_Id.Text <> '' then
        consNcm.setId(strtoint(edt_Id.Text));
    if (edt_Descricao.Text <> '') and (strtoint(edt_Descricao.Text) <> 0) then
       consNcm.setNumero(strtoint(edt_Descricao.text));
    if not umaCtrlNcm.Buscar(consNcm) then
        MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
    consNcm.destrua_se;
    edt_Id.Clear;
    edt_Descricao.Clear;
end;

procedure TFrmConNcm.btn_EditarClick(Sender: TObject);
begin
  inherited;
  umNcm.setId(0);
  umFrmCadNcm := TFrmCadNcm.Create(nil);
  umaCtrlNcm.Carrega(umNcm);
  if (umNcm.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser editado!',mtWarning,[mbOK],0)
  else
    with umFrmCadNcm do
    begin
        ConhecaObj(umNcm,umaCtrlNcm);
        CarregaObj;
        ShowModal;
    end;
end;

procedure TFrmConNcm.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  umNcm.setId(0);
  umaCtrlNcm.Carrega(umNcm);
  if (umNcm.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser excluido!',mtWarning,[mbOK],0)
  else
  begin
    umFrmCadNcm.ConhecaObj(umNcm, umaCtrlNcm);
    umFrmCadNcm.btn_Salvar.Caption := 'Excluir';
    umFrmCadNcm.CarregaObj;
    umFrmCadncm.edt_Numero.Enabled := False;
    umFrmCadNcm.edt_PorcentagemIPI.Enabled := false;
    umFrmCadNcm.ShowModal;
  end;
end;

procedure TFrmConNcm.btn_NovoClick(Sender: TObject);
begin
  inherited;
  if umNcm.getId <> 0 then
     umNcm.CrieObjeto;
  umFrmCadNcm.btn_Salvar.Caption := 'Salvar';
  umFrmCadNcm.ConhecaObj(umNcm, umaCtrlNcm);
  umFrmCadNcm.ShowModal;
end;

procedure TFrmConNcm.btn_SairClick(Sender: TObject);
begin
  inherited;
  if self.btn_Sair.Caption = 'Selecionar' then
  begin
    umNcm.setId(0);
    umNcm := Ncm(umaCtrlNcm.carrega(umNcm));
  end;
  umFrmCadNcm.Free;
end;

procedure TFrmConNcm.ConhecaObj(vNcm: Ncm);
begin
    umNcm := vNcm;
    umaCtrlNcm := CtrlNcm.CrieObjeto;
    umFrmCadNcm := TFrmCadNcm.Create(nil);
    Self.gridConsulta.DataSource := umaCtrlNcm.GetDS;
end;

end.
