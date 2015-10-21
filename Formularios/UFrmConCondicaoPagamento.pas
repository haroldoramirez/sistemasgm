unit UFrmConCondicaoPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmConsulta, Grids, DBGrids, sSkinManager, Buttons, sBitBtn,
  StdCtrls, sButton, sEdit, sLabel, sGroupBox, UCondicaoPagamento,
  UFrmCadCondicaoPagamento, UCtrlCondicaoPagamento, UFrmConFormaPagamento,
  UCtrlFormaPagamento, UFormaPagamento, UComuns;

type
  TFrmConCondicaoPagamento = class(TFrmConsulta)
    edt_FormaPagamento: TsEdit;
    lbl_FormaPagamento: TsLabel;
    btn_Buscar: TsBitBtn;
    edt_IdFormaPagamento: TsEdit;
    gridConsulta: TDBGrid;
    lbl_IdFormaPagamento: TsLabel;
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_EditarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure btn_BuscarClick(Sender: TObject);
    procedure edt_IdFormaPagamentoExit(Sender: TObject);
    procedure btn_ConsultarClick(Sender: TObject);
    procedure edt_IdKeyPress(Sender: TObject; var Key: Char);
    procedure edt_IdFormaPagamentoKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
     umaCondicaoPagamento      : CondicaoPagamento;
     umFrmCadCondicaoPagamento : TFrmCadCondicaoPagamento;
     umaCtrlCondicaoPagamento  : CtrlCondicaoPagamento;
     umFrmConFormaPagamento    : TFrmConFormaPagamento;
  public
    procedure ConhecaObj(vCondicaoPagamento : CondicaoPagamento);
    procedure DesabilitaCampos;
  end;

var
  FrmConCondicaoPagamento: TFrmConCondicaoPagamento;

implementation

{$R *.dfm}

{ TFrmConCondicaoPagamento }

procedure TFrmConCondicaoPagamento.ConhecaObj(vCondicaoPagamento: CondicaoPagamento);
begin
    umaCondicaoPagamento := vCondicaoPagamento;
    umaCtrlCondicaoPagamento := CtrlCondicaoPagamento.CrieObjeto;
    umFrmCadCondicaoPagamento := TFrmCadCondicaoPagamento.Create(nil);
    self.gridConsulta.DataSource := umaCtrlCondicaoPagamento.GetDS;
end;

procedure TFrmConCondicaoPagamento.btn_NovoClick(Sender: TObject);
begin
  inherited;
  if umaCondicaoPagamento.getId <> 0 then
    umaCondicaoPagamento.CrieObjeto;
  umFrmCadCondicaoPagamento.btn_Salvar.Caption := 'Salvar';
  umFrmCadCondicaoPagamento.ConhecaObj(umaCondicaoPagamento, umaCtrlCondicaoPagamento);
  umFrmCadCondicaoPagamento.ShowModal;
end;

procedure TFrmConCondicaoPagamento.btn_EditarClick(Sender: TObject);
begin
  inherited;
  umaCondicaoPagamento.setId(0);
  umFrmCadCondicaoPagamento := TFrmCadCondicaoPagamento.Create(nil);
  umaCtrlCondicaoPagamento.Carrega(umaCondicaoPagamento);
  if (umaCondicaoPagamento.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser editado!',mtWarning,[mbOK],0)
  else
    with umFrmCadCondicaoPagamento do
    begin
      ConhecaObj(umaCondicaoPagamento,umaCtrlCondicaoPagamento);
      CarregaObj;
      ShowModal;
    end;
end;
procedure TFrmConCondicaoPagamento.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  umaCondicaoPagamento.setId(0);
  umaCtrlCondicaoPagamento.Carrega(umaCondicaoPagamento);
  if (umaCondicaoPagamento.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser excluido!',mtWarning,[mbOK],0)
  else
  begin
    umFrmCadCondicaoPagamento.ConhecaObj(umaCondicaoPagamento, umaCtrlCondicaoPagamento);
    umFrmCadCondicaoPagamento.btn_Salvar.Caption := 'Excluir';
    umFrmCadCondicaoPagamento.CarregaObj;
    Self.DesabilitaCampos;
    umFrmCadCondicaoPagamento.ShowModal;
  end;
end;

procedure TFrmConCondicaoPagamento.DesabilitaCampos;
var i : Integer;
begin
  umFrmCadCondicaoPagamento.rg_GerarParcelas.Enabled := False;
  umFrmCadCondicaoPagamento.btn_Add_Gerar.Enabled := False;
  umFrmCadCondicaoPagamento.btn_Limpar.Enabled := False;
  umFrmCadCondicaoPagamento.btn_Buscar.Enabled := False;
  umFrmCadCondicaoPagamento.gridParcelas.Enabled := False;
  for i := 0 to umFrmCadCondicaoPagamento.ComponentCount - 1 do
    if umFrmCadCondicaoPagamento.Components[i] is TsEdit then
        TsEdit(umFrmCadCondicaoPagamento.Components[i]).Enabled := False;
end;

procedure TFrmConCondicaoPagamento.btn_ConsultarClick(Sender: TObject);
var  consCondicaoPgto: CondicaoPagamento;
begin
  inherited;
  consCondicaoPgto := CondicaoPagamento.CrieObjeto;
  consCondicaoPgto.setDescricao(edt_Descricao.text);
  if (edt_Id.Text <> '') then
    consCondicaoPgto.setId(strtoint(edt_Id.Text));
  if (edt_IdFormaPagamento.Text <> '') then
    consCondicaoPgto.getUmaFormaPagamento.setId(StrToInt(edt_IdFormaPagamento.Text));
  if not umaCtrlCondicaoPagamento.Buscar(consCondicaoPgto) then
      MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
  consCondicaoPgto.destrua_se;
  Self.edt_Id.Clear;
  Self.edt_Descricao.Clear;
  Self.edt_IdFormaPagamento.Clear;
  Self.edt_FormaPagamento.Clear;
end;

procedure TFrmConCondicaoPagamento.btn_BuscarClick(Sender: TObject);
begin
  inherited;
  umFrmConFormaPagamento := TFrmConFormaPagamento.Create(nil);
  umFrmConFormaPagamento.ConhecaObj(UmaCondicaoPagamento.getUmaFormaPagamento);
  umFrmConFormaPagamento.btn_Sair.Caption := 'Selecionar';
  umFrmConFormaPagamento.ShowModal;
  self.edt_IdFormaPagamento.Text := IntToStr(UmaCondicaoPagamento.getUmaFormaPagamento.getId);
  self.edt_FormaPagamento.Text   :=  UmaCondicaoPagamento.getUmaFormaPagamento.getDescricao;
end;

procedure TFrmConCondicaoPagamento.edt_IdFormaPagamentoExit(Sender: TObject);
var
  umaCtrlFormaPagamento: CtrlFormaPagamento;
  umaFormaPagamento: FormaPagamento;
begin
  inherited;
  if self.edt_IdFormaPagamento.Text <> '' then
  begin
    // umEstado := Estado.CrieObjeto;
    self.edt_FormaPagamento.Clear;
    umaCtrlFormaPagamento := CtrlFormaPagamento.CrieObjeto;
    UmaCondicaoPagamento.getUmaFormaPagamento.setId(StrToInt(self.edt_IdFormaPagamento.Text));
    UmaCondicaoPagamento.getUmaFormaPagamento.setDescricao(self.edt_FormaPagamento.Text);
    if not umaCtrlFormaPagamento.Buscar(UmaCondicaoPagamento.getUmaFormaPagamento) then
    begin
      MessageDlg('Nenhum registro encontrado!', mtInformation, [mbOK], 0);
      self.edt_IdFormaPagamento.Clear;
      self.edt_FormaPagamento.Clear;
    end
    else
    begin
      umaCtrlFormaPagamento.Carrega(UmaCondicaoPagamento.getUmaFormaPagamento);
      self.edt_IdFormaPagamento.Text := IntToStr(UmaCondicaoPagamento.getUmaFormaPagamento.getId);
      self.edt_FormaPagamento.Text :=  UmaCondicaoPagamento.getUmaFormaPagamento.getDescricao;
    end;
    umaFormaPagamento := FormaPagamento.CrieObjeto;
    umaCtrlFormaPagamento.Buscar(umaFormaPagamento);
  end
  else
  begin
    self.edt_IdFormaPagamento.Clear;
    self.edt_FormaPagamento.Clear;
  end;
end;

procedure TFrmConCondicaoPagamento.btn_SairClick(Sender: TObject);
begin
  inherited;
  if self.btn_Sair.Caption = 'Selecionar' then
  begin
    umaCondicaoPagamento.setId(0);
    umaCondicaoPagamento := CondicaoPagamento(umaCtrlCondicaoPagamento.Carrega(umaCondicaoPagamento));
  end;
  umFrmCadCondicaoPagamento.Free;
end;

procedure TFrmConCondicaoPagamento.edt_IdKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CampoNumero(Sender, Key);
end;

procedure TFrmConCondicaoPagamento.edt_IdFormaPagamentoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CampoNumero(Sender, Key);
end;

procedure TFrmConCondicaoPagamento.FormActivate(Sender: TObject);
begin
  inherited;
  gridConsulta.columns[1].width:=270;
end;

end.
