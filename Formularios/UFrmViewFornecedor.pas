unit UFrmViewFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, UFornecedor, UProduto, UProdutoFornecedor, UDaoProduto,
  UCtrlProduto;

type
  TFrmViewFornecedor = class(TForm)
    gridFornecedor: TStringGrid;
    procedure FormActivate(Sender: TObject);
  private
    umProdutoFornecedor : ProdutoFornecedor;
    umFornecedor        : Fornecedor;
    umProduto           : Produto;
    umaDaoProduto       : DaoProduto;
    umaCtrlProduto      : CtrlProduto;
  public
    procedure ConhecaObj(vProduto : Produto);
    procedure CarregaGridFornecedor;
  end;

var
  FrmViewFornecedor: TFrmViewFornecedor;

implementation

{$R *.dfm}

{ TFrmViewFornecedor }

procedure TFrmViewFornecedor.ConhecaObj(vProduto: Produto);
begin
  umProduto           := vProduto;
//  umProdutoFornecedor := ProdutoFornecedor.CrieObjeto;
//  umFornecedor        := Fornecedor.CrieObjeto;
  umaCtrlProduto := CtrlProduto.CrieObjeto;
  umProdutoFornecedor := ProdutoFornecedor(umaCtrlProduto.CarregarFornececor(umProduto));
  CarregaGridFornecedor;
end;

procedure TFrmViewFornecedor.CarregaGridFornecedor;
var i : Integer;
begin
  for i := 1 to umProdutoFornecedor.CountFornecedores do
  begin
    self.gridFornecedor.RowCount := i + 1;
    if (self.gridFornecedor.Cells[0, i] = '') then
      begin
        self.gridFornecedor.Cells[0, i] := IntToStr(umProdutoFornecedor.getFornecedor(i-1).getId);
        self.gridFornecedor.Cells[1, i] := umProdutoFornecedor.getFornecedor(i-1).getNome_RazaoSoCial;
        self.gridFornecedor.Cells[2, i] := umProdutoFornecedor.getFornecedor(i-1).getTelefone;
        self.gridFornecedor.Cells[3, i] := umProdutoFornecedor.getFornecedor(i-1).getCelular;
        self.gridFornecedor.Cells[4, i] := umProdutoFornecedor.getFornecedor(i-1).getEmail;
      end;
  end;
end;

procedure TFrmViewFornecedor.FormActivate(Sender: TObject);
begin
  self.gridFornecedor.ColWidths[1] := 200;
  self.gridFornecedor.ColWidths[4] := 177;
  self.gridFornecedor.Cells[0,0] := 'Código';
  self.gridFornecedor.Cells[1,0] := 'Fornecedor';
  self.gridFornecedor.Cells[2,0] := 'Telefone';
  self.gridFornecedor.Cells[3,0] := 'Celular';
  self.gridFornecedor.Cells[4,0] := 'Email';
end;

end.
