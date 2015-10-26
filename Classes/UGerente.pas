unit UGerente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, uInter, UPais, UEstado, UCidade, UCliente, UFornecedor,
  UFuncionario, UMarca, UCategoria, UFormaPagamento, UProduto, UCondicaoPagamento,
  UFrmConCondicaoPagamento, UVenda, UFrmConVenda, UCargo, UFrmConCargo, UContasReceber,
  UCompra, UUsuario, UTransportadora, sSkinManager, jpeg, ExtCtrls,
  UContasPagar, UUnidade, UDaoRelatorio, StdCtrls, sCheckBox,
  UVeiculo, uNcm, uCfop;

type
  TGerente = class(TForm)
    mmMenu: TMainMenu;
    Cadastro1: TMenuItem;
    Pas1: TMenuItem;
    mniEstado1: TMenuItem;
    mniCidade1: TMenuItem;
    mniCliente1: TMenuItem;
    mniFornecedor1: TMenuItem;
    mniFuncionrio1: TMenuItem;
    mniProduto1: TMenuItem;
    mniMarca1: TMenuItem;
    mniCategoria1: TMenuItem;
    mniFinanceiro1: TMenuItem;
    mniFormaPagamento1: TMenuItem;
    mniProduto2: TMenuItem;
    mniCargo1: TMenuItem;
    mniN2: TMenuItem;
    mniContasaReceber1: TMenuItem;
    mniContasaPagar1: TMenuItem;
    mniLocalidades1: TMenuItem;
    mniCadastrarFuncionrio1: TMenuItem;
    mniCompraVenda1: TMenuItem;
    mniCompra1: TMenuItem;
    mniVenda1: TMenuItem;
    mniSair1: TMenuItem;
    mniransportadora1: TMenuItem;
    Unidade1: TMenuItem;
    Usurio1: TMenuItem;
    Veculo1: TMenuItem;
    Ncm1: TMenuItem;
    Cfop1: TMenuItem;
    procedure Pas1Click(Sender: TObject);
    procedure mniCidade1Click(Sender: TObject);
    procedure mniCliente1Click(Sender: TObject);
    procedure mniFornecedor1Click(Sender: TObject);
    procedure mniMarca1Click(Sender: TObject);
    procedure mniCategoria1Click(Sender: TObject);
    procedure mniFormaPagamento1Click(Sender: TObject);
    procedure mniProduto2Click(Sender: TObject);
    procedure mniEstado1Click(Sender: TObject);
    procedure mniCondiodePagamento1Click(Sender: TObject);
    procedure mniCadastrarFuncionrio1Click(Sender: TObject);
    procedure mniSair1Click(Sender: TObject);
    procedure mniVenda1Click(Sender: TObject);
    procedure mniCargo1Click(Sender: TObject);
    procedure mniContasaReceber1Click(Sender: TObject);
    procedure mniCompra1Click(Sender: TObject);
    procedure mniUsurio1Click(Sender: TObject);
    procedure mniransportadora1Click(Sender: TObject);
    procedure mniContasaPagar1Click(Sender: TObject);
    procedure Unidade1Click(Sender: TObject);
    procedure Usurio1Click(Sender: TObject);
    procedure Veculo1Click(Sender: TObject);
    procedure Ncm1Click(Sender: TObject);
    procedure Cfop1Click(Sender: TObject);
  private
    umaInter             : Interfaces;
    umPais               : Pais;
    umEstado             : Estado;
    umaCidade            : Cidade;
    umCliente            : Cliente;
    umFornecedor         : Fornecedor;
    umFuncionario        : Funcionario;
    umaMarca             : Marca;
    umaCategoria         : Categoria;
    umaFormaPagamento    : FormaPagamento;
    umProduto            : Produto;
    umaCondicaoPagamento : CondicaoPagamento;
    umaVenda             : Venda;
    umCargo              : Cargo;
    umaContasReceber     : ContasReceber;
    umaCompra            : Compra;
    umUsuario            : Usuario;
    umaTransportadora    : Fornecedor;
    umaContasPagar       : ContasPagar;
    umaUnidade           : Unidade;
    umVeiculo            : Veiculo;
    umNcm                : Ncm;
    umCfop               : Cfop;


  public
    procedure ConhecaObj(vInter:Interfaces; vPais:Pais; vEstado:Estado; vCidade:Cidade;
    vCliente:Cliente; vFornecedor:Fornecedor; vFuncionario:Funcionario; vMarca:Marca;
    vCategoria:Categoria; vFormaPagamento:FormaPagamento; vProduto:Produto;
    vCondicaoPagamento:CondicaoPagamento; vVenda:Venda; vCargo:Cargo; vContasReceber:ContasReceber;
    vCompra:Compra; vUsuario:Usuario; vTransportadora:Fornecedor;
    vContasPagar:ContasPagar; vUnidade:Unidade; vVeiculo:Veiculo; vNcm:Ncm; vCfop:Cfop);
  end;

var
  Gerente: TGerente;

implementation

uses UAplicacao;
var umaAplicacao : Aplicacao;

{$R *.dfm}

{ TGerente }

procedure TGerente.ConhecaObj(vInter: Interfaces; vPais:Pais; vEstado:Estado;
          vCidade:Cidade; vCliente:Cliente; vFornecedor:Fornecedor; vFuncionario:Funcionario;
          vMarca:Marca; vCategoria:Categoria; vFormaPagamento:FormaPagamento; vProduto:Produto;
          vCondicaoPagamento : CondicaoPagamento; vVenda : Venda; vCargo:Cargo;
          vContasReceber: ContasReceber; vCompra:Compra; vUsuario:Usuario; vTransportadora:Fornecedor; vContasPagar:ContasPagar; vUnidade:Unidade;
          vVeiculo: Veiculo; vNcm: Ncm; vCfop: Cfop);
begin
    umaInter             := vInter;
    umPais               := vPais;
    umEstado             := vEstado;
    umaCidade            := vCidade;
    umCliente            := vCliente;
    umFornecedor         := vFornecedor;
    umFuncionario        := vFuncionario;
    umaMarca             := vMarca;
    umaCategoria         := vCategoria;
    umaFormaPagamento    := vFormaPagamento;
    umProduto            := vProduto;
    umaCondicaoPagamento := vCondicaoPagamento;
    umaVenda             := vVenda;
    umCargo              := vCargo;
    umaContasReceber     := vContasReceber;
    umaContasPagar       := vContasPagar;
    umaCompra            := vCompra;
    umUsuario            := vUsuario;
    umaTransportadora    := vFornecedor;
    umaUnidade           := vUnidade;
    umVeiculo            := vVeiculo;
    umNcm                := vNcm;
    umCfop               := vCfop;
end;

procedure TGerente.mniCadastrarFuncionrio1Click(Sender: TObject);
begin
   umaInter.PecaDadosFuncionario(umFuncionario);
end;

procedure TGerente.mniCargo1Click(Sender: TObject);
begin
    umaInter.PecaDadosCargo(umCargo);
end;

procedure TGerente.mniCategoria1Click(Sender: TObject);
begin
    umaInter.PecaDadosCategoria(umaCategoria);
end;

procedure TGerente.mniCidade1Click(Sender: TObject);
begin
    umaInter.PecaDadosCidade(umaCidade);
end;

procedure TGerente.mniCliente1Click(Sender: TObject);
begin
    umaInter.PecaDadosCliente(umCliente);
end;

procedure TGerente.mniCompra1Click(Sender: TObject);
begin
    umaInter.PecaDadosCompra(umaCompra);
end;

procedure TGerente.mniCondiodePagamento1Click(Sender: TObject);
begin
    umaInter.PecaDadosCondicaoPagamento(umaCondicaoPagamento);
end;

procedure TGerente.mniContasaPagar1Click(Sender: TObject);
begin
    umaInter.PecaDadosContasPagar(umaContasPagar);
end;

procedure TGerente.mniContasaReceber1Click(Sender: TObject);
begin
    //umaInter.PecaDadosContasReceber(umaContasReceber);
end;

procedure TGerente.mniEstado1Click(Sender: TObject);
begin
    umaInter.PecaDadosEstado(umEstado);
end;

procedure TGerente.mniFormaPagamento1Click(Sender: TObject);
begin
    umaInter.PecaDadosFormaPagamento(umaFormaPagamento);
end;

procedure TGerente.mniFornecedor1Click(Sender: TObject);
begin
  umaInter.PecaDadosFornecedor(umFornecedor, 'Fornecedor');
end;

procedure TGerente.mniMarca1Click(Sender: TObject);
begin
    umaInter.PecaDadosMarca(umaMarca);
end;

procedure TGerente.mniProduto2Click(Sender: TObject);
begin
   umaInter.PecaDadosProduto(umProduto);
end;

procedure TGerente.mniransportadora1Click(Sender: TObject);
begin
    umaInter.PecaDadosFornecedor(umaTransportadora, 'Transportadora');
end;

procedure TGerente.mniUsurio1Click(Sender: TObject);
begin
    umaInter.PecaDadosUsuario(umUsuario);
end;

procedure TGerente.mniVenda1Click(Sender: TObject);
begin
  //umaInter.PecaDadosVenda(umaVenda);
end;

procedure TGerente.Ncm1Click(Sender: TObject);
begin
    umaInter.PecaDadosNcm(umNcm);
end;

procedure TGerente.Pas1Click(Sender: TObject);
begin
     umaInter.PecaDadosPais(umPais);
end;

procedure TGerente.Unidade1Click(Sender: TObject);
begin
   umaInter.PecaDadosUnidade(umaUnidade);
end;

procedure TGerente.Usurio1Click(Sender: TObject);
begin
    umaInter.PecaDadosUsuario(umUsuario);
end;

procedure TGerente.Veculo1Click(Sender: TObject);
begin
    umaInter.PecaDadosVeiculo(umVeiculo);
end;

procedure TGerente.Cfop1Click(Sender: TObject);
begin
    umaInter.PecaDadosCfop(umCfop);
end;

procedure TGerente.mniSair1Click(Sender: TObject);
begin
    Close;
end;

end.


