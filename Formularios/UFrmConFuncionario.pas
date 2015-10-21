unit UFrmConFuncionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmConsulta, Grids, DBGrids, Mask, sMaskEdit, sSkinManager, Buttons,
  sBitBtn, StdCtrls, sButton, sEdit, sLabel, sGroupBox, UFuncionario,
  UFrmCadFuncionario, UCtrlFuncionario, UComuns;

type
  TFrmConFuncionario = class(TFrmConsulta)
    gridConsulta: TDBGrid;
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_EditarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure btn_ConsultarClick(Sender: TObject);
    procedure edt_IdKeyPress(Sender: TObject; var Key: Char);
  private
    umFuncionario       : Funcionario;
    umaCtrlFuncionario  : CtrlFuncionario;
    umFrmCadFuncionario : TFrmCadFuncionario;
  public
    procedure ConhecaObj(vFuncionario : Funcionario);
    procedure DesabilitaCampos;

  end;

var
  FrmConFuncionario: TFrmConFuncionario;

implementation

{$R *.dfm}

{ TFrmConFuncionario }

procedure TFrmConFuncionario.btn_ConsultarClick(Sender: TObject);
var  consFuncionario: Funcionario;
begin
  inherited;
    consFuncionario := Funcionario.CrieObjeto;
    consFuncionario.setNome_RazaoSoCial(edt_Descricao.text);
    consFuncionario.setCPF_CNPJ('');
    if edt_Id.Text <> '' then
        consFuncionario.setId(strtoint(edt_Id.Text));
    if not umaCtrlFuncionario.Buscar(consFuncionario) then
        MessageDlg('Nenhum registro encontrado!',  mtInformation, [mbOK], 0);
    consFuncionario.destrua_se;
    edt_Id.Clear;
    edt_Descricao.Clear;
end;

procedure TFrmConFuncionario.btn_EditarClick(Sender: TObject);
begin
  inherited;
  umFuncionario.setId(0);
  umFrmCadFuncionario := TFrmCadFuncionario.Create(nil);
  umaCtrlFuncionario.Carrega(umFuncionario);
  if (umFuncionario.getId = 0) then
  MessageDlg('ATENÇÃO: Não há cadastro para ser editado!',mtWarning,[mbOK],0)
  else
    with umFrmCadFuncionario do
    begin
      ConhecaObj(umFuncionario,umaCtrlFuncionario);
      CarregaObj;
      if umFuncionario.getDataDemissao <> StrToDateTime('30/12/1899') then
      begin
        Self.DesabilitaCampos;
        btn_Salvar.Enabled := False;
      end;
      ShowModal;
    end;
end;

procedure TFrmConFuncionario.btn_ExcluirClick(Sender: TObject);
begin
  umFuncionario.setId(0);
  umaCtrlFuncionario.Carrega(umFuncionario);
  if (umFuncionario.getId = 0) then
    MessageDlg('ATENÇÃO: Não há cadastro para ser excluido!',mtWarning,[mbOK],0)
  else
  begin
    umFrmCadFuncionario.ConhecaObj(umFuncionario, umaCtrlFuncionario);
    umFrmCadFuncionario.btn_Salvar.Caption := 'Excluir';
    umFrmCadFuncionario.btn_Salvar.Enabled := True;
    umFrmCadFuncionario.CarregaObj;
    DesabilitaCampos;
    umFrmCadFuncionario.ShowModal;
  end;
end;

procedure TFrmConFuncionario.btn_NovoClick(Sender: TObject);
begin
  inherited;
  if umFuncionario.getId <> 0 then
      umFuncionario.CrieObjeto;
   with umFrmCadFuncionario do
   begin
     btn_Salvar.Caption := 'Salvar';
     btn_Salvar.Enabled := True;
     ConhecaObj(umFuncionario, umaCtrlFuncionario);
     ShowModal;
   end;
end;

procedure TFrmConFuncionario.btn_SairClick(Sender: TObject);
begin
  inherited;
  if self.btn_Sair.Caption = 'Selecionar' then
    begin
        umFuncionario.setId(0);
        umFuncionario := Funcionario(umaCtrlFuncionario.Carrega(umFuncionario));
    end;
    umFrmCadFuncionario.Free;
end;

procedure TFrmConFuncionario.ConhecaObj(vFuncionario: Funcionario);
begin
    umFuncionario := vFuncionario;
    umaCtrlFuncionario := CtrlFuncionario.CrieObjeto;
    umFrmCadFuncionario := TFrmCadFuncionario.Create(nil);
    self.gridConsulta.DataSource := umaCtrlFuncionario.GetDS;
end;

procedure TFrmConFuncionario.DesabilitaCampos;
var i : Integer;
begin
    umFrmCadFuncionario.btn_BuscarCargo.Enabled := False;
    umFrmCadFuncionario.btn_BuscarCidade.Enabled := False;
    umFrmCadFuncionario.edt_Observacao.Enabled := False;
    for i := 0 to umFrmCadFuncionario.ComponentCount - 1 do
      if (umFrmCadFuncionario.Components[i] is TsEdit) or (umFrmCadFuncionario.Components[i] is TsMaskEdit)then
        begin
           TsEdit(umFrmCadFuncionario.Components[i]).Enabled := False;
           TsMaskEdit(umFrmCadFuncionario.Components[i]).Enabled := False;
        end;
end;

procedure TFrmConFuncionario.edt_IdKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  CampoNumero(Sender, Key);
end;

end.
