object DmRelatorio: TDmRelatorio
  Left = 0
  Top = 0
  Caption = 'DMRelat'#243'rio'
  ClientHeight = 262
  ClientWidth = 432
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object frxRelatorio: TfrxReport
    Version = '5.1.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41185.813271643500000000
    ReportOptions.LastChange = 41238.660427419000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 24
    Top = 24
    Datasets = <
      item
        DataSet = frxDBSContasReceber
        DataSetName = 'frxDBSContasReceber'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object ContasReceber: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object Titulo: TfrxReportTitle
        FillType = ftBrush
        Height = 45.354360000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 15.118120000000000000
          Top = 3.779530000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[DATE]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Left = 224.330860000000000000
          Top = 3.779530000000000000
          Width = 302.362400000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'RELAT'#211'RIO DO CONTAS A RECEBER')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 636.299630000000000000
          Top = 3.779530000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Pag.')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          Left = 662.756340000000000000
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[PAGE#]')
          ParentFont = False
        end
      end
      object Header: TfrxPageHeader
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 86.929190000000000000
        Width = 718.110700000000000000
        object Line1: TfrxLineView
          Left = 3.779530000000000000
          Top = 26.456710000000000000
          Width = 706.772110000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo2: TfrxMemoView
          Left = 547.252320000000000000
          Width = 37.795300000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Multa')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 586.165740000000000000
          Width = 37.795300000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Juros')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 622.520100000000000000
          Width = 37.795300000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Desc.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 278.260050000000000000
          Top = 0.559060000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Status')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 338.866420000000000000
          Top = 0.779530000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data Emiss'#227'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 418.693260000000000000
          Top = 0.779530000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data Venc.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 489.299630000000000000
          Top = 0.779530000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data Pag.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 5.338590000000000000
          Top = 1.779530000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 666.299630000000000000
          Top = 0.779530000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 257.330860000000000000
          Width = 11.338590000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'P')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 30.236191180000000000
        Top = 181.417440000000000000
        Width = 718.110700000000000000
        Columns = 1
        DataSet = frxDBSContasReceber
        DataSetName = 'frxDBSContasReceber'
        RowCount = 0
        object frxDBSContasPagarfornecedor: TfrxMemoView
          Left = 5.559060000000000000
          Top = 7.559060000000000000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          DataSet = frxDBSContasPagar
          DataSetName = 'frxDBSContasPagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBSContasReceber."cliente"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBSContasPagardataemissao: TfrxMemoView
          Left = 348.496290000000000000
          Top = 7.559060000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataSet = frxDBSContasPagar
          DataSetName = 'frxDBSContasPagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBSContasReceber."dataemissao"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBSContasPagardatavencimento: TfrxMemoView
          Left = 417.630180000000000000
          Top = 7.559060000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataSet = frxDBSContasPagar
          DataSetName = 'frxDBSContasPagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBSContasReceber."datavencimento"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBSContasPagardatapagamento: TfrxMemoView
          Left = 486.441250000000000000
          Top = 7.559060000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataSet = frxDBSContasPagar
          DataSetName = 'frxDBSContasPagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBSContasReceber."datapagamento"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBSContasPagarstatus: TfrxMemoView
          Left = 275.480520000000000000
          Top = 7.559060000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataSet = frxDBSContasPagar
          DataSetName = 'frxDBSContasPagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBSContasReceber."status"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBSContasPagarvalor: TfrxMemoView
          Left = 666.740570000000000000
          Top = 7.559060000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataSet = frxDBSContasPagar
          DataSetName = 'frxDBSContasPagar'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBSContasReceber."valor"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 632.401980000000000000
          Top = 7.559060000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataSet = frxDBSContasPagar
          DataSetName = 'frxDBSContasPagar'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBSContasReceber."desconto"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 594.827150000000000000
          Top = 7.559060000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataSet = frxDBSContasPagar
          DataSetName = 'frxDBSContasPagar'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBSContasReceber."juros"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 557.590910000000000000
          Top = 7.559060000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataSet = frxDBSContasPagar
          DataSetName = 'frxDBSContasPagar'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBSContasReceber."multa"]')
          ParentFont = False
        end
        object frxDBSContasRecebernumparcela: TfrxMemoView
          Left = 257.008040000000000000
          Top = 7.559060000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          DataField = 'numparcela'
          DataSet = frxDBSContasReceber
          DataSetName = 'frxDBSContasReceber'
          Memo.UTF8W = (
            '[frxDBSContasReceber."numparcela"]')
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 71.811070000000000000
        Top = 234.330860000000000000
        Width = 718.110700000000000000
        object Memo15: TfrxMemoView
          Left = 666.063390000000000000
          Top = 37.795300000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '[SUM((<frxDBSContasReceber."multa">+<frxDBSContasReceber."juros"' +
              '>+<frxDBSContasReceber."valor">)-<frxDBSContasReceber."desconto"' +
              '>,MasterData1)]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 7.559060000000000000
          Top = 11.338590000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'TOTAL:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 7.559060000000000000
          Top = 37.795300000000000000
          Width = 124.724490000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'TOTAL GERAL:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          Left = 7.559060000000000000
          Top = 7.559060000000000000
          Width = 699.213050000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line3: TfrxLineView
          Left = 7.559060000000000000
          Top = 35.015770000000000000
          Width = 699.213050000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line4: TfrxLineView
          Left = 7.559060000000000000
          Top = 56.692950000000000000
          Width = 699.213050000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo18: TfrxMemoView
          Left = 556.047620000000000000
          Top = 11.559060000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[SUM(<frxDBSContasReceber."multa">,MasterData1)]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 594.283860000000000000
          Top = 11.559060000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[SUM(<frxDBSContasReceber."juros">,MasterData1)]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 630.079160000000000000
          Top = 11.559060000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[SUM(<frxDBSContasReceber."desconto">,MasterData1)]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 665.315400000000000000
          Top = 11.559060000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[SUM(<frxDBSContasReceber."valor">,MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBSContasPagar: TfrxDBDataset
    UserName = 'frxDBSContasPagar'
    CloseDataSource = False
    DataSet = DM.QContasPagar
    BCDToCurrency = False
    Left = 112
    Top = 24
  end
  object frxDBSContasReceber: TfrxDBDataset
    UserName = 'frxDBSContasReceber'
    CloseDataSource = False
    FieldAliases.Strings = (
      'numnota=numnota'
      'serienota=serienota'
      'numparcela=numparcela'
      'cliente=cliente'
      'status=status'
      'valor=valor'
      'juros=juros'
      'multa=multa'
      'desconto=desconto'
      'formapagamento=formapagamento'
      'usu'#225'rio=usu'#225'rio'
      'datapagamento=datapagamento'
      'datavencimento=datavencimento'
      'dataemissao=dataemissao'
      'datacadastro=datacadastro'
      'dataalteracao=dataalteracao'
      'observacao=observacao'
      'idusuario=idusuario'
      'idformapagamento=idformapagamento'
      'idcliente=idcliente')
    DataSet = DM.QContasReceber
    BCDToCurrency = False
    Left = 224
    Top = 24
  end
  object frxDBSProdutos: TfrxDBDataset
    UserName = 'frxDBSProdutos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'idproduto=idproduto'
      'descricao=descricao'
      'tipo=tipo'
      'unidade=unidade'
      'idunidade=idunidade'
      'quantidade=quantidade'
      'icms=icms'
      'ipi=ipi'
      'preco_compra=preco_compra'
      'preco_venda=preco_venda'
      'icms_anterior=icms_anterior'
      'ipi_anterior=ipi_anterior'
      'preco_compra_ant=preco_compra_ant'
      'idmarca=idmarca'
      'idcategoria=idcategoria'
      'observacao=observacao'
      'datacadastro=datacadastro'
      'dataalteracao=dataalteracao')
    DataSet = DM.QProduto
    BCDToCurrency = False
    Left = 320
    Top = 24
  end
  object frxDBSCompra: TfrxDBDataset
    UserName = 'frxDBSCompra'
    CloseDataSource = False
    FieldAliases.Strings = (
      'idcompra=idcompra'
      'numnota=numnota'
      'serienota=serienota'
      'fornecedor=fornecedor'
      'condi'#231#227'oPgto=condi'#231#227'oPgto'
      'status=status'
      'base_icms=base_icms'
      'valor_frete=valor_frete'
      'total_icms=total_icms'
      'total_ipi=total_ipi'
      'valor_desconto=valor_desconto'
      'total_produto=total_produto'
      'total_nota=total_nota'
      'usu'#225'rio=usu'#225'rio'
      'tipofrete=tipofrete'
      'transportadora=transportadora'
      'datacompra=datacompra'
      'dataemissao=dataemissao'
      'datacadastro=datacadastro'
      'dataalteracao=dataalteracao'
      'observacao=observacao'
      'idfornecedor=idfornecedor'
      'idcondicaopagamento=idcondicaopagamento'
      'idtransportadora=idtransportadora'
      'idusuario=idusuario')
    DataSet = DM.QCompra
    BCDToCurrency = False
    Left = 112
    Top = 88
  end
  object frxDBSVenda: TfrxDBDataset
    UserName = 'frxDBSVenda'
    CloseDataSource = False
    FieldAliases.Strings = (
      'numnota=numnota'
      'serienota=serienota'
      'idordemservico=idordemservico'
      'cliente=cliente'
      'condi'#231#227'oPgto=condi'#231#227'oPgto'
      'status=status'
      'funcion'#225'rio=funcion'#225'rio'
      'datavenda=datavenda'
      'dataemissao=dataemissao'
      'datacadastro=datacadastro'
      'dataalteracao=dataalteracao'
      'observacao=observacao'
      'idcondicaopagamento=idcondicaopagamento'
      'idcliente=idcliente'
      'idusuario=idusuario')
    DataSet = DM.QVenda
    BCDToCurrency = False
    Left = 224
    Top = 88
  end
  object frxDBSProdutoVenda: TfrxDBDataset
    UserName = 'frxDBSProdutoVenda'
    CloseDataSource = False
    FieldAliases.Strings = (
      'idproduto_venda=idproduto_venda'
      'numnota=numnota'
      'idproduto=idproduto'
      'serienota=serienota'
      'valorunitario=valorunitario'
      'quantidade=quantidade'
      'desconto=desconto')
    DataSet = DM.QProdutoVenda
    BCDToCurrency = False
    Left = 320
    Top = 88
  end
end
