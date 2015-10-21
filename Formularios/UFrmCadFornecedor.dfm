inherited FrmCadFornecedor: TFrmCadFornecedor
  Caption = 'Cadastro Fornecedor/Transportadora'
  ClientHeight = 586
  ClientWidth = 813
  OnActivate = FormActivate
  ExplicitWidth = 819
  ExplicitHeight = 615
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_IdCliente: TsLabel [0]
    Left = 8
    Top = 8
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
  object lbl_Nome_RazaoSocial: TsLabel [1]
    Left = 8
    Top = 48
    Width = 36
    Height = 13
    Caption = 'Nome *'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4276545
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object lbl_DataCadastro: TsLabel [2]
    Left = 102
    Top = 8
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
  object lbl_Observacao: TsLabel [3]
    Left = 513
    Top = 308
    Width = 58
    Height = 13
    Caption = 'Observa'#231#227'o'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4276545
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  inherited lbl5: TsLabel
    Left = 469
    Top = 12
    ExplicitLeft = 469
    ExplicitTop = 12
  end
  inherited sGroupBox1: TsGroupBox
    Top = 520
    Width = 798
    TabOrder = 8
    ExplicitTop = 520
    ExplicitWidth = 798
    inherited btn_Salvar: TsBitBtn
      Left = 631
      OnClick = btn_SalvarClick
      ExplicitLeft = 631
    end
    inherited btn_Sair: TsBitBtn
      Left = 712
      ExplicitLeft = 712
    end
  end
  object edt_Observacao: TsMemo
    Left = 514
    Top = 326
    Width = 289
    Height = 123
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4276545
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 255
    ParentFont = False
    TabOrder = 6
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
  object rg_TipoPessoa: TsRadioGroup
    Left = 599
    Top = 7
    Width = 207
    Height = 38
    Caption = 'Tipo Pessoa'
    ParentBackground = False
    TabOrder = 10
    OnClick = rg_TipoPessoaClick
    SkinData.SkinSection = 'GROUPBOX'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'F'#237'sica'
      'Jur'#237'dica')
  end
  object edt_IdCliente: TsEdit
    Left = 8
    Top = 24
    Width = 60
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
    Left = 102
    Top = 24
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
    TabOrder = 9
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
  object edt_Nome_RazaoSocial: TsEdit
    Left = 8
    Top = 66
    Width = 499
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
  object sGroupBox3: TsGroupBox
    Left = 399
    Top = 233
    Width = 407
    Height = 68
    Caption = 'Condi'#231#227'o de Pagamento'
    TabOrder = 4
    SkinData.SkinSection = 'GROUPBOX'
    object lbl_IdCondicaoPgto: TsLabel
      Left = 13
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
    object lbl_CondicaoPgto: TsLabel
      Left = 79
      Top = 23
      Width = 110
      Height = 13
      Caption = 'Condi'#231#227'o Pagamento *'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object edt_IdCondicaoPgto: TsEdit
      Left = 13
      Top = 39
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
      TabOrder = 0
      OnExit = edt_IdCondicaoPgtoExit
      OnKeyPress = edt_IdCondicaoPgtoKeyPress
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
    object edt_CondicaoPgto: TsEdit
      Left = 79
      Top = 39
      Width = 283
      Height = 21
      CharCase = ecUpperCase
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
    object btn_BuscarCondicaoPgto: TsBitBtn
      Left = 366
      Top = 37
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
      OnClick = btn_BuscarCondicaoPgtoClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object sGroupBox4: TsGroupBox
    Left = 8
    Top = 233
    Width = 385
    Height = 68
    Caption = 'Dados Pessoal'
    TabOrder = 3
    SkinData.SkinSection = 'GROUPBOX'
    object lbl_RG_IE: TsLabel
      Left = 10
      Top = 23
      Width = 14
      Height = 13
      Caption = 'RG'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_CPF_CNPJ: TsLabel
      Left = 141
      Top = 23
      Width = 19
      Height = 13
      Caption = 'CPF'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_DataNasc_Fund: TsLabel
      Left = 283
      Top = 23
      Width = 90
      Height = 13
      Caption = 'Data Nascimento *'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object edt_DataNasc_Fund: TsDateEdit
      Left = 283
      Top = 39
      Width = 89
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
      TabOrder = 2
      Text = '  /  /    '
      OnExit = edt_DataNasc_FundExit
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
    object edt_CPF_CNPJ: TsMaskEdit
      Left = 141
      Top = 39
      Width = 109
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      EditMask = '!999.999.999-99;0;'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 14
      ParentFont = False
      TabOrder = 1
      OnClick = edt_CPF_CNPJClick
      OnExit = edt_CPF_CNPJExit
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
    object edt_RG_IE: TsEdit
      Left = 10
      Top = 39
      Width = 98
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
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
  object sGroupBox5: TsGroupBox
    Left = 517
    Top = 455
    Width = 289
    Height = 60
    TabOrder = 7
    SkinData.SkinSection = 'GROUPBOX'
    object lbl_DataUltAlteracao: TsLabel
      Left = 185
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
    object edt_DataUltAlteracao: TsDateEdit
      Left = 185
      Top = 30
      Width = 94
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
  object sGroupBox2: TsGroupBox
    Left = 8
    Top = 89
    Width = 798
    Height = 145
    Caption = 'Endere'#231'o'
    TabOrder = 2
    SkinData.SkinSection = 'GROUPBOX'
    object lbl_Logradouro: TsLabel
      Left = 10
      Top = 19
      Width = 64
      Height = 13
      Caption = 'Logradouro *'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_Numero: TsLabel
      Left = 404
      Top = 19
      Width = 46
      Height = 13
      Caption = 'N'#250'mero *'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_Bairro: TsLabel
      Left = 499
      Top = 19
      Width = 37
      Height = 13
      Caption = 'Bairro *'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_CEP: TsLabel
      Left = 722
      Top = 19
      Width = 19
      Height = 13
      Caption = 'CEP'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_Complemento: TsLabel
      Left = 10
      Top = 60
      Width = 65
      Height = 13
      Caption = 'Complemento'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_IdCidade: TsLabel
      Left = 304
      Top = 60
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
    object lbl_Cidade: TsLabel
      Left = 371
      Top = 60
      Width = 42
      Height = 13
      Caption = 'Cidade *'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_UF: TsLabel
      Left = 722
      Top = 60
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
    object lbl_Pais: TsLabel
      Left = 10
      Top = 101
      Width = 19
      Height = 13
      Caption = 'Pa'#237's'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_Email: TsLabel
      Left = 304
      Top = 101
      Width = 24
      Height = 13
      Caption = 'Email'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_Telefone: TsLabel
      Left = 609
      Top = 101
      Width = 42
      Height = 13
      Caption = 'Telefone'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_Celular: TsLabel
      Left = 702
      Top = 101
      Width = 33
      Height = 13
      Caption = 'Celular'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object edt_Logradouro: TsEdit
      Left = 10
      Top = 36
      Width = 384
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
    object edt_Numero: TsEdit
      Left = 404
      Top = 36
      Width = 85
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 5
      NumbersOnly = True
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
    object edt_Bairro: TsEdit
      Left = 499
      Top = 36
      Width = 213
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
    object edt_Complemento: TsEdit
      Left = 10
      Top = 77
      Width = 285
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
    object edt_IdCidade: TsEdit
      Left = 304
      Top = 77
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
      NumbersOnly = True
      ParentFont = False
      TabOrder = 5
      OnExit = edt_IdCidadeExit
      OnKeyPress = edt_IdCidadeKeyPress
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
    object edt_Cidade: TsEdit
      Left = 371
      Top = 77
      Width = 305
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 50
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
    object edt_UF: TsEdit
      Left = 722
      Top = 77
      Width = 65
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 2
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
    object edt_Pais: TsEdit
      Left = 10
      Top = 118
      Width = 285
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      TabOrder = 9
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
    object edt_Email: TsEdit
      Left = 303
      Top = 118
      Width = 299
      Height = 21
      CharCase = ecLowerCase
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      TabOrder = 10
      OnExit = edt_EmailExit
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
    object btn_BuscarCidade: TsBitBtn
      Left = 682
      Top = 75
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
      TabOrder = 7
      OnClick = btn_BuscarCidadeClick
      SkinData.SkinSection = 'BUTTON'
    end
    object edt_CEP: TsMaskEdit
      Left = 722
      Top = 36
      Width = 65
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      EditMask = '99999\-999;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 9
      ParentFont = False
      TabOrder = 3
      Text = '     -   '
      OnClick = edt_CEPClick
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
    object edt_Telefone: TsMaskEdit
      Left = 609
      Top = 118
      Width = 85
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 13
      ParentFont = False
      TabOrder = 11
      OnClick = edt_TelefoneClick
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
    object edt_Celular: TsMaskEdit
      Left = 702
      Top = 118
      Width = 85
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 13
      ParentFont = False
      TabOrder = 12
      OnClick = edt_CelularClick
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
  object grpBox_Produtos: TsGroupBox
    Left = 8
    Top = 302
    Width = 499
    Height = 213
    Caption = 'Produtos do Fornecedor'
    TabOrder = 5
    SkinData.SkinSection = 'GROUPBOX'
    object lbl_IdCondicaoPagamento: TsLabel
      Left = 10
      Top = 16
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
      Left = 66
      Top = 16
      Width = 38
      Height = 13
      Caption = 'Produto'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object edt_Produto: TsEdit
      Left = 66
      Top = 32
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
      Top = 32
      Width = 50
      Height = 21
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 5
      NumbersOnly = True
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
      Left = 350
      Top = 30
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
      OnClick = btn_BuscarProdutoClick
      SkinData.SkinSection = 'BUTTON'
    end
    object gridProduto: TStringGrid
      Left = 10
      Top = 61
      Width = 477
      Height = 143
      ColCount = 4
      DefaultColWidth = 66
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      TabOrder = 5
      RowHeights = (
        24)
    end
    object btn_LimparProduto: TsBitBtn
      Left = 457
      Top = 30
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
      OnClick = btn_LimparProdutoClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btn_Add_Produto: TsBitBtn
      Left = 421
      Top = 30
      Width = 30
      Height = 25
      Hint = 'Adicionar'
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
      TabOrder = 3
      OnClick = btn_Add_ProdutoClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
end
