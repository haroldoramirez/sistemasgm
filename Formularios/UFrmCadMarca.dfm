inherited FrmCadMarca: TFrmCadMarca
  Caption = 'Cadastro Marca'
  ClientHeight = 215
  ClientWidth = 377
  ExplicitWidth = 383
  ExplicitHeight = 244
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_Codigo: TsLabel [0]
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
  object lbl_Marca: TsLabel [1]
    Left = 8
    Top = 61
    Width = 38
    Height = 13
    Caption = 'Marca *'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4276545
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object lbl_DataCadastro: TsLabel [2]
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
  object lbl_DataUltAlteracao: TsLabel [3]
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
  inherited lbl5: TsLabel
    Left = 259
    Top = 10
    ExplicitLeft = 259
    ExplicitTop = 10
  end
  inherited sGroupBox1: TsGroupBox
    Top = 157
    Width = 365
    ExplicitTop = 157
    ExplicitWidth = 365
    inherited btn_Salvar: TsBitBtn
      Left = 193
      OnClick = btn_SalvarClick
      ExplicitLeft = 193
    end
    inherited btn_Sair: TsBitBtn
      Left = 279
      ExplicitLeft = 279
    end
  end
  object edt_IdMarca: TsEdit
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
    MaxLength = 5
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
  object edt_Marca: TsEdit
    Left = 8
    Top = 80
    Width = 365
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
    TabOrder = 3
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
    TabOrder = 4
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
