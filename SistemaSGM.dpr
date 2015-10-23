program SistemaSGM;

uses
  Forms,
  UGerente in 'Classes\UGerente.pas' {Gerente},
  UPais in 'Classes\UPais.pas',
  UFrmConsulta in 'Formularios\UFrmConsulta.pas' {FrmConsulta},
  UFrmCadastro in 'Formularios\UFrmCadastro.pas' {FrmCadastro},
  UFrmConPais in 'Formularios\UFrmConPais.pas' {FrmConPais},
  UFrmCadPais in 'Formularios\UFrmCadPais.pas' {FrmCadPais},
  UGenerico in 'Classes\UGenerico.pas',
  UInter in 'Classes\UInter.pas',
  UAplicacao in 'Classes\UAplicacao.pas',
  UDao in 'Dao\UDao.pas',
  UDaoPais in 'Dao\UDaoPais.pas',
  UController in 'Controller\UController.pas',
  UCrtlPais in 'Controller\UCrtlPais.pas',
  UDM in 'UDM.pas' {DM},
  UFrmConEstado in 'Formularios\UFrmConEstado.pas' {FrmConEstado},
  UEstado in 'Classes\UEstado.pas',
  UFrmCadEstado in 'Formularios\UFrmCadEstado.pas' {FrmCadEstado},
  UCtrlEstado in 'Controller\UCtrlEstado.pas',
  UDaoEstado in 'Dao\UDaoEstado.pas',
  UCidade in 'Classes\UCidade.pas',
  UFrmConCidade in 'Formularios\UFrmConCidade.pas' {FrmConCidade},
  UFrmCadCidade in 'Formularios\UFrmCadCidade.pas' {FrmCadCidade},
  UCtrlCidade in 'Controller\UCtrlCidade.pas',
  UDaoCidade in 'Dao\UDaoCidade.pas',
  UPessoa in 'Classes\UPessoa.pas',
  UEndereco in 'Classes\UEndereco.pas',
  UFrmCadCliente in 'Formularios\UFrmCadCliente.pas' {FrmCadCliente},
  UFrmConCliente in 'Formularios\UFrmConCliente.pas' {FrmConCliente},
  UCliente in 'Classes\UCliente.pas',
  UCtrlCliente in 'Controller\UCtrlCliente.pas',
  UDaoCliente in 'Dao\UDaoCliente.pas',
  UValidacao in 'UValidacao.pas',
  UFrmCadFornecedor in 'Formularios\UFrmCadFornecedor.pas' {FrmCadFornecedor},
  UFrmConFornecedor in 'Formularios\UFrmConFornecedor.pas' {FrmConFornecedor},
  UFornecedor in 'Classes\UFornecedor.pas',
  UFuncionario in 'Classes\UFuncionario.pas',
  UFrmConFuncionario in 'Formularios\UFrmConFuncionario.pas' {FrmConFuncionario},
  UFrmCadFuncionario in 'Formularios\UFrmCadFuncionario.pas' {FrmCadFuncionario},
  UCtrlFornecedor in 'Controller\UCtrlFornecedor.pas',
  UDaoFornecedor in 'Dao\UDaoFornecedor.pas',
  UFrmConFormaPagamento in 'Formularios\UFrmConFormaPagamento.pas' {FrmConFormaPagamento},
  UFrmCadFormaPagamento in 'Formularios\UFrmCadFormaPagamento.pas' {FrmCadFormaPagamento},
  UComuns in 'UComuns.pas',
  UFormaPagamento in 'Classes\UFormaPagamento.pas',
  UFrmConMarca in 'Formularios\UFrmConMarca.pas' {FrmConMarca},
  UFrmCadMarca in 'Formularios\UFrmCadMarca.pas' {FrmCadMarca},
  UFrmConCategoria in 'Formularios\UFrmConCategoria.pas' {FrmConCategoria},
  UFrmCadCategoria in 'Formularios\UFrmCadCategoria.pas' {FrmCadCategoria},
  UMarca in 'Classes\UMarca.pas',
  UCategoria in 'Classes\UCategoria.pas',
  UCtrlMarca in 'Controller\UCtrlMarca.pas',
  UDaoMarca in 'Dao\UDaoMarca.pas',
  UCtrlCategoria in 'Controller\UCtrlCategoria.pas',
  UDaoCategoria in 'Dao\UDaoCategoria.pas',
  UCtrlFormaPagamento in 'Controller\UCtrlFormaPagamento.pas',
  UDaoFormaPagamento in 'Dao\UDaoFormaPagamento.pas',
  UProduto in 'Classes\UProduto.pas',
  UFrmConProduto in 'Formularios\UFrmConProduto.pas' {FrmConProduto},
  UFrmCadProduto in 'Formularios\UFrmCadProduto.pas' {FrmCadProduto},
  UFrmConCondicaoPagamento in 'Formularios\UFrmConCondicaoPagamento.pas' {FrmConCondicaoPagamento},
  UFrmCadCondicaoPagamento in 'Formularios\UFrmCadCondicaoPagamento.pas' {FrmCadCondicaoPagamento},
  UCondicaoPagamento in 'Classes\UCondicaoPagamento.pas',
  UParcelas in 'Classes\UParcelas.pas',
  UCtrlCondicaoPagamento in 'Controller\UCtrlCondicaoPagamento.pas',
  UDaoCondicaoPagamento in 'Dao\UDaoCondicaoPagamento.pas',
  UDaoParcelas in 'Dao\UDaoParcelas.pas',
  UCtrlProduto in 'Controller\UCtrlProduto.pas',
  UDaoProduto in 'Dao\UDaoProduto.pas',
  UFrmConContasReceber in 'Formularios\UFrmConContasReceber.pas' {FrmConContasReceber},
  UFrmCadContasReceber in 'Formularios\UFrmCadContasReceber.pas' {FrmCadContasReceber},
  UFrmConContasPagar in 'Formularios\UFrmConContasPagar.pas' {FrmConContasPagar},
  UFrmCadContasPagar in 'Formularios\UFrmCadContasPagar.pas' {FrmCadContasPagar},
  UFrmConVenda in 'Formularios\UFrmConVenda.pas' {FrmConVenda},
  UFrmCadVenda in 'Formularios\UFrmCadVenda.pas' {FrmCadVenda},
  UFrmCadCompra in 'Formularios\UFrmCadCompra.pas' {FrmCadCompra},
  UFrmConCompra in 'Formularios\UFrmConCompra.pas' {FrmConCompra},
  UFrmCadMotivoCanlelamento in 'Formularios\UFrmCadMotivoCanlelamento.pas' {Form3},
  UContasReceber in 'Classes\UContasReceber.pas',
  UContasPagar in 'Classes\UContasPagar.pas',
  UVenda in 'Classes\UVenda.pas',
  UProdutoVenda in 'Classes\UProdutoVenda.pas',
  UCtrlFuncionario in 'Controller\UCtrlFuncionario.pas',
  UCtrlVenda in 'Controller\UCtrlVenda.pas',
  UDaoVenda in 'Dao\UDaoVenda.pas',
  UFrmConCargo in 'Formularios\UFrmConCargo.pas' {FrmConCargo},
  UFrmCadCargo in 'Formularios\UFrmCadCargo.pas' {FrmCadCargo},
  UCargo in 'Classes\UCargo.pas',
  UCtrlCargo in 'Controller\UCtrlCargo.pas',
  UDaoCargo in 'Dao\UDaoCargo.pas',
  UDaoFuncionario in 'Dao\UDaoFuncionario.pas',
  UCtrlContasReceber in 'Controller\UCtrlContasReceber.pas',
  UDaoContasReceber in 'Dao\UDaoContasReceber.pas',
  UCompra in 'Classes\UCompra.pas',
  UCtrlCompra in 'Controller\UCtrlCompra.pas',
  UDaoCompra in 'Dao\UDaoCompra.pas',
  UFrmConUsuario in 'Formularios\UFrmConUsuario.pas' {FrmConUsuario},
  UFrmCadUsuario in 'Formularios\UFrmCadUsuario.pas' {FrmCadUsuario},
  UUsuario in 'Classes\UUsuario.pas',
  UCtrlUsuario in 'Controller\UCtrlUsuario.pas',
  UDaoUsuario in 'Dao\UDaoUsuario.pas',
  UProdutoCompra in 'Classes\UProdutoCompra.pas',
  UFrmConTransportadora in 'Formularios\UFrmConTransportadora.pas' {FrmConTransportadora},
  UFrmCadTransportadora in 'Formularios\UFrmCadTransportadora.pas' {FrmCadTransportadora},
  UTransportadora in 'Classes\UTransportadora.pas',
  UDaoTransportadora in 'Dao\UDaoTransportadora.pas',
  UCtrlTransportadora in 'Controller\UCtrlTransportadora.pas',
  UCtrlContasPagar in 'Controller\UCtrlContasPagar.pas',
  UDaoContasPagar in 'Dao\UDaoContasPagar.pas',
  UFrmConUnidade in 'Formularios\UFrmConUnidade.pas' {FrmConUnidade},
  UUnidade in 'Classes\UUnidade.pas',
  UDaoUnidade in 'Dao\UDaoUnidade.pas',
  UCtrlUnidade in 'Controller\UCtrlUnidade.pas',
  UFrmCadUnidade in 'Formularios\UFrmCadUnidade.pas' {FrmCadUnidade},
  UFrmViewFornecedor in 'Formularios\UFrmViewFornecedor.pas' {FrmViewFornecedor},
  UProdutoFornecedor in 'Classes\UProdutoFornecedor.pas',
  UFrmAutenticacao in 'Formularios\UFrmAutenticacao.pas' {FrmAutenticacao},
  UDMRelatorio in 'UDMRelatorio.pas' {DmRelatorio},
  UDaoRelatorio in 'Dao\UDaoRelatorio.pas',
  UCalcProduto in 'Classes\UCalcProduto.pas' {
  UNcm in 'Classes\UNcm.pas',
  UCfop in 'Classes\UCfop.pas',
  UNcm in 'Classes\UNcm.pas',
  UCfop in 'Classes\UCfop.pas',
  UVeiculo in 'Classes\UVeiculo.pas';

{$R *.res},
  UCfop in 'Classes\UCfop.pas',
  UNcm in 'Classes\UNcm.pas',
  UVeiculo in 'Classes\UVeiculo.pas',
  UDaoVeiculo in 'Dao\UDaoVeiculo.pas',
  UCtrlVeiculo in 'Controller\UCtrlVeiculo.pas',
  UFrmConVeiculo in 'Formularios\UFrmConVeiculo.pas' {FrmConVeiculo},
  UFrmCadVeiculo in 'Formularios\UFrmCadVeiculo.pas' {FrmCadVeiculo},
  UFrmConNcm in 'Formularios\UFrmConNcm.pas' {FrmConNcm},
  UFrmCadNcm in 'Formularios\UFrmCadNcm.pas' {FrmCadNcm},
  UCtrlNcm in 'Controller\UCtrlNcm.pas',
  UDaoNcm in 'Dao\UDaoNcm.pas';

{$R *.res}

var
  umaAplicacao : Aplicacao;
begin
  umaAplicacao := Aplicacao.CrieObjeto;
  umaAplicacao.Execute_Se;
  umaAplicacao.Destrua_se;
end.
