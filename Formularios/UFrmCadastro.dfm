object FrmCadastro: TFrmCadastro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro'
  ClientHeight = 392
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl5: TsLabel
    Left = 173
    Top = 35
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
  object sGroupBox1: TsGroupBox
    Left = 8
    Top = 326
    Width = 519
    Height = 58
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    object btn_Salvar: TsBitBtn
      Left = 333
      Top = 13
      Width = 75
      Height = 33
      Caption = 'Salvar'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      SkinData.SkinSection = 'BUTTON'
    end
    object btn_Sair: TsBitBtn
      Left = 429
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
end
