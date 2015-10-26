unit UDaoFornecedor;

interface
      uses uDao, DB, SysUtils, Messages, UFornecedor, UEndereco, UDaoCidade,
      UDaoCondicaoPagamento, UDaoProduto;
      type DaoFornecedor = class(Dao)
      private

      protected
         umFornecedor            : Fornecedor;
         umEndereco              : Endereco;
         umaDaoCidade            : DaoCidade;
         umaDaoCondicaoPagamento : DaoCondicaoPagamento;
         umaDaoProduto           : DaoProduto;
      public
          Constructor CrieObjeto;
          Destructor Destrua_se;
          function Salvar(obj:TObject): string;      override;
          function GetDS : TDataSource;              override;
          function Carrega(obj:TObject): TObject;    override;
          function Buscar(obj : TObject) : Boolean;  override;
          function Excluir(obj : TObject) : string ; override;
          function VerificaCPF_CNPJ (obj : TObject) : Boolean;
          procedure FiltroFavorecido(tipo : string);
          procedure AtualizaGrid(tipo : string);
          procedure Ordena(campo: string);
end;

implementation

{ DaoFornecedor }

function DaoFornecedor.Buscar(obj: TObject): Boolean;
var
    prim: Boolean;
    sql, e, onde: string;
    umFornecedor: Fornecedor;
begin
    e := ' and ';
    onde := ' where';
    prim := true;
    umFornecedor := Fornecedor(obj);
    sql := 'select * from fornecedor';
    if umFornecedor.getId <> 0 then
    begin
        if prim then  //SE FOR O PRIMEIRO, SETA COMO FLAG COMO FALSO PQ É O PRIMEIRO
        begin
            prim := false;
            sql := sql+onde;
        end
        else //SE NAO, COLOCA CLAUSULA AND PARA JUNTAR CONDIÇOES
            sql := sql+e;
        sql := sql+' idfornecedor = '+inttostr(umFornecedor.getId); //COLOCA CONDIÇAO NO SQL
    end;
    if umFornecedor.getNome_RazaoSoCial <> '' then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' nome_razaosocial like '+quotedstr('%'+umFornecedor.getNome_RazaoSoCial+'%');
    end;
    if umFornecedor.getTelefone <> '' then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' telefone like '+quotedstr('%'+umFornecedor.getTelefone+'%');
    end;
    if umFornecedor.getCPF_CNPJ <> '' then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' cpf_cnpj = '''+umFornecedor.getCPF_CNPJ+'''';
    end;
    if umFornecedor.getTipoFavorecido <> '' then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' tipofavorecido = '''+umFornecedor.getTipoFavorecido+'''';
    end;
    with umDM do
    begin
        QFornecedor.Close;
        QFornecedor.sql.Text := sql+' order by idfornecedor';
        QFornecedor.Open;
        if QFornecedor.RecordCount > 0 then
          result := True
        else
          result := false;
    end;
end;

procedure DaoFornecedor.FiltroFavorecido(tipo : string);
begin
  with umDM do
  begin
    QFornecedor.Close;
    QFornecedor.sql.Text := 'select * from fornecedor where tipofavorecido = '''+tipo+''' order by idfornecedor';
    QFornecedor.Open;
  end;
end;

function DaoFornecedor.VerificaCPF_CNPJ (obj : TObject) : Boolean;
var sql : string;
    umFornecedor : Fornecedor;
begin
  umFornecedor := Fornecedor(obj);
  sql := 'select * from fornecedor where cpf_cnpj = '''+umFornecedor.getCPF_CNPJ+'''';
  with umDM do
  begin
    QFornecedor.Close;
    QFornecedor.sql.Text := sql+' order by idfornecedor';
    QFornecedor.Open;
    if QFornecedor.RecordCount > 0 then
      result := True
    else
      result := false;
  end;
end;

procedure DaoFornecedor.AtualizaGrid(tipo : string);
begin
  with umDM do
    begin
        QFornecedor.Close;
        QFornecedor.sql.Text := 'select * from fornecedor where tipofavorecido = '''+tipo+''' order by idfornecedor';
        QFornecedor.Open;
    end;
end;

function DaoFornecedor.Carrega(obj: TObject): TObject;
var
    umFornecedor  : Fornecedor;
    umEndereco : Endereco;
begin
    umFornecedor := Fornecedor(obj);
    umEndereco := Endereco.CrieObjeto;
    with umDM do
    begin
        if not QFornecedor.Active then
            QFornecedor.Open;

        if umFornecedor.getId <> 0 then
        begin
          QFornecedor.Close;
          QFornecedor.SQL.Text := 'select * from fornecedor where idfornecedor = '+IntToStr(umFornecedor.getId);
          QFornecedor.Open;
        end;

        umFornecedor.setId(QFornecedoridfornecedor.AsInteger);
        umFornecedor.setNome_RazaoSoCial(QFornecedornome_razaosocial.AsString);
        //Endereço
        umEndereco.setLogradouro(QFornecedorlogradouro.AsString);
        umEndereco.setNumero(QFornecedornumero.AsString);
        umEndereco.setCEP(QFornecedorcep.AsString);
        umEndereco.setBairro(QFornecedorbairro.AsString);
        umEndereco.setComplemento(QFornecedorcomplemento.AsString);

        umFornecedor.setumEndereco(umEndereco);
        umFornecedor.setEmail(QFornecedoremail.AsString);
        umFornecedor.setTelefone(QFornecedortelefone.AsString);
        umFornecedor.setCelular(QFornecedorcelular.AsString);
        umFornecedor.setCPF_CNPJ(QFornecedorcpf_cnpj.AsString);
        umFornecedor.setRG_IE(QFornecedorrg_ie.AsString);
        umFornecedor.setTipoPessoa(QFornecedortipopessoa.AsString);
        umFornecedor.setTipoFavorecido(QFornecedortipofavorecido.AsString);
        umFornecedor.setDataNasc_Fund(QFornecedordatanasc_fund.AsDateTime);
        umFornecedor.setDataCadastro(QFornecedordatacadastro.AsDateTime);
        umFornecedor.setDataUltAlteracao(QFornecedordataalteracao.AsDateTime);
        umFornecedor.setObservacao(QFornecedorobservacao.AsString);
        //Busca a Cidade referente ao Fornecedor
        umFornecedor.getumEndereco.getumaCidade.setId(QFornecedoridcidade.AsInteger);
        umaDaoCidade.Carrega(umFornecedor.getumEndereco.getumaCidade);
        //Busca a Condicao de Pagamento referente ao Fornecedor
        umFornecedor.getUmaCondicaoPgto.setId(QFornecedoridcondicaopagamento.AsInteger);
        umaDaoCondicaoPagamento.Carrega(umFornecedor.getUmaCondicaoPgto);

        //Carregar os Produtos
        QProdutoFornecedor.Close;
        QProdutoFornecedor.SQL.Text := 'select * from produto_fornecedor where idfornecedor = '+IntToStr(umFornecedor.getId);
        QProdutoFornecedor.Open;
        QProdutoFornecedor.First;

        if umFornecedor.CountProdutos <> 0 then
            umFornecedor.LimparListaProduto;  //Limpar a lista caso a lista vim com itens carregados

        while not QProdutoFornecedor.Eof do
        begin
          umFornecedor.CrieObejtoProduto;
          umFornecedor.addProduto(umFornecedor.getUmProduto);
          umFornecedor.getUmProduto.setId(QProdutoFornecedoridproduto.AsInteger);
          umaDaoProduto.Carrega(umFornecedor.getUmProduto);      //Carregar Todos os Atributos do Produto
          QProdutoFornecedor.Next;
        end;
    end;
    result := umFornecedor;
    Self.AtualizaGrid(umFornecedor.getTipoFavorecido);
end;

constructor DaoFornecedor.CrieObjeto;
begin
    inherited;
    umaDaoCidade            := DaoCidade.CrieObjeto;
    umaDaoCondicaoPagamento := DaoCondicaoPagamento.CrieObjeto;
    umaDaoProduto           := DaoProduto.CrieObjeto;
end;

destructor DaoFornecedor.Destrua_se;
begin
    inherited;
end;

function DaoFornecedor.Excluir(obj: TObject): string;
var
    umFornecedor: Fornecedor;
    tipo : string;
begin
    umFornecedor := Fornecedor(obj);
    with umDM do
    begin
        try
            beginTrans;
            tipo := umFornecedor.getTipoFavorecido;
            QProdutoFornecedor.SQL := UpdateProdutoFornecedor.DeleteSQL;
            QProdutoFornecedor.Params.ParamByName('OLD_idfornecedor').Value := umFornecedor.getId;
            QProdutoFornecedor.ExecSQL;

            QFornecedor.SQL := UpdateFornecedor.DeleteSQL;
            QFornecedor.Params.ParamByName('OLD_idfornecedor').Value := umFornecedor.getId;
            QFornecedor.ExecSQL;
            Commit;
            result := 'Fornecedor excluído com sucesso!';
        except
            on e:Exception do
            begin
                rollback;
                if pos('violates foreign key',e.Message)>0 then
                    result := 'Ocorreu um erro! O Fornecedor não pode ser excluído pois ja está sendo usado pelo sistema.'
                else
                    result := 'Ocorreu um erro! Fornecedor não foi excluído. Erro: '+e.Message;
            end;
        end;
    end;
    Self.AtualizaGrid(tipo);
end;

function DaoFornecedor.GetDS: TDataSource;
begin
    umDM.QFornecedor.FieldByName('idfornecedor').DisplayWidth := 10;
    umDM.QFornecedor.FieldByName('idfornecedor').DisplayLabel := 'código';
    umDM.QFornecedor.FieldByName('nome_razaosocial').DisplayLabel := 'nome';
    umDM.QFornecedor.FieldByName('nome_razaosocial').DisplayWidth := 60;
    umDM.QFornecedor.FieldByName('logradouro').DisplayWidth := 60;
//    Self.AtualizaGrid;
    result := umDM.DSFornecedor;
end;

procedure DaoFornecedor.Ordena(campo: string);
begin
    umDM.QFornecedor.IndexFieldNames := campo;
end;

function DaoFornecedor.Salvar(obj: TObject): string;
var umFornecedor : Fornecedor;
    i : Integer;
begin
    umFornecedor := Fornecedor(obj);
    with umDM do
    begin
        try
            beginTrans;
            QFornecedor.Close;
            if umFornecedor.getId = 0 then
            begin
                if(Self.Buscar(umFornecedor)) then
                begin
                  if (umFornecedor.getTipoPessoa = 'Física') then
                    Result := 'Esse CPF já existe!'
                  else
                    Result := 'Esse CNPJ já existe!';
                  Self.AtualizaGrid(umFornecedor.getTipoFavorecido);
                  Exit;
                end;
                QFornecedor.SQL := UpdateFornecedor.InsertSQL
            end
            else
            begin
                if(not Self.Buscar(umFornecedor)) and (not umFornecedor.verificaNome) and (not umFornecedor.verificaTel) then
                begin
                  if (not Self.VerificaCPF_CNPJ(umFornecedor)) then
                  begin
                    QProdutoFornecedor.SQL := UpdateProdutoFornecedor.DeleteSQL;
                    QProdutoFornecedor.Params.ParamByName('OLD_idfornecedor').Value := umFornecedor.getId;
                    QProdutoFornecedor.ExecSQL;

                    QFornecedor.SQL := UpdateFornecedor.ModifySQL;
                    QFornecedor.Params.ParamByName('OLD_idfornecedor').Value := umFornecedor.getId;
                  end
                  else
                  begin
                    if (umFornecedor.getTipoPessoa = 'Física') then
                      Result := 'Esse CPF já existe!'
                    else
                      Result := 'Esse CNPJ já existe!';
                    Self.AtualizaGrid(umFornecedor.getTipoFavorecido);
                    Exit;
                  end;
                end
                else
                begin
                  QProdutoFornecedor.SQL := UpdateProdutoFornecedor.DeleteSQL;
                  QProdutoFornecedor.Params.ParamByName('OLD_idfornecedor').Value := umFornecedor.getId;
                  QProdutoFornecedor.ExecSQL;

                  QFornecedor.SQL := UpdateFornecedor.ModifySQL;
                  QFornecedor.Params.ParamByName('OLD_idfornecedor').Value := umFornecedor.getId;
                end;
            end;
            QFornecedor.Params.ParamByName('nome_razaosocial').Value := umFornecedor.getNome_RazaoSoCial;

            QFornecedor.Params.ParamByName('logradouro').Value := umFornecedor.getumEndereco.getLogradouro;
            QFornecedor.Params.ParamByName('numero').Value := umFornecedor.getumEndereco.getNumero;
            QFornecedor.Params.ParamByName('cep').Value := umFornecedor.getumEndereco.getCEP;
            QFornecedor.Params.ParamByName('bairro').Value := umFornecedor.getumEndereco.getBairro;
            QFornecedor.Params.ParamByName('complemento').Value := umFornecedor.getumEndereco.getComplemento;
            QFornecedor.Params.ParamByName('idcidade').Value := umFornecedor.getumEndereco.getumaCidade.getId;

            QFornecedor.Params.ParamByName('email').Value := umFornecedor.getEmail;
            QFornecedor.Params.ParamByName('telefone').Value := umFornecedor.getTelefone;
            QFornecedor.Params.ParamByName('celular').Value := umFornecedor.getCelular;
            QFornecedor.Params.ParamByName('cpf_cnpj').Value := umFornecedor.getCPF_CNPJ;
            QFornecedor.Params.ParamByName('rg_ie').Value := umFornecedor.getRG_IE;
            QFornecedor.Params.ParamByName('tipopessoa').Value := umFornecedor.getTipoPessoa;
            QFornecedor.Params.ParamByName('tipofavorecido').Value := umFornecedor.getTipoFavorecido;
            QFornecedor.Params.ParamByName('idcondicaopagamento').Value := umFornecedor.getUmaCondicaoPgto.getId;
            if umFornecedor.getDataNasc_Fund <> StrToDateTime('30/12/1899') then
              QFornecedor.Params.ParamByName('datanasc_fund').Value := umFornecedor.getDataNasc_Fund;
            QFornecedor.Params.ParamByName('datacadastro').Value := umFornecedor.getDataCadastro;
            QFornecedor.Params.ParamByName('dataalteracao').Value := umFornecedor.getDataUltAlteracao;
            QFornecedor.Params.ParamByName('observacao').Value := umFornecedor.getObservacao;

            QFornecedor.ExecSQL;

            if umFornecedor.getId = 0 then
            begin
              QGenerica.Close;
              QGenerica.SQL.Text := 'Select last_value as idFornecedor from idfornecedor_seq';
              QGenerica.Open;
              umFornecedor.setId(QGenerica.Fields.FieldByName('idFornecedor').Value);
            end;

           //Faz Relacao com os Produtos do Fornecedor
            for i := 1 to umFornecedor.CountProdutos do
            begin
              QProdutoFornecedor.SQL := UpdateProdutoFornecedor.InsertSQL;
              QProdutoFornecedor.Params.ParamByName('idfornecedor').Value := umFornecedor.getId;
              QProdutoFornecedor.Params.ParamByName('idproduto').Value := umFornecedor.getProduto(i-1).getId;
              QProdutoFornecedor.ExecSQL;
            end;
            Commit;
            result := 'Fornecedor salvo com sucesso!';
        except
          on e: Exception do
          begin
              rollback;
              Result := 'Ocorreu um erro! Fornecedor não foi salvo. Erro: '+e.Message;
          end;
        end;
    end;
    Self.FiltroFavorecido(umFornecedor.getTipoFavorecido);
end;
end.
