unit UFrmConProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmConsulta, Grids, DBGrids, sSkinManager, Buttons, sBitBtn,
  StdCtrls, sButton, sEdit, sLabel, sGroupBox, UProduto, UFrmCadProduto,
  UCtrlProduto, UComuns, UDaoRelatorio;

type
  TFrmConProduto = class(TFrmConsulta)
    gridConsulta: TDBGrid;
    btn_Relatorio: TsButton;
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_EditarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure btn_ConsultarClick(Sender: TObject);
    procedure edt_IdKeyPress(Sender: TObject; var Key: Char);
    procedure btn_RelatorioClick(Sender: TObject);
  private
    umProduto       : Produto;
    umFrmCadProduto : TFrmCadProduto;
    umaCtrlProduto  : CtrlProduto;
    umaDaoRelatorio : DaoRelatorio;
  public
    procedure ConhecaObj(vProduto:Produto);
    procedure desabilitaCampos;
  end;

var
  FrmConProduto: TFrmConProduto;

implementation

{$R *.dfm}

{ TFrmConProduto }

procedure TFrmConProduto.btn_ConsultarClick(Sender: TObject);
var consProduto: Produto;
begin
  inherited;
  consProduto := Produto.CrieObjeto;
  consProduto.setDescricao(edt_Descricao.text);
  if edt_Id.Text <> '' then
    consProduto.setId(strtoint(edt_Id.Text));
  if not umaCtrlProduto.Buscar(consProduto) then
      MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
  consProduto.destrua_se;
  edt_Id.Clear;
  edt_Descricao.Clear;
end;

procedure TFrmConProduto.btn_EditarClick(Sender: TObject);
begin
  inherited;
  umProduto.setId(0);
  umFrmCadProduto := TFrmCadProduto.Create(nil);
  umaCtrlProduto.Carrega(umProduto);
  if (umProduto.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser editado!',mtWarning,[mbOK],0)
  else
    with umFrmCadProduto do
    begin
      ConhecaObj(umProduto,umaCtrlProduto);
      CarregaObj;
      ShowModal;
    end;
end;

procedure TFrmConProduto.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  umProduto.setId(0);
  umaCtrlProduto.Carrega(umProduto);
  if (umProduto.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser excluido!',mtWarning,[mbOK],0)
  else
  begin
    umFrmCadProduto.ConhecaObj(umProduto, umaCtrlProduto);
    umFrmCadProduto.btn_Salvar.Caption := 'Excluir';
    umFrmCadProduto.CarregaObj;
    Self.desabilitaCampos;
    umFrmCadProduto.ShowModal;
  end;
end;

procedure TFrmConProduto.btn_NovoClick(Sender: TObject);
begin
  inherited;
  if umProduto.getId <> 0 then
    umProduto.CrieObjeto;
  umFrmCadProduto.btn_Salvar.Caption := 'Salvar';
  umFrmCadProduto.ConhecaObj(umProduto, umaCtrlProduto);
  umFrmCadProduto.ShowModal;
end;

procedure TFrmConProduto.btn_RelatorioClick(Sender: TObject);
begin
  inherited;
  if (umaCtrlProduto.RelacaoProduto(0)) then
    umaDaoRelatorio.rl_RelacaoProdutos
  else
    MessageDlg('Nenhum registro encontrado!', mtInformation,[mbOK],0)
end;

procedure TFrmConProduto.btn_SairClick(Sender: TObject);
begin
  inherited;
  if self.btn_Sair.Caption = 'Selecionar' then
  begin
    umProduto.setId(0);
    umProduto := Produto(umaCtrlProduto.Carrega(umProduto));
  end;
  umFrmCadProduto.Free;
end;

procedure TFrmConProduto.ConhecaObj(vProduto: Produto);
begin
  umProduto       := vProduto;
  umaCtrlProduto  := CtrlProduto.CrieObjeto;
  umaDaoRelatorio := DaoRelatorio.CrieObjeto;
  umFrmCadProduto := TFrmCadProduto.Create(nil);
  Self.gridConsulta.DataSource := umaCtrlProduto.GetDS;
  self.btn_Relatorio.Hide;
end;

procedure TFrmConProduto.desabilitaCampos;
begin
  with umFrmCadProduto do
  begin
    edt_Descricao.Enabled := False;
    edt_IdMarca.Enabled := False;
    edt_IdCategoria.Enabled := False;
    edt_IdUnidade.Enabled := False;
    edt_Quantidade.Enabled := False;
    edt_ICMS.Enabled := False;
    edt_IPI.Enabled := False;
    edt_PrecoVenda.Enabled := False;
    edt_Observacao.Enabled := False;
    btn_BuscarMarca.Enabled := False;
    btn_BuscarCategoria.Enabled := False;
    btn_BuscarUnidade.Enabled := False;
  end;
end;

procedure TFrmConProduto.edt_IdKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CampoNumero(Sender, Key)
end;

end.
