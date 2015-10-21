unit UGenerico;

interface
    uses DateUtils, SysUtils;
    type Generico = class

    protected
        Id : Integer;
        Descricao : string[100];
        DataCadastro  : TDateTime;
        DataAlteracao : TDateTime;
    public
        Constructor CrieObjeto;
        Destructor Destrua_Se;
        Procedure setId (vId : integer);
        Procedure setDescricao (vDescricao : string);
        Procedure setDataCadastro (vDataCadastro : TDateTime);
        Procedure setDataAlteracao (vDataAlteracao : TDateTime);
        Function getId  : integer;
        Function getDescricao     : string;
        Function getDataCadastro  :TDateTime;
        Function getDataAlteracao : TDateTime;
    end;

implementation

{ Generico }

constructor Generico.CrieObjeto;
var dataAtual : TDateTime;
begin
     dataAtual := Date;
     Id := 0;
     Descricao := '';
     DataCadastro := dataAtual;
     DataAlteracao:= dataAtual;
end;

destructor Generico.Destrua_Se;
begin

end;

function Generico.getDataCadastro: TDateTime;
begin
     Result := DataCadastro;
end;

function Generico.getDataAlteracao: TDateTime;
begin
     Result := DataAlteracao;
end;

function Generico.getDescricao: string;
begin
     Result := Descricao;
end;

function Generico.getId: integer;
begin
    Result := Id;
end;

procedure Generico.setDataCadastro(vDataCadastro: TDateTime);
begin
     DataCadastro := vDataCadastro;
end;

procedure Generico.setDataAlteracao(vDataAlteracao: TDateTime);
begin
     DataAlteracao := vDataAlteracao;
end;

procedure Generico.setDescricao(vDescricao: string);
begin
     Descricao := vDescricao;
end;

procedure Generico.setId(vId: integer);
begin
    Id := vId;
end;

end.
