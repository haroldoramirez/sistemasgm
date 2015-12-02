unit UDaoRelatorio;

interface
  uses UdmRelatorio, sysUtils, forms, Dialogs;
  type DaoRelatorio = class
    private
      umDmRelatorio : TdmRelatorio;
    protected
    public
      constructor CrieObjeto;
      destructor Destrua_se;

      procedure rl_ContasPagar;
      procedure rl_ContasReceber;
      procedure rl_RelacaoProdutos;
      procedure rl_Compra;
      procedure rl_Venda;
  end;

implementation

{ DaoRelatorio }

constructor DaoRelatorio.CrieObjeto;
begin
    umDmRelatorio := TdmRelatorio.Create(nil);
end;

destructor DaoRelatorio.destrua_se;
begin
    umDmRelatorio.Destroy;
end;

procedure DaoRelatorio.rl_ContasPagar;
begin
  with umDmRelatorio do
  begin
    frxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName)+'Relatorios\RLContasPagar.fr3');
    frxRelatorio.ShowReport(true);
  end;
end;

procedure DaoRelatorio.rl_ContasReceber;
begin
  with umDmRelatorio do
  begin
    frxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName)+'Relatorios\RLContasReceber.fr3');
    frxRelatorio.ShowReport(true);
  end;
end;

procedure DaoRelatorio.rl_RelacaoProdutos;
begin
  with umDmRelatorio do
  begin
    frxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName)+'Relatorios\RLRelacaoProdutos.fr3');
    frxRelatorio.ShowReport(true);
  end;
end;

procedure DaoRelatorio.rl_Compra;
begin
  with umDmRelatorio do
  begin
    frxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName)+'Relatorios\RLCompra.fr3');
    frxRelatorio.ShowReport(true);
  end;
end;

procedure DaoRelatorio.rl_Venda;
begin
  with umDmRelatorio do
  begin
    frxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName)+'Relatorios\RLVenda.fr3');
    frxRelatorio.ShowReport(true);
  end;
end;
end.

