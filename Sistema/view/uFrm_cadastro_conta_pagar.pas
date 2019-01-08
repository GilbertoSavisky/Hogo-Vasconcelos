unit uFrm_cadastro_conta_pagar;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrm_cadastro_basico, Data.DB,
    System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.ComCtrls,
    Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, uDM,
    Datasnap.DBClient, unt_funcoes;

type
    Tfrm_cadastro_contas_pagar = class(Tfrm_cadastro_basico)
        Label1: TLabel;
        Label2: TLabel;
        Label3: TLabel;
        Label4: TLabel;
        Label5: TLabel;
        Label6: TLabel;
        CDS_parcelas: TClientDataSet;
        DBGrid1: TDBGrid;
        DS_parcelas: TDataSource;
        bt_: TBitBtn;
        CDS_parcelasParcela: TIntegerField;
        CDS_parcelasValor: TCurrencyField;
        CDS_parcelasVencimento: TDateField;
        btn_limpar_parcelas: TBitBtn;
        edt_dt_compra: TEdit;
        edt_vl_compra: TEdit;
        edt_qt_parcelas: TEdit;
        edt_varia��o: TEdit;
        edt_descricao: TEdit;
        edt_num_doc: TEdit;
        ComboBoxEx1: TComboBoxEx;
    Label7: TLabel;
        procedure btn_limpar_parcelasClick(Sender: TObject);
        procedure bt_Click(Sender: TObject);
        procedure act_inserirExecute(Sender: TObject);
        procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
          DataCol: Integer; Column: TColumn; State: TGridDrawState);
        procedure act_postExecute(Sender: TObject);
        procedure act_pesquisarExecute(Sender: TObject);
        procedure act_editExecute(Sender: TObject);
        procedure btn_filtrarClick(Sender: TObject);
        procedure act_deleteExecute(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    frm_cadastro_contas_pagar: Tfrm_cadastro_contas_pagar;

implementation

{$R *.dfm}

procedure Tfrm_cadastro_contas_pagar.act_deleteExecute(Sender: TObject);
begin
    if Application.MessageBox('Deseja realmente Cancelar o Documento?', 'Pergunta',
      MB_YESNO) = mrYes then
    begin
        try
            dm_1.CDS_contas_pagar.Edit;
            dm_1.CDS_contas_pagarcntPg_status.AsString := 'C';
            dm_1.CDS_contas_pagar.ApplyUpdates(0);

            Application.MessageBox('Documento Cancelado com Sucesso!', 'Informa��o', 0 + 64);
            dm_1.CDS_contas_pagar.Open;

        Except
            on E: Exception do
                raise Exception.Create('Erro ao Excluir Registro :' + #13 +
                  E.Message);

        end;
    end;
end;

procedure Tfrm_cadastro_contas_pagar.act_editExecute(Sender: TObject);
begin
    Application.MessageBox('N�o � Poss�vel Editar os Campos!', 'Informa��o',
      MB_OK + MB_ICONWARNING);
end;

procedure Tfrm_cadastro_contas_pagar.act_inserirExecute(Sender: TObject);
begin
    inherited;
    edt_num_doc.SetFocus;
    edt_dt_compra.Text := DateToStr(Now);
end;

procedure Tfrm_cadastro_contas_pagar.act_pesquisarExecute(Sender: TObject);
begin
    inherited;
    dm_1.CDS_contas_pagar.Close;
    dm_1.CDS_contas_pagar.CommandText := 'SELECT * FROM CONTAS_PAGAR';
    dm_1.CDS_contas_pagar.Open;
end;

procedure Tfrm_cadastro_contas_pagar.act_postExecute(Sender: TObject);
var
    i, prox: Integer;
begin
    for i := ComponentCount - 1 downto 0 do
    begin
        if (Components[i] is TEdit) then
        begin
            if (((Components[i] as TEdit).Text = '') and
              not((Components[i] as TEdit).Name = 'edt_pesquisar')) then
            begin
                Application.MessageBox('Existe(m) campo(s) vazio(s), ' + #13 +
                  'Favor preencher!', 'Aten��o', MB_OK + MB_ICONWARNING);
                (Components[i] as TEdit).SetFocus;
                Abort;
            end;

        end;

    end;

    try
        CDS_parcelas.First;

        while not CDS_parcelas.Eof do
            if DS_parcelas.State in [dsBrowse, dsInsert] then
            begin
                dm_1.CDS_contas_pagar.First;
                prox := dm_1.CDS_contas_pagar.Fields[0].AsInteger + 1;

                if not dm_1.CDS_contas_pagar.Active then
                    dm_1.CDS_contas_pagar.Open;
                dm_1.CDS_contas_pagar.Append;
                dm_1.CDS_contas_pagarcntPg_id.AsInteger := prox;

                dm_1.CDS_contas_pagarcntPg_nun_doc.AsString :=
                  Trim(edt_num_doc.Text);
                dm_1.CDS_contas_pagarcntPg_descricao.AsString :=
                  Trim(edt_descricao.Text);
                dm_1.CDS_contas_pagarcntPg_parcela.AsInteger :=
                  CDS_parcelasParcela.AsInteger;
                dm_1.CDS_contas_pagarcntPg_vlr_parcela.AsCurrency :=
                  CDS_parcelasValor.AsFloat;
                dm_1.CDS_contas_pagarcntPg_vlr_compra.AsCurrency :=
                  StrToFloat(edt_vl_compra.Text);
                dm_1.CDS_contas_pagarcntPg_dt_compra.AsDateTime :=
                  StrToDate(edt_dt_compra.Text);
                dm_1.CDS_contas_pagarcntPg_vencimento.AsDateTime :=
                  CDS_parcelasVencimento.AsDateTime;
                dm_1.CDS_contas_pagarcntPg_status.AsString := 'A';
                dm_1.CDS_contas_pagarcntPg_dt_cadastro.AsDateTime :=
                  StrToDate(edt_dt_compra.Text);
                dm_1.CDS_contas_pagarcntPg_vlr_abatido.AsCurrency := 0;
                dm_1.CDS_contas_pagarcntPg_dt_pagamento.AsDateTime := Now;

                dm_1.CDS_contas_pagar.Post;
                dm_1.CDS_contas_pagar.ApplyUpdates(0);

                CDS_parcelas.Next;
            end;
        if dm_1.CDS_contas_pagar.ApplyUpdates(0) = 0 then
            Application.MessageBox('Registro Inserido com Sucesso!',
              'Informa��o', MB_OK + MB_ICONINFORMATION);

        dm_1.CDS_contas_pagar.Open;

        for i := 0 to ComponentCount - 1 do
        begin
            if Components[i] is TCustomEdit then
                TCustomEdit(Components[i]).Clear;
        end;
        if pageControl_1.ActivePage = tbs_cadastro then
        begin
            tbs_cadastro.TabVisible := false;
            pageControl_1.ActivePage := tbs_pesquisa;
        end;
        edt_pesquisar.SetFocus;

        CDS_parcelas.EmptyDataSet;

    except
        on E: Exception do
            raise Exception.Create('Erro ao Salvar Registro: ' + E.Message);

    end;

end;

procedure Tfrm_cadastro_contas_pagar.btn_filtrarClick(Sender: TObject);
begin
    if edt_pesquisar.Text = '' then
    begin
        Application.MessageBox('Informe um Valor a ser Pesquisado!', 'Aten��o!',
          MB_OK + MB_ICONWARNING);
        edt_pesquisar.SetFocus;
        Abort;
    end;
    inherited;
    dm_1.CDS_contas_pagar.Close;
    case cbx_filtros.ItemIndex of
        0:
            dm_1.CDS_contas_pagar.CommandText :=
              'select * from contas_pagar where cntPg_nun_doc like ' +
              QuotedStr('%' + edt_pesquisar.Text + '%');
        1:
            dm_1.CDS_contas_pagar.CommandText :=
              'select * from contas_pagar where cntPg_descricao like ' +
              QuotedStr('%' + edt_pesquisar.Text + '%');
    end;
    dm_1.CDS_contas_pagar.Open;

end;

procedure Tfrm_cadastro_contas_pagar.btn_limpar_parcelasClick(Sender: TObject);
begin
    CDS_parcelas.EmptyDataSet;
end;

procedure Tfrm_cadastro_contas_pagar.bt_Click(Sender: TObject);
var
    i: Integer;
begin

    for i := ComponentCount - 1 downto 0 do
    begin
        if (Components[i] is TEdit) then
        begin
            if (((Components[i] as TEdit).Text = '') and
              not((Components[i] as TEdit).Name = 'edt_pesquisar')) then
            begin
                Application.MessageBox('Existe(m) campo(s) vazio(s), ' + #13 +
                  'Favor preencher!', 'Aten��o', MB_OK + MB_ICONWARNING);
                (Components[i] as TEdit).SetFocus;
                Abort;
            end;

        end;

    end;

    CDS_parcelas.EmptyDataSet;
    for i := 1 to Strtoint(edt_qt_parcelas.Text) do
    begin
        CDS_parcelas.Insert;
        CDS_parcelasParcela.AsInteger := i;
        CDS_parcelasValor.AsCurrency := StrToFloat(edt_vl_compra.Text) /
          Strtoint(edt_qt_parcelas.Text);
        CDS_parcelasVencimento.AsDateTime := StrToDate(edt_dt_compra.Text) +
          (Strtoint(edt_varia��o.Text) * i);
        CDS_parcelas.Post;
    end;

end;

procedure Tfrm_cadastro_contas_pagar.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    editar_dbgrid(DS_parcelas, DBGrid1, State, Rect, Column);
end;

end.
