unit unt_funcoes;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrm_cadastro_basico, Data.DB,
    System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.StdCtrls,
    Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, uDM,
    Vcl.Mask, Vcl.DBCtrls, Data.DBXMySQL,
    Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr;

function get_id(campo, tabela: string): integer;
function get_login_cadastrado(login: string): boolean;
procedure editar_dbgrid(DataSource: TDataSource; Sender: TDBGrid;
  State: TGridDrawState; Rect: TRect; Column: TColumn);
function StringToFloat(s: string): Extended;

implementation

function get_id(campo, tabela: string): integer;
begin
    with TSQLQuery.Create(nil) do
        try
            SQLConnection := dm_1.con_conexao;
            SQL.Add('Select ' + campo + ' from ' + tabela + ' order by ' + campo
              + ' desc limit 1');
            Open;
            Result := Fields[0].AsInteger + 1;
        finally
            Close;
            Free;
        end;
end;

function get_login_cadastrado(login: string): boolean;
begin
    Result := False;
    with TSQLQuery.Create(nil) do
    begin
        try
            SQLConnection := dm_1.con_conexao;
            SQL.Add('Select cli_ID from usuarios where cli_login = :login');
            Params[0].AsString := login;
            Open;
            if not IsEmpty then
                Result := True;

        finally
            Close;
            Free;
        end;

    end;
end;

procedure editar_dbgrid(DataSource: TDataSource; Sender: TDBGrid;
  State: TGridDrawState; Rect: TRect; Column: TColumn);
begin
    if not odd(DataSource.DataSet.RecNo) then
    begin
        if not(gdSelected in State) then
        begin
            Sender.Canvas.Brush.Color := $00FFFFDF;
            Sender.Canvas.FillRect(Rect);
            Sender.DefaultDrawDataCell(Rect, Column.Field, State);
        end;

    end;

end;

function StringToFloat(s: string): Extended;
{ Filtra uma string qualquer, convertendo as suas partes
  numéricas para sua representação decimal, por exemplo:
  'R$ 1.200,00' para 1200,00 '1AB34TZ' para 134 }
var
    i: integer;
    t: string;
    SeenDecimal, SeenSgn: boolean;
begin
    t := '';
    SeenDecimal := False;
    SeenSgn := False;
    { Percorre os caracteres da string: }
    for i := Length(s) downto 0 do
        { Filtra a string, aceitando somente números e separador decimal: }

        if (s[i] in ['0' .. '9', '-', '+', ',']) then
        begin
            if (s[i] = ',') and (not SeenDecimal) then
            begin
                t := s[i] + t;
                SeenDecimal := True;
            end
            else if (s[i] in ['+', '-']) and (not SeenSgn) and (i = 1) then
            begin
                t := s[i] + t;
                SeenSgn := True;
            end
            else if s[i] in ['0' .. '9'] then
            begin
                t := s[i] + t;
            end;
        end;
    Result := StrToFloat(t);
end;

end.
