unit uFrm_cadastro_basico;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
    Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ExtCtrls,
    Vcl.DBActns, System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList,
    Vcl.PlatformDefaultStyleActnCtrls, Datasnap.DBClient, Vcl.StdCtrls,
    Vcl.Buttons, Vcl.Imaging.pngimage, uDM;

type
    Tfrm_cadastro_basico = class(TForm)
        dataSource_tabela: TDataSource;
        pnl_1: TPanel;
        pageControl_1: TPageControl;
        tbs_cadastro: TTabSheet;
        imgList_cadastro: TImageList;
        actList_acoes: TActionList;
        act_inserir: TAction;
        act_edit: TAction;
        act_delete: TAction;
        act_post: TAction;
        act_cancel: TAction;
        act_pesquisar: TAction;
        act_imprimir: TAction;
        act_fechar: TAction;
        SpeedButton3: TSpeedButton;
        SpeedButton4: TSpeedButton;
        SpeedButton5: TSpeedButton;
        SpeedButton6: TSpeedButton;
        SpeedButton7: TSpeedButton;
        SpeedButton8: TSpeedButton;
        SpeedButton2: TSpeedButton;
        SpeedButton1: TSpeedButton;
        tbs_pesquisa: TTabSheet;
        btn_filtrar: TButton;
        edt_pesquisar: TEdit;
        dbg_dados: TDBGrid;
    cbx_filtros: TComboBoxEx;
    lbl_sel_cad_basico: TLabel;
    lbl_pesq_cad_basico: TLabel;
    StatusBar1: TStatusBar;
        procedure FormKeyPress(Sender: TObject; var Key: Char);

        procedure act_fecharExecute(Sender: TObject);

        procedure act_pesquisarExecute(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure tbs_cadastroShow(Sender: TObject);

        procedure act_imprimirUpdate(Sender: TObject);
        procedure act_inserirExecute(Sender: TObject);
        procedure act_editExecute(Sender: TObject);
        procedure act_deleteExecute(Sender: TObject);
        procedure act_postExecute(Sender: TObject);
        procedure act_cancelExecute(Sender: TObject);
        procedure act_imprimirExecute(Sender: TObject);
        procedure act_inserirUpdate(Sender: TObject);
        procedure act_editUpdate(Sender: TObject);
        procedure act_deleteUpdate(Sender: TObject);
        procedure act_postUpdate(Sender: TObject);
        procedure act_cancelUpdate(Sender: TObject);
    procedure dbg_dadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edt_pesquisarKeyPress(Sender: TObject; var Key: Char);


    private
        { Private declarations }
        i_modo: integer;
        procedure limpar_tudo;

    public
        { Public declarations }
    end;

var
    frm_cadastro_basico: Tfrm_cadastro_basico;

implementation

{$R *.dfm}

uses unt_funcoes;

procedure Tfrm_cadastro_basico.act_cancelExecute(Sender: TObject);
begin
    limpar_tudo;
    TClientDataSet(dataSource_tabela.DataSet).Cancel;

end;

procedure Tfrm_cadastro_basico.act_cancelUpdate(Sender: TObject);
begin
    act_cancel.Enabled := act_post.Enabled = True;
end;

procedure Tfrm_cadastro_basico.act_deleteExecute(Sender: TObject);
begin
    if Application.MessageBox('Deseja realmente Excluir o Registr?', 'Pergunta',
      MB_YESNO) = mrYes then
    begin
        try
            TClientDataSet(dataSource_tabela.DataSet).Delete;
            TClientDataSet(dataSource_tabela.DataSet).ApplyUpdates(0);

            Application.MessageBox('Registro Excluído!', 'Informação', 0 + 64);
            TClientDataSet(dataSource_tabela.DataSet).Open;

        Except
            on E: Exception do
                raise Exception.Create('Erro ao Excluir Registro :' + #13 +
                  E.Message);

        end;
    end;
end;

procedure Tfrm_cadastro_basico.act_deleteUpdate(Sender: TObject);
begin
    if (dataSource_tabela.State in [dsBrowse]) and
      (not TClientDataSet(dataSource_tabela.DataSet).IsEmpty) then
        act_delete.Enabled := dataSource_tabela.State in [dsBrowse];
end;

procedure Tfrm_cadastro_basico.act_editExecute(Sender: TObject);
begin
    i_modo := 1;

    if pageControl_1.ActivePage = tbs_pesquisa then
        tbs_cadastro.TabVisible := True;
    tbs_pesquisa.TabVisible := false;
    pageControl_1.ActivePage := tbs_cadastro;
    TClientDataSet(dataSource_tabela.DataSet).Edit;
end;

procedure Tfrm_cadastro_basico.act_editUpdate(Sender: TObject);
begin
    if not TClientDataSet(dataSource_tabela.DataSet).IsEmpty then

        act_edit.Enabled := true;
end;

procedure Tfrm_cadastro_basico.act_fecharExecute(Sender: TObject);
begin
    Close;
end;

procedure Tfrm_cadastro_basico.act_imprimirExecute(Sender: TObject);
begin
    ShowMessage('Em Desenvolvimento');
end;

procedure Tfrm_cadastro_basico.act_imprimirUpdate(Sender: TObject);
begin
    if (dataSource_tabela.State in [dsBrowse]) and
      (not TClientDataSet(dataSource_tabela.DataSet).IsEmpty) then

        act_imprimir.Enabled := dataSource_tabela.State in [dsBrowse];

end;

procedure Tfrm_cadastro_basico.act_inserirExecute(Sender: TObject);
begin
    i_modo := 0;

    if pageControl_1.ActivePage = tbs_pesquisa then
        tbs_cadastro.TabVisible := True;
    tbs_pesquisa.TabVisible := false;
    pageControl_1.ActivePage := tbs_cadastro;

    if not TClientDataSet(dataSource_tabela.DataSet).Active then
        TClientDataSet(dataSource_tabela.DataSet).Open;
    TClientDataSet(dataSource_tabela.DataSet).Insert;
end;

procedure Tfrm_cadastro_basico.act_inserirUpdate(Sender: TObject);
begin
    act_inserir.Enabled := dataSource_tabela.State in [dsBrowse, dsInactive];
end;

procedure Tfrm_cadastro_basico.act_pesquisarExecute(Sender: TObject);
begin
    pageControl_1.ActivePage := tbs_pesquisa;
    edt_pesquisar.Clear;
    edt_pesquisar.SetFocus;
    cbx_filtros.ItemIndex := 0;
end;

procedure Tfrm_cadastro_basico.act_postExecute(Sender: TObject);
begin
    try

        TClientDataSet(dataSource_tabela.DataSet).Post;
        TClientDataSet(dataSource_tabela.DataSet).ApplyUpdates(0);
        case i_modo of
            0:
                Application.MessageBox('Registro Inserido com Sucesso!',
                  'Informação', MB_OK + MB_ICONINFORMATION);
            1:
                Application.MessageBox('Registro Atualizado com Sucesso!',
                  'Informação', MB_OK + MB_ICONINFORMATION);
        end;

        // limpar campos para novos registros
        limpar_tudo;
        TClientDataSet(dataSource_tabela.DataSet).Open;

    except
        on E: Exception do
            raise Exception.Create('Erro as Salvar Registro : ' + #13 +
              E.Message);

    end;
end;

procedure Tfrm_cadastro_basico.act_postUpdate(Sender: TObject);
begin
    act_post.Enabled := dataSource_tabela.State in [dsInsert, dsEdit];
end;



procedure Tfrm_cadastro_basico.dbg_dadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    editar_dbgrid(dataSource_tabela, dbg_dados, State, Rect, Column);
end;

procedure Tfrm_cadastro_basico.edt_pesquisarKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = #13 then
    begin
        btn_filtrar.Click;
    end;
end;

procedure Tfrm_cadastro_basico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    TClientDataSet(dataSource_tabela.DataSet).Cancel;
    TClientDataSet(dataSource_tabela.DataSet).Close;
end;

procedure Tfrm_cadastro_basico.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #27 then
    begin
        Close;
    end;

end;

procedure Tfrm_cadastro_basico.limpar_tudo;
var
    i: integer;
begin
    for i := 0 to ComponentCount - 1 do
    begin
        if Components[i] is TCustomEdit then
            TCustomEdit(Components[i]).Clear;

    end;
    if pageControl_1.ActivePage = tbs_cadastro then
    begin
        tbs_cadastro.TabVisible := False;
        pageControl_1.ActivePage := tbs_pesquisa;
    end;
    edt_pesquisar.SetFocus;
end;

procedure Tfrm_cadastro_basico.tbs_cadastroShow(Sender: TObject);
begin
    pageControl_1.ActivePage := tbs_pesquisa;
end;

end.
