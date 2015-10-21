unit UFuncionario;

interface
    uses SysUtils, UPessoa, UCargo;
    type Funcionario = class(Pessoa)
    protected
      idCargo         : Integer;
      umCargo         : Cargo;
      CNH             : string[8];
      CTPS            : string[8];
      DataVencimento  : TDateTime;
      DataAdmissao    : TDateTime;
      DataDemissao    : TDateTime;
    public
      verificaNome    : Boolean;
      constructor CrieObjeto;
      destructor destrua_se;

      Procedure setIdCargo (vIdCargo : Integer);
      Procedure setUmCargo (vCargo : Cargo);
      Procedure setCNH (vCNH : string);
      Procedure setCTPS (vCTPS : string);
      Procedure setDataVencimento (vDataVencimento : TDateTime);
      Procedure setDataAdmissao (vDataAdmissao : TDateTime);
      Procedure setDataDemissao (vDataDemissao : TDateTime);

      Function getIdCargo : Integer;
      Function getUmCargo : Cargo;
      Function getCNH : string;
      Function getCTPS : string;
      Function getDataVencimento : TDateTime;
      Function getDataAdmissao : TDateTime;
      Function getDataDemissao : TDateTime;
    end;
implementation

{ Funcionario }

constructor Funcionario.CrieObjeto;
var dataAtual : TDateTime;
begin
  inherited;
  dataAtual  := Date;
  idCargo    := 0;
  umCargo    := Cargo.CrieObjeto;
  CNH        := '';
  CTPS       := '';
end;

destructor Funcionario.destrua_se;
begin
   inherited;
end;

function Funcionario.getCNH: string;
begin
    Result := CNH;
end;

function Funcionario.getCTPS: string;
begin
    Result := CTPS;
end;

function Funcionario.getDataAdmissao: TDateTime;
begin
    Result := DataAdmissao;
end;

function Funcionario.getDataDemissao: TDateTime;
begin
    Result := DataDemissao;
end;

function Funcionario.getDataVencimento: TDateTime;
begin
    Result := DataVencimento;
end;

function Funcionario.getIdCargo: Integer;
begin
    Result := idCargo;
end;

function Funcionario.getUmCargo: Cargo;
begin
    Result := umCargo;
end;

procedure Funcionario.setCNH(vCNH: string);
begin
    CNH := vCNH;
end;

procedure Funcionario.setCTPS(vCTPS: string);
begin
    CTPS := vCTPS;
end;

procedure Funcionario.setDataAdmissao(vDataAdmissao: TDateTime);
begin
    DataAdmissao := vDataAdmissao;
end;

procedure Funcionario.setDataDemissao(vDataDemissao: TDateTime);
begin
    DataDemissao := vDataDemissao;
end;

procedure Funcionario.setDataVencimento(vDataVencimento: TDateTime);
begin
    DataVencimento := vDataVencimento;
end;

procedure Funcionario.setIdCargo(vIdCargo: Integer);
begin
    idCargo := vIdCargo;
end;

procedure Funcionario.setUmCargo(vCargo: Cargo);
begin
    umCargo := vCargo;
end;

end.
