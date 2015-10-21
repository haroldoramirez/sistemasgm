unit UFrmFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCadastro, Mask, sMaskEdit, StdCtrls, sEdit, sLabel, Buttons,
  sBitBtn, sGroupBox, sCustomComboEdit, sTooledit;

type
  TFrmCadFornecedor = class(TFrmCadastro)
    sGroupBox2: TsGroupBox;
    lbl_Logradouro: TsLabel;
    lbl_Numero: TsLabel;
    lbl_Bairro: TsLabel;
    lbl_CEP: TsLabel;
    lbl_Complemento: TsLabel;
    lbl_IdCidade: TsLabel;
    lbl_Cidade: TsLabel;
    lbl_Estado: TsLabel;
    lbl_Pais: TsLabel;
    lbl_Email: TsLabel;
    lbl_Telefone: TsLabel;
    lbl_Celular: TsLabel;
    edt_Logradouro: TsEdit;
    edt_Numero: TsEdit;
    edt_Bairro: TsEdit;
    edt_Complemento: TsEdit;
    edt_IdCidade: TsEdit;
    edt_Cidade: TsEdit;
    edt_Estado: TsEdit;
    edt_Pais: TsEdit;
    edt_Email: TsEdit;
    btn_BuscarCidade: TsBitBtn;
    edt_CEP: TsMaskEdit;
    edt_Telefone: TsMaskEdit;
    edt_Celular: TsMaskEdit;
    lbl_IdFornecedor: TsLabel;
    lbl_RazaoSocial: TsLabel;
    edt_IdCliente: TsEdit;
    edt_Nome_RazaoSocial: TsEdit;
    edt1: TsEdit;
    lbl_Fantasia: TsLabel;
    lbl_RG_IE: TsLabel;
    lbl_CPF_CNPJ: TsLabel;
    lbl_DataNasc_Fund: TsLabel;
    lbl4: TsLabel;
    edt_CPF_CNPJ: TsMaskEdit;
    edt_DataNasc_Fund: TsDateEdit;
    edt_RG_IE: TsEdit;
    edt_DataUltAlteracao: TsDateEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadFornecedor: TFrmCadFornecedor;

implementation

{$R *.dfm}

end.
