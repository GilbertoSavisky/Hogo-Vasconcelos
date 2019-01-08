unit udm_Relatorio;

interface

uses
  System.SysUtils, System.Classes, uDM, frxClass, frxDBSet, frxExportPDF;

type
  Tdm_relatorios = class(TDataModule)
    frxReport: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm_relatorios: Tdm_relatorios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
