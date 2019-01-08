unit uFrm_cadastro_usuarios;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrm_cadastro_basico, Data.DB,
    System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Grids,
    Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, uDM,
    unt_funcoes, frxClass, frxDBSet, udm_Relatorio;

type
    Tfrm_cadastro_usuarios = class(Tfrm_cadastro_basico)
        Label1: TLabel;
        Label3: TLabel;
        Label4: TLabel;
        edt_nome: TEdit;
        edt_login: TEdit;
        edt_senha: TEdit;
        procedure act_postExecute(Sender: TObject);
        procedure act_editExecute(Sender: TObject);
        procedure btn_filtrarClick(Sender: TObject);
        procedure act_pesquisarExecute(Sender: TObject);
        procedure act_imprimirExecute(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    frm_cadastro_usuarios: Tfrm_cadastro_usuarios;

implementation

{$R *.dfm}

procedure Tfrm_cadastro_usuarios.act_editExecute(Sender: TObject);
begin
    inherited;
    edt_nome.Text := dm_1.CDS_usuarioscli_nome.AsString;
    edt_login.Text := dm_1.CDS_usuarioscli_login.AsString;
    edt_senha.Text := dm_1.CDS_usuarioscli_senha.AsString;

end;

procedure Tfrm_cadastro_usuarios.act_imprimirExecute(Sender: TObject);
begin
    dm_relatorios := Tdm_relatorios.Create(nil);
    try
    dm_relatorios.frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      'relatorios\rel_cad_usuarios.fr3');
    dm_relatorios.frxReport.ShowReport(true);
    finally
    FreeAndNil(dm_relatorios);
    end;
end;

procedure Tfrm_cadastro_usuarios.act_pesquisarExecute(Sender: TObject);
begin
    dm_1.CDS_usuarios.Close;
    dm_1.CDS_usuarios.CommandText := 'select * from usuarios';
    dm_1.CDS_usuarios.Open;
    inherited;

end;

procedure Tfrm_cadastro_usuarios.act_postExecute(Sender: TObject);
var
    i: Integer;
begin

    try
        if (dataSource_tabela.State in [dsInsert]) and
          (get_login_cadastrado(Trim(edt_login.Text))) then
        begin
            Application.MessageBox('Login j� Cadastrado!', 'Aten��o',
              MB_OK + MB_ICONWARNING);
            edt_login.Clear;
            edt_login.SetFocus;
            abort;
        end;

        if (Trim(edt_nome.Text) = '') or (Trim(edt_login.Text) = '') or
          (Trim(edt_senha.Text) = '') then
        begin
            Application.MessageBox('Existe(m) campo(s) vazio(s)! ' + #13 +
              'Por Favor Preencha.', 'Aten��o', MB_OK + MB_ICONWARNING);
            abort;
        end;

    finally

        if dataSource_tabela.State in [dsInsert] then
            dm_1.CDS_usuarioscli_id.AsInteger := get_id('cli_id', 'usuarios');
        dm_1.CDS_usuarioscli_nome.AsString := edt_nome.Text;
        dm_1.CDS_usuarioscli_login.AsString := edt_login.Text;
        dm_1.CDS_usuarioscli_senha.AsString := edt_senha.Text;
        dm_1.CDS_usuarioscli_status.AsString := 'A';
        dm_1.CDS_usuarioscli_data_cadastro.AsDateTime := now;

    end;

    inherited;
end;

procedure Tfrm_cadastro_usuarios.btn_filtrarClick(Sender: TObject);
begin
    if edt_pesquisar.Text = '' then
    begin
        Application.MessageBox('Informe um valor a ser pesquisado', 'Aten��o!',
          MB_OK + MB_ICONWARNING);
        edt_pesquisar.SetFocus;
        abort;
    end;
    inherited;
    dm_1.CDS_usuarios.Close;
    case cbx_filtros.ItemIndex of
        0:
            dm_1.CDS_usuarios.CommandText :=
              'select * from usuarios where cli_nome like ' +
              QuotedStr('%' + edt_pesquisar.Text + '%');
        1:
            dm_1.CDS_usuarios.CommandText :=
              'select * from usuarios where cli_login like ' +
              QuotedStr('%' + edt_pesquisar.Text + '%');
    end;
    dm_1.CDS_usuarios.Open;
end;

end.
