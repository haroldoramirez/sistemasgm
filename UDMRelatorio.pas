unit UDMRelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZSqlUpdate, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  frxClass, frxDBSet, UDM, frxBarcode, frxDesgn;

type
  TDmRelatorio = class(TDM)
    frxRelatorio: TfrxReport;
    frxDBSContasPagar: TfrxDBDataset;
    frxDBSContasReceber: TfrxDBDataset;
    frxDBSProdutos: TfrxDBDataset;
    frxDBSCompra: TfrxDBDataset;
    frxDBSVenda: TfrxDBDataset;
    frxDBSProdutoVenda: TfrxDBDataset;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmRelatorio: TDmRelatorio;

implementation

{$R *.dfm}

end.
