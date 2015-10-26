unit UDaoCliente;

interface
      uses uDao, DB, SysUtils, Messages, UCliente, UEndereco, UDaoCidade,
      UDaoCondicaoPagamento;
      type DaoCliente = class(Dao)
      private

      protected
         umCliente    : Cliente;
         umEndereco   : Endereco;
         umaDaoCidade : DaoCidade;
         umaDaoCondicaoPagamento : DaoCondicaoPagamento;
      public
          Constructor CrieObjeto;
          Destructor Destrua_se;
          function Salvar(obj:TObject): string;      override;
          function GetDS : TDataSource;              override;
          function Carrega(obj:TObject): TObject;    override;
          function Buscar(obj : TObject) : Boolean;  override;
          function Excluir(obj : TObject) : string ; override;
          function VerificaCPF_CNPJ (obj : TObject) : Boolean;
          procedure AtualizaGrid;
          procedure Ordena(campo: string);
end;

implementation

{ DaoCliente }

function DaoCliente.Buscar(obj: TObject): Boolean;
var
    prim: Boolean;
    sql, e, onde: string;
    umCliente: Cliente;
begin
    e := ' and ';
    onde := ' where';
    prim := true;
    umCliente := Cliente(obj);
    sql := 'select * from cliente';
    if umCliente.getId <> 0 then
    begin
        if prim then  //SE FOR O PRIMEIRO, SETA COMO FLAG COMO FALSO PQ É O PRIMEIRO
        begin
            prim := false;
            sql := sql+onde;
        end
        else //SE NAO, COLOCA CLAUSULA AND PARA JUNTAR CONDIÇOES
            sql := sql+e;
        sql := sql+' idcliente = '+inttostr(umCliente.getId); //COLOCA CONDIÇAO NO SQL
    end;
    if umCliente.getNome_RazaoSoCial <> '' then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' nome_razaosocial like '+quotedstr('%'+umCliente.getNome_RazaoSoCial+'%');
    end;
    if umCliente.getTelefone <> '' then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' telefone like '+quotedstr('%'+umCliente.getTelefone+'%');
    end;
    if umCliente.getCPF_CNPJ <> '' then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' cpf_cnpj = '''+umCliente.getCPF_CNPJ+'''';
    end;
    with umDM do
    begin
        QCliente.Close;
        QCliente.sql.Text := sql+' order by idcliente';
        QCliente.Open;
        if QCliente.RecordCount > 0 then
          result := True
        else
          result := false;
    end;
end;

function DaoCliente.VerificaCPF_CNPJ (obj : TObject) : Boolean;
var sql : string;
    umCliente : Cliente;
begin
  umCliente := Cliente(obj);
  sql := 'select * from cliente where cpf_cnpj = '''+umCliente.getCPF_CNPJ+'''';
  with umDM do
  begin
    QCliente.Close;
    QCliente.sql.Text := sql+' order by idcliente';
    QCliente.Open;
    if QCliente.RecordCount > 0 then
      result := True
    else
      result := false;
  end;
end;

procedure DaoCliente.AtualizaGrid;
begin
  with umDM do
    begin
        QCliente.Close;
        QCliente.sql.Text := 'select * from cliente order by idcliente';
        QCliente.Open;
    end;
end;

function DaoCliente.Carrega(obj: TObject): TObject;
var
    umCliente  : Cliente;
    umEndereco : Endereco;
begin
    umCliente := Cliente(obj);
    umEndereco := Endereco.CrieObjeto;
    with umDM do
    begin
        if not QCliente.Active then
            QCliente.Open;

        if umCliente.getId <> 0 then
        begin
          QCliente.Close;
          QCliente.SQL.Text := 'select * from cliente where idcliente = '+IntToStr(umCliente.getId);
          QCliente.Open;
        end;

        umCliente.setId(QClienteidcliente.AsInteger);
        umCliente.setNome_RazaoSoCial(QClientenome_razaosocial.AsString);
        //Endereço
        umEndereco.setLogradouro(QClientelogradouro.AsString);
        umEndereco.setNumero(QClientenumero.AsString);
        umEndereco.setCEP(QClientecep.AsString);
        umEndereco.setBairro(QClientebairro.AsString);
        umEndereco.setComplemento(QClientecomplemento.AsString);
        umCliente.setumEndereco(umEndereco);

        umCliente.setEmail(QClienteemail.AsString);
        umCliente.setTelefone(QClientetelefone.AsString);
        umCliente.setCelular(QClientecelular.AsString);
        umCliente.setCPF_CNPJ(QClientecpf_cnpj.AsString);
        umCliente.setRG_IE(QClienterg_ie.AsString);
        umCliente.setTipoPessoa(QClientetipopessoa.AsString);
        umCliente.setDataNasc_Fund(QClientedatanasc_fund.AsDateTime);
        umCliente.setDataCadastro(QClientedatacadastro.AsDateTime);
        umCliente.setDataUltAlteracao(QClientedataalteracao.AsDateTime);
        umCliente.setObservacao(QClienteobservacao.AsString);
        //Busca a Cidade referente ao Cliente
        umCliente.getumEndereco.getumaCidade.setId(QClienteidcidade.AsInteger);
        umaDaoCidade.Carrega(umCliente.getumEndereco.getumaCidade);
        //Busca a Condicao de Pagamento referente ao Cliente
        umCliente.getUmaCondicaoPgto.setId(QClienteidcondicaopagamento.AsInteger);
        umaDaoCondicaoPagamento.Carrega(umCliente.getUmaCondicaoPgto);
    end;
    result := umCliente;
    Self.AtualizaGrid;
end;

constructor DaoCliente.CrieObjeto;
begin
    inherited;
    umaDaoCidade := DaoCidade.CrieObjeto;
    umaDaoCondicaoPagamento := DaoCondicaoPagamento.CrieObjeto;
end;

destructor DaoCliente.Destrua_se;
begin
    inherited;
end;

function DaoCliente.Excluir(obj: TObject): string;
var
    umCliente: Cliente;
begin
    umCliente := Cliente(obj);
    with umDM do
    begin
        try
            beginTrans;
            QCliente.SQL := UpdateCliente.DeleteSQL;
            QCliente.Params.ParamByName('OLD_idcliente').Value := umCliente.getId;
            QCliente.ExecSQL;
            Commit;
            result := 'Cliente excluído com sucesso!';
        except
            on e:Exception do
            begin
                rollback;
                if pos('violates foreign key',e.Message)>0 then
                    result := 'Ocorreu um erro! O Cliente não pode ser excluído pois ja está sendo usado pelo sistema.'
                else
                    result := 'Ocorreu um erro! Cliente não foi excluído. Erro: '+e.Message;
            end;
        end;
    end;
    AtualizaGrid;
end;

function DaoCliente.GetDS: TDataSource;
begin
    AtualizaGrid;
    result := umDM.DSCliente;
end;

procedure DaoCliente.Ordena(campo: string);
begin
    umDM.QCliente.IndexFieldNames := campo;
end;

function DaoCliente.Salvar(obj: TObject): string;
var
    umCliente : Cliente;
begin
    umCliente := Cliente(obj);
    with umDM do
    begin
        try
            beginTrans;
            QCliente.Close;
            if umCliente.getId = 0 then
            begin
                if(Self.Buscar(umCliente)) then
                begin
                  if (umCliente.getTipoPessoa = 'Física') then
                    Result := 'Esse CPF já existe!'
                  else
                    Result := 'Esse CNPJ já existe!';
                  Self.AtualizaGrid;
                  Exit;
                end;
                QCliente.SQL := UpdateCliente.InsertSQL;
            end
            else
            begin
                if(not Self.Buscar(umCliente)) and (not umCliente.verificaNome) and (not umCliente.verificaTel) then
                begin
                  if (not Self.VerificaCPF_CNPJ(umCliente)) then
                  begin
                    QCliente.SQL := UpdateCliente.ModifySQL;
                    QCliente.Params.ParamByName('OLD_idcliente').Value := umCliente.getId;
                  end
                  else
                  begin
                    if (umCliente.getTipoPessoa = 'Física') then
                      Result := 'Esse CPF já existe!'
                    else
                      Result := 'Esse CNPJ já existe!';
                    Self.AtualizaGrid;
                    Exit;
                  end;
                end
                else
                begin
                  QCliente.SQL := UpdateCliente.ModifySQL;
                  QCliente.Params.ParamByName('OLD_idcliente').Value := umCliente.getId;
                end;
            end;
            QCliente.Params.ParamByName('nome_razaosocial').Value := umCliente.getNome_RazaoSoCial;

            QCliente.Params.ParamByName('logradouro').Value := umCliente.getumEndereco.getLogradouro;
            QCliente.Params.ParamByName('numero').Value := umCliente.getumEndereco.getNumero;
            QCliente.Params.ParamByName('cep').Value := umCliente.getumEndereco.getCEP;
            QCliente.Params.ParamByName('bairro').Value := umCliente.getumEndereco.getBairro;
            QCliente.Params.ParamByName('complemento').Value := umCliente.getumEndereco.getComplemento;
            QCliente.Params.ParamByName('idcidade').Value := umCliente.getumEndereco.getumaCidade.getId;

            QCliente.Params.ParamByName('email').Value := umCliente.getEmail;
            QCliente.Params.ParamByName('telefone').Value := umCliente.getTelefone;
            QCliente.Params.ParamByName('celular').Value := umCliente.getCelular;
            QCliente.Params.ParamByName('cpf_cnpj').Value := umCliente.getCPF_CNPJ;
            QCliente.Params.ParamByName('rg_ie').Value := umCliente.getRG_IE;
            QCliente.Params.ParamByName('tipopessoa').Value := umCliente.getTipoPessoa;
            QCliente.Params.ParamByName('idcondicaopagamento').Value := umCliente.getUmaCondicaoPgto.getId;
            if umCliente.getDataNasc_Fund <> StrToDateTime('30/12/1899') then
              QCliente.Params.ParamByName('datanasc_fund').Value := umCliente.getDataNasc_Fund;
            QCliente.Params.ParamByName('datacadastro').Value := umCliente.getDataCadastro;
            QCliente.Params.ParamByName('dataalteracao').Value := umCliente.getDataUltAlteracao;
            QCliente.Params.ParamByName('observacao').Value := umCliente.getObservacao;

            QCliente.ExecSQL;
            Commit;
            result := 'Cliente salvo com sucesso!';
        except
          on e: Exception do
          begin
              rollback;
              Result := 'Ocorreu um erro! Cliente não foi salvo. Erro: '+e.Message;
          end;
        end;
    end;
    AtualizaGrid;
end;

end.
