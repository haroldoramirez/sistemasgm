unit UDaoProduto;
interface
  uses uDao, DB, SysUtils, Messages, UProduto, UDaoMarca, UDaoCategoria,
  UProdutoFornecedor, UFornecedor, UDaoUnidade, UDaoNcm, UEndereco;
  type DaoProduto = class(Dao)
  private
  protected
     umProduto           : Produto;
     umaDaoMarca         : DaoMarca;
     umaDaoCategoria     : DaoCategoria;
     umaDaoUnidade       : DaoUnidade;
     umaFornecedor       : Fornecedor;
     umaDaoNcm           : DaoNcm;
     umProdutoFornecedor : ProdutoFornecedor;
  public
      Constructor CrieObjeto;
      Destructor Destrua_se;
      function Salvar(obj:TObject): string;      override;
      function GetDS : TDataSource;              override;
      function Carrega(obj:TObject): TObject;    override;
      function Buscar(obj : TObject) : Boolean;  override;
      function Excluir(obj : TObject) : string ; override;
      function CarregarFornececor(obj: TObject): TObject;
      function RelacaoProduto (tipo : Integer) : Boolean;
      procedure AtualizaGrid;
      procedure Ordena(campo: string);
end;
implementation

{ DaoProduto }

function DaoProduto.Buscar(obj: TObject): Boolean;
var
    prim: Boolean;
    sql, e, onde: string;
    umProduto: Produto;
begin
    e := ' and ';
    onde := ' where';
    prim := true;
    umProduto := Produto(obj);
    sql := 'select * from produto';
    if umProduto.getId <> 0 then
    begin
        if prim then  //SE FOR O PRIMEIRO, SETA COMO FLAG COMO FALSO PQ É O PRIMEIRO
        begin
            prim := false;
            sql := sql+onde;
        end
        else //SE NAO, COLOCA CLAUSULA AND PARA JUNTAR CONDIÇOES
            sql := sql+e;
        sql := sql+' idproduto = '+inttostr(umProduto.getId); //COLOCA CONDIÇAO NO SQL
    end;
    if umProduto.getDescricao <> '' then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' descricao like '+quotedstr('%'+umProduto.getDescricao+'%');
    end;
    with umDM do
    begin
        QProduto.Close;
        QProduto.sql.Text := sql+' order by idproduto';
        QProduto.Open;
        if QProduto.RecordCount > 0 then
          result := True
        else
          result := false;
    end;
end;

procedure DaoProduto.AtualizaGrid;
begin
  with umDM do
    begin
        QProduto.Close;
        QProduto.sql.Text := 'select * from produto order by idproduto';
        QProduto.Open;
    end;
end;

function DaoProduto.RelacaoProduto(tipo: Integer): Boolean;
var sql : string;
begin
  sql := 'select * from produto';
  with umDM do
  begin
    QProduto.Close;
    QProduto.sql.Text := sql+' order by idproduto';
    QProduto.Open;
    if QProduto.RecordCount > 0 then
      result := True
    else
      result := false;
  end;
end;

function DaoProduto.Carrega(obj: TObject): TObject;
var  umProduto: Produto;
begin
    umProduto := Produto(obj);
    with umDM do
    begin
      if not QProduto.Active then
          QProduto.Open;

      if umProduto.getId <> 0 then
        begin
          QProduto.Close;
          QProduto.SQL.Text := 'select * from produto where idproduto = '+IntToStr(umProduto.getId);
          QProduto.Open;
        end;

      umProduto.setId(QProdutoidproduto.AsInteger);
      umProduto.setDescricao(QProdutodescricao.AsString);
      umProduto.setQuantidade(QProdutoquantidade.AsFloat);
      umProduto.setUnidade(QProdutounidade.AsString);
      umProduto.setICMS(QProdutoicms.AsFloat);
      umProduto.setCst(QProdutocst.AsString);
      umProduto.setIPI(QProdutoipi.AsFloat);
      umProduto.setPrecoCompra(QProdutopreco_compra.AsFloat);
      umProduto.setICMSAnterior(QProdutoicms_anterior.AsFloat);
      umProduto.setIPIAnterior(QProdutoipi_anterior.AsFloat);
      umProduto.setPrecoCompraAnt(QProdutopreco_compra_ant.AsFloat);
      umProduto.setPrecoVenda(QProdutopreco_venda.AsFloat);
      umProduto.setObservacao(QProdutoobservacao.AsString);
      umProduto.setDataCadastro(QProdutodatacadastro.AsDateTime);
      umProduto.setDataAlteracao(QProdutodataalteracao.AsDateTime);

      // Busca Marca referente a Produto
      umProduto.getUmaMarca.setId(QProdutoidmarca.AsInteger);
      umaDaoMarca.Carrega(umProduto.getUmaMarca);

      // Busca Categoria referente a Produto
      umProduto.getUmaCategoria.setId(QProdutoidcategoria.AsInteger);
      umaDaoCategoria.Carrega(umProduto.getUmaCategoria);

      // Busca NCM referente a Produto
      umProduto.getUmNcm.setId(QProdutoidncm.AsInteger);
      umaDaoNcm.Carrega(umProduto.getUmNcm);
    end;
    result := umProduto;
//    Self.AtualizaGrid;
end;

function DaoProduto.CarregarFornececor(obj: TObject): TObject;
var
    umFornecedor : Fornecedor;
    umEndereco   : Endereco;
    umProduto    : Produto;
begin
    umProduto := Produto(obj);
    with umDM do
    begin
      //Carregar os Fornecedores
      QProdutoFornecedor.Close;
      QProdutoFornecedor.SQL.Text := 'select * from produto_fornecedor where idproduto = '+IntToStr(umProduto.getId);
      QProdutoFornecedor.Open;
      QProdutoFornecedor.First;

      if umProdutoFornecedor.CountFornecedores <> 0 then
          umProdutoFornecedor.LimparListaFornecedor;  //Limpar a lista caso a lista vim com itens carregados

      while not QProdutoFornecedor.Eof do
      begin
        umProdutoFornecedor.CrieObejtoFornecedor;
        umProdutoFornecedor.addFornecedor(umProdutoFornecedor.getUmFornecedor);
        umProdutoFornecedor.getUmFornecedor.setId(QProdutoFornecedoridfornecedor.AsInteger);

        umEndereco := Endereco.CrieObjeto;
        if not QFornecedor.Active then
            QFornecedor.Open;

        if umProdutoFornecedor.getUmFornecedor.getId <> 0 then
        begin
          QFornecedor.Close;
          QFornecedor.SQL.Text := 'select * from fornecedor where idfornecedor = '+IntToStr(umProdutoFornecedor.getUmFornecedor.getId);
          QFornecedor.Open;
        end;

        umProdutoFornecedor.getUmFornecedor.setId(QFornecedoridfornecedor.AsInteger);
        umProdutoFornecedor.getUmFornecedor.setNome_RazaoSoCial(QFornecedornome_razaosocial.AsString);
        //Endereço
        umEndereco.setLogradouro(QFornecedorlogradouro.AsString);
        umEndereco.setNumero(QFornecedornumero.AsString);
        umEndereco.setCEP(QFornecedorcep.AsString);
        umEndereco.setBairro(QFornecedorbairro.AsString);
        umEndereco.setComplemento(QFornecedorcomplemento.AsString);

        umProdutoFornecedor.getUmFornecedor.setumEndereco(umEndereco);
        umProdutoFornecedor.getUmFornecedor.setEmail(QFornecedoremail.AsString);
        umProdutoFornecedor.getUmFornecedor.setTelefone(QFornecedortelefone.AsString);
        umProdutoFornecedor.getUmFornecedor.setCelular(QFornecedorcelular.AsString);
        umProdutoFornecedor.getUmFornecedor.setCPF_CNPJ(QFornecedorcpf_cnpj.AsString);
        umProdutoFornecedor.getUmFornecedor.setRG_IE(QFornecedorrg_ie.AsString);
        umProdutoFornecedor.getUmFornecedor.setTipoPessoa(QFornecedortipopessoa.AsString);
        QProdutoFornecedor.Next;
      end;
    end;
    result := umProdutoFornecedor;
end;

constructor DaoProduto.CrieObjeto;
begin
   inherited;
   umaDaoMarca         := DaoMarca.CrieObjeto;
   umaDaoCategoria     := DaoCategoria.CrieObjeto;
   umaDaoUnidade       := DaoUnidade.CrieObjeto;
   umaDaoNcm           := DaoNcm.CrieObjeto;
   umProdutoFornecedor := ProdutoFornecedor.CrieObjeto;
end;

destructor DaoProduto.Destrua_se;
begin
  inherited;
end;

function DaoProduto.Excluir(obj: TObject): string;
var
    umProduto: Produto;
begin
    umProduto := Produto(obj);
    with umDM do
    begin
        try
            beginTrans;
            QProduto.SQL := UpdateProduto.DeleteSQL;
            QProduto.Params.ParamByName('OLD_idproduto').Value := umProduto.getId;
            QProduto.ExecSQL;
            Commit;
            result := 'Produto excluído com sucesso!'
        except
            on e:Exception do
            begin
              rollback;
              if pos('violates foreign key',e.Message)>0 then
                result := 'Ocorreu um erro! O Produto não pode ser excluído pois ja está sendo usado pelo sistema.'
              else
                result := 'Ocorreu um erro! Produto não foi excluído. Erro: '+e.Message
            end;
        end;
    end;
    Self.AtualizaGrid;
end;

function DaoProduto.GetDS: TDataSource;
begin
   (umDM.QProduto.FieldByName('quantidade') as TFloatField).DisplayFormat := '0.000';
   (umDM.QProduto.FieldByName('icms') as TFloatField).DisplayFormat := '0.00';
   (umDM.QProduto.FieldByName('ipi') as TFloatField).DisplayFormat := '0.00';
   (umDM.QProduto.FieldByName('preco_compra') as TFloatField).DisplayFormat := '0.00';
   (umDM.QProduto.FieldByName('icms_anterior') as TFloatField).DisplayFormat := '0.00';
   (umDM.QProduto.FieldByName('ipi_anterior') as TFloatField).DisplayFormat := '0.00';
   (umDM.QProduto.FieldByName('preco_compra_ant') as TFloatField).DisplayFormat := '0.00';

   umDM.QProduto.FieldByName('cst').DisplayLabel := 'CST';
   umDM.QProduto.FieldByName('icms').DisplayLabel := 'ICMS';
   umDM.QProduto.FieldByName('ipi').DisplayLabel := 'IPI';
   umDM.QProduto.FieldByName('preco_compra').DisplayLabel := 'Média Compra';
   umDM.QProduto.FieldByName('preco_venda').DisplayLabel := 'Preco Venda';
   umDM.QProduto.FieldByName('icms_anterior').DisplayLabel := 'Icms Anterior';
   umDM.QProduto.FieldByName('ipi_anterior').DisplayLabel := 'Ipi Anterior';
   umDM.QProduto.FieldByName('preco_compra_ant').DisplayLabel := 'Preco Compra Ant.';

   Self.AtualizaGrid;
   Result := umDM.DSProduto;
end;

procedure DaoProduto.Ordena(campo: string);
begin
   umDM.QProduto.IndexFieldNames := campo;
end;

function DaoProduto.Salvar(obj: TObject): string;
var umProduto : Produto;
begin
    umProduto := Produto(obj);
    with umDM do
    begin
        try
            beginTrans;
            QProduto.Close;
            if umProduto.getId = 0 then
                QProduto.SQL := UpdateProduto.InsertSQL
            else
            begin
              QProduto.SQL := UpdateProduto.ModifySQL;
              QProduto.Params.ParamByName('OLD_idproduto').Value := umProduto.getId;
            end;
            QProduto.Params.ParamByName('descricao').Value := umProduto.getDescricao;
            QProduto.Params.ParamByName('unidade').Value := umProduto.getUnidade;
            QProduto.Params.ParamByName('idncm').Value := umProduto.getUmNcm.getId;
            QProduto.Params.ParamByName('quantidade').Value := umProduto.getQuantidade;
            QProduto.Params.ParamByName('idmarca').Value := umProduto.getUmaMarca.getId;
            QProduto.Params.ParamByName('idcategoria').Value := umProduto.getUmaCategoria.getId;
            QProduto.Params.ParamByName('cst').Value := umProduto.getCst;
            QProduto.Params.ParamByName('icms').Value := umProduto.getICMS;
            QProduto.Params.ParamByName('ipi').Value := umProduto.getIPI;
            QProduto.Params.ParamByName('preco_compra').Value := umProduto.getPrecoCompra;
            QProduto.Params.ParamByName('icms_anterior').Value := umProduto.getICMSAnterior;
            QProduto.Params.ParamByName('ipi_anterior').Value := umProduto.getIPIAnterior;
            QProduto.Params.ParamByName('preco_compra_ant').Value := umProduto.getPrecoCompraAnt;
            QProduto.Params.ParamByName('preco_venda').Value := umProduto.getPrecoVenda;
            QProduto.Params.ParamByName('observacao').Value := umProduto.getObservacao;
            QProduto.Params.ParamByName('datacadastro').Value := umProduto.getDataCadastro;
            QProduto.Params.ParamByName('dataalteracao').Value := umProduto.getDataAlteracao;

            QProduto.ExecSQL;
            Commit;
            result := 'Produto salvo com sucesso!';
        except
          on e: Exception do
          begin
              rollback;
              Result := 'Ocorreu um erro! Produto não foi salvo. Erro: '+e.Message
          end;
        end;
    end;
    Self.AtualizaGrid;
end;

end.
