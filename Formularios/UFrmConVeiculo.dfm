inherited FrmConVeiculo: TFrmConVeiculo
  Caption = 'Consulta Ve'#237'culo'
  ExplicitWidth = 660
  ExplicitHeight = 471
  PixelsPerInch = 96
  TextHeight = 13
  inherited sGroupBox1: TsGroupBox
    inherited lbl_Descricao: TsLabel
      Width = 21
      Caption = 'Antt'
      ExplicitWidth = 21
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
      OnClick = btn_ExcluirClick
    end
  end
  object gridConsulta: TDBGrid [2]
    Left = 8
    Top = 127
    Width = 638
    Height = 243
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
