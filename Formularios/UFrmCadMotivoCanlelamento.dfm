object Form3: TForm3
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Motivo Cancelamento'
  ClientHeight = 210
  ClientWidth = 409
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_Observacao: TsLabel
    Left = 8
    Top = 8
    Width = 49
    Height = 13
    Caption = 'Descri'#231#227'o '
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4276545
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object edt_Observacao: TsMemo
    Left = 8
    Top = 27
    Width = 393
    Height = 121
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4276545
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
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
  object sGroupBox11: TsGroupBox
    Left = 8
    Top = 154
    Width = 393
    Height = 52
    TabOrder = 1
    SkinData.SkinSection = 'GROUPBOX'
    object btn_Salvar: TsBitBtn
      Left = 224
      Top = 10
      Width = 75
      Height = 33
      Caption = 'Salvar'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      SkinData.SkinSection = 'BUTTON'
    end
    object btn_Sair: TsBitBtn
      Left = 306
      Top = 10
      Width = 75
      Height = 33
      Caption = 'Sair'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      SkinData.SkinSection = 'BUTTON'
    end
  end
end
