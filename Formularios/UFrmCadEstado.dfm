inherited FrmCadEstado: TFrmCadEstado
  Caption = 'Cadastro Estado'
  ClientHeight = 268
  ClientWidth = 390
  ExplicitWidth = 396
  ExplicitHeight = 297
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_IdEstado: TsLabel [0]
    Left = 8
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
  object lbl_Estado: TsLabel [1]
    Left = 8
    Top = 59
    Width = 42
    Height = 13
    Caption = 'Estado *'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4276545
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object lbl_UF: TsLabel [2]
    Left = 333
    Top = 59
    Width = 13
    Height = 13
    Caption = 'UF'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4276545
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object lbl_IdPais: TsLabel [3]
    Left = 8
    Top = 105
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
  object lbl_Pais: TsLabel [4]
    Left = 74
    Top = 105
    Width = 28
    Height = 13
    Caption = 'Pa'#237's *'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4276545
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object lbl_DataCadastro: TsLabel [5]
    Left = 8
    Top = 160
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
  object lbl_DataUltAlteracao: TsLabel [6]
    Left = 122
    Top = 160
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
  inherited lbl5: TsLabel
    Left = 268
    Top = 13
    ExplicitLeft = 268
    ExplicitTop = 13
  end
  inherited sGroupBox1: TsGroupBox
    Top = 208
    Width = 374
    TabOrder = 8
    ExplicitTop = 208
    ExplicitWidth = 374
    inherited btn_Salvar: TsBitBtn
      Left = 208
      OnClick = btn_SalvarClick
      ExplicitLeft = 208
    end
    inherited btn_Sair: TsBitBtn
      Left = 292
      Width = 73
      ExplicitLeft = 292
      ExplicitWidth = 73
    end
  end
  object edt_IdEstado: TsEdit
    Left = 8
    Top = 32
    Width = 60
    Height = 21
    Color = clWhite
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4276545
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
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
  object edt_Estado: TsEdit
    Left = 8
    Top = 78
    Width = 319
    Height = 21
    CharCase = ecUpperCase
    Color = clWhite
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
  object edt_UF: TsEdit
    Left = 333
    Top = 78
    Width = 49
    Height = 21
    CharCase = ecUpperCase
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4276545
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 3
    ParentFont = False
    TabOrder = 2
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
  object edt_IdPais: TsEdit
    Left = 8
    Top = 124
    Width = 60
    Height = 21
    CharCase = ecUpperCase
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4276545
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    TabOrder = 3
    OnExit = edt_IdPaisExit
    OnKeyPress = edt_IdPaisKeyPress
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
  object edt_Pais: TsEdit
    Left = 72
    Top = 123
    Width = 274
    Height = 21
    CharCase = ecUpperCase
    Color = clWhite
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4276545
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
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
  object edt_DataCadastro: TsDateEdit
    Left = 8
    Top = 179
    Width = 100
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
    TabOrder = 6
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
  object edt_DataUltAlteracao: TsDateEdit
    Left = 122
    Top = 179
    Width = 100
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
    TabOrder = 7
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
  object btn_Buscar: TsBitBtn
    Left = 352
    Top = 121
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
    TabOrder = 5
    OnClick = btn_BuscarClick
    SkinData.SkinSection = 'BUTTON'
  end
end
