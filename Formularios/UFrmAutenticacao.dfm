object FrmAutenticacao: TFrmAutenticacao
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Sistema SGM'
  ClientHeight = 157
  ClientWidth = 337
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
  object btn_Entrar: TsButton
    Left = 173
    Top = 119
    Width = 75
    Height = 33
    Caption = 'Entrar'
    TabOrder = 0
    OnClick = btn_EntrarClick
    SkinData.SkinSection = 'BUTTON'
  end
  object btn_Cancelar: TsButton
    Left = 254
    Top = 119
    Width = 75
    Height = 33
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = btn_CancelarClick
    SkinData.SkinSection = 'BUTTON'
  end
  object Panel1: TsPanel
    Left = 8
    Top = 8
    Width = 321
    Height = 105
    TabOrder = 2
    SkinData.SkinSection = 'PANEL'
    object lbl_Login: TsLabel
      Left = 41
      Top = 36
      Width = 30
      Height = 13
      Caption = 'Login'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object lbl_Senha: TsLabel
      Left = 36
      Top = 63
      Width = 35
      Height = 13
      Caption = 'Senha'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object sLabel3: TsLabel
      Left = 119
      Top = 8
      Width = 75
      Height = 13
      Caption = 'Autentica'#231#227'o'
      Color = clBackground
      ParentColor = False
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsUnderline]
    end
    object edt_Login: TsEdit
      Left = 91
      Top = 33
      Width = 140
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = edt_LoginKeyPress
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
    object edt_Senha: TsEdit
      Left = 91
      Top = 60
      Width = 140
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 1
      OnKeyPress = edt_SenhaKeyPress
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
end
