unit UFrmConPais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmConsulta, StdCtrls, UPais, UFrmCadPais, UCrtlPais, Grids, DBGrids,
  Mask,  sMaskEdit, sCustomComboEdit, sTooledit, Buttons, sBitBtn, sGroupBox,
  sLabel, sEdit, sButton, sSkinManager, UComuns;

type
  TFrmConPais = class(TFrmConsulta)
    gridConsulta: TDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_EditarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure btn_ConsultarClick(Sender: TObject);
    procedure edt_IdKeyPress(Sender: TObject; var Key: Char);
  private
    umPais : Pais;
    umFrmCadPais : TFrmCadPais;
    umaCtrlPais : CtrlPais;
  public
    procedure ConhecaObj(vPais:Pais);
  end;

var
  FrmConPais: TFrmConPais;

implementation

{$R *.dfm}

{ TFrmConPais }

procedure TFrmConPais.btn_ConsultarClick(Sender: TObject);
  var
    consPais: Pais;
begin
  inherited;
    consPais := Pais.CrieObjeto;
    consPais.setDescricao(edt_Descricao.text);
    if edt_Id.Text <> '' then
        consPais.setId(strtoint(edt_Id.Text));
    if not umaCtrlPais.Buscar(consPais) then
        MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
    consPais.destrua_se;
    edt_Id.Clear;
    edt_Descricao.Clear;
end;

procedure TFrmConPais.btn_EditarClick(Sender: TObject);
begin
  inherited;
  umPais.setId(0);
  umFrmCadPais := TFrmCadPais.Create(nil);
  umaCtrlPais.Carrega(umPais);
  if (umPais.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser editado!',mtWarning,[mbOK],0)
  else
    with umFrmCadPais do
    begin
        ConhecaObj(umPais,umaCtrlPais);
        CarregaObj;
        ShowModal;
    end;
end;

procedure TFrmConPais.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  umPais.setId(0);
  umaCtrlPais.Carrega(umPais);
  if (umPais.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser excluido!',mtWarning,[mbOK],0)
  else
  begin
    umFrmCadPais.ConhecaObj(umPais, umaCtrlPais);
    umFrmCadPais.btn_Salvar.Caption := 'Excluir';
    umFrmCadPais.CarregaObj;
    umFrmCadPais.edt_Pais.Enabled := False;
    umFrmCadPais.edt_DDI.Enabled := False;
    umFrmCadPais.edt_Sigla.Enabled := False;
    umFrmCadPais.ShowModal;
  end;
end;

procedure TFrmConPais.btn_NovoClick(Sender: TObject);
begin
  inherited;
  if umPais.getId <> 0 then
     umPais.CrieObjeto;
  umFrmCadPais.btn_Salvar.Caption := 'Salvar';
  umFrmCadPais.ConhecaObj(umPais, umaCtrlPais);
  umFrmCadPais.ShowModal;
end;

procedure TFrmConPais.btn_SairClick(Sender: TObject);
begin
  inherited;
  if self.btn_Sair.Caption = 'Selecionar' then
  begin
      umPais.setId(0);
      umPais := Pais(umaCtrlPais.carrega(umPais));
  end;
  umFrmCadPais.Free;
end;

procedure TFrmConPais.ConhecaObj(vPais: Pais);
begin
    umPais := vPais;
    umaCtrlPais := CtrlPais.CrieObjeto;
    umFrmCadPais := TFrmCadPais.Create(nil);
    Self.gridConsulta.DataSource := umaCtrlPais.GetDS;
end;

procedure TFrmConPais.edt_IdKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CampoNumero(Sender,Key);
end;

procedure TFrmConPais.FormActivate(Sender: TObject);
begin
  inherited;
//  gridConsulta.columns[1].width:=235;
//  gridConsulta.columns[2].width:=50;
end;
end.
