inherited FrmConProduto: TFrmConProduto
  Caption = 'Consulta Produto'
  ClientHeight = 439
  ClientWidth = 651
  ExplicitTop = -21
  ExplicitWidth = 657
  ExplicitHeight = 468
  PixelsPerInch = 96
  TextHeight = 13
  inherited sGroupBox1: TsGroupBox
    inherited lbl_Id: TsLabel
      Top = 19
      ExplicitTop = 19
    end
    inherited lbl_Descricao: TsLabel
      Top = 65
      ExplicitTop = 65
    end
    inherited edt_Id: TsEdit
      Top = 36
      MaxLength = 5
      OnKeyPress = edt_IdKeyPress
      ExplicitTop = 36
    end
    inherited edt_Descricao: TsEdit
      Top = 82
      ExplicitTop = 82
    end
    inherited btn_Consultar: TsButton
      OnClick = btn_ConsultarClick
    end
  end
  inherited sGroupBox2: TsGroupBox
    Top = 376
    ExplicitTop = 376
    inherited btn_Novo: TsBitBtn
      Left = 209
      OnClick = btn_NovoClick
      ExplicitLeft = 209
    end
    inherited btn_Editar: TsBitBtn
      Left = 294
      OnClick = btn_EditarClick
      ExplicitLeft = 294
    end
    inherited btn_Excluir: TsBitBtn
      Left = 379
      OnClick = btn_ExcluirClick
      ExplicitLeft = 379
    end
    object btn_Relatorio: TsBitBtn
      Left = 464
      Top = 15
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
  object gridConsulta: TDBGrid [2]
    Left = 8
    Top = 127
    Width = 638
    Height = 243
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
