inherited FrmConEstado: TFrmConEstado
  Caption = 'Consulta Estado'
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited sGroupBox1: TsGroupBox
    inherited lbl_Descricao: TsLabel
      Width = 33
      Caption = 'Estado'
      ExplicitWidth = 33
    end
    inherited edt_Id: TsEdit
      MaxLength = 5
      OnKeyPress = edt_IdKeyPress
    end
    inherited edt_Descricao: TsEdit
      MaxLength = 100
    end
    inherited btn_Consultar: TsButton
      OnClick = btn_ConsultarClick
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
