inherited FrmConCondicaoPagamento: TFrmConCondicaoPagamento
  Caption = 'Consulta Condi'#231#227'o de Pagamento'
  ClientHeight = 457
  OnActivate = FormActivate
  ExplicitWidth = 660
  ExplicitHeight = 486
  PixelsPerInch = 96
  TextHeight = 13
  inherited sGroupBox1: TsGroupBox
    Height = 153
    ExplicitHeight = 153
    object lbl_FormaPagamento: TsLabel [2]
      Left = 92
      Top = 102
      Width = 102
      Height = 13
      Caption = 'Forma de Pagamento'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_IdFormaPagamento: TsLabel [3]
      Left = 16
      Top = 102
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
    inherited edt_Id: TsEdit
      Top = 31
      MaxLength = 5
      OnKeyPress = edt_IdKeyPress
      ExplicitTop = 31
    end
    inherited edt_Descricao: TsEdit
      Width = 397
      MaxLength = 100
      ExplicitWidth = 397
    end
    inherited btn_Consultar: TsButton
      Top = 110
      TabOrder = 5
      OnClick = btn_ConsultarClick
      ExplicitTop = 110
    end
    object edt_FormaPagamento: TsEdit
      Left = 87
      Top = 121
      Width = 286
      Height = 21
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 100
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
    object btn_Buscar: TsBitBtn
      Left = 383
      Top = 118
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
      OnClick = btn_BuscarClick
      SkinData.SkinSection = 'BUTTON'
    end
    object edt_IdFormaPagamento: TsEdit
      Left = 16
      Top = 120
      Width = 65
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
  end
  inherited sGroupBox2: TsGroupBox
    Top = 394
    ExplicitTop = 394
    inherited btn_Novo: TsBitBtn
      OnClick = btn_NovoClick
    end
    inherited btn_Editar: TsBitBtn
      OnClick = btn_EditarClick
    end
    inherited btn_Excluir: TsBitBtn
      OnClick = btn_ExcluirClick
    end
  end
  object gridConsulta: TDBGrid [2]
    Left = 8
    Top = 167
    Width = 638
    Height = 221
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  inherited sss1: TsSkinManager
    IsDefault = False
  end
end
