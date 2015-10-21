unit UFrmConFormaPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmConsulta, Grids, DBGrids, sSkinManager, Buttons, sBitBtn,
  StdCtrls, sButton, sEdit, sLabel, sGroupBox, UFormaPagamento,
  UFrmCadFormaPagamento, UCtrlFormaPagamento, UComuns;

type
  TFrmConFormaPagamento = class(TFrmConsulta)
    gridConsulta: TDBGrid;
    procedure btn_ConsultarClick(Sender: TObject);
    procedure btn_EditarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure btn_NovoClick(Sender: TObject);
    procedure edt_IdKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    umaFormaPagamento : FormaPagamento;
    umFrmCadFormaPagamento : TFrmCadFormaPagamento;
    umaCtrlFormaPagamento : CtrlFormaPagamento;
  public
    procedure ConhecaObj(vFormaPagamento:FormaPagamento);
  end;

var
  FrmConFormaPagamento: TFrmConFormaPagamento;

implementation

{$R *.dfm}

{ TFrmConFormaPagamento }

procedure TFrmConFormaPagamento.btn_ConsultarClick(Sender: TObject);
var  consFormaPagamento: FormaPagamento;
begin
  inherited;
  consFormaPagamento := FormaPagamento.CrieObjeto;
  consFormaPagamento.setDescricao(edt_Descricao.text);
  if edt_Id.Text <> '' then
      consFormaPagamento.setId(strtoint(edt_Id.Text));
  if not umaCtrlFormaPagamento.Buscar(consFormaPagamento) then
      MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
  consFormaPagamento.destrua_se;
  edt_Id.Clear;
  edt_Descricao.Clear;
end;

procedure TFrmConFormaPagamento.btn_EditarClick(Sender: TObject);
begin
  inherited;
  umaFormaPagamento.setId(0);
  umFrmCadFormaPagamento := TFrmCadFormaPagamento.Create(nil);
  umaCtrlFormaPagamento.Carrega(umaFormaPagamento);
  if (umaFormaPagamento.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser editado!',mtWarning,[mbOK],0)
  else
    with umFrmCadFormaPagamento do
    begin
      ConhecaObj(umaFormaPagamento,umaCtrlFormaPagamento);
      CarregaObj;
      ShowModal;
    end;
end;

procedure TFrmConFormaPagamento.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  umaFormaPagamento.setId(0);
  umaCtrlFormaPagamento.Carrega(umaFormaPagamento);
  if (umaFormaPagamento.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser excluido!',mtWarning,[mbOK],0)
  else
  begin
    umFrmCadFormaPagamento.ConhecaObj(umaFormaPagamento, umaCtrlFormaPagamento);
    umFrmCadFormaPagamento.btn_Salvar.Caption := 'Excluir';
    umFrmCadFormaPagamento.CarregaObj;
    umFrmCadFormaPagamento.edt_FormaPagamento.Enabled := False;
    umFrmCadFormaPagamento.ShowModal;
  end;
end;

procedure TFrmConFormaPagamento.btn_NovoClick(Sender: TObject);
begin
  inherited;
      if umaFormaPagamento.getId <> 0 then
        umaFormaPagamento.CrieObjeto;
      umFrmCadFormaPagamento.ConhecaObj(umaFormaPagamento, umaCtrlFormaPagamento);
      umFrmCadFormaPagamento.ShowModal;
end;

procedure TFrmConFormaPagamento.btn_SairClick(Sender: TObject);
begin
  inherited;

  if self.btn_Sair.Caption = 'Selecionar' then
  begin
      umaFormaPagamento.setId(0);
      umaFormaPagamento := FormaPagamento(umaCtrlFormaPagamento.carrega(umaFormaPagamento));
  end;
  umFrmCadFormaPagamento.Free;
end;

procedure TFrmConFormaPagamento.ConhecaObj(vFormaPagamento: FormaPagamento);
begin
    umaFormaPagamento := vFormaPagamento;
    umaCtrlFormaPagamento := CtrlFormaPagamento.CrieObjeto;
    umFrmCadFormaPagamento := TFrmCadFormaPagamento.Create(nil);
    Self.gridConsulta.DataSource := umaCtrlFormaPagamento.GetDS;
end;

procedure TFrmConFormaPagamento.edt_IdKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
      CampoNumero(Sender, Key);
end;

procedure TFrmConFormaPagamento.FormActivate(Sender: TObject);
begin
  inherited;
//  gridConsulta.columns[1].width:=235;
//  gridConsulta.columns[2].width:=50;
end;

end.
