object FrmCadCompra: TFrmCadCompra
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro Compra'
  ClientHeight = 665
  ClientWidth = 964
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object sGroupBox3: TsGroupBox
    Left = 8
    Top = 2
    Width = 514
    Height = 60
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    object lbl_IdPlanoContas: TsLabel
      Left = 10
      Top = 13
      Width = 60
      Height = 13
      Caption = 'N'#250'm. Nota *'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_SerieNota: TsLabel
      Left = 81
      Top = 13
      Width = 30
      Height = 13
      Caption = 'S'#233'rie*'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_IdFornecedor: TsLabel
      Left = 125
      Top = 13
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_Fornecedor: TsLabel
      Left = 196
      Top = 13
      Width = 64
      Height = 13
      Caption = 'Fornecedor *'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object edt_NumeroNota: TsEdit
      Left = 10
      Top = 30
      Width = 65
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 9
      ParentFont = False
      TabOrder = 0
      OnExit = edt_NumeroNotaExit
      OnKeyPress = edt_NumeroNotaKeyPress
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object edt_SerieNota: TsEdit
      Left = 78
      Top = 30
      Width = 33
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 1
      OnExit = edt_SerieNotaExit
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object edt_IdFornecedor: TsEdit
      Left = 125
      Top = 30
      Width = 55
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      TabOrder = 2
      OnExit = edt_IdFornecedorExit
      OnKeyPress = edt_IdFornecedorKeyPress
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object edt_Fornecedor: TsEdit
      Left = 196
      Top = 30
      Width = 273
      Height = 21
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      TabOrder = 3
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object btn_BuscarFornecedor: TsBitBtn
      Left = 475
      Top = 28
      Width = 30
      Height = 25
      Hint = 'Consultar'
      DoubleBuffered = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000643F3F00653F
        3F00674242006B474700714D4D00775555007E5C5C008C686600244574000435
        7700093876000938760008357304043B8088404A65B68B605C52643F3F00653F
        3F00674242006B474700714D4D00775555007E5C5C008C686600244574000435
        77000938760009347104023E85981388E0FF54AEE4FF738CA8C1643F3F00653F
        3F00674242006B474700714D4D00775555007E5C5C008C686600244574000435
        770009346F05023E85981087E1FF82E6FEFF6EDBFDFF0F83DD87643F3F00653F
        3F00674242006B474700714D4D00775555007E5C5C008C686600214475000432
        7309023E86991086E1FF81E4FEFF75DCF8FF1086DE990879DA05643F3F00653F
        3F00674242006A4646006F4B4B00765353007C5A5A008C686500384B6D000039
        81801388E1FF82E6FEFF75DCF8FF0F85DE9A0978D7020C7BDA00643F3F00653F
        3F00664141146A46476B734F50A6795858B7815F6091866566437F5D5B22464D
        67B64FA2D8FF6EDBFBFF1086DE9A0978D7030C7CDA000C7BDA00643F3E00643E
        3F3D6A4849D7927368F9BFAB9FD9D1C1BDD1BEABA3E2A08682F58F7273EBB08A
        83F55A7391B5097EDD83097ADA030C7CDA000C7CDA000C7BDA00633E3F256A47
        47E9B78263DBF9E2A999FEFEE493FEFEFC94FEFEE893F3DDAEABB8988AF1AE92
        92F68E8895271178D100057BE000087BDD00087BDD00087ADD006442469A9F61
        47EEFEA85F95FED19196FEEEBA99FEF9CC99FEF1BE99FED89793F5AA6EAAB697
        8EF6AB9190478C8D9A00768BA500798CA300798CA300798BA300714D4CE1D567
        2CBAFE8B3B92FEA86395FEC18195FECE8F95FEC48596FEAB6794FE8F4196D696
        73EBAF9FA295B1959100B6969100B5969100B5969100B5969100865B53EBE851
        09A2F971229BFC9953B0FEAF6BB7FEAB68A9FDA25DA3FDA560B9FEAA63DEE9A7
        78FCB7A6A8B3B19B9B00B29D9D00B29D9D00B29D9D00B29D9D00845C57E8E875
        31D0FEAD66E4FECC8EF7FEDA9FF8FEDDA3F3FEDBA0EFFED89DF8FECB88F9E6B1
        8CFFBDABAEA3B6A2A100B7A3A300B7A3A300B7A3A300B7A3A3007E5D5FBBCC95
        6FFFFED38FF7FEE0A5F5FEEBB7F5FEF0C1F6FEF0C1F7FEECB5F5FEDB9EF6D7BA
        A9FFBDADAF67BBA8A800BCA8A800BCA8A800BCA8A800BCA8A8007B5D5F509B79
        73FFEDC292FDFEF2BAF4FEF5CCF5FEF7D7F5FEF8D7F5FEF5C9F5E8D2B5FFC5B2
        B4D7BCA9A913BDAAAA00BDAAAA00BDAAAA00BDAAAA00BDAAAA007E5E5E008B6D
        6F79A88D86FFDDC9ABFFF9EDD0FDFBF6E3FCF7F0E0FFE0CFBFFFC5B4B4E2BDAA
        AA3BBDAAAA00BDAAAA00BDAAAA00BDAAAA00BDAAAA00BDAAAA007E5E5E008A6A
        6A0094777951A38C8DB6B8A3A1ECC9B4B0EDC1AEAFE0BBA6A895BBA8A827BEAA
        AA00BDAAAA00BDAAAA00BDAAAA00BDAAAA00BDAAAA00BDAAAA00}
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btn_BuscarFornecedorClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object sGroupBox1: TsGroupBox
    Left = 8
    Top = 118
    Width = 951
    Height = 239
    Caption = 'Produto'
    TabOrder = 5
    SkinData.SkinSection = 'GROUPBOX'
    object lbl_IdProduto: TsLabel
      Left = 10
      Top = 20
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_Produto: TsLabel
      Left = 64
      Top = 19
      Width = 47
      Height = 13
      Caption = 'Produto *'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_Quantidade: TsLabel
      Left = 357
      Top = 59
      Width = 56
      Height = 13
      Caption = 'Quantidade'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_Preco: TsLabel
      Left = 423
      Top = 59
      Width = 56
      Height = 13
      Caption = 'V. Unit'#225'rio*'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_ICMS: TsLabel
      Left = 624
      Top = 58
      Width = 36
      Height = 13
      Caption = '%ICMS'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_IPI: TsLabel
      Left = 695
      Top = 59
      Width = 25
      Height = 13
      Caption = '%IPI'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_Unidade: TsLabel
      Left = 292
      Top = 59
      Width = 48
      Height = 13
      Caption = 'Unidade *'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_CPOF: TsLabel
      Left = 182
      Top = 58
      Width = 36
      Height = 13
      Caption = 'CFOP *'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_Desconto: TsLabel
      Left = 489
      Top = 59
      Width = 58
      Height = 13
      Caption = 'V. Desconto'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_Total: TsLabel
      Left = 555
      Top = 59
      Width = 37
      Height = 13
      Caption = 'V. Total'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_BCIMCMS: TsLabel
      Left = 762
      Top = 59
      Width = 42
      Height = 13
      Caption = 'BC.ICMS'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_ValorICMS: TsLabel
      Left = 831
      Top = 58
      Width = 35
      Height = 13
      Caption = 'V.ICMS'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_ValorIPI: TsLabel
      Left = 892
      Top = 58
      Width = 24
      Height = 13
      Caption = 'V.IPI'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_NCM: TsLabel
      Left = 10
      Top = 58
      Width = 22
      Height = 13
      Caption = 'NCM'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_CST: TsLabel
      Left = 74
      Top = 58
      Width = 19
      Height = 13
      Caption = 'CST'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object sLabel3: TsLabel
      Left = 145
      Top = 58
      Width = 23
      Height = 13
      Caption = 'C'#243'd.'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object edt_Produto: TsEdit
      Left = 64
      Top = 35
      Width = 308
      Height = 21
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      TabOrder = 1
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object edt_IdProduto: TsEdit
      Left = 10
      Top = 35
      Width = 50
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 4
      ParentFont = False
      TabOrder = 0
      OnExit = edt_IdProdutoExit
      OnKeyPress = edt_IdProdutoKeyPress
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object btn_BuscarProduto: TsBitBtn
      Left = 378
      Top = 33
      Width = 30
      Height = 25
      DoubleBuffered = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000643F3F00653F
        3F00674242006B474700714D4D00775555007E5C5C008C686600244574000435
        7700093876000938760008357304043B8088404A65B68B605C52643F3F00653F
        3F00674242006B474700714D4D00775555007E5C5C008C686600244574000435
        77000938760009347104023E85981388E0FF54AEE4FF738CA8C1643F3F00653F
        3F00674242006B474700714D4D00775555007E5C5C008C686600244574000435
        770009346F05023E85981087E1FF82E6FEFF6EDBFDFF0F83DD87643F3F00653F
        3F00674242006B474700714D4D00775555007E5C5C008C686600214475000432
        7309023E86991086E1FF81E4FEFF75DCF8FF1086DE990879DA05643F3F00653F
        3F00674242006A4646006F4B4B00765353007C5A5A008C686500384B6D000039
        81801388E1FF82E6FEFF75DCF8FF0F85DE9A0978D7020C7BDA00643F3F00653F
        3F00664141146A46476B734F50A6795858B7815F6091866566437F5D5B22464D
        67B64FA2D8FF6EDBFBFF1086DE9A0978D7030C7CDA000C7BDA00643F3E00643E
        3F3D6A4849D7927368F9BFAB9FD9D1C1BDD1BEABA3E2A08682F58F7273EBB08A
        83F55A7391B5097EDD83097ADA030C7CDA000C7CDA000C7BDA00633E3F256A47
        47E9B78263DBF9E2A999FEFEE493FEFEFC94FEFEE893F3DDAEABB8988AF1AE92
        92F68E8895271178D100057BE000087BDD00087BDD00087ADD006442469A9F61
        47EEFEA85F95FED19196FEEEBA99FEF9CC99FEF1BE99FED89793F5AA6EAAB697
        8EF6AB9190478C8D9A00768BA500798CA300798CA300798BA300714D4CE1D567
        2CBAFE8B3B92FEA86395FEC18195FECE8F95FEC48596FEAB6794FE8F4196D696
        73EBAF9FA295B1959100B6969100B5969100B5969100B5969100865B53EBE851
        09A2F971229BFC9953B0FEAF6BB7FEAB68A9FDA25DA3FDA560B9FEAA63DEE9A7
        78FCB7A6A8B3B19B9B00B29D9D00B29D9D00B29D9D00B29D9D00845C57E8E875
        31D0FEAD66E4FECC8EF7FEDA9FF8FEDDA3F3FEDBA0EFFED89DF8FECB88F9E6B1
        8CFFBDABAEA3B6A2A100B7A3A300B7A3A300B7A3A300B7A3A3007E5D5FBBCC95
        6FFFFED38FF7FEE0A5F5FEEBB7F5FEF0C1F6FEF0C1F7FEECB5F5FEDB9EF6D7BA
        A9FFBDADAF67BBA8A800BCA8A800BCA8A800BCA8A800BCA8A8007B5D5F509B79
        73FFEDC292FDFEF2BAF4FEF5CCF5FEF7D7F5FEF8D7F5FEF5C9F5E8D2B5FFC5B2
        B4D7BCA9A913BDAAAA00BDAAAA00BDAAAA00BDAAAA00BDAAAA007E5E5E008B6D
        6F79A88D86FFDDC9ABFFF9EDD0FDFBF6E3FCF7F0E0FFE0CFBFFFC5B4B4E2BDAA
        AA3BBDAAAA00BDAAAA00BDAAAA00BDAAAA00BDAAAA00BDAAAA007E5E5E008A6A
        6A0094777951A38C8DB6B8A3A1ECC9B4B0EDC1AEAFE0BBA6A895BBA8A827BEAA
        AA00BDAAAA00BDAAAA00BDAAAA00BDAAAA00BDAAAA00BDAAAA00}
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      OnClick = btn_BuscarProdutoClick
      SkinData.SkinSection = 'BUTTON'
    end
    object gridProduto: TStringGrid
      Left = 10
      Top = 100
      Width = 933
      Height = 130
      ColCount = 15
      DefaultColWidth = 47
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      TabOrder = 20
    end
    object edt_ICMS: TsEdit
      Left = 624
      Top = 73
      Width = 56
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 13
      OnExit = edt_ICMSExit
      OnKeyPress = edt_ICMSKeyPress
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object edt_PrecoCusto: TsEdit
      Left = 423
      Top = 74
      Width = 56
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 10
      OnExit = edt_PrecoCustoExit
      OnKeyPress = edt_PrecoCustoKeyPress
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object edt_IPI: TsEdit
      Left = 694
      Top = 73
      Width = 56
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 14
      OnKeyPress = edt_IPIKeyPress
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object edt_Quantidade: TsEdit
      Left = 357
      Top = 74
      Width = 56
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 9
      OnExit = edt_QuantidadeExit
      OnKeyPress = edt_QuantidadeKeyPress
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object btn_Add_Produto: TsBitBtn
      Left = 414
      Top = 33
      Width = 30
      Height = 26
      Hint = 'Adicionar Produto'
      DoubleBuffered = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0040914D233C8E487D398B43DB35883FF331863BF32E83
        36DB2B80327D277E2F23FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0048985753449552E640984FFF7CC18EFF95D0A5FF95CFA5FF77BD
        88FF358C41FF2B8033E6287E2F53FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00509E60534C9B5CF463B377FFA7DBB4FF86CC97FF65BB7CFF63B97BFF85CB
        97FFA4D9B3FF57A96AFF2B8033F4287E2F53FFFFFF00FFFFFF00FFFFFF0058A5
        6A2255A265E569B87CFFA7DBB1FF5FBB76FF5BB972FF58B76FFF58B46EFF57B4
        6EFF5AB673FFA4D9B2FF59A96BFF2B8133E5287E2F22FFFFFF00FFFFFF005CA8
        6F7E52AA67FFA9DDB3FF63C078FF5EBD70FF5FBB76FFFFFFFFFFFFFFFFFF58B7
        6FFF57B46DFF5BB673FFA5DAB3FF378E42FF2B81337EFFFFFF00FFFFFF0060AB
        74DB89CC97FF88D395FF6AC579FF62C06FFF54AA64FFFFFFFFFFFFFFFFFF58B7
        6FFF58B76FFF5AB871FF84CC96FF7ABD8CFF2F8438DBFFFFFF00FFFFFF0064AE
        79F6A8DDB2FF7CCF89FF74CC80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF58B76FFF66BD7CFF9BD4AAFF33873CF6FFFFFF00FFFFFF0068B1
        7DF6B5E2BDFF8AD596FF79C985FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF58B76FFF68C07DFF9CD4A9FF378A41F6FFFFFF00FFFFFF006CB4
        82DBABDDB5FFA5DFAEFF80CB8BFF7BC985FF6DBC78FFFFFFFFFFFFFFFFFF5AAB
        69FF5FBB76FF5BB972FF8AD198FF7FC491FF3B8D46DBFFFFFF00FFFFFF006FB7
        867E84C796FFD2EED7FF94D99FFF89D393FF7EC888FFFFFFFFFFFFFFFFFF78CD
        84FF6AC27BFF6EC77DFFABDFB4FF449D56FF3F904B7EFFFFFF00FFFFFF0072B9
        89226FB786E5A9DAB6FFD8F1DCFF91D89CFF87CD92FF83CC8DFF8AD495FF89D4
        94FF82D28DFFAEE0B6FF6AB87CFF479755E543935022FFFFFF00FFFFFF00FFFF
        FF0072BA8A536FB786F4AEDCBAFFDCF2E0FFB5E4BCFF9ADBA4FF95D99FFFA4DF
        AEFFBFE8C4FF78C189FF4F9D5EF44B9A5A53FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0072BA8A5370B786E693CEA3FFC2E6CBFFCFEBD4FFC9E9CEFFAEDD
        B7FF6CB87EFF57A468E653A06453FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0073BA8A2370B8877D6DB583DB69B27FF366B07BF362AD
        76DB5FAA727D5BA76D23FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 18
      OnClick = btn_Add_ProdutoClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btn_LimparProdutos: TsBitBtn
      Left = 450
      Top = 33
      Width = 30
      Height = 25
      Hint = 'Remover Produto'
      DoubleBuffered = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF003E53C223394FC17D3752BDDB3450BCF32F4ABBF32D4D
        B7DB2A4BB67D2647B423FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF004557C8534154C5E63B51CCFF7479E8FF8E91EEFF8E91EEFF7077
        E4FF324CC0FF2A49B6E6284AB453FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF004C59CD534858CBF45B64E0FFA0A5F5FF7D85EFFF5A62E9FF585CE7FF7C83
        EEFF9D9FF4FF505CD7FF2A49B6F4284AB453FFFFFF00FFFFFF00FFFFFF00535E
        D2225260CFE5606AE3FFA0ABF5FF535EECFF4F5BEAFF4C58E9FF4D58E6FF4B55
        E6FF4F55E6FF9DA1F4FF535FD6FF2949B7E5284AB422FFFFFF00FFFFFF00575F
        D47E4A55DBFFA1AAF6FF5563F0FF5165EEFF4C58E9FF4C58E9FF4C58E9FF4C58
        E9FF4B57E6FF5159E6FF9EA2F5FF334FC3FF2949B77EFFFFFF00FFFFFF005B61
        D7DB808BEEFF7D90F7FF5C72F3FF4C58E9FF4C58E9FF4C58E9FF4C58E9FF4C58
        E9FF4C58E9FF4E5AE9FF7A82F0FF747AE2FF2D4AB9DBFFFFFF00FFFFFF005E62
        DAF6A0AAF7FF6F85F8FF6781F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF4C58E9FF5B65EAFF959BF1FF314FBBF6FFFFFF00FFFFFF006368
        DBF6AEB8F9FF7E92FAFF6F84F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF4C58E9FF5D69EEFF959CF1FF354EBDF6FFFFFF00FFFFFF006669
        DEDBA4AEF5FF9CAAFAFF768BF0FF535EECFF535EECFF535EECFF535EECFF535E
        ECFF535EECFF6276F2FF808DF4FF777EE9FF3952BFDBFFFFFF00FFFFFF006968
        E07E7C82EAFFCDD4FCFF8A9CFAFF7D92F7FF7489EEFF6B83F6FF6B83F6FF6B83
        F6FF6B83F6FF6278F3FFA3AEF8FF3D4ED0FF3D53C17EFFFFFF00FFFFFF006B6B
        E1226968E0E5A2A6F3FFD4DBFDFF8699FAFF7E90F0FF798DF1FF7E93F8FF7D91
        F9FF758BF8FFA7B5F8FF626DE3FF4456C7E54055C422FFFFFF00FFFFFF00FFFF
        FF006C6BE3536968E0F4A9ACF2FFD8DCFDFFADB9FAFF90A2FAFF8A9CFAFF9BA8
        FBFFB9C7FCFF6F7AE9FF4B5ACCF44757CA53FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF006C6BE3536969DFE68D92EDFFBDC2F8FFCCD3F9FFC3CBF9FFA9B3
        F4FF656FE2FF525DD1E64F5CCE53FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF006C6CE2236A69E17D6769DDDB6263DCF36063DAF35C62
        D9DB5A62D67D5761D423FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 19
      OnClick = btn_LimparProdutosClick
      SkinData.SkinSection = 'BUTTON'
    end
    object edt_Unidade: TsEdit
      Left = 292
      Top = 74
      Width = 55
      Height = 21
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      TabOrder = 8
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object edt_CPOF: TsEdit
      Left = 182
      Top = 74
      Width = 61
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      TabOrder = 6
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object edt_Desconto: TsEdit
      Left = 489
      Top = 74
      Width = 56
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 11
      OnExit = edt_DescontoExit
      OnKeyPress = edt_DescontoKeyPress
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object edt_Total: TsEdit
      Left = 555
      Top = 74
      Width = 56
      Height = 21
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 12
      OnExit = edt_TotalExit
      OnKeyPress = edt_TotalKeyPress
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object edt_BCICMS: TsEdit
      Left = 762
      Top = 73
      Width = 56
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 15
      OnKeyPress = edt_BCICMSKeyPress
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object edt_ValorICMS: TsEdit
      Left = 830
      Top = 73
      Width = 56
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 16
      OnKeyPress = edt_ValorICMSKeyPress
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object edt_ValorIPI: TsEdit
      Left = 892
      Top = 73
      Width = 56
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 17
      OnKeyPress = edt_ValorIPIKeyPress
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object edt_NCM: TsEdit
      Left = 8
      Top = 74
      Width = 56
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      TabOrder = 3
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object edt_CST: TsEdit
      Left = 74
      Top = 74
      Width = 56
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      TabOrder = 4
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object btn_BuscarCFOP: TsBitBtn
      Left = 250
      Top = 72
      Width = 30
      Height = 25
      DoubleBuffered = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000643F3F00653F
        3F00674242006B474700714D4D00775555007E5C5C008C686600244574000435
        7700093876000938760008357304043B8088404A65B68B605C52643F3F00653F
        3F00674242006B474700714D4D00775555007E5C5C008C686600244574000435
        77000938760009347104023E85981388E0FF54AEE4FF738CA8C1643F3F00653F
        3F00674242006B474700714D4D00775555007E5C5C008C686600244574000435
        770009346F05023E85981087E1FF82E6FEFF6EDBFDFF0F83DD87643F3F00653F
        3F00674242006B474700714D4D00775555007E5C5C008C686600214475000432
        7309023E86991086E1FF81E4FEFF75DCF8FF1086DE990879DA05643F3F00653F
        3F00674242006A4646006F4B4B00765353007C5A5A008C686500384B6D000039
        81801388E1FF82E6FEFF75DCF8FF0F85DE9A0978D7020C7BDA00643F3F00653F
        3F00664141146A46476B734F50A6795858B7815F6091866566437F5D5B22464D
        67B64FA2D8FF6EDBFBFF1086DE9A0978D7030C7CDA000C7BDA00643F3E00643E
        3F3D6A4849D7927368F9BFAB9FD9D1C1BDD1BEABA3E2A08682F58F7273EBB08A
        83F55A7391B5097EDD83097ADA030C7CDA000C7CDA000C7BDA00633E3F256A47
        47E9B78263DBF9E2A999FEFEE493FEFEFC94FEFEE893F3DDAEABB8988AF1AE92
        92F68E8895271178D100057BE000087BDD00087BDD00087ADD006442469A9F61
        47EEFEA85F95FED19196FEEEBA99FEF9CC99FEF1BE99FED89793F5AA6EAAB697
        8EF6AB9190478C8D9A00768BA500798CA300798CA300798BA300714D4CE1D567
        2CBAFE8B3B92FEA86395FEC18195FECE8F95FEC48596FEAB6794FE8F4196D696
        73EBAF9FA295B1959100B6969100B5969100B5969100B5969100865B53EBE851
        09A2F971229BFC9953B0FEAF6BB7FEAB68A9FDA25DA3FDA560B9FEAA63DEE9A7
        78FCB7A6A8B3B19B9B00B29D9D00B29D9D00B29D9D00B29D9D00845C57E8E875
        31D0FEAD66E4FECC8EF7FEDA9FF8FEDDA3F3FEDBA0EFFED89DF8FECB88F9E6B1
        8CFFBDABAEA3B6A2A100B7A3A300B7A3A300B7A3A300B7A3A3007E5D5FBBCC95
        6FFFFED38FF7FEE0A5F5FEEBB7F5FEF0C1F6FEF0C1F7FEECB5F5FEDB9EF6D7BA
        A9FFBDADAF67BBA8A800BCA8A800BCA8A800BCA8A800BCA8A8007B5D5F509B79
        73FFEDC292FDFEF2BAF4FEF5CCF5FEF7D7F5FEF8D7F5FEF5C9F5E8D2B5FFC5B2
        B4D7BCA9A913BDAAAA00BDAAAA00BDAAAA00BDAAAA00BDAAAA007E5E5E008B6D
        6F79A88D86FFDDC9ABFFF9EDD0FDFBF6E3FCF7F0E0FFE0CFBFFFC5B4B4E2BDAA
        AA3BBDAAAA00BDAAAA00BDAAAA00BDAAAA00BDAAAA00BDAAAA007E5E5E008A6A
        6A0094777951A38C8DB6B8A3A1ECC9B4B0EDC1AEAFE0BBA6A895BBA8A827BEAA
        AA00BDAAAA00BDAAAA00BDAAAA00BDAAAA00BDAAAA00BDAAAA00}
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 7
      OnClick = btn_BuscarCFOPClick
      SkinData.SkinSection = 'BUTTON'
    end
    object edt_IdCFOP: TsEdit
      Left = 145
      Top = 74
      Width = 31
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      TabOrder = 5
      OnExit = edt_IdCFOPExit
      OnKeyPress = edt_IdCFOPKeyPress
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
  end
  object sGroupBox2: TsGroupBox
    Left = 8
    Top = 63
    Width = 206
    Height = 57
    TabOrder = 2
    SkinData.SkinSection = 'GROUPBOX'
    object lbl_DataEmissao: TsLabel
      Left = 10
      Top = 11
      Width = 73
      Height = 13
      Caption = 'Data Emiss'#227'o *'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_DataCompra: TsLabel
      Left = 108
      Top = 11
      Width = 72
      Height = 13
      Caption = 'Data Compra *'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object edt_DataEmissao: TsDateEdit
      Left = 10
      Top = 26
      Width = 90
      Height = 21
      AutoSize = False
      Color = clWhite
      EditMask = '!99/99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      Text = '  /  /    '
      OnExit = edt_DataEmissaoExit
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object edt_DataCompra: TsDateEdit
      Left = 108
      Top = 26
      Width = 90
      Height = 21
      AutoSize = False
      Color = clWhite
      EditMask = '!99/99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      Text = '  /  /    '
      OnExit = edt_DataCompraExit
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
  end
  object sGroupBox11: TsGroupBox
    Left = 8
    Top = 606
    Width = 951
    Height = 58
    TabOrder = 11
    SkinData.SkinSection = 'GROUPBOX'
    object btn_Salvar: TsBitBtn
      Left = 777
      Top = 13
      Width = 75
      Height = 33
      Caption = 'Salvar'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btn_SalvarClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btn_Sair: TsBitBtn
      Left = 865
      Top = 13
      Width = 75
      Height = 33
      Caption = 'Sair'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = btn_SairClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object sGroupBox4: TsGroupBox
    Left = 8
    Top = 422
    Width = 425
    Height = 178
    Caption = 'Condi'#231#227'o de Pagamento'
    TabOrder = 7
    SkinData.SkinSection = 'GROUPBOX'
    object lbl_IdCondicaoPagamento: TsLabel
      Left = 10
      Top = 20
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_CondicaoPagamento: TsLabel
      Left = 64
      Top = 20
      Width = 125
      Height = 13
      Caption = 'Condi'#231#227'o de Pagamento *'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object edt_CondicaoPagamento: TsEdit
      Left = 64
      Top = 37
      Width = 244
      Height = 21
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      TabOrder = 1
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object edt_IdCondicaoPagamento: TsEdit
      Left = 8
      Top = 37
      Width = 50
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      TabOrder = 0
      OnExit = edt_IdCondicaoPagamentoExit
      OnKeyPress = edt_IdCondicaoPagamentoKeyPress
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object btn_BuscarCondicaoPagamento: TsBitBtn
      Left = 314
      Top = 35
      Width = 30
      Height = 25
      DoubleBuffered = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000643F3F00653F
        3F00674242006B474700714D4D00775555007E5C5C008C686600244574000435
        7700093876000938760008357304043B8088404A65B68B605C52643F3F00653F
        3F00674242006B474700714D4D00775555007E5C5C008C686600244574000435
        77000938760009347104023E85981388E0FF54AEE4FF738CA8C1643F3F00653F
        3F00674242006B474700714D4D00775555007E5C5C008C686600244574000435
        770009346F05023E85981087E1FF82E6FEFF6EDBFDFF0F83DD87643F3F00653F
        3F00674242006B474700714D4D00775555007E5C5C008C686600214475000432
        7309023E86991086E1FF81E4FEFF75DCF8FF1086DE990879DA05643F3F00653F
        3F00674242006A4646006F4B4B00765353007C5A5A008C686500384B6D000039
        81801388E1FF82E6FEFF75DCF8FF0F85DE9A0978D7020C7BDA00643F3F00653F
        3F00664141146A46476B734F50A6795858B7815F6091866566437F5D5B22464D
        67B64FA2D8FF6EDBFBFF1086DE9A0978D7030C7CDA000C7BDA00643F3E00643E
        3F3D6A4849D7927368F9BFAB9FD9D1C1BDD1BEABA3E2A08682F58F7273EBB08A
        83F55A7391B5097EDD83097ADA030C7CDA000C7CDA000C7BDA00633E3F256A47
        47E9B78263DBF9E2A999FEFEE493FEFEFC94FEFEE893F3DDAEABB8988AF1AE92
        92F68E8895271178D100057BE000087BDD00087BDD00087ADD006442469A9F61
        47EEFEA85F95FED19196FEEEBA99FEF9CC99FEF1BE99FED89793F5AA6EAAB697
        8EF6AB9190478C8D9A00768BA500798CA300798CA300798BA300714D4CE1D567
        2CBAFE8B3B92FEA86395FEC18195FECE8F95FEC48596FEAB6794FE8F4196D696
        73EBAF9FA295B1959100B6969100B5969100B5969100B5969100865B53EBE851
        09A2F971229BFC9953B0FEAF6BB7FEAB68A9FDA25DA3FDA560B9FEAA63DEE9A7
        78FCB7A6A8B3B19B9B00B29D9D00B29D9D00B29D9D00B29D9D00845C57E8E875
        31D0FEAD66E4FECC8EF7FEDA9FF8FEDDA3F3FEDBA0EFFED89DF8FECB88F9E6B1
        8CFFBDABAEA3B6A2A100B7A3A300B7A3A300B7A3A300B7A3A3007E5D5FBBCC95
        6FFFFED38FF7FEE0A5F5FEEBB7F5FEF0C1F6FEF0C1F7FEECB5F5FEDB9EF6D7BA
        A9FFBDADAF67BBA8A800BCA8A800BCA8A800BCA8A800BCA8A8007B5D5F509B79
        73FFEDC292FDFEF2BAF4FEF5CCF5FEF7D7F5FEF8D7F5FEF5C9F5E8D2B5FFC5B2
        B4D7BCA9A913BDAAAA00BDAAAA00BDAAAA00BDAAAA00BDAAAA007E5E5E008B6D
        6F79A88D86FFDDC9ABFFF9EDD0FDFBF6E3FCF7F0E0FFE0CFBFFFC5B4B4E2BDAA
        AA3BBDAAAA00BDAAAA00BDAAAA00BDAAAA00BDAAAA00BDAAAA007E5E5E008A6A
        6A0094777951A38C8DB6B8A3A1ECC9B4B0EDC1AEAFE0BBA6A895BBA8A827BEAA
        AA00BDAAAA00BDAAAA00BDAAAA00BDAAAA00BDAAAA00BDAAAA00}
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      OnClick = btn_BuscarCondicaoPagamentoClick
      SkinData.SkinSection = 'BUTTON'
    end
    object gridParcelas: TStringGrid
      Left = 10
      Top = 64
      Width = 403
      Height = 105
      ColCount = 4
      DefaultColWidth = 93
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      TabOrder = 5
    end
    object btn_GerarParcelas: TsBitBtn
      Left = 348
      Top = 35
      Width = 30
      Height = 25
      DoubleBuffered = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002F7835FFFFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0036823DFF337D39FFFFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF003E8C45FF56A05DFF549D59FF347E3AFF307A36FF2D75
        32D32A712F6BFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0045974DFF5EA865FF82C58AFF80C486FF7DC284FF7BC181FF6CB4
        73FF4C9451FF2B7230CB286D2C1AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00499C52FF62AC69FF86C98EFF84C78AFF81C588FF7EC386FF74BE
        7BFF7AC181FF549C5AFF2B7230CBFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF004A9D52FF62AD6BFF5FA967FF3F8F47FF59A260FF80C4
        86FF7DC384FF7BC181FF4D9553FF2C73316BFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF004A9E53FF47994FFFFFFFFF00409048A63D8B
        44FD7BC083FF76C07DFF70B676FF2F7835D8FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004B9F54FFFFFFFF00FFFFFF004190
        488262AA69FF82C789FF81C487FF337D39FFFFFFFF00FFFFFF00FFFFFF00FFFF
        FF005BB565FF58B162FF55AD5FFF52A85BFF4FA45877FFFFFF00FFFFFF004596
        4D8266AE6EFF87C98EFF84C88BFF37833DFFFFFFFF00FFFFFF00FFFFFF00FFFF
        FF005EB969D893D19CFF9CD5A5FF92CF9AFF52A95CFD4FA558824CA05582499B
        51FD88C98FFF84C88BFF7CBF83FF3B8842D8FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0061BD6C6B7AC784FF9FD7A8FF9DD6A6FF96D19FFF76BF80FF74BB7DFF8DCC
        96FF92CF9AFF8FCE97FF60AA68FF3F8E466BFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0061BE6CCB81CA8BFFA0D8AAFF98D4A1FF9BD5A5FF9AD4A3FF91D0
        9AFF95D19DFF70B778FF46984FCBFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0063C16F1A61BE6DCB7BC886FF95D3A0FF9FD8A9FF9DD6A6FF8FCE
        98FF6FB977FF4EA257CB4A9E531AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0062BF6D6B5FBB6BD85DB868FF5AB465FF57B0
        62D854AC5E6BFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 3
      OnClick = btn_GerarParcelasClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btn_LimparParcelas: TsBitBtn
      Left = 383
      Top = 35
      Width = 30
      Height = 25
      DoubleBuffered = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF003E53C223394FC17D3752BDDB3450BCF32F4ABBF32D4D
        B7DB2A4BB67D2647B423FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF004557C8534154C5E63B51CCFF7479E8FF8E91EEFF8E91EEFF7077
        E4FF324CC0FF2A49B6E6284AB453FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF004C59CD534858CBF45B64E0FFA0A5F5FF7D85EFFF5A62E9FF585CE7FF7C83
        EEFF9D9FF4FF505CD7FF2A49B6F4284AB453FFFFFF00FFFFFF00FFFFFF00535E
        D2225260CFE5606AE3FFA0ABF5FF535EECFF4F5BEAFF4C58E9FF4D58E6FF4B55
        E6FF4F55E6FF9DA1F4FF535FD6FF2949B7E5284AB422FFFFFF00FFFFFF00575F
        D47E4A55DBFFA1AAF6FF5563F0FF5165EEFF4C58E9FF4C58E9FF4C58E9FF4C58
        E9FF4B57E6FF5159E6FF9EA2F5FF334FC3FF2949B77EFFFFFF00FFFFFF005B61
        D7DB808BEEFF7D90F7FF5C72F3FF4C58E9FF4C58E9FF4C58E9FF4C58E9FF4C58
        E9FF4C58E9FF4E5AE9FF7A82F0FF747AE2FF2D4AB9DBFFFFFF00FFFFFF005E62
        DAF6A0AAF7FF6F85F8FF6781F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF4C58E9FF5B65EAFF959BF1FF314FBBF6FFFFFF00FFFFFF006368
        DBF6AEB8F9FF7E92FAFF6F84F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF4C58E9FF5D69EEFF959CF1FF354EBDF6FFFFFF00FFFFFF006669
        DEDBA4AEF5FF9CAAFAFF768BF0FF535EECFF535EECFF535EECFF535EECFF535E
        ECFF535EECFF6276F2FF808DF4FF777EE9FF3952BFDBFFFFFF00FFFFFF006968
        E07E7C82EAFFCDD4FCFF8A9CFAFF7D92F7FF7489EEFF6B83F6FF6B83F6FF6B83
        F6FF6B83F6FF6278F3FFA3AEF8FF3D4ED0FF3D53C17EFFFFFF00FFFFFF006B6B
        E1226968E0E5A2A6F3FFD4DBFDFF8699FAFF7E90F0FF798DF1FF7E93F8FF7D91
        F9FF758BF8FFA7B5F8FF626DE3FF4456C7E54055C422FFFFFF00FFFFFF00FFFF
        FF006C6BE3536968E0F4A9ACF2FFD8DCFDFFADB9FAFF90A2FAFF8A9CFAFF9BA8
        FBFFB9C7FCFF6F7AE9FF4B5ACCF44757CA53FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF006C6BE3536969DFE68D92EDFFBDC2F8FFCCD3F9FFC3CBF9FFA9B3
        F4FF656FE2FF525DD1E64F5CCE53FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF006C6CE2236A69E17D6769DDDB6263DCF36063DAF35C62
        D9DB5A62D67D5761D423FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 4
      OnClick = btn_LimparParcelasClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object sGroupBox5: TsGroupBox
    Left = 546
    Top = 2
    Width = 413
    Height = 60
    TabOrder = 1
    SkinData.SkinSection = 'GROUPBOX'
    object lbl_IdFuncionario: TsLabel
      Left = 12
      Top = 13
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_Funcionario: TsLabel
      Left = 69
      Top = 13
      Width = 64
      Height = 13
      Caption = 'Funcion'#225'rio *'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl3: TsLabel
      Left = 296
      Top = 3
      Width = 114
      Height = 13
      Caption = 'Campos Obrigat'#243'rios(*)'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object edt_IdFuncionario: TsEdit
      Left = 10
      Top = 30
      Width = 55
      Height = 21
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      TabOrder = 0
      OnExit = edt_IdFuncionarioExit
      OnKeyPress = edt_IdFuncionarioKeyPress
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object edt_Funcionario: TsEdit
      Left = 69
      Top = 30
      Width = 300
      Height = 21
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      TabOrder = 1
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object btn_BuscarFuncionario: TsBitBtn
      Left = 375
      Top = 28
      Width = 30
      Height = 25
      Hint = 'Consultar'
      DoubleBuffered = True
      Enabled = False
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000643F3F00653F
        3F00674242006B474700714D4D00775555007E5C5C008C686600244574000435
        7700093876000938760008357304043B8088404A65B68B605C52643F3F00653F
        3F00674242006B474700714D4D00775555007E5C5C008C686600244574000435
        77000938760009347104023E85981388E0FF54AEE4FF738CA8C1643F3F00653F
        3F00674242006B474700714D4D00775555007E5C5C008C686600244574000435
        770009346F05023E85981087E1FF82E6FEFF6EDBFDFF0F83DD87643F3F00653F
        3F00674242006B474700714D4D00775555007E5C5C008C686600214475000432
        7309023E86991086E1FF81E4FEFF75DCF8FF1086DE990879DA05643F3F00653F
        3F00674242006A4646006F4B4B00765353007C5A5A008C686500384B6D000039
        81801388E1FF82E6FEFF75DCF8FF0F85DE9A0978D7020C7BDA00643F3F00653F
        3F00664141146A46476B734F50A6795858B7815F6091866566437F5D5B22464D
        67B64FA2D8FF6EDBFBFF1086DE9A0978D7030C7CDA000C7BDA00643F3E00643E
        3F3D6A4849D7927368F9BFAB9FD9D1C1BDD1BEABA3E2A08682F58F7273EBB08A
        83F55A7391B5097EDD83097ADA030C7CDA000C7CDA000C7BDA00633E3F256A47
        47E9B78263DBF9E2A999FEFEE493FEFEFC94FEFEE893F3DDAEABB8988AF1AE92
        92F68E8895271178D100057BE000087BDD00087BDD00087ADD006442469A9F61
        47EEFEA85F95FED19196FEEEBA99FEF9CC99FEF1BE99FED89793F5AA6EAAB697
        8EF6AB9190478C8D9A00768BA500798CA300798CA300798BA300714D4CE1D567
        2CBAFE8B3B92FEA86395FEC18195FECE8F95FEC48596FEAB6794FE8F4196D696
        73EBAF9FA295B1959100B6969100B5969100B5969100B5969100865B53EBE851
        09A2F971229BFC9953B0FEAF6BB7FEAB68A9FDA25DA3FDA560B9FEAA63DEE9A7
        78FCB7A6A8B3B19B9B00B29D9D00B29D9D00B29D9D00B29D9D00845C57E8E875
        31D0FEAD66E4FECC8EF7FEDA9FF8FEDDA3F3FEDBA0EFFED89DF8FECB88F9E6B1
        8CFFBDABAEA3B6A2A100B7A3A300B7A3A300B7A3A300B7A3A3007E5D5FBBCC95
        6FFFFED38FF7FEE0A5F5FEEBB7F5FEF0C1F6FEF0C1F7FEECB5F5FEDB9EF6D7BA
        A9FFBDADAF67BBA8A800BCA8A800BCA8A800BCA8A800BCA8A8007B5D5F509B79
        73FFEDC292FDFEF2BAF4FEF5CCF5FEF7D7F5FEF8D7F5FEF5C9F5E8D2B5FFC5B2
        B4D7BCA9A913BDAAAA00BDAAAA00BDAAAA00BDAAAA00BDAAAA007E5E5E008B6D
        6F79A88D86FFDDC9ABFFF9EDD0FDFBF6E3FCF7F0E0FFE0CFBFFFC5B4B4E2BDAA
        AA3BBDAAAA00BDAAAA00BDAAAA00BDAAAA00BDAAAA00BDAAAA007E5E5E008A6A
        6A0094777951A38C8DB6B8A3A1ECC9B4B0EDC1AEAFE0BBA6A895BBA8A827BEAA
        AA00BDAAAA00BDAAAA00BDAAAA00BDAAAA00BDAAAA00BDAAAA00}
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btn_BuscarFuncionarioClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object sGroupBox6: TsGroupBox
    Left = 441
    Top = 422
    Width = 415
    Height = 116
    Caption = 'Observa'#231#227'o'
    TabOrder = 8
    SkinData.SkinSection = 'GROUPBOX'
    object edt_Observacao: TsMemo
      Left = 12
      Top = 19
      Width = 395
      Height = 86
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 255
      ParentFont = False
      TabOrder = 0
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
    end
  end
  object sGroupBox7: TsGroupBox
    Left = 441
    Top = 540
    Width = 260
    Height = 60
    Caption = 'Status'
    TabOrder = 9
    SkinData.SkinSection = 'GROUPBOX'
    object edt_status: TsEdit
      Left = 9
      Top = 30
      Width = 111
      Height = 21
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 15
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
  end
  object sGroupBox8: TsGroupBox
    Left = 8
    Top = 354
    Width = 951
    Height = 61
    Caption = 'C'#225'lculo do Imposto'
    TabOrder = 6
    SkinData.SkinSection = 'GROUPBOX'
    object lbl_Frete: TsLabel
      Left = 294
      Top = 17
      Width = 39
      Height = 13
      Caption = 'V. Frete'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_BaseICMS: TsLabel
      Left = 10
      Top = 17
      Width = 78
      Height = 13
      Caption = 'Base Calc. ICMS'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_TotalICMS: TsLabel
      Left = 152
      Top = 17
      Width = 65
      Height = 13
      Caption = 'V. Total ICMS'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_ValorDesconto: TsLabel
      Left = 436
      Top = 17
      Width = 58
      Height = 13
      Caption = 'V. Desconto'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_TotalIPI: TsLabel
      Left = 578
      Top = 17
      Width = 54
      Height = 13
      Caption = 'V. Total IPI'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl2: TsLabel
      Left = 720
      Top = 17
      Width = 75
      Height = 13
      Caption = 'V.Total Produto'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl1: TsLabel
      Left = 865
      Top = 17
      Width = 60
      Height = 13
      Caption = 'V.Total Nota'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object edt_ValorFrete: TsEdit
      Left = 294
      Top = 33
      Width = 78
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 9
      ParentFont = False
      TabOrder = 2
      OnExit = edt_ValorFreteExit
      OnKeyPress = edt_ValorFreteKeyPress
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object edt_BaseICMS: TsEdit
      Left = 10
      Top = 33
      Width = 78
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 9
      ParentFont = False
      TabOrder = 0
      OnExit = edt_BaseICMSExit
      OnKeyPress = edt_BaseICMSKeyPress
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object edt_TotalICMS: TsEdit
      Left = 152
      Top = 33
      Width = 78
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 9
      ParentFont = False
      TabOrder = 1
      OnExit = edt_TotalICMSExit
      OnKeyPress = edt_TotalICMSKeyPress
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object edt_ValorDesconto: TsEdit
      Left = 436
      Top = 33
      Width = 78
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 9
      ParentFont = False
      TabOrder = 3
      OnExit = edt_ValorDescontoExit
      OnKeyPress = edt_ValorDescontoKeyPress
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object edt_TotalIpi: TsEdit
      Left = 578
      Top = 33
      Width = 78
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 9
      ParentFont = False
      TabOrder = 4
      OnExit = edt_TotalIpiExit
      OnKeyPress = edt_TotalIpiKeyPress
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object edt_TotalProduto: TsEdit
      Left = 720
      Top = 33
      Width = 78
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 9
      ParentFont = False
      TabOrder = 5
      OnExit = edt_TotalProdutoExit
      OnKeyPress = edt_TotalProdutoKeyPress
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object edt_TotalNota: TsEdit
      Left = 865
      Top = 33
      Width = 78
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 6
      OnChange = edt_TotalNotaChange
      OnExit = edt_TotalNotaExit
      OnKeyPress = edt_TotalNotaKeyPress
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
  end
  object rg_TipoFrete: TsRadioGroup
    Left = 632
    Top = 63
    Width = 327
    Height = 57
    Caption = 'Tipo Frete'
    ParentBackground = False
    TabOrder = 4
    OnClick = rg_TipoFreteClick
    SkinData.SkinSection = 'GROUPBOX'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      '0 - Emitente'
      '1 - Destinat'#225'rio'
      '3 - N'#227'o se Aplica'
      '9 - Sem Transportadora')
  end
  object sGroupBox12: TsGroupBox
    Left = 218
    Top = 63
    Width = 408
    Height = 57
    TabOrder = 3
    SkinData.SkinSection = 'GROUPBOX'
    object lbl_IdTransportadora: TsLabel
      Left = 10
      Top = 11
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_Transportadora: TsLabel
      Left = 69
      Top = 11
      Width = 75
      Height = 13
      Caption = 'Transportadora'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object edt_IdTransportadora: TsEdit
      Left = 8
      Top = 26
      Width = 55
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      TabOrder = 0
      OnExit = edt_IdTransportadoraExit
      OnKeyPress = edt_IdTransportadoraKeyPress
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object edt_transportadora: TsEdit
      Left = 69
      Top = 26
      Width = 293
      Height = 21
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      TabOrder = 1
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object btn_BuscarTransportadora: TsBitBtn
      Left = 367
      Top = 24
      Width = 30
      Height = 25
      DoubleBuffered = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000643F3F00653F
        3F00674242006B474700714D4D00775555007E5C5C008C686600244574000435
        7700093876000938760008357304043B8088404A65B68B605C52643F3F00653F
        3F00674242006B474700714D4D00775555007E5C5C008C686600244574000435
        77000938760009347104023E85981388E0FF54AEE4FF738CA8C1643F3F00653F
        3F00674242006B474700714D4D00775555007E5C5C008C686600244574000435
        770009346F05023E85981087E1FF82E6FEFF6EDBFDFF0F83DD87643F3F00653F
        3F00674242006B474700714D4D00775555007E5C5C008C686600214475000432
        7309023E86991086E1FF81E4FEFF75DCF8FF1086DE990879DA05643F3F00653F
        3F00674242006A4646006F4B4B00765353007C5A5A008C686500384B6D000039
        81801388E1FF82E6FEFF75DCF8FF0F85DE9A0978D7020C7BDA00643F3F00653F
        3F00664141146A46476B734F50A6795858B7815F6091866566437F5D5B22464D
        67B64FA2D8FF6EDBFBFF1086DE9A0978D7030C7CDA000C7BDA00643F3E00643E
        3F3D6A4849D7927368F9BFAB9FD9D1C1BDD1BEABA3E2A08682F58F7273EBB08A
        83F55A7391B5097EDD83097ADA030C7CDA000C7CDA000C7BDA00633E3F256A47
        47E9B78263DBF9E2A999FEFEE493FEFEFC94FEFEE893F3DDAEABB8988AF1AE92
        92F68E8895271178D100057BE000087BDD00087BDD00087ADD006442469A9F61
        47EEFEA85F95FED19196FEEEBA99FEF9CC99FEF1BE99FED89793F5AA6EAAB697
        8EF6AB9190478C8D9A00768BA500798CA300798CA300798BA300714D4CE1D567
        2CBAFE8B3B92FEA86395FEC18195FECE8F95FEC48596FEAB6794FE8F4196D696
        73EBAF9FA295B1959100B6969100B5969100B5969100B5969100865B53EBE851
        09A2F971229BFC9953B0FEAF6BB7FEAB68A9FDA25DA3FDA560B9FEAA63DEE9A7
        78FCB7A6A8B3B19B9B00B29D9D00B29D9D00B29D9D00B29D9D00845C57E8E875
        31D0FEAD66E4FECC8EF7FEDA9FF8FEDDA3F3FEDBA0EFFED89DF8FECB88F9E6B1
        8CFFBDABAEA3B6A2A100B7A3A300B7A3A300B7A3A300B7A3A3007E5D5FBBCC95
        6FFFFED38FF7FEE0A5F5FEEBB7F5FEF0C1F6FEF0C1F7FEECB5F5FEDB9EF6D7BA
        A9FFBDADAF67BBA8A800BCA8A800BCA8A800BCA8A800BCA8A8007B5D5F509B79
        73FFEDC292FDFEF2BAF4FEF5CCF5FEF7D7F5FEF8D7F5FEF5C9F5E8D2B5FFC5B2
        B4D7BCA9A913BDAAAA00BDAAAA00BDAAAA00BDAAAA00BDAAAA007E5E5E008B6D
        6F79A88D86FFDDC9ABFFF9EDD0FDFBF6E3FCF7F0E0FFE0CFBFFFC5B4B4E2BDAA
        AA3BBDAAAA00BDAAAA00BDAAAA00BDAAAA00BDAAAA00BDAAAA007E5E5E008A6A
        6A0094777951A38C8DB6B8A3A1ECC9B4B0EDC1AEAFE0BBA6A895BBA8A827BEAA
        AA00BDAAAA00BDAAAA00BDAAAA00BDAAAA00BDAAAA00BDAAAA00}
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = btn_BuscarTransportadoraClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object sGroupBox9: TsGroupBox
    Left = 706
    Top = 540
    Width = 253
    Height = 60
    TabOrder = 10
    SkinData.SkinSection = 'GROUPBOX'
    object sLabel1: TsLabel
      Left = 10
      Top = 13
      Width = 70
      Height = 13
      Caption = 'Data Cadastro'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object sLabel2: TsLabel
      Left = 155
      Top = 13
      Width = 72
      Height = 13
      Caption = 'Data Altera'#231#227'o'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object edt_DataCadastro: TsDateEdit
      Left = 10
      Top = 30
      Width = 90
      Height = 21
      AutoSize = False
      Color = clWhite
      Enabled = False
      EditMask = '!99/99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      Text = '  /  /    '
      OnExit = edt_DataEmissaoExit
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
    object edt_DataAlteracao: TsDateEdit
      Left = 155
      Top = 30
      Width = 90
      Height = 21
      AutoSize = False
      Color = clWhite
      Enabled = False
      EditMask = '!99/99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      Text = '  /  /    '
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
  end
end
