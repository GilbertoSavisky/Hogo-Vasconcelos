unit uFrm_Prinipal;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
    Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, System.Actions, Vcl.ActnList,
    Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Data.DB,
    uFrm_cadastro_usuarios, Vcl.Imaging.jpeg, Vcl.Mask,
  uFrm_cadastro_conta_pagar, uFrm_cadastro_conta_receber,
  uFrm_cadastro_conta_receber2;

type
    Tfrm_Principal = class(TForm)
        lbl_1: TLabel;
        img_usuarios: TImage;
        lbl_11: TLabel;
    img_caixa: TImage;
        lbl_12: TLabel;
        img_pagar: TImage;
    img_receber: TImage;
        img_cons_receber: TImage;
        img_cons_pagar: TImage;
        img_rel_pagamentos: TImage;
        img_11: TImage;
        img_12: TImage;
        img_rel_receber: TImage;
        img_rel_caixa: TImage;
        blnHt_1: TBalloonHint;
        stat_1: TStatusBar;
        tmr_1: TTimer;
    Image1: TImage;
    Image2: TImage;
        procedure tmr_1Timer(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure img_usuariosClick(Sender: TObject);
    procedure img_caixaClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure img_pagarClick(Sender: TObject);
    procedure img_receberClick(Sender: TObject);
    procedure img_rel_pagamentosClick(Sender: TObject);

    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    frm_Principal: Tfrm_Principal;

implementation

uses
    uFrm_cadastro_basico, Datasnap.DBClient, uFrm_cadastro_caixa;

{$R *.dfm}

procedure Tfrm_Principal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if Application.MessageBox('Deseja Realmente Sair?', 'Informação',
      MB_YESNO + MB_ICONQUESTION) = mrYes then
    begin
        Application.Terminate;
    end;
    Abort;

end;

procedure Tfrm_Principal.Image2Click(Sender: TObject);
begin
    Close;
end;

procedure Tfrm_Principal.img_receberClick(Sender: TObject);
begin
    frm_cadastro_contas_receber2 := Tfrm_cadastro_contas_receber2.Create(nil);
    try
        frm_cadastro_contas_receber2.ShowModal;
    finally
        FreeAndNil(frm_cadastro_contas_receber2);
    end;
end;

procedure Tfrm_Principal.img_rel_pagamentosClick(Sender: TObject);
begin
     frm_cadastro_contas_receber := Tfrm_cadastro_contas_receber.Create(nil);
    try
        frm_cadastro_contas_receber.ShowModal;
    finally
        FreeAndNil(frm_cadastro_contas_receber);
    end;
end;

procedure Tfrm_Principal.img_pagarClick(Sender: TObject);
begin
    frm_cadastro_contas_pagar := Tfrm_cadastro_contas_pagar.Create(nil);
    try
        frm_cadastro_contas_pagar.ShowModal;
    finally
        FreeAndNil(frm_cadastro_contas_pagar);
    end;
end;

procedure Tfrm_Principal.img_caixaClick(Sender: TObject);
begin
      frm_cadastro_caixa := Tfrm_cadastro_caixa.Create(nil);
    try
        frm_cadastro_caixa.ShowModal;
    finally
        FreeAndNil(frm_cadastro_caixa);
    end;
end;

procedure Tfrm_Principal.img_usuariosClick(Sender: TObject);
begin
    frm_cadastro_usuarios := Tfrm_cadastro_usuarios.Create(nil);
    try
        frm_cadastro_usuarios.ShowModal;
    finally
        FreeAndNil(frm_cadastro_usuarios);
    end;
end;

procedure Tfrm_Principal.tmr_1Timer(Sender: TObject);
begin
    stat_1.Panels.Items[0].Text := DateTimeToStr(Now);
end;

end.
