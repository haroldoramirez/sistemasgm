inherited FrmConFormaPagamento: TFrmConFormaPagamento
  Caption = 'Consulta Forma de Pagamento'
  OnActivate = FormActivate
  ExplicitWidth = 660
  ExplicitHeight = 471
  PixelsPerInch = 96
  TextHeight = 13
  inherited sGroupBox1: TsGroupBox
    inherited edt_Id: TsEdit
      MaxLength = 5
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
      Top = 16
      OnClick = btn_NovoClick
      ExplicitTop = 16
    end
    inherited btn_Editar: TsBitBtn
      Top = 16
      OnClick = btn_EditarClick
      ExplicitTop = 16
    end
    inherited btn_Excluir: TsBitBtn
      Top = 16
      OnClick = btn_ExcluirClick
      ExplicitTop = 16
    end
    inherited btn_Sair: TsBitBtn
      Top = 16
      ExplicitTop = 16
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
