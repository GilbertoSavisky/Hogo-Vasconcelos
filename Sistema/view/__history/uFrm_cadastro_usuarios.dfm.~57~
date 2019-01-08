inherited frm_cadastro_usuarios: Tfrm_cadastro_usuarios
  Caption = 'Cadastro de Usuarios'
  PixelsPerInch = 96
  TextHeight = 26
  inherited pageControl_1: TPageControl
    inherited tbs_cadastro: TTabSheet
      ParentFont = False
      ExplicitLeft = 4
      ExplicitTop = 37
      ExplicitWidth = 1106
      ExplicitHeight = 472
      object Label1: TLabel
        Left = 112
        Top = 112
        Width = 56
        Height = 26
        Caption = 'Nome:'
      end
      object Label3: TLabel
        Left = 112
        Top = 197
        Width = 50
        Height = 26
        Caption = 'Login:'
      end
      object Label4: TLabel
        Left = 107
        Top = 264
        Width = 59
        Height = 26
        Caption = 'Senha:'
      end
      object edt_nome: TEdit
        Left = 174
        Top = 109
        Width = 796
        Height = 34
        TabOrder = 0
      end
      object edt_login: TEdit
        Left = 174
        Top = 194
        Width = 796
        Height = 34
        TabOrder = 1
      end
      object edt_senha: TEdit
        Left = 174
        Top = 261
        Width = 796
        Height = 34
        PasswordChar = '*'
        TabOrder = 2
      end
    end
    inherited tbs_pesquisa: TTabSheet
      ExplicitLeft = -3
      ExplicitTop = 47
      ExplicitWidth = 1106
      ExplicitHeight = 472
      inherited btn_filtrar: TButton
        OnClick = btn_filtrarClick
      end
      inherited dbg_dados: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'cli_id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cli_nome'
            Width = 514
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cli_login'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cli_senha'
            Width = 178
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cli_status'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'cli_data_cadastro'
            Visible = False
          end>
      end
      inherited cbx_filtros: TComboBoxEx
        HelpType = htKeyword
        HelpKeyword = '0'
        ItemsEx = <
          item
            Caption = 'Nome'
          end
          item
            Caption = 'Login'
          end>
        ParentDoubleBuffered = False
      end
    end
  end
  inherited dataSource_tabela: TDataSource
    DataSet = dm_1.CDS_usuarios
    Left = 808
  end
  inherited imgList_cadastro: TImageList
    Left = 712
    Top = 56
  end
  inherited actList_acoes: TActionList
    Left = 632
    Top = 56
  end
end
