object FrmCadContasReceber: TFrmCadContasReceber
  Left = 0
  Top = 55
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Contas a Receber'
  ClientHeight = 493
  ClientWidth = 580
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
  object sGroupBox11: TsGroupBox
    Left = 8
    Top = 434
    Width = 566
    Height = 58
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    object btn_Receber: TsBitBtn
      Left = 389
      Top = 14
      Width = 75
      Height = 33
      Caption = 'Receber'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btn_ReceberClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btn_Sair: TsBitBtn
      Left = 479
      Top = 14
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
  object group_FormaPagamento: TsGroupBox
    Left = 262
    Top = 71
    Width = 315
    Height = 58
    TabOrder = 1
    SkinData.SkinSection = 'GROUPBOX'
    object lbl_IdFormaPagamento: TsLabel
      Left = 9
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
    object lbl_FormaPagamento: TsLabel
      Left = 69
      Top = 11
      Width = 111
      Height = 13
      Caption = 'Forma de Pagamento *'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object edt_IdFormaPagamento: TsEdit
      Left = 9
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
      TabOrder = 0
      OnExit = edt_IdFormaPagamentoExit
      OnKeyPress = edt_IdFormaPagamentoKeyPress
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
    object edt_FormaPagamento: TsEdit
      Left = 69
      Top = 30
      Width = 207
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
    object btn_BuscarFormaPagamento: TsBitBtn
      Left = 282
      Top = 27
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
      OnClick = btn_BuscarFormaPagamentoClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object sGroupBox7: TsGroupBox
    Left = 8
    Top = 128
    Width = 347
    Height = 58
    TabOrder = 2
    SkinData.SkinSection = 'GROUPBOX'
    object lbl_DataVencimento: TsLabel
      Left = 174
      Top = 13
      Width = 81
      Height = 13
      Caption = 'Data Vencimento'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_NumParcela: TsLabel
      Left = 9
      Top = 13
      Width = 50
      Height = 13
      Caption = 'N'#186' Parcela'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_Valor: TsLabel
      Left = 93
      Top = 13
      Width = 24
      Height = 13
      Caption = 'Valor'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl2: TsLabel
      Left = 275
      Top = 13
      Width = 55
      Height = 13
      Caption = 'Dias Atraso'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object edt_DataVencimento: TsDateEdit
      Left = 174
      Top = 29
      Width = 80
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
      TabOrder = 2
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
    object edt_NumParcela: TsEdit
      Left = 9
      Top = 29
      Width = 59
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 9
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
    object edt_Valor: TsEdit
      Left = 93
      Top = 29
      Width = 60
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 9
      ParentFont = False
      ReadOnly = True
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
    object edt_DiasAtraso: TsEdit
      Left = 275
      Top = 29
      Width = 60
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 4
      ParentFont = False
      ReadOnly = True
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
  end
  object sGroupBox6: TsGroupBox
    Left = 8
    Top = 186
    Width = 241
    Height = 58
    TabOrder = 3
    SkinData.SkinSection = 'GROUPBOX'
    object lbl_Descontos: TsLabel
      Left = 162
      Top = 11
      Width = 50
      Height = 13
      Caption = 'Descontos'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_Multa: TsLabel
      Left = 9
      Top = 11
      Width = 26
      Height = 13
      Caption = 'Multa'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_Juros: TsLabel
      Left = 88
      Top = 11
      Width = 26
      Height = 13
      Caption = 'Juros'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object edt_Multa: TsEdit
      Left = 9
      Top = 27
      Width = 60
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
      OnExit = edt_MultaExit
      OnKeyPress = edt_MultaKeyPress
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
    object edt_Descontos: TsEdit
      Left = 162
      Top = 27
      Width = 60
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
      OnExit = edt_DescontosExit
      OnKeyPress = edt_DescontosKeyPress
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
    object edt_Juros: TsEdit
      Left = 88
      Top = 27
      Width = 60
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
      OnExit = edt_JurosExit
      OnKeyPress = edt_JurosKeyPress
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
  object sGroupBox9: TsGroupBox
    Left = 254
    Top = 186
    Width = 102
    Height = 58
    TabOrder = 4
    SkinData.SkinSection = 'GROUPBOX'
    object lbl_ValorTotal: TsLabel
      Left = 10
      Top = 11
      Width = 51
      Height = 13
      Caption = 'Valor Total'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object edt_ValorTotal: TsEdit
      Left = 10
      Top = 27
      Width = 76
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
      OnKeyPress = edt_ValorTotalKeyPress
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
  object sGroupBox10: TsGroupBox
    Left = 361
    Top = 128
    Width = 216
    Height = 58
    TabOrder = 5
    SkinData.SkinSection = 'GROUPBOX'
    object lbl_DataPagamento: TsLabel
      Left = 10
      Top = 13
      Width = 80
      Height = 13
      Caption = 'Data Pagamento'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object edt_DataPagamento: TsDateEdit
      Left = 10
      Top = 29
      Width = 80
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
  object sGroupBox4: TsGroupBox
    Left = 423
    Top = 334
    Width = 153
    Height = 94
    Caption = 'Observa'#231#227'o'
    TabOrder = 6
    SkinData.SkinSection = 'GROUPBOX'
    object edt_Observacao: TsMemo
      Left = 10
      Top = 22
      Width = 127
      Height = 59
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
  object sGroupBox5: TsGroupBox
    Left = 423
    Top = 253
    Width = 151
    Height = 75
    Caption = 'Status'
    TabOrder = 7
    SkinData.SkinSection = 'GROUPBOX'
    object edt_Status: TsEdit
      Left = 8
      Top = 32
      Width = 129
      Height = 21
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HideSelection = False
      MaxLength = 6
      ParentFont = False
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
    Left = 361
    Top = 186
    Width = 215
    Height = 58
    TabOrder = 8
    SkinData.SkinSection = 'GROUPBOX'
    object lbl1: TsLabel
      Left = 9
      Top = 11
      Width = 64
      Height = 13
      Caption = 'Data Emiss'#227'o'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object edt_DataEmissao: TsDateEdit
      Left = 9
      Top = 27
      Width = 80
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
  object sGroupBox12: TsGroupBox
    Left = 8
    Top = 5
    Width = 569
    Height = 60
    TabOrder = 9
    SkinData.SkinSection = 'GROUPBOX'
    object lbl_NumNota: TsLabel
      Left = 9
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
      Width = 59
      Height = 13
      Caption = 'S'#233'rie Nota *'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_IdCliente: TsLabel
      Left = 157
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
    object lbl_Cliente: TsLabel
      Left = 218
      Top = 13
      Width = 42
      Height = 13
      Caption = 'Cliente *'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl3: TsLabel
      Left = 452
      Top = 11
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
    object edt_NumNota: TsEdit
      Left = 9
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
      OnKeyPress = edt_NumNotaKeyPress
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
      Width = 65
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
    object edt_IdCliente: TsEdit
      Left = 157
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
      OnExit = edt_IdClienteExit
      OnKeyPress = edt_IdClienteKeyPress
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
    object edt_Cliente: TsEdit
      Left = 216
      Top = 30
      Width = 314
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
    object btn_BuscarCliente: TsBitBtn
      Left = 536
      Top = 28
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
      TabOrder = 4
      OnClick = btn_BuscarClienteClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object sGroupBox2: TsGroupBox
    Left = 8
    Top = 69
    Width = 255
    Height = 58
    TabOrder = 10
    SkinData.SkinSection = 'GROUPBOX'
    object lbl_IdFuncionario: TsLabel
      Left = 9
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
    object lbl_Funcionario: TsLabel
      Left = 69
      Top = 11
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
    object edt_IdFuncionario: TsEdit
      Left = 9
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
      Width = 143
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
      Left = 218
      Top = 29
      Width = 30
      Height = 25
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
      TabOrder = 2
      OnClick = btn_BuscarFuncionarioClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object group_Condicao: TsGroupBox
    Left = 7
    Top = 250
    Width = 410
    Height = 178
    Caption = 'Condi'#231#227'o de Pagamento'
    TabOrder = 11
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
      Width = 178
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
      Left = 10
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
      Left = 248
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
      TabOrder = 2
      OnClick = btn_BuscarCondicaoPagamentoClick
      SkinData.SkinSection = 'BUTTON'
    end
    object gridParcelas: TStringGrid
      Left = 10
      Top = 64
      Width = 383
      Height = 105
      ColCount = 4
      DefaultColWidth = 93
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      TabOrder = 5
    end
    object btn_GerarParcelas: TsBitBtn
      Left = 282
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
      TabOrder = 3
      OnClick = btn_GerarParcelasClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btn_LimparParcelas: TsBitBtn
      Left = 316
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
      TabOrder = 4
      OnClick = btn_LimparParcelasClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
end
