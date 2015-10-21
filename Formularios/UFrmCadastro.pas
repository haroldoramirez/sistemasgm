unit UFrmCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, sBitBtn, sGroupBox, sLabel, sEdit;

type
  TFrmCadastro = class(TForm)
    sGroupBox1: TsGroupBox;
    btn_Salvar: TsBitBtn;
    btn_Sair: TsBitBtn;
    lbl5: TsLabel;
    procedure btn_SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastro: TFrmCadastro;

implementation

{$R *.dfm}

procedure TFrmCadastro.btn_SairClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmCadastro.FormCreate(Sender: TObject);
var count : Integer;
begin
//  for count := 0 to Self.ComponentCount - 1 do
//    if Self.Components[count] is TsEdit then
//      TsEdit(Components[count]).CharCase := ecUpperCase;
end;

end.
