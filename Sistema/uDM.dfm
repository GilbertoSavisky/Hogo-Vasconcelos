object dm_1: Tdm_1
  OldCreateOrder = False
  Height = 459
  Width = 558
  object con_conexao: TSQLConnection
    ConnectionName = 'financeiro'
    DriverName = 'MySQL'
    LoginPrompt = False
    Params.Strings = (
      'GetDriverFunc=getSQLDriverMYSQL'
      'DriverName=MySQL'
      'DriverUnit=Data.DBXMySQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver250.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMySqlMetaDataCommandFactory,DbxMySQLDr' +
        'iver250.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMySqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMySQLDriver,Version=24.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'LibraryName=dbxmys.dll'
      'LibraryNameOsx=libsqlmys.dylib'
      'VendorLib=LIBMYSQL.dll'
      'VendorLibWin64=libmysql.dll'
      'VendorLibOsx=libmysqlclient.dylib'
      'HostName=localhost'
      'Database=financeiro'
      'User_Name=root'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'Password=sa')
    Connected = True
    Left = 56
    Top = 24
  end
  object SQL_DT_SET_caixa: TSQLDataSet
    CommandText = 'select *  from `caixa`'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = con_conexao
    Left = 80
    Top = 104
  end
  object dtSetProv_caixa: TDataSetProvider
    DataSet = SQL_DT_SET_caixa
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 240
    Top = 104
  end
  object CDS_caixa: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dtSetProv_caixa'
    Left = 400
    Top = 104
    object CDS_caixacx_id: TIntegerField
      DisplayLabel = 'C'#243'd.:'
      FieldName = 'cx_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDS_caixacx_num_doc: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'num doc.'
      FieldName = 'cx_num_doc'
    end
    object CDS_caixacx_descricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'cx_descricao'
      Size = 200
    end
    object CDS_caixacx_valor: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'cx_valor'
      DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
      Precision = 20
      Size = 2
    end
    object CDS_caixacx_tipo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tipo'
      FieldName = 'cx_tipo'
      FixedChar = True
      Size = 1
    end
    object CDS_caixacx_data_cadastro: TDateField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'cx_data_cadastro'
    end
  end
  object SQL_DT_SET_contas_pagar: TSQLDataSet
    CommandText = 'select *  from contas_pagar'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = con_conexao
    Left = 80
    Top = 176
    object SQL_DT_SET_contas_pagarcntPg_id: TIntegerField
      DisplayLabel = 'Cod.:'
      FieldName = 'cntPg_id'
      Required = True
    end
    object SQL_DT_SET_contas_pagarcntPg_nun_doc: TStringField
      DisplayLabel = 'Num. Doc.'
      FieldName = 'cntPg_nun_doc'
      Required = True
      Size = 200
    end
    object SQL_DT_SET_contas_pagarcntPg_descricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'cntPg_descricao'
      Required = True
      Size = 200
    end
    object SQL_DT_SET_contas_pagarcntPg_parcela: TIntegerField
      DisplayLabel = 'Parcela'
      FieldName = 'cntPg_parcela'
      Required = True
    end
    object SQL_DT_SET_contas_pagarcntPg_vlr_parcela: TFMTBCDField
      DisplayLabel = 'Vlr. Parcela'
      FieldName = 'cntPg_vlr_parcela'
      Required = True
      Precision = 20
      Size = 2
    end
    object SQL_DT_SET_contas_pagarcntPg_vlr_compra: TFMTBCDField
      DisplayLabel = 'Vlr. Compra'
      FieldName = 'cntPg_vlr_compra'
      Required = True
      Precision = 20
      Size = 2
    end
    object SQL_DT_SET_contas_pagarcntPg_vlr_abatido: TFMTBCDField
      DisplayLabel = 'Vlr. Abatido'
      FieldName = 'cntPg_vlr_abatido'
      Required = True
      Precision = 20
      Size = 2
    end
    object SQL_DT_SET_contas_pagarcntPg_dt_compra: TDateField
      DisplayLabel = 'Data Compra'
      FieldName = 'cntPg_dt_compra'
      Required = True
    end
    object SQL_DT_SET_contas_pagarcntPg_dt_cadastro: TDateField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'cntPg_dt_cadastro'
      Required = True
    end
    object SQL_DT_SET_contas_pagarcntPg_vencimento: TDateField
      DisplayLabel = 'Vencimento'
      FieldName = 'cntPg_vencimento'
      Required = True
    end
    object SQL_DT_SET_contas_pagarcntPg_dt_pagamento: TDateField
      DisplayLabel = 'Data Pgto'
      FieldName = 'cntPg_dt_pagamento'
    end
    object SQL_DT_SET_contas_pagarcntPg_status: TStringField
      DisplayLabel = 'Status'
      FieldName = 'cntPg_status'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dtSetProv_contas_pagar: TDataSetProvider
    DataSet = SQL_DT_SET_contas_pagar
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 240
    Top = 176
  end
  object CDS_contas_pagar: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dtSetProv_contas_pagar'
    OnReconcileError = CDS_contas_pagarReconcileError
    Left = 400
    Top = 176
    object CDS_contas_pagarcntPg_id: TIntegerField
      DisplayLabel = 'C'#243'd.:'
      FieldName = 'cntPg_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDS_contas_pagarcntPg_nun_doc: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Num. Doc.'
      FieldName = 'cntPg_nun_doc'
      Required = True
      Size = 200
    end
    object CDS_contas_pagarcntPg_descricao: TStringField
      DisplayLabel = 'Descricao'
      FieldName = 'cntPg_descricao'
      Required = True
      Size = 200
    end
    object CDS_contas_pagarcntPg_parcela: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Parcela'
      FieldName = 'cntPg_parcela'
      Required = True
    end
    object CDS_contas_pagarcntPg_vlr_parcela: TFMTBCDField
      DisplayLabel = 'Vlr da Parcela'
      FieldName = 'cntPg_vlr_parcela'
      Required = True
      DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
      Precision = 20
      Size = 2
    end
    object CDS_contas_pagarcntPg_vlr_compra: TFMTBCDField
      DisplayLabel = 'Vlr da Compra'
      FieldName = 'cntPg_vlr_compra'
      Required = True
      DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
      Precision = 20
      Size = 2
    end
    object CDS_contas_pagarcntPg_vlr_abatido: TFMTBCDField
      DisplayLabel = 'Vlr Abatido'
      FieldName = 'cntPg_vlr_abatido'
      Required = True
      DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
      Precision = 20
      Size = 2
    end
    object CDS_contas_pagarcntPg_dt_compra: TDateField
      DisplayLabel = 'Data da Compra'
      FieldName = 'cntPg_dt_compra'
      Required = True
    end
    object CDS_contas_pagarcntPg_dt_cadastro: TDateField
      DisplayLabel = 'Data do Cadastro'
      FieldName = 'cntPg_dt_cadastro'
      Required = True
    end
    object CDS_contas_pagarcntPg_vencimento: TDateField
      DisplayLabel = 'Vencimento'
      FieldName = 'cntPg_vencimento'
      Required = True
    end
    object CDS_contas_pagarcntPg_dt_pagamento: TDateField
      DisplayLabel = 'Data do Pgto'
      FieldName = 'cntPg_dt_pagamento'
    end
    object CDS_contas_pagarcntPg_status: TStringField
      Alignment = taCenter
      DisplayLabel = 'Status'
      FieldName = 'cntPg_status'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object SQL_DT_SET_contas_receber: TSQLDataSet
    CommandText = 'select  * from `contas_receber`'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = con_conexao
    Left = 80
    Top = 256
  end
  object dtSetProv_contas_receber: TDataSetProvider
    DataSet = SQL_DT_SET_contas_receber
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 240
    Top = 256
  end
  object CDS_contas_receber: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dtSetProv_contas_receber'
    Left = 400
    Top = 256
    object cntRcb_id: TIntegerField
      DisplayLabel = 'C'#243'd.:'
      DisplayWidth = 6
      FieldName = 'cntRcb_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cntRcb_documento: TStringField
      DisplayLabel = 'Num. Doc.'
      DisplayWidth = 10
      FieldName = 'cntRcb_documento'
      Required = True
    end
    object cntRcb_descricao: TStringField
      DisplayLabel = 'Descricao'
      DisplayWidth = 200
      FieldName = 'cntRcb_descricao'
      Size = 200
    end
    object cntRcb_parcela: TIntegerField
      DisplayLabel = 'Parcela'
      DisplayWidth = 10
      FieldName = 'cntRcb_parcela'
      Required = True
    end
    object cntRcb_vlr_parcela: TFMTBCDField
      DisplayLabel = 'Vlr da Parcela'
      DisplayWidth = 21
      FieldName = 'cntRcb_vlr_parcela'
      Required = True
      DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
      Precision = 20
      Size = 2
    end
    object cntRcb_vlr_compra: TFMTBCDField
      DisplayLabel = 'Vlr da Compra'
      DisplayWidth = 21
      FieldName = 'cntRcb_vlr_compra'
      Required = True
      DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
      Precision = 20
      Size = 2
    end
    object cntRcb_vlr_abatido: TFMTBCDField
      DisplayLabel = 'Vlr Abatido'
      DisplayWidth = 21
      FieldName = 'cntRcb_vlr_abatido'
      Required = True
      DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
      Precision = 20
      Size = 2
    end
    object cntRcb_dt_compra: TDateField
      DisplayLabel = 'Data da Compra'
      DisplayWidth = 15
      FieldName = 'cntRcb_dt_compra'
      Required = True
    end
    object cntRcb_dt_vencimento: TDateField
      DisplayLabel = 'Data do Vencimento'
      DisplayWidth = 19
      FieldName = 'cntRcb_dt_vencimento'
      Required = True
    end
    object cntRcb_dt_cadastro: TDateField
      DisplayLabel = 'Data do Cadastro'
      DisplayWidth = 17
      FieldName = 'cntRcb_dt_cadastro'
      Required = True
    end
    object cntRcb_status: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 10
      FieldName = 'cntRcb_status'
      Required = True
      FixedChar = True
      Size = 10
    end
    object cntRcb_dt_pagamento: TDateField
      DisplayLabel = 'Data do Pgto'
      DisplayWidth = 12
      FieldName = 'cntRcb_dt_pagamento'
    end
  end
  object SQL_DT_SET_usuarios: TSQLDataSet
    CommandText = 'select *  from usuarios'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = con_conexao
    Left = 80
    Top = 336
  end
  object dtSetProv_usuarios: TDataSetProvider
    DataSet = SQL_DT_SET_usuarios
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 232
    Top = 336
  end
  object CDS_usuarios: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dtSetProv_usuarios'
    Left = 392
    Top = 336
    object CDS_usuarioscli_id: TIntegerField
      DisplayLabel = 'C'#243'd.:'
      FieldName = 'cli_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDS_usuarioscli_nome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'cli_nome'
      Size = 50
    end
    object CDS_usuarioscli_login: TStringField
      DisplayLabel = 'Login'
      FieldName = 'cli_login'
    end
    object CDS_usuarioscli_senha: TStringField
      DisplayLabel = 'Senha'
      FieldName = 'cli_senha'
      EditMask = '*******'
    end
    object CDS_usuarioscli_status: TStringField
      DisplayLabel = 'Status'
      FieldName = 'cli_status'
      FixedChar = True
      Size = 1
    end
    object CDS_usuarioscli_data_cadastro: TDateField
      DisplayLabel = 'Data de Cadastro'
      FieldName = 'cli_data_cadastro'
    end
  end
end
