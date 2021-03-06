unit uDM;

interface

uses
  System.SysUtils, System.Classes, Data.DBXMySQL, Data.FMTBcd, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, Vcl.Dialogs;

type
  Tdm_1 = class(TDataModule)
    con_conexao: TSQLConnection;
    SQL_DT_SET_caixa: TSQLDataSet;
    dtSetProv_caixa: TDataSetProvider;
    CDS_caixa: TClientDataSet;
    SQL_DT_SET_contas_pagar: TSQLDataSet;
    dtSetProv_contas_pagar: TDataSetProvider;
    CDS_contas_pagar: TClientDataSet;
    SQL_DT_SET_contas_receber: TSQLDataSet;
    dtSetProv_contas_receber: TDataSetProvider;
    CDS_contas_receber: TClientDataSet;
    SQL_DT_SET_usuarios: TSQLDataSet;
    dtSetProv_usuarios: TDataSetProvider;
    CDS_usuarios: TClientDataSet;
    CDS_caixacx_id: TIntegerField;
    CDS_caixacx_num_doc: TStringField;
    CDS_caixacx_descricao: TStringField;
    CDS_caixacx_valor: TFMTBCDField;
    CDS_caixacx_tipo: TStringField;
    CDS_caixacx_data_cadastro: TDateField;
    cntRcb_documento: TStringField;
    cntRcb_descricao: TStringField;
    cntRcb_parcela: TIntegerField;
    cntRcb_vlr_parcela: TFMTBCDField;
    cntRcb_vlr_compra: TFMTBCDField;
    cntRcb_vlr_abatido: TFMTBCDField;
    cntRcb_dt_compra: TDateField;
    cntRcb_dt_vencimento: TDateField;
    cntRcb_dt_cadastro: TDateField;
    cntRcb_status: TStringField;
    cntRcb_dt_pagamento: TDateField;
    CDS_usuarioscli_id: TIntegerField;
    CDS_usuarioscli_nome: TStringField;
    CDS_usuarioscli_login: TStringField;
    CDS_usuarioscli_senha: TStringField;
    CDS_usuarioscli_status: TStringField;
    CDS_usuarioscli_data_cadastro: TDateField;
    SQL_DT_SET_contas_pagarcntPg_id: TIntegerField;
    SQL_DT_SET_contas_pagarcntPg_nun_doc: TStringField;
    SQL_DT_SET_contas_pagarcntPg_descricao: TStringField;
    SQL_DT_SET_contas_pagarcntPg_parcela: TIntegerField;
    SQL_DT_SET_contas_pagarcntPg_vlr_parcela: TFMTBCDField;
    SQL_DT_SET_contas_pagarcntPg_vlr_compra: TFMTBCDField;
    SQL_DT_SET_contas_pagarcntPg_vlr_abatido: TFMTBCDField;
    SQL_DT_SET_contas_pagarcntPg_dt_compra: TDateField;
    SQL_DT_SET_contas_pagarcntPg_dt_cadastro: TDateField;
    SQL_DT_SET_contas_pagarcntPg_vencimento: TDateField;
    SQL_DT_SET_contas_pagarcntPg_dt_pagamento: TDateField;
    SQL_DT_SET_contas_pagarcntPg_status: TStringField;
    CDS_contas_pagarcntPg_id: TIntegerField;
    CDS_contas_pagarcntPg_nun_doc: TStringField;
    CDS_contas_pagarcntPg_descricao: TStringField;
    CDS_contas_pagarcntPg_parcela: TIntegerField;
    CDS_contas_pagarcntPg_vlr_parcela: TFMTBCDField;
    CDS_contas_pagarcntPg_vlr_compra: TFMTBCDField;
    CDS_contas_pagarcntPg_vlr_abatido: TFMTBCDField;
    CDS_contas_pagarcntPg_dt_compra: TDateField;
    CDS_contas_pagarcntPg_dt_cadastro: TDateField;
    CDS_contas_pagarcntPg_vencimento: TDateField;
    CDS_contas_pagarcntPg_dt_pagamento: TDateField;
    CDS_contas_pagarcntPg_status: TStringField;
    cntRcb_id: TIntegerField;
    procedure CDS_contas_pagarReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm_1: Tdm_1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Tdm_1.CDS_contas_pagarReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
    ShowMessage(E.Message);
end;

end.
