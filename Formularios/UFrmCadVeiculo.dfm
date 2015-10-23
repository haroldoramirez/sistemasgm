inherited FrmCadVeiculo: TFrmCadVeiculo
  Caption = 'Cadastro de Ve'#237'culo'
  ClientHeight = 220
  ClientWidth = 393
  ExplicitWidth = 399
  ExplicitHeight = 249
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbl5: TsLabel
    Left = 271
    Top = 8
    ExplicitLeft = 271
    ExplicitTop = 8
  end
  object lbl_Codigo: TsLabel [1]
    Left = 8
    Top = 10
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
  object lbl_Pais: TsLabel [2]
    Left = 8
    Top = 61
    Width = 30
    Height = 13
    Caption = 'Antt *'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4276545
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object lbl_DDI: TsLabel [3]
    Left = 339
    Top = 61
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
  object lbl_DataCadastro: TsLabel [4]
    Left = 8
    Top = 111
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
  object lbl_DataUltAlteracao: TsLabel [5]
    Left = 121
    Top = 111
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
  object sLabel2: TsLabel [6]
    Left = 235
    Top = 61
    Width = 25
    Height = 13
    Caption = 'Placa'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4276545
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  inherited sGroupBox1: TsGroupBox
    Top = 157
    Width = 377
    TabOrder = 4
    ExplicitTop = 157
    ExplicitWidth = 377
    inherited btn_Salvar: TsBitBtn
      Left = 209
      Top = 14
      OnClick = btn_SalvarClick
      ExplicitLeft = 209
      ExplicitTop = 14
    end
    inherited btn_Sair: TsBitBtn
      Left = 290
      ExplicitLeft = 290
    end
  end
  object edt_IdVeiculo: TsEdit
    Left = 8
    Top = 29
    Width = 65
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
  object edt_Antt: TsEdit
    Left = 8
    Top = 80
    Width = 213
    Height = 21
    CharCase = ecUpperCase
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4276545
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 20
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
  object edt_Uf: TsEdit
    Left = 339
    Top = 80
    Width = 34
    Height = 21
    CharCase = ecUpperCase
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4276545
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 2
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
  object edt_DataCadastro: TsDateEdit
    Left = 8
    Top = 130
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
    TabOrder = 5
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
    Left = 121
    Top = 130
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
  object edt_Placa: TsEdit
    Left = 235
    Top = 80
    Width = 90
    Height = 21
    CharCase = ecUpperCase
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4276545
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 8
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
end
