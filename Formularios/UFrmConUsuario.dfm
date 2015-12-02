inherited FrmConUsuario: TFrmConUsuario
  Caption = 'Consulta Usu'#225'rio'
  ExplicitWidth = 660
  ExplicitHeight = 471
  PixelsPerInch = 96
  TextHeight = 13
  inherited sGroupBox1: TsGroupBox
    inherited lbl_Descricao: TsLabel
      Width = 27
      Caption = 'Nome'
      ExplicitWidth = 27
    end
    inherited edt_Id: TsEdit
      OnKeyPress = edt_IdKeyPress
    end
    inherited btn_Consultar: TsButton
      OnClick = btn_ConsultarClick
    end
  end
  inherited sGroupBox2: TsGroupBox
    Top = 376
    ExplicitTop = 376
    inherited btn_Novo: TsBitBtn
      OnClick = btn_NovoClick
    end
    inherited btn_Editar: TsBitBtn
      OnClick = btn_EditarClick
    end
    inherited btn_Excluir: TsBitBtn
      Caption = 'Bloquear'
      OnClick = btn_ExcluirClick
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
