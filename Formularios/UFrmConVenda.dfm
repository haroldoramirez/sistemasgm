object FrmConVenda: TFrmConVenda
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consultar Venda'
  ClientHeight = 450
  ClientWidth = 924
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
  object gridConsulta: TDBGrid
    Left = 8
    Top = 121
    Width = 908
    Height = 259
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object sGroupBox2: TsGroupBox
    Left = 8
    Top = 386
    Width = 908
    Height = 58
    TabOrder = 1
    SkinData.SkinSection = 'GROUPBOX'
    object btn_Novo: TsBitBtn
      Left = 465
      Top = 14
      Width = 75
      Height = 33
      Caption = 'Novo'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btn_NovoClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btn_Sair: TsBitBtn
      Left = 819
      Top = 14
      Width = 75
      Height = 33
      Caption = 'Sair'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 3
      OnClick = btn_SairClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btn_Cancelar: TsBitBtn
      Left = 642
      Top = 14
      Width = 75
      Height = 33
      Caption = 'Cancelar'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = btn_CancelarClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btn_Finalizar: TsBitBtn
      Left = 554
      Top = 14
      Width = 75
      Height = 34
      Caption = 'Visualizar'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = btn_FinalizarClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btn_Relatorio: TsBitBtn
      Left = 730
      Top = 14
      Width = 75
      Height = 33
      Caption = 'Relat'#243'rio'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 4
      OnClick = btn_RelatorioClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object sGroupBox1: TsGroupBox
    Left = 8
    Top = 3
    Width = 908
    Height = 113
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    object lbl_Cliente: TsLabel
      Left = 16
      Top = 63
      Width = 33
      Height = 13
      Caption = 'Cliente'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_DataInicio: TsLabel
      Left = 370
      Top = 63
      Width = 51
      Height = 13
      Caption = 'Data Inicio'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object lbl_DataFinal: TsLabel
      Left = 482
      Top = 63
      Width = 48
      Height = 13
      Caption = 'Data Final'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object edt_Cliente: TsEdit
      Left = 16
      Top = 79
      Width = 338
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4276545
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 100
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
    object btn_Consultar: TsButton
      Left = 819
      Top = 69
      Width = 75
      Height = 33
      Caption = 'Consultar'
      TabOrder = 4
      OnClick = btn_ConsultarClick
      SkinData.SkinSection = 'BUTTON'
    end
    object edt_DataInicio: TsDateEdit
      Left = 370
      Top = 79
      Width = 100
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
    object edt_DataFinal: TsDateEdit
      Left = 482
      Top = 79
      Width = 100
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
    object rg_TipoConsulta: TsRadioGroup
      Left = 14
      Top = 13
      Width = 880
      Height = 42
      Caption = 'Tipo de Consulta'
      ParentBackground = False
      TabOrder = 1
      SkinData.SkinSection = 'GROUPBOX'
      Columns = 4
      Items.Strings = (
        'Venda Finalizada'
        'Venda Cancelada'
        'Todas as Vendas')
    end
  end
end
