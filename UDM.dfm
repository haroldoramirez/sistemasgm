object DM: TDM
  Left = 0
  Top = -55
  Caption = 'DM'
  ClientHeight = 591
  ClientWidth = 946
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object DB: TZConnection
    Protocol = 'postgresql-7'
    HostName = 'localhost'
    Port = 5432
    Database = 'sgmdb'
    User = 'postgres'
    Password = 'haroldo'
    Properties.Strings = (
      'codepage=utf8')
    Connected = True
    Left = 104
    Top = 16
  end
  object QEstado: TZQuery
    Connection = DB
    UpdateObject = UpdateEstado
    Active = True
    SQL.Strings = (
      'select * from estado;')
    Params = <>
    Left = 32
    Top = 432
    object QEstadoidestado: TIntegerField
      FieldName = 'idestado'
      Required = True
    end
    object QEstadodescricao: TWideStringField
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
    object QEstadouf: TWideStringField
      FieldName = 'uf'
      Size = 2
    end
    object QEstadopaís: TStringField
      FieldKind = fkLookup
      FieldName = 'pa'#237's'
      LookupDataSet = QPais
      LookupKeyFields = 'idpais'
      LookupResultField = 'descricao'
      KeyFields = 'idpais'
      Lookup = True
    end
    object QEstadodatacadastro: TDateField
      FieldName = 'datacadastro'
    end
    object QEstadodataalteracao: TDateField
      FieldName = 'dataalteracao'
    end
    object QEstadoidpais: TIntegerField
      FieldName = 'idpais'
      Required = True
    end
  end
  object DSEstado: TDataSource
    DataSet = QEstado
    Left = 128
    Top = 432
  end
  object UpdateEstado: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM estado'
      'WHERE'
      '  estado.idestado = :OLD_idestado')
    InsertSQL.Strings = (
      'INSERT INTO estado'
      '  (idpais, descricao, uf, datacadastro, dataalteracao)'
      'VALUES'
      '  (:idpais, :descricao, :uf, :datacadastro, :dataalteracao)')
    ModifySQL.Strings = (
      'UPDATE estado SET'
      '  idpais = :idpais,'
      '  descricao = :descricao,'
      '  uf = :uf,'
      '  datacadastro = :datacadastro,'
      '  dataalteracao = :dataalteracao'
      'WHERE'
      '  estado.idestado = :OLD_idestado')
    UseSequenceFieldForRefreshSQL = False
    Left = 233
    Top = 432
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idpais'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'uf'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datacadastro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataalteracao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idestado'
        ParamType = ptUnknown
      end>
  end
  object QCidade: TZQuery
    Connection = DB
    UpdateObject = UpdateCidade
    Active = True
    SQL.Strings = (
      'select * from cidade;')
    Params = <>
    Left = 32
    Top = 488
    object QCidadeidcidade: TIntegerField
      FieldName = 'idcidade'
      Required = True
    end
    object QCidadedescricao: TWideStringField
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
    object QCidadeddd: TWideStringField
      FieldName = 'ddd'
      Size = 2
    end
    object QCidadeestado: TStringField
      FieldKind = fkLookup
      FieldName = 'estado'
      LookupDataSet = QEstado
      LookupKeyFields = 'idestado'
      LookupResultField = 'descricao'
      KeyFields = 'idestado'
      Size = 30
      Lookup = True
    end
    object QCidadedatacadastro: TDateField
      FieldName = 'datacadastro'
    end
    object QCidadedataalteracao: TDateField
      FieldName = 'dataalteracao'
    end
    object QCidadeidestado: TIntegerField
      FieldName = 'idestado'
      Required = True
    end
  end
  object DSCidade: TDataSource
    DataSet = QCidade
    Left = 127
    Top = 488
  end
  object UpdateCidade: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM cidade'
      'WHERE'
      '  cidade.idcidade = :OLD_idcidade')
    InsertSQL.Strings = (
      'INSERT INTO cidade'
      '  (idestado, descricao, ddd, datacadastro, dataalteracao)'
      'VALUES'
      '  (:idestado, :descricao, :ddd, :datacadastro, :dataalteracao)')
    ModifySQL.Strings = (
      'UPDATE cidade SET'
      '  idestado = :idestado,'
      '  descricao = :descricao,'
      '  ddd = :ddd,'
      '  datacadastro = :datacadastro,'
      '  dataalteracao = :dataalteracao'
      'WHERE'
      '  cidade.idcidade = :OLD_idcidade')
    UseSequenceFieldForRefreshSQL = False
    Left = 233
    Top = 488
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idestado'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ddd'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datacadastro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataalteracao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idcidade'
        ParamType = ptUnknown
      end>
  end
  object QCliente: TZQuery
    Connection = DB
    UpdateObject = UpdateCliente
    Active = True
    SQL.Strings = (
      'select * from cliente;')
    Params = <>
    Left = 32
    Top = 88
    object QClienteidcliente: TIntegerField
      FieldName = 'idcliente'
      Required = True
    end
    object QClientenome_razaosocial: TWideStringField
      FieldName = 'nome_razaosocial'
      Required = True
      Size = 100
    end
    object QClientelogradouro: TWideStringField
      FieldName = 'logradouro'
      Required = True
      Size = 100
    end
    object QClientenumero: TWideStringField
      FieldName = 'numero'
      Required = True
      Size = 10
    end
    object QClientecep: TWideStringField
      FieldName = 'cep'
      Size = 9
    end
    object QClientebairro: TWideStringField
      FieldName = 'bairro'
      Required = True
      Size = 50
    end
    object QClientecomplemento: TWideStringField
      FieldName = 'complemento'
      Size = 50
    end
    object QClientecidade: TStringField
      FieldKind = fkLookup
      FieldName = 'cidade'
      LookupDataSet = QCidade
      LookupKeyFields = 'idcidade'
      LookupResultField = 'descricao'
      KeyFields = 'idcidade'
      Lookup = True
    end
    object QClientecondiçãoPgto: TStringField
      FieldKind = fkLookup
      FieldName = 'condi'#231#227'oPgto'
      LookupDataSet = QCondicaoPagamento
      LookupKeyFields = 'idcondicaopagamento'
      LookupResultField = 'descricao'
      KeyFields = 'idcondicaopagamento'
      Lookup = True
    end
    object QClienteemail: TWideStringField
      FieldName = 'email'
      Size = 100
    end
    object QClientetelefone: TWideStringField
      FieldName = 'telefone'
      Required = True
      Size = 13
    end
    object QClientecelular: TWideStringField
      FieldName = 'celular'
      Size = 13
    end
    object QClientecpf_cnpj: TWideStringField
      FieldName = 'cpf_cnpj'
      Size = 18
    end
    object QClienterg_ie: TWideStringField
      FieldName = 'rg_ie'
      Size = 10
    end
    object QClientetipopessoa: TWideStringField
      FieldName = 'tipopessoa'
      Required = True
      Size = 8
    end
    object QClientedatanasc_fund: TDateField
      FieldName = 'datanasc_fund'
    end
    object QClientedatacadastro: TDateField
      FieldName = 'datacadastro'
      Required = True
    end
    object QClientedataalteracao: TDateField
      FieldName = 'dataalteracao'
      Required = True
    end
    object QClienteobservacao: TWideStringField
      FieldName = 'observacao'
      Size = 255
    end
    object QClienteidcidade: TIntegerField
      FieldName = 'idcidade'
      Required = True
    end
    object QClienteidcondicaopagamento: TIntegerField
      FieldName = 'idcondicaopagamento'
      Required = True
    end
  end
  object DSCliente: TDataSource
    DataSet = QCliente
    Left = 128
    Top = 88
  end
  object UpdateCliente: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM cliente'
      'WHERE'
      '  cliente.idcliente = :OLD_idcliente')
    InsertSQL.Strings = (
      'INSERT INTO cliente'
      
        '  (nome_razaosocial, logradouro, numero, cep, bairro, complement' +
        'o, idcidade, '
      
        '   email, telefone, celular, cpf_cnpj, rg_ie, tipopessoa, idcond' +
        'icaopagamento, '
      '   datanasc_fund, datacadastro, dataalteracao, observacao)'
      'VALUES'
      
        '  (:nome_razaosocial, :logradouro, :numero, :cep, :bairro, :comp' +
        'lemento, '
      
        '   :idcidade, :email, :telefone, :celular, :cpf_cnpj, :rg_ie, :t' +
        'ipopessoa, '
      
        '   :idcondicaopagamento, :datanasc_fund, :datacadastro, :dataalt' +
        'eracao, '
      '   :observacao)')
    ModifySQL.Strings = (
      'UPDATE cliente SET'
      '  nome_razaosocial = :nome_razaosocial,'
      '  logradouro = :logradouro,'
      '  numero = :numero,'
      '  cep = :cep,'
      '  bairro = :bairro,'
      '  complemento = :complemento,'
      '  idcidade = :idcidade,'
      '  email = :email,'
      '  telefone = :telefone,'
      '  celular = :celular,'
      '  cpf_cnpj = :cpf_cnpj,'
      '  rg_ie = :rg_ie,'
      '  tipopessoa = :tipopessoa,'
      '  idcondicaopagamento = :idcondicaopagamento,'
      '  datanasc_fund = :datanasc_fund,'
      '  datacadastro = :datacadastro,'
      '  dataalteracao = :dataalteracao,'
      '  observacao = :observacao'
      'WHERE'
      '  cliente.idcliente = :OLD_idcliente')
    UseSequenceFieldForRefreshSQL = False
    Left = 233
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nome_razaosocial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'logradouro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'bairro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'complemento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idcidade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'email'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'telefone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'celular'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cpf_cnpj'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rg_ie'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipopessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idcondicaopagamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datanasc_fund'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datacadastro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataalteracao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'observacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idcliente'
        ParamType = ptUnknown
      end>
  end
  object QFornecedor: TZQuery
    Connection = DB
    UpdateObject = UpdateFornecedor
    Active = True
    SQL.Strings = (
      'select * from fornecedor;')
    Params = <>
    Left = 32
    Top = 144
    object QFornecedoridfornecedor: TIntegerField
      FieldName = 'idfornecedor'
      Required = True
    end
    object QFornecedornome_razaosocial: TWideStringField
      FieldName = 'nome_razaosocial'
      Required = True
      Size = 100
    end
    object QFornecedorlogradouro: TWideStringField
      FieldName = 'logradouro'
      Required = True
      Size = 100
    end
    object QFornecedornumero: TWideStringField
      FieldName = 'numero'
      Required = True
      Size = 10
    end
    object QFornecedorcep: TWideStringField
      FieldName = 'cep'
      Size = 9
    end
    object QFornecedorbairro: TWideStringField
      FieldName = 'bairro'
      Required = True
      Size = 50
    end
    object QFornecedortipofavorecido: TWideStringField
      FieldName = 'tipofavorecido'
      Size = 1
    end
    object QFornecedortipopessoa: TWideStringField
      FieldName = 'tipopessoa'
      Required = True
      Size = 8
    end
    object QFornecedorcomplemento: TWideStringField
      FieldName = 'complemento'
      Size = 50
    end
    object QFornecedorcidade: TStringField
      FieldKind = fkLookup
      FieldName = 'cidade'
      LookupDataSet = QCidade
      LookupKeyFields = 'idcidade'
      LookupResultField = 'descricao'
      KeyFields = 'idcidade'
      Lookup = True
    end
    object QFornecedorcondiçãoPgto: TStringField
      FieldKind = fkLookup
      FieldName = 'condi'#231#227'oPgto'
      LookupDataSet = QCondicaoPagamento
      LookupKeyFields = 'idcondicaopagamento'
      LookupResultField = 'descricao'
      KeyFields = 'idcondicaopagamento'
      Lookup = True
    end
    object QFornecedoremail: TWideStringField
      FieldName = 'email'
      Size = 100
    end
    object QFornecedortelefone: TWideStringField
      FieldName = 'telefone'
    end
    object QFornecedorcelular: TWideStringField
      FieldName = 'celular'
    end
    object QFornecedorcpf_cnpj: TWideStringField
      FieldName = 'cpf_cnpj'
      Size = 18
    end
    object QFornecedorrg_ie: TWideStringField
      FieldName = 'rg_ie'
      Size = 10
    end
    object QFornecedordatanasc_fund: TDateField
      FieldName = 'datanasc_fund'
      Required = True
    end
    object QFornecedordatacadastro: TDateField
      FieldName = 'datacadastro'
      Required = True
    end
    object QFornecedordataalteracao: TDateField
      FieldName = 'dataalteracao'
      Required = True
    end
    object QFornecedorobservacao: TWideStringField
      FieldName = 'observacao'
      Size = 255
    end
    object QFornecedoridcidade: TIntegerField
      FieldName = 'idcidade'
      Required = True
    end
    object QFornecedoridcondicaopagamento: TIntegerField
      FieldName = 'idcondicaopagamento'
      Required = True
    end
  end
  object DSFornecedor: TDataSource
    DataSet = QFornecedor
    Left = 128
    Top = 144
  end
  object UpdateFornecedor: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM fornecedor'
      'WHERE'
      '  fornecedor.idfornecedor = :OLD_idfornecedor')
    InsertSQL.Strings = (
      'INSERT INTO fornecedor'
      
        '  (nome_razaosocial, logradouro, numero, cep, bairro, complement' +
        'o, idcidade, '
      
        '   email, telefone, celular, cpf_cnpj, tipopessoa, rg_ie, datana' +
        'sc_fund, '
      
        '   idcondicaopagamento, datacadastro, dataalteracao, observacao,' +
        ' tipofavorecido)'
      'VALUES'
      
        '  (:nome_razaosocial, :logradouro, :numero, :cep, :bairro, :comp' +
        'lemento, '
      
        '   :idcidade, :email, :telefone, :celular, :cpf_cnpj, :tipopesso' +
        'a, :rg_ie, '
      
        '   :datanasc_fund, :idcondicaopagamento, :datacadastro, :dataalt' +
        'eracao, '
      '   :observacao, :tipofavorecido)')
    ModifySQL.Strings = (
      'UPDATE fornecedor SET'
      '  nome_razaosocial = :nome_razaosocial,'
      '  logradouro = :logradouro,'
      '  numero = :numero,'
      '  cep = :cep,'
      '  bairro = :bairro,'
      '  complemento = :complemento,'
      '  idcidade = :idcidade,'
      '  email = :email,'
      '  telefone = :telefone,'
      '  celular = :celular,'
      '  cpf_cnpj = :cpf_cnpj,'
      '  tipopessoa = :tipopessoa,'
      '  rg_ie = :rg_ie,'
      '  datanasc_fund = :datanasc_fund,'
      '  idcondicaopagamento = :idcondicaopagamento,'
      '  datacadastro = :datacadastro,'
      '  dataalteracao = :dataalteracao,'
      '  observacao = :observacao,'
      '  tipofavorecido = :tipofavorecido'
      'WHERE'
      '  fornecedor.idfornecedor = :OLD_idfornecedor')
    UseSequenceFieldForRefreshSQL = False
    Left = 233
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nome_razaosocial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'logradouro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'bairro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'complemento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idcidade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'email'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'telefone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'celular'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cpf_cnpj'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipopessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rg_ie'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datanasc_fund'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idcondicaopagamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datacadastro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataalteracao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'observacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipofavorecido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idfornecedor'
        ParamType = ptUnknown
      end>
  end
  object QMarca: TZQuery
    Connection = DB
    UpdateObject = UpdateMarca
    Active = True
    SQL.Strings = (
      'select * from marca;')
    Params = <>
    Left = 332
    Top = 144
    object QMarcaidmarca: TIntegerField
      FieldName = 'idmarca'
      Required = True
    end
    object QMarcadescricao: TWideStringField
      FieldName = 'descricao'
      Required = True
      Size = 50
    end
    object QMarcadatacadastro: TDateField
      FieldName = 'datacadastro'
    end
    object QMarcadataalteracao: TDateField
      FieldName = 'dataalteracao'
    end
  end
  object DSMarca: TDataSource
    DataSet = QMarca
    Left = 423
    Top = 144
  end
  object UpdateMarca: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM marca'
      'WHERE'
      '  marca.idmarca = :OLD_idmarca')
    InsertSQL.Strings = (
      'INSERT INTO marca'
      '  (descricao, datacadastro, dataalteracao)'
      'VALUES'
      '  (:descricao, :datacadastro, :dataalteracao)')
    ModifySQL.Strings = (
      'UPDATE marca SET'
      '  descricao = :descricao,'
      '  datacadastro = :datacadastro,'
      '  dataalteracao = :dataalteracao'
      'WHERE'
      '  marca.idmarca = :OLD_idmarca')
    UseSequenceFieldForRefreshSQL = False
    Left = 528
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datacadastro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataalteracao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idmarca'
        ParamType = ptUnknown
      end>
  end
  object QCategoria: TZQuery
    Connection = DB
    UpdateObject = UpdateCategoria
    Active = True
    SQL.Strings = (
      'select * from categoria;')
    Params = <>
    Left = 332
    Top = 200
    object QCategoriaidcategoria: TIntegerField
      FieldName = 'idcategoria'
      Required = True
    end
    object QCategoriadescricao: TWideStringField
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
    object QCategoriadatacadastro: TDateField
      FieldName = 'datacadastro'
    end
    object QCategoriadataalteracao: TDateField
      FieldName = 'dataalteracao'
    end
  end
  object DSCategoria: TDataSource
    DataSet = QCategoria
    Left = 423
    Top = 200
  end
  object UpdateCategoria: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM categoria'
      'WHERE'
      '  categoria.idcategoria = :OLD_idcategoria')
    InsertSQL.Strings = (
      'INSERT INTO categoria'
      '  (descricao, datacadastro, dataalteracao)'
      'VALUES'
      '  (:descricao, :datacadastro, :dataalteracao)')
    ModifySQL.Strings = (
      'UPDATE categoria SET'
      '  descricao = :descricao,'
      '  datacadastro = :datacadastro,'
      '  dataalteracao = :dataalteracao'
      'WHERE'
      '  categoria.idcategoria = :OLD_idcategoria')
    UseSequenceFieldForRefreshSQL = False
    Left = 528
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datacadastro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataalteracao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idcategoria'
        ParamType = ptUnknown
      end>
  end
  object QFormaPagamento: TZQuery
    Connection = DB
    UpdateObject = UpdateFormaPagamento
    Active = True
    SQL.Strings = (
      'select * from formapagamento;')
    Params = <>
    Left = 631
    Top = 200
    object QFormaPagamentoidformapagamento: TIntegerField
      FieldName = 'idformapagamento'
      Required = True
    end
    object QFormaPagamentodescricao: TWideStringField
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
    object QFormaPagamentodatacadastro: TDateField
      FieldName = 'datacadastro'
    end
    object QFormaPagamentodataalteracao: TDateField
      FieldName = 'dataalteracao'
    end
  end
  object DSFormaPagamento: TDataSource
    DataSet = QFormaPagamento
    Left = 737
    Top = 200
  end
  object UpdateFormaPagamento: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM formapagamento'
      'WHERE'
      '  formapagamento.idformapagamento = :OLD_idformapagamento')
    InsertSQL.Strings = (
      'INSERT INTO formapagamento'
      '  (descricao, datacadastro, dataalteracao)'
      'VALUES'
      '  (:descricao, :datacadastro, :dataalteracao)')
    ModifySQL.Strings = (
      'UPDATE formapagamento SET'
      '  descricao = :descricao,'
      '  datacadastro = :datacadastro,'
      '  dataalteracao = :dataalteracao'
      'WHERE'
      '  formapagamento.idformapagamento = :OLD_idformapagamento')
    UseSequenceFieldForRefreshSQL = False
    Left = 857
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datacadastro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataalteracao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idformapagamento'
        ParamType = ptUnknown
      end>
  end
  object QCondicaoPagamento: TZQuery
    Connection = DB
    UpdateObject = UpdateCondicaoPagamento
    Active = True
    SQL.Strings = (
      'select * from condicaopagamento;')
    Params = <>
    Left = 631
    Top = 256
    object QCondicaoPagamentoidcondicaopagamento: TIntegerField
      FieldName = 'idcondicaopagamento'
      Required = True
    end
    object QCondicaoPagamentodescricao: TWideStringField
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
    object QCondicaoPagamentoformaPgto: TStringField
      FieldKind = fkLookup
      FieldName = 'formaPgto'
      LookupDataSet = QFormaPagamento
      LookupKeyFields = 'idformapagamento'
      LookupResultField = 'descricao'
      KeyFields = 'idformapagamento'
      Lookup = True
    end
    object QCondicaoPagamentodatacadastro: TDateField
      FieldName = 'datacadastro'
      Required = True
    end
    object QCondicaoPagamentodataalteracao: TDateField
      FieldName = 'dataalteracao'
      Required = True
    end
    object QCondicaoPagamentoidformapagamento: TIntegerField
      FieldName = 'idformapagamento'
      Required = True
    end
  end
  object DSCondicaoPagamento: TDataSource
    DataSet = QCondicaoPagamento
    Left = 737
    Top = 256
  end
  object UpdateCondicaoPagamento: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM condicaopagamento'
      'WHERE'
      
        '  condicaopagamento.idcondicaopagamento = :OLD_idcondicaopagamen' +
        'to')
    InsertSQL.Strings = (
      'INSERT INTO condicaopagamento'
      '  (idformapagamento, descricao, datacadastro, dataalteracao)'
      'VALUES'
      '  (:idformapagamento, :descricao, :datacadastro, :dataalteracao)')
    ModifySQL.Strings = (
      'UPDATE condicaopagamento SET'
      '  idformapagamento = :idformapagamento,'
      '  descricao = :descricao,'
      '  datacadastro = :datacadastro,'
      '  dataalteracao = :dataalteracao'
      'WHERE'
      '  condicaopagamento.idcondicaopagamento = '
      ':OLD_idcondicaopagamento')
    UseSequenceFieldForRefreshSQL = False
    Left = 857
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idformapagamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datacadastro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataalteracao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idcondicaopagamento'
        ParamType = ptUnknown
      end>
  end
  object QParcelas: TZQuery
    Connection = DB
    UpdateObject = UpdateParcelas
    Active = True
    SQL.Strings = (
      'select * from parcelas;')
    Params = <>
    Left = 631
    Top = 312
    object QParcelasidcondicaopagamento: TIntegerField
      FieldName = 'idcondicaopagamento'
      Required = True
    end
    object QParcelasnumparcela: TIntegerField
      FieldName = 'numparcela'
      Required = True
    end
    object QParcelasnumdias: TIntegerField
      FieldName = 'numdias'
      Required = True
    end
    object QParcelasporcentagem: TFloatField
      FieldName = 'porcentagem'
    end
  end
  object DSParcelas: TDataSource
    DataSet = QParcelas
    Left = 737
    Top = 312
  end
  object UpdateParcelas: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM parcelas'
      'WHERE'
      '  parcelas.idcondicaopagamento = :OLD_idcondicaopagamento')
    InsertSQL.Strings = (
      'INSERT INTO parcelas'
      '  (idcondicaopagamento, numparcela, numdias, porcentagem)'
      'VALUES'
      '  (:idcondicaopagamento, :numparcela, :numdias, :porcentagem)')
    ModifySQL.Strings = (
      'UPDATE parcelas SET'
      '  idcondicaopagamento = :idcondicaopagamento,'
      '  numparcela = :numparcela,'
      '  numdias = :numdias,'
      '  porcentagem = :porcentagem'
      'WHERE'
      '  parcelas.idcondicaopagamento = :OLD_idcondicaopagamento')
    UseSequenceFieldForRefreshSQL = False
    Left = 857
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idcondicaopagamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numparcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numdias'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'porcentagem'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idcondicaopagamento'
        ParamType = ptUnknown
      end>
  end
  object QProduto: TZQuery
    Connection = DB
    UpdateObject = UpdateProduto
    Active = True
    SQL.Strings = (
      'select * from produto;')
    Params = <>
    Left = 332
    Top = 88
    object QProdutoidproduto: TIntegerField
      FieldName = 'idproduto'
      Required = True
    end
    object QProdutodescricao: TWideStringField
      FieldName = 'descricao'
      Required = True
      Size = 60
    end
    object QProdutoidunidade: TIntegerField
      FieldName = 'idunidade'
    end
    object QProdutoquantidade: TFloatField
      FieldName = 'quantidade'
    end
    object QProdutoicms: TFloatField
      FieldName = 'icms'
    end
    object QProdutoipi: TFloatField
      FieldName = 'ipi'
    end
    object QProdutopreco_compra: TFloatField
      FieldName = 'preco_compra'
    end
    object QProdutopreco_venda: TFloatField
      FieldName = 'preco_venda'
      Required = True
    end
    object QProdutoicms_anterior: TFloatField
      FieldName = 'icms_anterior'
    end
    object QProdutoipi_anterior: TFloatField
      FieldName = 'ipi_anterior'
    end
    object QProdutopreco_compra_ant: TFloatField
      FieldName = 'preco_compra_ant'
    end
    object QProdutoidmarca: TIntegerField
      FieldName = 'idmarca'
    end
    object QProdutoidcategoria: TIntegerField
      FieldName = 'idcategoria'
    end
    object QProdutoobservacao: TWideStringField
      FieldName = 'observacao'
      Size = 255
    end
    object QProdutodatacadastro: TDateField
      FieldName = 'datacadastro'
    end
    object QProdutodataalteracao: TDateField
      FieldName = 'dataalteracao'
    end
  end
  object DSProduto: TDataSource
    DataSet = QProduto
    Left = 423
    Top = 88
  end
  object UpdateProduto: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM produto'
      'WHERE'
      '  produto.idproduto = :OLD_idproduto')
    InsertSQL.Strings = (
      'INSERT INTO produto'
      '  (descricao, idunidade, quantidade, icms, ipi, preco_compra, '
      'preco_venda, '
      
        '   icms_anterior, ipi_anterior, preco_compra_ant, idmarca, idcat' +
        'egoria, '
      '   observacao, datacadastro, dataalteracao)'
      'VALUES'
      
        '  (:descricao, :idunidade, :quantidade, :icms, :ipi, :preco_comp' +
        'ra, '
      ':preco_venda, '
      
        '   :icms_anterior, :ipi_anterior, :preco_compra_ant, :idmarca, :' +
        'idcategoria, '
      '   :observacao, :datacadastro, :dataalteracao)')
    ModifySQL.Strings = (
      'UPDATE produto SET'
      '  descricao = :descricao,'
      '  idunidade = :idunidade,'
      '  quantidade = :quantidade,'
      '  icms = :icms,'
      '  ipi = :ipi,'
      '  preco_compra = :preco_compra,'
      '  preco_venda = :preco_venda,'
      '  icms_anterior = :icms_anterior,'
      '  ipi_anterior = :ipi_anterior,'
      '  preco_compra_ant = :preco_compra_ant,'
      '  idmarca = :idmarca,'
      '  idcategoria = :idcategoria,'
      '  observacao = :observacao,'
      '  datacadastro = :datacadastro,'
      '  dataalteracao = :dataalteracao'
      'WHERE'
      '  produto.idproduto = :OLD_idproduto')
    UseSequenceFieldForRefreshSQL = False
    Left = 529
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idunidade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'quantidade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'icms'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ipi'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'preco_compra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'preco_venda'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'icms_anterior'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ipi_anterior'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'preco_compra_ant'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idmarca'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idcategoria'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'observacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datacadastro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataalteracao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idproduto'
        ParamType = ptUnknown
      end>
  end
  object QVenda: TZQuery
    Connection = DB
    UpdateObject = UpdateVenda
    Active = True
    SQL.Strings = (
      'select * from venda;')
    Params = <>
    Left = 332
    Top = 422
    object QVendanumnota: TIntegerField
      FieldName = 'numnota'
      Required = True
    end
    object QVendaserienota: TWideStringField
      FieldName = 'serienota'
      Required = True
      Size = 2
    end
    object QVendaidordemservico: TIntegerField
      FieldName = 'idordemservico'
    end
    object QVendacliente: TStringField
      FieldKind = fkLookup
      FieldName = 'cliente'
      LookupDataSet = QFuncionario
      LookupKeyFields = 'idfuncionario'
      LookupResultField = 'nome'
      KeyFields = 'idcliente'
      Size = 30
      Lookup = True
    end
    object QVendacondiçãoPgto: TStringField
      FieldKind = fkLookup
      FieldName = 'condi'#231#227'oPgto'
      LookupDataSet = QCondicaoPagamento
      LookupKeyFields = 'idcondicaopagamento'
      LookupResultField = 'descricao'
      KeyFields = 'idcondicaopagamento'
      Size = 15
      Lookup = True
    end
    object QVendastatus: TWideStringField
      FieldName = 'status'
      Size = 15
    end
    object QVendafuncionário: TStringField
      FieldKind = fkLookup
      FieldName = 'funcion'#225'rio'
      LookupDataSet = QUsuario
      LookupKeyFields = 'idusuario'
      LookupResultField = 'login'
      KeyFields = 'idusuario'
      Lookup = True
    end
    object QVendadatavenda: TDateField
      FieldName = 'datavenda'
      Required = True
    end
    object QVendadataemissao: TDateField
      FieldName = 'dataemissao'
      Required = True
    end
    object QVendadatacadastro: TDateField
      FieldName = 'datacadastro'
      Required = True
    end
    object QVendadataalteracao: TDateField
      FieldName = 'dataalteracao'
      Required = True
    end
    object QVendaobservacao: TWideStringField
      FieldName = 'observacao'
      Size = 255
    end
    object QVendaidcondicaopagamento: TIntegerField
      FieldName = 'idcondicaopagamento'
      Required = True
    end
    object QVendaidcliente: TIntegerField
      FieldName = 'idcliente'
      Required = True
    end
    object QVendaidusuario: TIntegerField
      FieldName = 'idusuario'
      Required = True
    end
  end
  object DSVenda: TDataSource
    DataSet = QVenda
    Left = 423
    Top = 422
  end
  object UpdateVenda: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM venda'
      'WHERE'
      '  venda.numnota = :OLD_numnota AND'
      '  venda.serienota = :OLD_serienota')
    InsertSQL.Strings = (
      'INSERT INTO venda'
      
        '  (serienota, idcliente, idcondicaopagamento, idusuario, status,' +
        ' datavenda, '
      
        '   dataemissao, idordemservico, datacadastro, dataalteracao, obs' +
        'ervacao)'
      'VALUES'
      
        '  (:serienota, :idcliente, :idcondicaopagamento, :idusuario, :st' +
        'atus, :datavenda, '
      
        '   :dataemissao, :idordemservico, :datacadastro, :dataalteracao,' +
        ' :observacao)')
    ModifySQL.Strings = (
      'UPDATE venda SET'
      '  serienota = :serienota,'
      '  idcliente = :idcliente,'
      '  idcondicaopagamento = :idcondicaopagamento,'
      '  idusuario = :idusuario,'
      '  status = :status,'
      '  datavenda = :datavenda,'
      '  dataemissao = :dataemissao,'
      '  idordemservico = :idordemservico,'
      '  datacadastro = :datacadastro,'
      '  dataalteracao = :dataalteracao,'
      '  observacao = :observacao'
      'WHERE'
      '  venda.numnota = :OLD_numnota AND'
      '  venda.serienota = :OLD_serienota')
    UseSequenceFieldForRefreshSQL = False
    Left = 528
    Top = 422
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'serienota'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idcliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idcondicaopagamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idusuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datavenda'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataemissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idordemservico'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datacadastro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataalteracao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'observacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_numnota'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_serienota'
        ParamType = ptUnknown
      end>
  end
  object QProdutoVenda: TZQuery
    Connection = DB
    UpdateObject = UpdateProdutoVenda
    Active = True
    SQL.Strings = (
      'select * from produto_venda;')
    Params = <>
    Left = 332
    Top = 480
    object QProdutoVendaidproduto_venda: TIntegerField
      FieldName = 'idproduto_venda'
      ReadOnly = True
    end
    object QProdutoVendanumnota: TIntegerField
      FieldName = 'numnota'
      Required = True
    end
    object QProdutoVendaidproduto: TIntegerField
      FieldName = 'idproduto'
      Required = True
    end
    object QProdutoVendaserienota: TWideStringField
      FieldName = 'serienota'
      Required = True
      Size = 2
    end
    object QProdutoVendavalorunitario: TFloatField
      FieldName = 'valorunitario'
      Required = True
    end
    object QProdutoVendaquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
    end
    object QProdutoVendadesconto: TFloatField
      FieldName = 'desconto'
      Required = True
    end
  end
  object DSProdutoVenda: TDataSource
    DataSet = QProdutoVenda
    Left = 423
    Top = 480
  end
  object UpdateProdutoVenda: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM produto_venda'
      'WHERE'
      '  produto_venda.numnota = :OLD_numnota AND'
      '  produto_venda.serienota = :OLD_serienota')
    InsertSQL.Strings = (
      'INSERT INTO produto_venda'
      
        '  (numnota, idproduto, serienota, valorunitario, quantidade, des' +
        'conto)'
      'VALUES'
      
        '  (:numnota, :idproduto, :serienota, :valorunitario, :quantidade' +
        ', :desconto)')
    ModifySQL.Strings = (
      'UPDATE produto_venda SET'
      '  numnota = :numnota,'
      '  idproduto = :idproduto,'
      '  serienota = :serienota,'
      '  valorunitario = :valorunitario,'
      '  quantidade = :quantidade,'
      '  desconto = :desconto'
      'WHERE'
      '  produto_venda.numnota = :OLD_numnota AND'
      '  produto_venda.serienota = :OLD_serienota')
    UseSequenceFieldForRefreshSQL = False
    Left = 528
    Top = 480
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numnota'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idproduto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'serienota'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'valorunitario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'quantidade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'desconto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_numnota'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_serienota'
        ParamType = ptUnknown
      end>
  end
  object QCargo: TZQuery
    Connection = DB
    UpdateObject = UpdateCargo
    Active = True
    SQL.Strings = (
      'select * from cargo;')
    Params = <>
    Left = 32
    Top = 256
    object QCargoidcargo: TIntegerField
      FieldName = 'idcargo'
      Required = True
    end
    object QCargodescricao: TWideStringField
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
    object QCargodatacadastro: TDateField
      FieldName = 'datacadastro'
    end
    object QCargodataalteracao: TDateField
      FieldName = 'dataalteracao'
      Required = True
    end
  end
  object DSCargo: TDataSource
    DataSet = QCargo
    Left = 128
    Top = 256
  end
  object UpdateCargo: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM cargo'
      'WHERE'
      '  cargo.idcargo = :OLD_idcargo')
    InsertSQL.Strings = (
      'INSERT INTO cargo'
      '  (descricao, datacadastro, dataalteracao)'
      'VALUES'
      '  (:descricao, :datacadastro, :dataalteracao)')
    ModifySQL.Strings = (
      'UPDATE cargo SET'
      '  descricao = :descricao,'
      '  datacadastro = :datacadastro,'
      '  dataalteracao = :dataalteracao'
      'WHERE'
      '  cargo.idcargo = :OLD_idcargo')
    UseSequenceFieldForRefreshSQL = False
    Left = 233
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datacadastro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataalteracao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idcargo'
        ParamType = ptUnknown
      end>
  end
  object QFuncionario: TZQuery
    Connection = DB
    UpdateObject = UpdateFuncionario
    Active = True
    SQL.Strings = (
      'select * from funcionario;')
    Params = <>
    Left = 32
    Top = 200
    object QFuncionarioidfuncionario: TIntegerField
      FieldName = 'idfuncionario'
      Required = True
    end
    object QFuncionarionome: TWideStringField
      FieldName = 'nome'
      Required = True
      Size = 100
    end
    object QFuncionariocargo: TStringField
      FieldKind = fkLookup
      FieldName = 'cargo'
      LookupDataSet = QCargo
      LookupKeyFields = 'idcargo'
      LookupResultField = 'descricao'
      KeyFields = 'idcargo'
      Size = 15
      Lookup = True
    end
    object QFuncionariologradouro: TWideStringField
      FieldName = 'logradouro'
      Required = True
      Size = 100
    end
    object QFuncionarionumero: TWideStringField
      FieldName = 'numero'
      Size = 10
    end
    object QFuncionariocep: TWideStringField
      FieldName = 'cep'
      Required = True
      Size = 9
    end
    object QFuncionariobairro: TWideStringField
      FieldName = 'bairro'
      Required = True
      Size = 50
    end
    object QFuncionariocomplemento: TWideStringField
      FieldName = 'complemento'
      Size = 50
    end
    object QFuncionariocidade: TStringField
      FieldKind = fkLookup
      FieldName = 'cidade'
      LookupDataSet = QCidade
      LookupKeyFields = 'idcidade'
      LookupResultField = 'descricao'
      KeyFields = 'idcidade'
      Lookup = True
    end
    object QFuncionarioemail: TWideStringField
      FieldName = 'email'
      Size = 100
    end
    object QFuncionariotelefone: TWideStringField
      FieldName = 'telefone'
      Size = 13
    end
    object QFuncionariocelular: TWideStringField
      FieldName = 'celular'
      Size = 13
    end
    object QFuncionariocpf: TWideStringField
      FieldName = 'cpf'
      Size = 14
    end
    object QFuncionariorg: TWideStringField
      FieldName = 'rg'
      Size = 10
    end
    object QFuncionariodatanascimento: TDateField
      FieldName = 'datanascimento'
      Required = True
    end
    object QFuncionarioctps: TWideStringField
      FieldName = 'ctps'
      Size = 8
    end
    object QFuncionariocnh: TWideStringField
      FieldName = 'cnh'
      Required = True
      Size = 11
    end
    object QFuncionariodatavencimento: TDateField
      FieldName = 'datavencimento'
      Required = True
    end
    object QFuncionariodatacadastro: TDateField
      FieldName = 'datacadastro'
      Required = True
    end
    object QFuncionariodataalteracao: TDateField
      FieldName = 'dataalteracao'
    end
    object QFuncionariodataadmissao: TDateField
      FieldName = 'dataadmissao'
    end
    object QFuncionariodatademissao: TDateField
      FieldName = 'datademissao'
    end
    object QFuncionarioobservacao: TWideStringField
      FieldName = 'observacao'
      Size = 255
    end
    object QFuncionarioidcargo: TIntegerField
      FieldName = 'idcargo'
      Required = True
    end
    object QFuncionarioidcidade: TIntegerField
      FieldName = 'idcidade'
      Required = True
    end
  end
  object DSFuncionario: TDataSource
    DataSet = QFuncionario
    Left = 128
    Top = 200
  end
  object UpdateFuncionario: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM funcionario'
      'WHERE'
      '  funcionario.idfuncionario = :OLD_idfuncionario')
    InsertSQL.Strings = (
      'INSERT INTO funcionario'
      
        '  (nome, idcargo, logradouro, numero, cep, bairro, complemento, ' +
        'idcidade, '
      
        '   email, telefone, celular, cpf, rg, datanascimento, ctps, cnh,' +
        ' datavencimento, '
      
        '   datacadastro, dataalteracao, dataadmissao, datademissao, obse' +
        'rvacao)'
      'VALUES'
      
        '  (:nome, :idcargo, :logradouro, :numero, :cep, :bairro, :comple' +
        'mento, '
      
        '   :idcidade, :email, :telefone, :celular, :cpf, :rg, :datanasci' +
        'mento, '
      
        '   :ctps, :cnh, :datavencimento, :datacadastro, :dataalteracao, ' +
        ':dataadmissao, '
      '   :datademissao, :observacao)')
    ModifySQL.Strings = (
      'UPDATE funcionario SET'
      '  nome = :nome,'
      '  idcargo = :idcargo,'
      '  logradouro = :logradouro,'
      '  numero = :numero,'
      '  cep = :cep,'
      '  bairro = :bairro,'
      '  complemento = :complemento,'
      '  idcidade = :idcidade,'
      '  email = :email,'
      '  telefone = :telefone,'
      '  celular = :celular,'
      '  cpf = :cpf,'
      '  rg = :rg,'
      '  datanascimento = :datanascimento,'
      '  ctps = :ctps,'
      '  cnh = :cnh,'
      '  datavencimento = :datavencimento,'
      '  datacadastro = :datacadastro,'
      '  dataalteracao = :dataalteracao,'
      '  dataadmissao = :dataadmissao,'
      '  datademissao = :datademissao,'
      '  observacao = :observacao'
      'WHERE'
      '  funcionario.idfuncionario = :OLD_idfuncionario')
    UseSequenceFieldForRefreshSQL = False
    Left = 233
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nome'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idcargo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'logradouro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'bairro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'complemento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idcidade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'email'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'telefone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'celular'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cpf'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rg'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datanascimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ctps'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cnh'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datavencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datacadastro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataalteracao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataadmissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datademissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'observacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idfuncionario'
        ParamType = ptUnknown
      end>
  end
  object QPais: TZQuery
    Connection = DB
    UpdateObject = UpdatePais
    Active = True
    SQL.Strings = (
      'select * from pais;')
    Params = <>
    Left = 32
    Top = 376
    object QPaisidpais: TIntegerField
      FieldName = 'idpais'
      Required = True
    end
    object QPaisdescricao: TWideStringField
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
    object QPaisddi: TWideStringField
      FieldName = 'ddi'
      Size = 4
    end
    object QPaissigla: TWideStringField
      FieldName = 'sigla'
      Size = 3
    end
    object QPaisdatacadastro: TDateField
      FieldName = 'datacadastro'
    end
    object QPaisdataalteracao: TDateField
      FieldName = 'dataalteracao'
    end
  end
  object DSPais: TDataSource
    DataSet = QPais
    Left = 128
    Top = 376
  end
  object UpdatePais: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM pais'
      'WHERE'
      '  pais.idpais = :OLD_idpais')
    InsertSQL.Strings = (
      'INSERT INTO pais'
      '  (descricao, ddi, datacadastro, dataalteracao, sigla)'
      'VALUES'
      '  (:descricao, :ddi, :datacadastro, :dataalteracao, :sigla)')
    ModifySQL.Strings = (
      'UPDATE pais SET'
      '  descricao = :descricao,'
      '  ddi = :ddi,'
      '  datacadastro = :datacadastro,'
      '  dataalteracao = :dataalteracao,'
      '  sigla = :sigla'
      'WHERE'
      '  pais.idpais = :OLD_idpais')
    UseSequenceFieldForRefreshSQL = False
    Left = 233
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ddi'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datacadastro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataalteracao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sigla'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idpais'
        ParamType = ptUnknown
      end>
  end
  object QContasReceber: TZQuery
    Connection = DB
    UpdateObject = UpdateContasReceber
    Active = True
    SQL.Strings = (
      'select * from contareceber;')
    Params = <>
    Left = 631
    Top = 144
    object QContasRecebernumnota: TIntegerField
      FieldName = 'numnota'
      Required = True
    end
    object QContasReceberserienota: TWideStringField
      FieldName = 'serienota'
      Required = True
      Size = 2
    end
    object QContasRecebernumparcela: TIntegerField
      FieldName = 'numparcela'
      Required = True
    end
    object QContasRecebercliente: TStringField
      FieldKind = fkLookup
      FieldName = 'cliente'
      LookupDataSet = QCliente
      LookupKeyFields = 'idcliente'
      LookupResultField = 'nome_razaosocial'
      KeyFields = 'idcliente'
      Lookup = True
    end
    object QContasReceberstatus: TWideStringField
      FieldName = 'status'
      Required = True
      Size = 15
    end
    object QContasRecebervalor: TFloatField
      FieldName = 'valor'
    end
    object QContasReceberjuros: TFloatField
      FieldName = 'juros'
    end
    object QContasRecebermulta: TFloatField
      FieldName = 'multa'
    end
    object QContasReceberdesconto: TFloatField
      FieldName = 'desconto'
    end
    object QContasReceberformapagamento: TStringField
      FieldKind = fkLookup
      FieldName = 'formapagamento'
      LookupDataSet = QFormaPagamento
      LookupKeyFields = 'idformapagamento'
      LookupResultField = 'descricao'
      KeyFields = 'idformapagamento'
      Size = 10
      Lookup = True
    end
    object QContasReceberfuncionário: TStringField
      FieldKind = fkLookup
      FieldName = 'funcion'#225'rio'
      LookupDataSet = QUsuario
      LookupKeyFields = 'idusuario'
      LookupResultField = 'login'
      KeyFields = 'idusuario'
      Lookup = True
    end
    object QContasReceberdatapagamento: TDateField
      FieldName = 'datapagamento'
    end
    object QContasReceberdatavencimento: TDateField
      FieldName = 'datavencimento'
    end
    object QContasReceberdataemissao: TDateField
      FieldName = 'dataemissao'
    end
    object QContasReceberdatacadastro: TDateField
      FieldName = 'datacadastro'
    end
    object QContasReceberdataalteracao: TDateField
      FieldName = 'dataalteracao'
    end
    object QContasReceberobservacao: TWideStringField
      FieldName = 'observacao'
      Size = 255
    end
    object QContasReceberidusuario: TIntegerField
      FieldName = 'idusuario'
      Required = True
    end
    object QContasReceberidformapagamento: TIntegerField
      FieldName = 'idformapagamento'
      Required = True
    end
    object QContasReceberidcliente: TIntegerField
      FieldName = 'idcliente'
      Required = True
    end
  end
  object DSContasReceber: TDataSource
    DataSet = QContasReceber
    Left = 737
    Top = 144
  end
  object UpdateContasReceber: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM contareceber'
      'WHERE'
      '  contareceber.numnota = :OLD_numnota AND'
      '  contareceber.serienota = :OLD_serienota AND'
      '  contareceber.numparcela = :OLD_numparcela')
    InsertSQL.Strings = (
      'INSERT INTO contareceber'
      
        '  (numnota, serienota, numparcela, idcliente, idformapagamento, ' +
        'idusuario, '
      
        '   dataemissao, datavencimento, datapagamento, valor, juros, mul' +
        'ta, desconto, '
      '   status, datacadastro, dataalteracao, observacao)'
      'VALUES'
      
        '  (:numnota, :serienota, :numparcela, :idcliente, :idformapagame' +
        'nto, :idusuario, '
      
        '   :dataemissao, :datavencimento, :datapagamento, :valor, :juros' +
        ', :multa, '
      
        '   :desconto, :status, :datacadastro, :dataalteracao, :observaca' +
        'o)')
    ModifySQL.Strings = (
      'UPDATE contareceber SET'
      '  numnota = :numnota,'
      '  serienota = :serienota,'
      '  numparcela = :numparcela,'
      '  idcliente = :idcliente,'
      '  idformapagamento = :idformapagamento,'
      '  idusuario = :idusuario,'
      '  dataemissao = :dataemissao,'
      '  datavencimento = :datavencimento,'
      '  datapagamento = :datapagamento,'
      '  valor = :valor,'
      '  juros = :juros,'
      '  multa = :multa,'
      '  desconto = :desconto,'
      '  status = :status,'
      '  datacadastro = :datacadastro,'
      '  dataalteracao = :dataalteracao,'
      '  observacao = :observacao'
      'WHERE'
      '  contareceber.numnota = :OLD_numnota AND'
      '  contareceber.serienota = :OLD_serienota AND'
      '  contareceber.numparcela = :OLD_numparcela')
    UseSequenceFieldForRefreshSQL = False
    Left = 857
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numnota'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'serienota'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numparcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idcliente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idformapagamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idusuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataemissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datavencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datapagamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'valor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'juros'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'multa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'desconto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datacadastro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataalteracao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'observacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_numnota'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_serienota'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_numparcela'
        ParamType = ptUnknown
      end>
  end
  object QUsuario: TZQuery
    Connection = DB
    UpdateObject = UpdateUsuario
    Active = True
    SQL.Strings = (
      'select * from usuario;')
    Params = <>
    Left = 32
    Top = 312
    object QUsuarioidusuario: TIntegerField
      FieldName = 'idusuario'
      Required = True
    end
    object QUsuariologin: TWideStringField
      FieldName = 'login'
      Required = True
      Size = 30
    end
    object QUsuariosenha: TWideStringField
      FieldName = 'senha'
      Required = True
      Size = 10
    end
    object QUsuariofuncionário: TStringField
      FieldKind = fkLookup
      FieldName = 'funcion'#225'rio'
      LookupDataSet = QFuncionario
      LookupKeyFields = 'idfuncionario'
      LookupResultField = 'nome'
      KeyFields = 'idfuncionario'
      Lookup = True
    end
    object QUsuariostatus: TWideStringField
      FieldName = 'status'
      Required = True
      Size = 15
    end
    object QUsuarioperfil: TWideStringField
      FieldName = 'perfil'
      ReadOnly = True
      Size = 3
    end
    object QUsuariodatacadastro: TDateField
      FieldName = 'datacadastro'
      Required = True
    end
    object QUsuariodataalteracao: TDateField
      FieldName = 'dataalteracao'
      Required = True
    end
    object QUsuarioidfuncionario: TIntegerField
      FieldName = 'idfuncionario'
      Required = True
    end
  end
  object DSUsuario: TDataSource
    DataSet = QUsuario
    Left = 128
    Top = 312
  end
  object UpdateUsuario: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM usuario'
      'WHERE'
      '  usuario.idusuario = :OLD_idusuario')
    InsertSQL.Strings = (
      'INSERT INTO usuario'
      
        '  (login, senha, idfuncionario, status, datacadastro, dataaltera' +
        'cao, perfil)'
      'VALUES'
      
        '  (:login, :senha, :idfuncionario, :status, :datacadastro, :data' +
        'alteracao, '
      '   :perfil)')
    ModifySQL.Strings = (
      'UPDATE usuario SET'
      '  login = :login,'
      '  senha = :senha,'
      '  idfuncionario = :idfuncionario,'
      '  status = :status,'
      '  datacadastro = :datacadastro,'
      '  dataalteracao = :dataalteracao,'
      '  perfil = :perfil'
      'WHERE'
      '  usuario.idusuario = :OLD_idusuario')
    UseSequenceFieldForRefreshSQL = False
    Left = 233
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'login'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'senha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idfuncionario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datacadastro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataalteracao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'perfil'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idusuario'
        ParamType = ptUnknown
      end>
  end
  object QProdutoCompra: TZQuery
    Connection = DB
    UpdateObject = UpdateProdutoCompra
    Active = True
    SQL.Strings = (
      'select * from produto_compra;')
    Params = <>
    Left = 332
    Top = 368
    object QProdutoCompranumnota: TIntegerField
      FieldName = 'numnota'
      Required = True
    end
    object QProdutoCompraserienota: TWideStringField
      FieldName = 'serienota'
      Required = True
      Size = 2
    end
    object QProdutoCompraidfornecedor: TIntegerField
      FieldName = 'idfornecedor'
      Required = True
    end
    object QProdutoCompraidproduto: TIntegerField
      FieldName = 'idproduto'
      Required = True
    end
    object QProdutoCompraidcompra: TIntegerField
      FieldName = 'idcompra'
      Required = True
    end
    object QProdutoComprancm_sh: TWideStringField
      FieldName = 'ncm_sh'
      Size = 8
    end
    object QProdutoCompracst: TIntegerField
      FieldName = 'cst'
    end
    object QProdutoCompracpof: TIntegerField
      FieldName = 'cpof'
      Required = True
    end
    object QProdutoCompraunidade: TWideStringField
      FieldName = 'unidade'
      Required = True
      Size = 3
    end
    object QProdutoCompraquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
    end
    object QProdutoCompraprecocusto: TFloatField
      FieldName = 'precocusto'
      Required = True
    end
    object QProdutoCompradesconto: TFloatField
      FieldName = 'desconto'
    end
    object QProdutoCompravalortotal: TFloatField
      FieldName = 'valortotal'
      Required = True
    end
    object QProdutoComprabaseicms: TFloatField
      FieldName = 'baseicms'
      Required = True
    end
    object QProdutoCompravaloricms: TFloatField
      FieldName = 'valoricms'
      Required = True
    end
    object QProdutoCompravaloripi: TFloatField
      FieldName = 'valoripi'
      Required = True
    end
    object QProdutoCompraicms: TFloatField
      FieldName = 'icms'
      Required = True
    end
    object QProdutoCompraipi: TFloatField
      FieldName = 'ipi'
      Required = True
    end
  end
  object DSProdutoCompra: TDataSource
    DataSet = QProdutoCompra
    Left = 423
    Top = 368
  end
  object UpdateProdutoCompra: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM produto_compra'
      'WHERE'
      '  produto_compra.numnota = :OLD_numnota AND'
      '  produto_compra.serienota = :OLD_serienota AND'
      '  produto_compra.idfornecedor = :OLD_idfornecedor AND'
      '  produto_compra.idproduto = :OLD_idproduto AND'
      '  produto_compra.idcompra = :OLD_idcompra')
    InsertSQL.Strings = (
      'INSERT INTO produto_compra'
      
        '  (numnota, serienota, idfornecedor, idproduto, idcompra, cpof, ' +
        'unidade, '
      
        '   quantidade, precocusto, desconto, valortotal, baseicms, valor' +
        'icms, valoripi, '
      '   icms, ipi, ncm_sh, cst)'
      'VALUES'
      
        '  (:numnota, :serienota, :idfornecedor, :idproduto, :idcompra, :' +
        'cpof, :unidade, '
      
        '   :quantidade, :precocusto, :desconto, :valortotal, :baseicms, ' +
        ':valoricms, '
      '   :valoripi, :icms, :ipi, :ncm_sh, :cst)')
    ModifySQL.Strings = (
      'UPDATE produto_compra SET'
      '  numnota = :numnota,'
      '  serienota = :serienota,'
      '  idfornecedor = :idfornecedor,'
      '  idproduto = :idproduto,'
      '  idcompra = :idcompra,'
      '  cpof = :cpof,'
      '  unidade = :unidade,'
      '  quantidade = :quantidade,'
      '  precocusto = :precocusto,'
      '  desconto = :desconto,'
      '  valortotal = :valortotal,'
      '  baseicms = :baseicms,'
      '  valoricms = :valoricms,'
      '  valoripi = :valoripi,'
      '  icms = :icms,'
      '  ipi = :ipi,'
      '  ncm_sh = :ncm_sh,'
      '  cst = :cst'
      'WHERE'
      '  produto_compra.numnota = :OLD_numnota AND'
      '  produto_compra.serienota = :OLD_serienota AND'
      '  produto_compra.idfornecedor = :OLD_idfornecedor AND'
      '  produto_compra.idproduto = :OLD_idproduto AND'
      '  produto_compra.idcompra = :OLD_idcompra')
    UseSequenceFieldForRefreshSQL = False
    Left = 528
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numnota'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'serienota'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idfornecedor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idproduto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idcompra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cpof'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'unidade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'quantidade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'precocusto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'desconto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'valortotal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'baseicms'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'valoricms'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'valoripi'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'icms'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ipi'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ncm_sh'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cst'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_numnota'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_serienota'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idfornecedor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idproduto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idcompra'
        ParamType = ptUnknown
      end>
  end
  object QCompra: TZQuery
    Connection = DB
    UpdateObject = UpdateCompra
    Active = True
    SQL.Strings = (
      'select * from compra;')
    Params = <>
    Left = 332
    Top = 312
    object QCompraidcompra: TIntegerField
      FieldName = 'idcompra'
      Required = True
    end
    object QCompranumnota: TIntegerField
      FieldName = 'numnota'
      Required = True
    end
    object QCompraserienota: TWideStringField
      FieldName = 'serienota'
      Required = True
      Size = 2
    end
    object QCompraidfornecedor: TIntegerField
      FieldName = 'idfornecedor'
      Required = True
    end
    object QComprafornecedor: TStringField
      FieldKind = fkLookup
      FieldName = 'fornecedor'
      LookupDataSet = QFornecedor
      LookupKeyFields = 'idfornecedor'
      LookupResultField = 'nome_razaosocial'
      KeyFields = 'idfornecedor'
      Size = 30
      Lookup = True
    end
    object QCompracondiçãoPgto: TStringField
      FieldKind = fkLookup
      FieldName = 'condi'#231#227'oPgto'
      LookupDataSet = QCondicaoPagamento
      LookupKeyFields = 'idcondicaopagamento'
      LookupResultField = 'descricao'
      KeyFields = 'idcondicaopagamento'
      Lookup = True
    end
    object QComprastatus: TWideStringField
      FieldName = 'status'
      Required = True
      Size = 15
    end
    object QComprabase_icms: TFloatField
      FieldName = 'base_icms'
      Required = True
    end
    object QCompravalor_frete: TFloatField
      FieldName = 'valor_frete'
    end
    object QCompratotal_icms: TFloatField
      FieldName = 'total_icms'
    end
    object QCompratotal_ipi: TFloatField
      FieldName = 'total_ipi'
    end
    object QCompravalor_desconto: TFloatField
      FieldName = 'valor_desconto'
      Required = True
    end
    object QCompratotal_produto: TFloatField
      FieldName = 'total_produto'
      Required = True
    end
    object QComprafuncionário: TStringField
      FieldKind = fkLookup
      FieldName = 'funcion'#225'rio'
      LookupDataSet = QUsuario
      LookupKeyFields = 'idusuario'
      LookupResultField = 'login'
      KeyFields = 'idusuario'
      Lookup = True
    end
    object QCompratotal_nota: TFloatField
      FieldName = 'total_nota'
      Required = True
    end
    object QCompratransportadora: TStringField
      FieldKind = fkLookup
      FieldName = 'transportadora'
      LookupDataSet = QFornecedor
      LookupKeyFields = 'idfornecedor'
      LookupResultField = 'nome_razaosocial'
      KeyFields = 'idtransportadora'
      Size = 30
      Lookup = True
    end
    object QCompratipofrete: TIntegerField
      FieldName = 'tipofrete'
      Required = True
    end
    object QCompradatacompra: TDateField
      FieldName = 'datacompra'
      Required = True
    end
    object QCompradataemissao: TDateField
      FieldName = 'dataemissao'
      Required = True
    end
    object QCompradatacadastro: TDateField
      FieldName = 'datacadastro'
      Required = True
    end
    object QCompradataalteracao: TDateField
      FieldName = 'dataalteracao'
      Required = True
    end
    object QCompraobservacao: TWideStringField
      FieldName = 'observacao'
      Size = 255
    end
    object QCompraidcondicaopagamento: TIntegerField
      FieldName = 'idcondicaopagamento'
      Required = True
    end
    object QCompraidtransportadora: TIntegerField
      FieldName = 'idtransportadora'
    end
    object QCompraidusuario: TIntegerField
      FieldName = 'idusuario'
      Required = True
    end
  end
  object DSCompra: TDataSource
    DataSet = QCompra
    Left = 423
    Top = 312
  end
  object UpdateCompra: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM compra'
      'WHERE'
      '  compra.numnota = :OLD_numnota AND'
      '  compra.serienota = :OLD_serienota AND'
      '  compra.idfornecedor = :OLD_idfornecedor')
    InsertSQL.Strings = (
      'INSERT INTO compra'
      
        '  (numnota, serienota, idfornecedor, idcondicaopagamento, idusua' +
        'rio, '
      'idtransportadora, '
      
        '   tipofrete, base_icms, valor_frete, total_icms, total_ipi, val' +
        'or_desconto, '
      '   total_produto, total_nota, status, datacompra, dataemissao, '
      'datacadastro, '
      '   dataalteracao, observacao)'
      'VALUES'
      
        '  (:numnota, :serienota, :idfornecedor, :idcondicaopagamento, :i' +
        'dusuario, '
      
        '   :idtransportadora, :tipofrete, :base_icms, :valor_frete, :tot' +
        'al_icms, '
      
        '   :total_ipi, :valor_desconto, :total_produto, :total_nota, :st' +
        'atus, '
      ':datacompra, '
      '   :dataemissao, :datacadastro, :dataalteracao, :observacao)')
    ModifySQL.Strings = (
      'UPDATE compra SET'
      '  numnota = :numnota,'
      '  serienota = :serienota,'
      '  idfornecedor = :idfornecedor,'
      '  idcondicaopagamento = :idcondicaopagamento,'
      '  idusuario = :idusuario,'
      '  idtransportadora = :idtransportadora,'
      '  tipofrete = :tipofrete,'
      '  base_icms = :base_icms,'
      '  valor_frete = :valor_frete,'
      '  total_icms = :total_icms,'
      '  total_ipi = :total_ipi,'
      '  valor_desconto = :valor_desconto,'
      '  total_produto = :total_produto,'
      '  total_nota = :total_nota,'
      '  status = :status,'
      '  datacompra = :datacompra,'
      '  dataemissao = :dataemissao,'
      '  datacadastro = :datacadastro,'
      '  dataalteracao = :dataalteracao,'
      '  observacao = :observacao'
      'WHERE'
      '  compra.numnota = :OLD_numnota AND'
      '  compra.serienota = :OLD_serienota AND'
      '  compra.idfornecedor = :OLD_idfornecedor')
    UseSequenceFieldForRefreshSQL = False
    Left = 528
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numnota'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'serienota'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idfornecedor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idcondicaopagamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idusuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idtransportadora'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipofrete'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'base_icms'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'valor_frete'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'total_icms'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'total_ipi'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'valor_desconto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'total_produto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'total_nota'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datacompra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataemissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datacadastro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataalteracao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'observacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_numnota'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_serienota'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idfornecedor'
        ParamType = ptUnknown
      end>
  end
  object QContasPagar: TZQuery
    Connection = DB
    UpdateObject = UpdateContasPagar
    Active = True
    SQL.Strings = (
      'select * from contapagar;')
    Params = <>
    Left = 631
    Top = 88
    object QContasPagarnumnota: TIntegerField
      FieldName = 'numnota'
      Required = True
    end
    object QContasPagarserienota: TWideStringField
      FieldName = 'serienota'
      Required = True
      Size = 2
    end
    object QContasPagarnumparcela: TIntegerField
      FieldName = 'numparcela'
      Required = True
    end
    object QContasPagaridfornecedor: TIntegerField
      FieldName = 'idfornecedor'
      Required = True
    end
    object QContasPagarfornecedor: TStringField
      FieldKind = fkLookup
      FieldName = 'fornecedor'
      LookupDataSet = QFornecedor
      LookupKeyFields = 'idfornecedor'
      LookupResultField = 'nome_razaosocial'
      KeyFields = 'idfornecedor'
      Size = 30
      Lookup = True
    end
    object QContasPagarformaPgto: TStringField
      FieldKind = fkLookup
      FieldName = 'formaPgto'
      LookupDataSet = QFormaPagamento
      LookupKeyFields = 'idformapagamento'
      LookupResultField = 'descricao'
      KeyFields = 'idformapagamento'
      Lookup = True
    end
    object QContasPagarstatus: TWideStringField
      FieldName = 'status'
      Size = 15
    end
    object QContasPagarvalor: TFloatField
      FieldName = 'valor'
    end
    object QContasPagarmulta: TFloatField
      FieldName = 'multa'
    end
    object QContasPagarjuros: TFloatField
      FieldName = 'juros'
    end
    object QContasPagardesconto: TFloatField
      FieldName = 'desconto'
    end
    object QContasPagarfuncionário: TStringField
      FieldKind = fkLookup
      FieldName = 'funcion'#225'rio'
      LookupDataSet = QUsuario
      LookupKeyFields = 'idusuario'
      LookupResultField = 'login'
      KeyFields = 'idusuario'
      Lookup = True
    end
    object QContasPagardatapagamento: TDateField
      FieldName = 'datapagamento'
    end
    object QContasPagardatavencimento: TDateField
      FieldName = 'datavencimento'
      Required = True
    end
    object QContasPagardataemissao: TDateField
      FieldName = 'dataemissao'
      Required = True
    end
    object QContasPagardatacadastro: TDateField
      FieldName = 'datacadastro'
    end
    object QContasPagardataalteracao: TDateField
      FieldName = 'dataalteracao'
    end
    object QContasPagarobservacao: TWideStringField
      FieldName = 'observacao'
      Size = 255
    end
    object QContasPagaridcontapagar: TIntegerField
      FieldName = 'idcontapagar'
      Required = True
    end
    object QContasPagaridcompra: TIntegerField
      FieldName = 'idcompra'
    end
    object QContasPagaridusuario: TIntegerField
      FieldName = 'idusuario'
      Required = True
    end
    object QContasPagaridformapagamento: TIntegerField
      FieldName = 'idformapagamento'
      Required = True
    end
  end
  object DSContasPagar: TDataSource
    DataSet = QContasPagar
    Left = 737
    Top = 88
  end
  object UpdateContasPagar: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM contapagar'
      'WHERE'
      '  contapagar.numnota = :OLD_numnota AND'
      '  contapagar.serienota = :OLD_serienota AND'
      '  contapagar.numparcela = :OLD_numparcela AND'
      '  contapagar.idfornecedor = :OLD_idfornecedor')
    InsertSQL.Strings = (
      'INSERT INTO contapagar'
      '  (numnota, serienota, numparcela, idfornecedor, idusuario, '
      'idformapagamento, '
      
        '   dataemissao, datavencimento, datapagamento, valor, multa, jur' +
        'os, '
      'desconto, '
      '   status, observacao, idcompra)'
      'VALUES'
      
        '  (:numnota, :serienota, :numparcela, :idfornecedor, :idusuario,' +
        ' '
      ':idformapagamento, '
      
        '   :dataemissao, :datavencimento, :datapagamento, :valor, :multa' +
        ', :juros, '
      '   :desconto, :status, :observacao, :idcompra)')
    ModifySQL.Strings = (
      'UPDATE contapagar SET'
      '  numnota = :numnota,'
      '  serienota = :serienota,'
      '  numparcela = :numparcela,'
      '  idfornecedor = :idfornecedor,'
      '  idusuario = :idusuario,'
      '  idformapagamento = :idformapagamento,'
      '  dataemissao = :dataemissao,'
      '  datavencimento = :datavencimento,'
      '  datapagamento = :datapagamento,'
      '  valor = :valor,'
      '  multa = :multa,'
      '  juros = :juros,'
      '  desconto = :desconto,'
      '  status = :status,'
      '  observacao = :observacao,'
      '  idcompra =:idcompra'
      'WHERE'
      '  contapagar.numnota = :OLD_numnota AND'
      '  contapagar.serienota = :OLD_serienota AND'
      '  contapagar.numparcela = :OLD_numparcela AND'
      '  contapagar.idfornecedor = :OLD_idfornecedor'
      ''
      '')
    UseSequenceFieldForRefreshSQL = False
    Left = 857
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numnota'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'serienota'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numparcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idfornecedor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idusuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idformapagamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataemissao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datavencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datapagamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'valor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'multa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'juros'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'desconto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'observacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idcompra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_numnota'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_serienota'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_numparcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idfornecedor'
        ParamType = ptUnknown
      end>
  end
  object QUnidade: TZQuery
    Connection = DB
    UpdateObject = UpdateUnidade
    Active = True
    SQL.Strings = (
      'select * from unidade;')
    Params = <>
    Left = 332
    Top = 256
    object QUnidadeidunidade: TIntegerField
      FieldName = 'idunidade'
      Required = True
    end
    object QUnidadedescricao: TWideStringField
      FieldName = 'descricao'
      Required = True
    end
    object QUnidadedatacadastro: TDateField
      FieldName = 'datacadastro'
    end
    object QUnidadedataalteracao: TDateField
      FieldName = 'dataalteracao'
    end
  end
  object DSUnidade: TDataSource
    DataSet = QUnidade
    Left = 423
    Top = 256
  end
  object UpdateUnidade: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM unidade'
      'WHERE'
      '  unidade.idunidade = :OLD_idunidade')
    InsertSQL.Strings = (
      'INSERT INTO unidade'
      '  (descricao, datacadastro, dataalteracao)'
      'VALUES'
      '  (:descricao, :datacadastro, :dataalteracao)')
    ModifySQL.Strings = (
      'UPDATE unidade SET'
      '  descricao = :descricao,'
      '  datacadastro = :datacadastro,'
      '  dataalteracao = :dataalteracao'
      'WHERE'
      '  unidade.idunidade = :OLD_idunidade')
    UseSequenceFieldForRefreshSQL = False
    Left = 528
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datacadastro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataalteracao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idunidade'
        ParamType = ptUnknown
      end>
  end
  object QProdutoFornecedor: TZQuery
    Connection = DB
    UpdateObject = UpdateProdutoFornecedor
    Active = True
    SQL.Strings = (
      'select * from produto_fornecedor;')
    Params = <>
    Left = 630
    Top = 368
    object QProdutoFornecedoridfornecedor: TIntegerField
      FieldName = 'idfornecedor'
      Required = True
    end
    object QProdutoFornecedoridproduto: TIntegerField
      FieldName = 'idproduto'
      Required = True
    end
  end
  object DSProdutoFornecedor: TDataSource
    DataSet = QProdutoFornecedor
    Left = 737
    Top = 368
  end
  object UpdateProdutoFornecedor: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM produto_fornecedor'
      'WHERE'
      '  produto_fornecedor.idfornecedor = :OLD_idfornecedor')
    InsertSQL.Strings = (
      'INSERT INTO produto_fornecedor'
      '  (idfornecedor, idproduto)'
      'VALUES'
      '  (:idfornecedor, :idproduto)')
    ModifySQL.Strings = (
      'UPDATE produto_fornecedor SET'
      '  idfornecedor = :idfornecedor,'
      '  idproduto = :idproduto'
      'WHERE'
      '  produto_fornecedor.idfornecedor = :OLD_idfornecedor')
    UseSequenceFieldForRefreshSQL = False
    Left = 857
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idfornecedor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idproduto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idfornecedor'
        ParamType = ptUnknown
      end>
  end
  object QGenerica: TZQuery
    Connection = DB
    Active = True
    SQL.Strings = (
      'select *from pais;')
    Params = <>
    Left = 160
    Top = 16
  end
  object QTransportadora: TZQuery
    Connection = DB
    UpdateObject = UpdateTransportadora
    SQL.Strings = (
      'select * from transportadora;')
    Params = <>
    Left = 32
    Top = 544
    object QTransportadoraidtransportadora: TIntegerField
      FieldName = 'idtransportadora'
      Required = True
    end
    object QTransportadorarazaosocial: TWideStringField
      FieldName = 'razaosocial'
      Required = True
      Size = 100
    end
    object QTransportadoralogradouro: TWideStringField
      FieldName = 'logradouro'
      Required = True
      Size = 100
    end
    object QTransportadoranumero: TWideStringField
      FieldName = 'numero'
      Required = True
      Size = 10
    end
    object QTransportadoracep: TWideStringField
      FieldName = 'cep'
      Required = True
      Size = 9
    end
    object QTransportadorabairro: TWideStringField
      FieldName = 'bairro'
      Size = 50
    end
    object QTransportadoracomplemento: TWideStringField
      FieldName = 'complemento'
      Size = 50
    end
    object QTransportadoraidcidade: TIntegerField
      FieldName = 'idcidade'
      Required = True
    end
    object QTransportadoraemail: TWideStringField
      FieldName = 'email'
      Required = True
      Size = 100
    end
    object QTransportadoratelefone: TWideStringField
      FieldName = 'telefone'
      Required = True
      Size = 13
    end
    object QTransportadoracelular: TWideStringField
      FieldName = 'celular'
      Required = True
      Size = 13
    end
    object QTransportadoracnpj: TWideStringField
      FieldName = 'cnpj'
      Required = True
      Size = 18
    end
    object QTransportadoraie: TWideStringField
      FieldName = 'ie'
      Size = 10
    end
    object QTransportadoradatafundacao: TDateField
      FieldName = 'datafundacao'
      Required = True
    end
    object QTransportadoraidcondicaopagamento: TIntegerField
      FieldName = 'idcondicaopagamento'
    end
    object QTransportadoradatacadastro: TDateField
      FieldName = 'datacadastro'
    end
    object QTransportadoradataalteracao: TDateField
      FieldName = 'dataalteracao'
    end
    object QTransportadoraobservacao: TWideStringField
      FieldName = 'observacao'
      Size = 255
    end
  end
  object DSTransportadora: TDataSource
    DataSet = QTransportadora
    Left = 129
    Top = 544
  end
  object UpdateTransportadora: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM transportadora'
      'WHERE'
      '  transportadora.idtransportadora = :OLD_idtransportadora')
    InsertSQL.Strings = (
      'INSERT INTO transportadora'
      
        '  (razaosocial, logradouro, numero, cep, bairro, complemento, id' +
        'cidade, '
      
        '   email, telefone, celular, cnpj, ie, datafundacao, idcondicaop' +
        'agamento, '
      '   datacadastro, dataalteracao, observacao)'
      'VALUES'
      
        '  (:razaosocial, :logradouro, :numero, :cep, :bairro, :complemen' +
        'to, :idcidade, '
      
        '   :email, :telefone, :celular, :cnpj, :ie, :datafundacao, :idco' +
        'ndicaopagamento, '
      '   :datacadastro, :dataalteracao, :observacao)')
    ModifySQL.Strings = (
      'UPDATE transportadora SET'
      '  razaosocial = :razaosocial,'
      '  logradouro = :logradouro,'
      '  numero = :numero,'
      '  cep = :cep,'
      '  bairro = :bairro,'
      '  complemento = :complemento,'
      '  idcidade = :idcidade,'
      '  email = :email,'
      '  telefone = :telefone,'
      '  celular = :celular,'
      '  cnpj = :cnpj,'
      '  ie = :ie,'
      '  datafundacao = :datafundacao,'
      '  idcondicaopagamento = :idcondicaopagamento,'
      '  datacadastro = :datacadastro,'
      '  dataalteracao = :dataalteracao,'
      '  observacao = :observacao'
      'WHERE'
      '  transportadora.idtransportadora = :OLD_idtransportadora')
    UseSequenceFieldForRefreshSQL = False
    Left = 233
    Top = 544
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'razaosocial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'logradouro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'bairro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'complemento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idcidade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'email'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'telefone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'celular'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cnpj'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ie'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datafundacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idcondicaopagamento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datacadastro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataalteracao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'observacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idtransportadora'
        ParamType = ptUnknown
      end>
  end
  object QVeiculo: TZQuery
    Connection = DB
    UpdateObject = UpdateVeiculo
    Active = True
    SQL.Strings = (
      'select * from veiculo;')
    Params = <>
    Left = 336
    Top = 544
    object QVeiculoidveiculo: TIntegerField
      FieldName = 'idveiculo'
      Required = True
    end
    object QVeiculoantt: TWideStringField
      FieldName = 'antt'
      Required = True
    end
    object QVeiculoplaca: TWideStringField
      FieldName = 'placa'
      Required = True
      Size = 8
    end
    object QVeiculouf: TWideStringField
      FieldName = 'uf'
      Required = True
      Size = 2
    end
    object QVeiculodatacadastro: TDateField
      FieldName = 'datacadastro'
    end
    object QVeiculodataalteracao: TDateField
      FieldName = 'dataalteracao'
    end
  end
  object UpdateVeiculo: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM veiculo'
      'WHERE'
      '  veiculo.idveiculo = :OLD_idveiculo')
    InsertSQL.Strings = (
      'INSERT INTO veiculo'
      '  (antt, placa, uf, datacadastro, dataalteracao)'
      'VALUES'
      '  (:antt, :placa, :uf, :datacadastro, :dataalteracao)')
    ModifySQL.Strings = (
      'UPDATE veiculo SET'
      '  antt = :antt,'
      '  placa = :placa,'
      '  uf = :uf,'
      '  datacadastro = :datacadastro,'
      '  dataalteracao = :dataalteracao'
      'WHERE'
      '  veiculo.idveiculo = :OLD_idveiculo')
    UseSequenceFieldForRefreshSQL = False
    Left = 528
    Top = 544
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'antt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'placa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'uf'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datacadastro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataalteracao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idveiculo'
        ParamType = ptUnknown
      end>
  end
  object DSVeiculo: TDataSource
    DataSet = QVeiculo
    Left = 424
    Top = 544
  end
  object QNcm: TZQuery
    Connection = DB
    UpdateObject = UpdateNcm
    Active = True
    SQL.Strings = (
      'select * from ncm;')
    Params = <>
    Left = 624
    Top = 424
    object QNcmidncm: TIntegerField
      FieldName = 'idncm'
      Required = True
    end
    object QNcmnumero: TIntegerField
      FieldName = 'numero'
      Required = True
    end
    object QNcmporcentagem_ipi: TFloatField
      FieldName = 'porcentagem_ipi'
    end
    object QNcmdatacadastro: TDateField
      FieldName = 'datacadastro'
    end
    object QNcmdataalteracao: TDateField
      FieldName = 'dataalteracao'
    end
  end
  object DSNcm: TDataSource
    DataSet = QNcm
    Left = 736
    Top = 424
  end
  object UpdateNcm: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM ncm'
      'WHERE'
      '  ncm.idncm = :OLD_idncm')
    InsertSQL.Strings = (
      'INSERT INTO ncm'
      '  (numero, porcentagem_ipi, datacadastro, dataalteracao)'
      'VALUES'
      '  (:numero, :porcentagem_ipi, :datacadastro, :dataalteracao)')
    ModifySQL.Strings = (
      'UPDATE ncm SET'
      '  numero = :numero,'
      '  porcentagem_ipi = :porcentagem_ipi,'
      '  datacadastro = :datacadastro,'
      '  dataalteracao = :dataalteracao'
      'WHERE'
      '  ncm.idncm = :OLD_idncm')
    UseSequenceFieldForRefreshSQL = False
    Left = 856
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'porcentagem_ipi'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datacadastro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataalteracao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idncm'
        ParamType = ptUnknown
      end>
  end
  object QCfop: TZQuery
    Connection = DB
    UpdateObject = UpdateCfop
    Active = True
    SQL.Strings = (
      'select * from cfop;')
    Params = <>
    Left = 624
    Top = 488
    object QCfopidcfop: TIntegerField
      FieldName = 'idcfop'
      Required = True
    end
    object QCfopnome: TWideStringField
      FieldName = 'nome'
      Required = True
      Size = 100
    end
    object QCfopnumero: TIntegerField
      FieldName = 'numero'
    end
    object QCfopdatacadastro: TDateField
      FieldName = 'datacadastro'
    end
    object QCfopdataalteracao: TDateField
      FieldName = 'dataalteracao'
    end
  end
  object DSCfop: TDataSource
    DataSet = QCfop
    Left = 736
    Top = 488
  end
  object UpdateCfop: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM cfop'
      'WHERE'
      '  cfop.idcfop = :OLD_idcfop')
    InsertSQL.Strings = (
      'INSERT INTO cfop'
      '  (nome, numero, datacadastro, dataalteracao)'
      'VALUES'
      '  (:nome, :numero, :datacadastro, :dataalteracao)')
    ModifySQL.Strings = (
      'UPDATE cfop SET'
      '  nome = :nome,'
      '  numero = :numero,'
      '  datacadastro = :datacadastro,'
      '  dataalteracao = :dataalteracao'
      'WHERE'
      '  cfop.idcfop = :OLD_idcfop')
    UseSequenceFieldForRefreshSQL = False
    Left = 856
    Top = 488
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nome'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'datacadastro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataalteracao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idcfop'
        ParamType = ptUnknown
      end>
  end
end
