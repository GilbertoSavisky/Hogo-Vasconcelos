unit uFrm_cadastro_conta_receber;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrm_cadastro_basico, Data.DB,
    System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.ComCtrls,
    Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, uDM,
    unt_funcoes, Datasnap.DBClient;

type
    Tfrm_cadastro_contas_receber = class(Tfrm_cadastro_basico)
        Label7: TLabel;
        Label1: TLabel;
        Label2: TLabel;
        Label4: TLabel;
        edt_num_doc: TEdit;
        Label3: TLabel;
        Label5: TLabel;
        edt_descricao: TEdit;
        edt_variação: TEdit;
        Label6: TLabel;
        edt_dt_compra: TEdit;
        Label8: TLabel;
        edt_qt_parcelas: TEdit;
        Label9: TLabel;
        Label10: TLabel;
        edt_vl_compra: TEdit;
        bt_: TBitBtn;
        btn_limpar_parcelas: TBitBtn;
        DBGrid1: TDBGrid;
        DS_parcelas: TDataSource;
        CDS_parcelas: TClientDataSet;
        CDS_parcelasParcela: TIntegerField;
        CDS_parcelasValor: TCurrencyField;
        CDS_parcelasVencimento: TDateField;
        Edit1: TEdit;
        Edit2: TEdit;
        BitBtn1: TBitBtn;
        procedure btn_limpar_parcelasClick(Sender: TObject);
        procedure BitBtn1Click(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    frm_cadastro_contas_receber: Tfrm_cadastro_contas_receber;

implementation

{$R *.dfm}

procedure Tfrm_cadastro_contas_receber.BitBtn1Click(Sender: TObject);
var
    Valor1, Valor2, Resultado: integer;
begin
    try
        Valor1 := StrToInt(Edit1.Text);
        Valor2 := StrToInt(Edit2.Text);
        Resultado := Valor1 div Valor2;
    except
        on EDivByZero do
            ShowMessage(' Divisão por Zero ');
        on EInOutError do
            ShowMessage('‘ Os valores devem ser numéricos ’');
    end

end;

procedure Tfrm_cadastro_contas_receber.btn_limpar_parcelasClick
  (Sender: TObject);
begin
    CDS_parcelas.EmptyDataSet;

end;

end.
