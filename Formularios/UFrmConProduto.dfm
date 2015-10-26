inherited FrmConProduto: TFrmConProduto
  Caption = 'Consulta Produto'
  ExplicitWidth = 660
  ExplicitHeight = 471
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
      NumbersOnly = True
      OnKeyPress = edt_IdKeyPress
      ExplicitTop = 36
    end
    inherited edt_Descricao: TsEdit
      Top = 82
      ExplicitTop = 82
    end
    inherited btn_Consultar: TsButton
      TabOrder = 3
      OnClick = btn_ConsultarClick
    end
    object btn_Relatorio: TsButton
      Left = 465
      Top = 70
      Width = 75
      Height = 33
      Caption = 'Relat'#243'rio'
      TabOrder = 2
      OnClick = btn_RelatorioClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  inherited sGroupBox2: TsGroupBox
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
    Top = 191
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
