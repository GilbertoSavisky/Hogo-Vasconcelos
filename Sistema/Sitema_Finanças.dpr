program Sitema_Finanças;

uses
  Vcl.Forms,
  uFrm_Prinipal in 'uFrm_Prinipal.pas' {frm_Principal},
  Vcl.Themes,
  Vcl.Styles,
  uDM in 'uDM.pas' {dm_1: TDataModule},
  uFrm_cadastro_basico in 'view\uFrm_cadastro_basico.pas' {frm_cadastro_basico},
  unt_funcoes in 'classes\unt_funcoes.pas',
  uFrm_cadastro_usuarios in 'view\uFrm_cadastro_usuarios.pas' {frm_cadastro_usuarios},
  uFrm_cadastro_caixa in 'view\uFrm_cadastro_caixa.pas' {frm_cadastro_caixa},
  uFrm_cadastro_conta_pagar in 'view\uFrm_cadastro_conta_pagar.pas' {frm_cadastro_contas_pagar},
  uFrm_cadastro_conta_receber in 'view\uFrm_cadastro_conta_receber.pas' {frm_cadastro_contas_receber},
  uFrm_cadastro_conta_receber2 in 'view\uFrm_cadastro_conta_receber2.pas' {frm_cadastro_contas_receber2},
  udm_Relatorio in 'data_module\udm_Relatorio.pas' {dm_relatorios: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10');
  Application.CreateForm(Tfrm_Principal, frm_Principal);
  Application.CreateForm(Tdm_1, dm_1);
  Application.CreateForm(Tfrm_cadastro_contas_receber2, frm_cadastro_contas_receber2);
  Application.CreateForm(Tdm_relatorios, dm_relatorios);
  Application.Run;
end.
