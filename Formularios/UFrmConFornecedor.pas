unit UFrmConFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmConsulta, Mask, sMaskEdit, sSkinManager, Buttons, sBitBtn,
  StdCtrls, sButton, sEdit, sLabel, sGroupBox, Grids, DBGrids, UFornecedor,
  UFrmCadFornecedor, UCtrlFornecedor, UComuns;

type
  TFrmConFornecedor = class(TFrmConsulta)
    edt_Telefone: TsMaskEdit;
    lbl1: TsLabel;
    gridConsulta: TDBGrid;
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_ConsultarClick(Sender: TObject);
    procedure btn_EditarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure edt_IdKeyPress(Sender: TObject; var Key: Char);
  private
    umFornecedor       : Fornecedor;
    umFrmCadFornecedor : TFrmCadFornecedor;
    umaCtrlFornecedor  : CtrlFornecedor;
  public
    TipoFavorecido : String;
    procedure ConhecaObj(vFornecedor : Fornecedor; Tipo:String);
  end;

var
  FrmConFornecedor: TFrmConFornecedor;

implementation

{$R *.dfm}

{ TFrmConFornecedor }

procedure TFrmConFornecedor.btn_ConsultarClick(Sender: TObject);
var consFornecedor: Fornecedor;
begin
  inherited;
  consFornecedor := Fornecedor.CrieObjeto;
    if (self.Caption = 'Consultar Fornecedor') then
      consFornecedor.setTipoFavorecido('F')
    else if (self.Caption = 'Consultar Transportadora') then
      consFornecedor.setTipoFavorecido('T');
  consFornecedor.setNome_RazaoSoCial(edt_Descricao.text);
  consFornecedor.setTelefone(edt_Telefone.text);
  if edt_Id.Text <> '' then
      consFornecedor.setId(strtoint(edt_Id.Text));
  if not umaCtrlFornecedor.Buscar(consFornecedor) then
      MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
  consFornecedor.destrua_se;
  edt_Id.Clear;
  edt_Descricao.Clear;
  edt_Telefone.Clear;
end;

procedure TFrmConFornecedor.btn_EditarClick(Sender: TObject);
begin
  inherited;
  umFornecedor.setId(0);
  umFrmCadFornecedor := TFrmCadFornecedor.Create(nil);
  umaCtrlFornecedor.Carrega(umFornecedor);
  if (umFornecedor.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser editado!',mtWarning,[mbOK],0)
  else
    with umFrmCadFornecedor do
    begin
        ConhecaObj(umFornecedor,umaCtrlFornecedor,TipoFavorecido);
        CarregaObj;
        ShowModal;
    end;
end;

procedure TFrmConFornecedor.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  umFornecedor.setId(0);
  umaCtrlFornecedor.Carrega(umFornecedor);
  if (umFornecedor.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser excluido!',mtWarning,[mbOK],0)
  else
  begin
    umFrmCadFornecedor.ConhecaObj(umFornecedor, umaCtrlFornecedor,TipoFavorecido);
    umFrmCadFornecedor.btn_Salvar.Caption := 'Excluir';
    umFrmCadFornecedor.CarregaObj;
    umFrmCadFornecedor.edt_Nome_RazaoSocial.Enabled := False;

    umFrmCadFornecedor.edt_Logradouro.Enabled := False;
    umFrmCadFornecedor.edt_Numero.Enabled := False;
    umFrmCadFornecedor.edt_CEP.Enabled := False;
    umFrmCadFornecedor.edt_Bairro.Enabled := False;
    umFrmCadFornecedor.edt_Complemento.Enabled := False;
    umFrmCadFornecedor.edt_IdCidade.Enabled := False;
    umFrmCadFornecedor.btn_BuscarCidade.Enabled := False;
    umFrmCadFornecedor.edt_Email.Enabled := False;
    umFrmCadFornecedor.edt_Telefone.Enabled := False;
    umFrmCadFornecedor.edt_Celular.Enabled := False;
    umFrmCadFornecedor.edt_CPF_CNPJ.Enabled := False;
    umFrmCadFornecedor.edt_RG_IE.Enabled := False;
    umFrmCadFornecedor.edt_DataNasc_Fund.Enabled := False;
    umFrmCadFornecedor.edt_IdCondicaoPgto.Enabled := False;
    umFrmCadFornecedor.btn_BuscarCondicaoPgto.Enabled := False;
    umFrmCadFornecedor.rg_TipoPessoa.Enabled := False;
    umFrmCadFornecedor.edt_IdProduto.Enabled := False;
    umFrmCadFornecedor.btn_BuscarProduto.Enabled := False;
    umFrmCadFornecedor.btn_Add_Produto.Enabled := False;
    umFrmCadFornecedor.btn_LimparProduto.Enabled := False;
    umFrmCadFornecedor.gridProduto.Enabled := False;
    umFrmCadFornecedor.edt_Observacao.Enabled := False;

    umFrmCadFornecedor.ShowModal;
  end;
end;

procedure TFrmConFornecedor.btn_NovoClick(Sender: TObject);
begin
  inherited;
  if umFornecedor.getId <> 0 then
    umFornecedor.CrieObjeto;
  umFrmCadFornecedor.btn_Salvar.Caption := 'Salvar';
  umFrmCadFornecedor.ConhecaObj(umFornecedor, umaCtrlFornecedor, TipoFavorecido);
  umFrmCadFornecedor.ShowModal;
end;

procedure TFrmConFornecedor.btn_SairClick(Sender: TObject);
begin
  inherited;
  if self.btn_Sair.Caption = 'Selecionar' then
  begin
      umFornecedor.setId(0);
      umFornecedor := Fornecedor(umaCtrlFornecedor.Carrega(umFornecedor));
  end;
  umFrmCadFornecedor.Free;
end;

procedure TFrmConFornecedor.ConhecaObj(vFornecedor: Fornecedor; Tipo:String);
var T : Char;
begin
    TipoFavorecido     := 'Cadastro '+Tipo;
    Self.Caption       := 'Consultar '+Tipo;
    umFornecedor       := vFornecedor;
    umaCtrlFornecedor  := CtrlFornecedor.CrieObjeto;
    umFrmCadFornecedor := TFrmCadFornecedor.Create(nil);
    self.gridConsulta.DataSource := umaCtrlFornecedor.GetDS;
    if (Tipo = 'Fornecedor') then
      umaCtrlFornecedor.FiltroFavorecido('F')
    else if (Tipo = 'Transportadora') then
      begin
          umaCtrlFornecedor.FiltroFavorecido('T');
      end;
end;

procedure TFrmConFornecedor.edt_IdKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CampoNumero(Sender, Key);
end;

end.
