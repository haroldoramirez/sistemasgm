object Gerente: TGerente
  Left = 0
  Top = 0
  Caption = 'SistemaSGM'
  ClientHeight = 349
  ClientWidth = 606
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmMenu
  OldCreateOrder = False
  Position = poOwnerFormCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object mmMenu: TMainMenu
    Left = 32
    Top = 24
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object mniCliente1: TMenuItem
        Caption = 'Cliente'
        OnClick = mniCliente1Click
      end
      object mniFornecedor1: TMenuItem
        Caption = 'Fornecedor'
        OnClick = mniFornecedor1Click
      end
      object mniFuncionrio1: TMenuItem
        Caption = 'Funcion'#225'rio'
        object mniCadastrarFuncionrio1: TMenuItem
          Caption = 'Cadastrar Funcion'#225'rio'
          OnClick = mniCadastrarFuncionrio1Click
        end
        object mniCargo1: TMenuItem
          Caption = 'Cargo'
          OnClick = mniCargo1Click
        end
        object Usurio1: TMenuItem
          Caption = 'Usu'#225'rio'
          OnClick = Usurio1Click
        end
      end
      object mniransportadora1: TMenuItem
        Caption = 'Transportadora'
        OnClick = mniransportadora1Click
      end
      object Veculo1: TMenuItem
        Caption = 'Ve'#237'culo'
        OnClick = Veculo1Click
      end
      object Ncm1: TMenuItem
        Caption = 'Ncm'
        OnClick = Ncm1Click
      end
      object Cfop1: TMenuItem
        Caption = 'Cfop'
        OnClick = Cfop1Click
      end
    end
    object mniLocalidades1: TMenuItem
      Caption = 'Localidades'
      object mniCidade1: TMenuItem
        Caption = 'Cidade'
        OnClick = mniCidade1Click
      end
      object mniEstado1: TMenuItem
        Caption = 'Estado'
        OnClick = mniEstado1Click
      end
      object Pas1: TMenuItem
        Caption = 'Pa'#237's'
        OnClick = Pas1Click
      end
    end
    object mniProduto1: TMenuItem
      Caption = 'Estoque'
      object mniProduto2: TMenuItem
        Caption = 'Produto'
        OnClick = mniProduto2Click
      end
      object mniMarca1: TMenuItem
        Caption = 'Marca'
        OnClick = mniMArca1Click
      end
      object mniCategoria1: TMenuItem
        Caption = 'Categoria'
        OnClick = mniCategoria1Click
      end
      object Unidade1: TMenuItem
        Caption = 'Unidade'
        OnClick = Unidade1Click
      end
    end
    object mniCompraVenda1: TMenuItem
      Caption = 'Compra/Venda'
      object mniCompra1: TMenuItem
        Caption = 'Compra'
        OnClick = mniCompra1Click
      end
      object mniVenda1: TMenuItem
        Caption = 'Venda'
        OnClick = mniVenda1Click
      end
    end
    object mniFinanceiro1: TMenuItem
      Caption = 'Financeiro'
      object mniContasaReceber1: TMenuItem
        Caption = 'Contas a Receber'
        OnClick = mniContasaReceber1Click
      end
      object mniContasaPagar1: TMenuItem
        Caption = 'Contas a Pagar'
        OnClick = mniContasaPagar1Click
      end
      object mniN2: TMenuItem
        Caption = '-'
      end
      object mniFormaPagamento1: TMenuItem
        Caption = 'Forma Pagamento'
        OnClick = mniFormaPagamento1Click
      end
      object mniCondiodePagamento1: TMenuItem
        Caption = 'Condi'#231#227'o de Pagamento'
        OnClick = mniCondiodePagamento1Click
      end
    end
    object mniSair1: TMenuItem
      Caption = 'Sair'
      OnClick = mniSair1Click
    end
  end
end
