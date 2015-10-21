unit UDaoParcelas;

interface
      uses uDao, DB, SysUtils, Messages, UParcelas, UDaoPais;
      type DaoParcelas = class(Dao)
      private

      protected
         umParcelas : Parcelas;
         umaDaoPais : DaoPais;
      public
          Constructor CrieObjeto;
          Destructor Destrua_se;
          function Salvar(obj:TObject): string;      override;
          function Carrega(obj:TObject): TObject;    override;
          function Buscar(obj : TObject) : Boolean;  override;
          function Excluir(obj : TObject) : string ; override;
          procedure AtualizaGrid;
          procedure Ordena(campo: string);
end;

implementation

{ DaoParcelas }

function DaoParcelas.Buscar(obj: TObject): Boolean;
begin

end;

procedure DaoParcelas.AtualizaGrid;
begin

end;

function DaoParcelas.Carrega(obj: TObject): TObject;
var
    umParcelas: Parcelas;
begin
    umParcelas := Parcelas(obj);
    with umDM do
    begin
        if not QParcelas.Active then
            QParcelas.Open;

        umParcelas.setnumParcela(QParcelasnumParcela.AsInteger);
        umParcelas.setDias(QParcelasnumdias.AsInteger);
        umParcelas.setPorcentagem(QParcelasporcentagem.AsFloat);
    end;
    result := umParcelas;
end;

constructor DaoParcelas.CrieObjeto;
begin
    inherited;
end;

destructor DaoParcelas.Destrua_se;
begin
    inherited;
end;

function DaoParcelas.Excluir(obj: TObject): string;
begin

end;

procedure DaoParcelas.Ordena(campo: string);
begin

end;

function DaoParcelas.Salvar(obj: TObject): string;
begin

end;

end.
