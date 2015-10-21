unit UFrmConsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, sGroupBox, sLabel, sEdit, sSpeedButton, sButton,
  sSkinManager;

type
  TFrmConsulta = class(TForm)
    sGroupBox1: TsGroupBox;
    sGroupBox2: TsGroupBox;
    btn_Novo: TsBitBtn;
    btn_Editar: TsBitBtn;
    btn_Excluir: TsBitBtn;
    btn_Sair: TsBitBtn;
    edt_Id: TsEdit;
    edt_Descricao: TsEdit;
    lbl_Id: TsLabel;
    lbl_Descricao: TsLabel;
    btn_Consultar: TsButton;
    sss1: TsSkinManager;
    procedure btn_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsulta: TFrmConsulta;

implementation

{$R *.dfm}

procedure TFrmConsulta.btn_SairClick(Sender: TObject);
begin
    Close;
end;
procedure TFrmConsulta.FormCreate(Sender: TObject);
var count : Integer;
begin
  sss1.SkinDirectory := ExtractFilePath(Application.ExeName)+'Layout';
  sss1.SkinName := 'Opus';
  for count := 0 to Self.ComponentCount - 1 do
    if Self.Components[count] is TsEdit then
      TsEdit(Components[count]).CharCase := ecUpperCase;
end;

end.
