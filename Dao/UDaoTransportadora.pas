unit UDaoTransportadora;

interface
      uses uDao, DB, SysUtils, Messages, UTransportadora, UEndereco, UDaoCidade,
      UDaoCondicaoPagamento;
      type DaoTransportadora = class(Dao)
      private

      protected
         umTransportadora            : Transportadora;
         umEndereco              : Endereco;
         umaDaoCidade            : DaoCidade;
         umaDaoCondicaoPagamento : DaoCondicaoPagamento;
      public
          Constructor CrieObjeto;
          Destructor Destrua_se;
          function Salvar(obj:TObject): string;      override;
          function GetDS : TDataSource;              override;
          function Carrega(obj:TObject): TObject;    override;
          function Buscar(obj : TObject) : Boolean;  override;
          function Excluir(obj : TObject) : string ; override;
          function VerificaCNPJ (obj : TObject) : Boolean;
          procedure AtualizaGrid;
          procedure Ordena(campo: string);
end;

implementation

{ DaoTransportadora }

function DaoTransportadora.Buscar(obj: TObject): Boolean;
var
    prim: Boolean;
    sql, e, onde: string;
    umTransportadora: Transportadora;
begin
    e := ' and ';
    onde := ' where';
    prim := true;
    umTransportadora := Transportadora(obj);
    sql := 'select * from transportadora';
    if umTransportadora.getId <> 0 then
    begin
        if prim then  //SE FOR O PRIMEIRO, SETA COMO FLAG COMO FALSO PQ É O PRIMEIRO
        begin
            prim := false;
            sql := sql+onde;
        end
        else //SE NAO, COLOCA CLAUSULA AND PARA JUNTAR CONDIÇOES
            sql := sql+e;
        sql := sql+' idtransportadora = '+inttostr(umTransportadora.getId); //COLOCA CONDIÇAO NO SQL
    end;
    if umTransportadora.getNome_RazaoSoCial <> '' then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' razaosocial like '+quotedstr('%'+umTransportadora.getNome_RazaoSoCial+'%');
    end;
    if umTransportadora.getTelefone <> '' then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' telefone like '+quotedstr('%'+umTransportadora.getTelefone+'%');
    end;
    if umTransportadora.getCPF_CNPJ <> '' then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' cnpj = '''+umTransportadora.getCPF_CNPJ+'''';
    end;
    with umDM do
    begin
        QTransportadora.Close;
        QTransportadora.sql.Text := sql+' order by idtransportadora';
        QTransportadora.Open;
        if QTransportadora.RecordCount > 0 then
          result := True
        else
          result := false;
    end;
end;

procedure DaoTransportadora.AtualizaGrid;
begin
  with umDM do
    begin
        QTransportadora.Close;
        QTransportadora.sql.Text := 'select * from transportadora order by idtransportadora';
        QTransportadora.Open;
    end;
end;

function DaoTransportadora.VerificaCNPJ (obj : TObject) : Boolean;
var sql : string;
    umaTransportadora : Transportadora;
begin
  umaTransportadora := Transportadora(obj);
  sql := 'select * from transportadora where cnpj = '''+umaTransportadora.getCPF_CNPJ+'''';
  with umDM do
  begin
    QTransportadora.Close;
    QTransportadora.sql.Text := sql+' order by idtransportadora';
    QTransportadora.Open;
    if QTransportadora.RecordCount > 0 then
      result := True
    else
      result := false;
  end;
end;

function DaoTransportadora.Carrega(obj: TObject): TObject;
var
    umTransportadora  : Transportadora;
    umEndereco : Endereco;
begin
    umTransportadora := Transportadora(obj);
    umEndereco := Endereco.CrieObjeto;
    with umDM do
    begin
        if not QTransportadora.Active then
            QTransportadora.Open;

        if umTransportadora.getId <> 0 then
        begin
          QTransportadora.Close;
          QTransportadora.SQL.Text := 'select * from transportadora where idtransportadora = '+IntToStr(umTransportadora.getId);
          QTransportadora.Open;
        end;

        umTransportadora.setId(QTransportadoraidtransportadora.AsInteger);
        umTransportadora.setNome_RazaoSoCial(QTransportadorarazaosocial.AsString);
        //Endereço
        umEndereco.setLogradouro(QTransportadoralogradouro.AsString);
        umEndereco.setNumero(QTransportadoranumero.AsString);
        umEndereco.setCEP(QTransportadoracep.AsString);
        umEndereco.setBairro(QTransportadorabairro.AsString);
        umEndereco.setComplemento(QTransportadoracomplemento.AsString);

        umTransportadora.setumEndereco(umEndereco);
        umTransportadora.setEmail(QTransportadoraemail.AsString);
        umTransportadora.setTelefone(QTransportadoratelefone.AsString);
        umTransportadora.setCelular(QTransportadoracelular.AsString);
        umTransportadora.setCPF_CNPJ(QTransportadoracnpj.AsString);
        umTransportadora.setRG_IE(QTransportadoraie.AsString);
        umTransportadora.setDataNasc_Fund(QTransportadoradatafundacao.AsDateTime);
        umTransportadora.setDataCadastro(QTransportadoradatacadastro.AsDateTime);
        umTransportadora.setDataUltAlteracao(QTransportadoradataalteracao.AsDateTime);
        umTransportadora.setObservacao(QTransportadoraobservacao.AsString);
        //Busca a Cidade referente ao Transportadora
        umTransportadora.getumEndereco.getumaCidade.setId(QTransportadoraidcidade.AsInteger);
        umaDaoCidade.Carrega(umTransportadora.getumEndereco.getumaCidade);
        //Busca a Condicao de Pagamento referente ao Transportadora
        umTransportadora.getUmaCondicaoPgto.setId(QTransportadoraidcondicaopagamento.AsInteger);
        umaDaoCondicaoPagamento.Carrega(umTransportadora.getUmaCondicaoPgto);
    end;
    result := umTransportadora;
    Self.AtualizaGrid;
end;

constructor DaoTransportadora.CrieObjeto;
begin
    inherited;
    umaDaoCidade            := DaoCidade.CrieObjeto;
    umaDaoCondicaoPagamento := DaoCondicaoPagamento.CrieObjeto;
end;

destructor DaoTransportadora.Destrua_se;
begin
    inherited;
end;

function DaoTransportadora.Excluir(obj: TObject): string;
var
    umTransportadora: Transportadora;
begin
    umTransportadora := Transportadora(obj);
    with umDM do
    begin
        try
            beginTrans;
            QTransportadora.SQL := UpdateTransportadora.DeleteSQL;
            QTransportadora.Params.ParamByName('OLD_idtransportadora').Value := umTransportadora.getId;
            QTransportadora.ExecSQL;
            Commit;
            result := 'Transportadora excluída com sucesso!';
        except
            on e:Exception do
            begin
                rollback;
                if pos('chave estrangeira',e.Message)>0 then
                    result := 'Ocorreu um erro! A Transportadora não pode ser excluída pois ja está sendo usado pelo sistema.'
                else
                    result := 'Ocorreu um erro! Transportadora não foi excluída. Erro: '+e.Message;
            end;
        end;
    end;
    Self.AtualizaGrid;
end;

function DaoTransportadora.GetDS: TDataSource;
begin
    Self.AtualizaGrid;
    result := umDM.DSTransportadora;
end;

procedure DaoTransportadora.Ordena(campo: string);
begin
    umDM.QTransportadora.IndexFieldNames := campo;
end;

function DaoTransportadora.Salvar(obj: TObject): string;
var
    umTransportadora : Transportadora;
begin
    umTransportadora := Transportadora(obj);
    with umDM do
    begin
        try
            beginTrans;
            QTransportadora.Close;
            if umTransportadora.getId = 0 then
            begin
                if(Self.Buscar(umTransportadora)) then
                begin
                  Result := 'Esse CNPJ já existe!';
                  Self.AtualizaGrid;
                  Exit;
                end;
                QTransportadora.SQL := UpdateTransportadora.InsertSQL;
            end
            else
            begin
                if(not Self.Buscar(umTransportadora)) and (not umTransportadora.verificaNome) and (not umTransportadora.verificaTel) then
                begin
                  if (not Self.VerificaCNPJ(umTransportadora)) then
                  begin
                    QTransportadora.SQL := UpdateTransportadora.ModifySQL;
                    QTransportadora.Params.ParamByName('OLD_idtransportadora').Value := umTransportadora.getId
                  end
                  else
                  begin
                    Result := 'Esse CNPJ já existe!';
                    Self.AtualizaGrid;
                    Exit;
                  end;
                end
                else
                begin
                  QTransportadora.SQL := UpdateTransportadora.ModifySQL;
                  QTransportadora.Params.ParamByName('OLD_idtransportadora').Value := umTransportadora.getId;
                end;
            end;
            QTransportadora.Params.ParamByName('razaosocial').Value := umTransportadora.getNome_RazaoSoCial;

            QTransportadora.Params.ParamByName('logradouro').Value := umTransportadora.getumEndereco.getLogradouro;
            QTransportadora.Params.ParamByName('numero').Value := umTransportadora.getumEndereco.getNumero;
            QTransportadora.Params.ParamByName('cep').Value := umTransportadora.getumEndereco.getCEP;
            QTransportadora.Params.ParamByName('bairro').Value := umTransportadora.getumEndereco.getBairro;
            QTransportadora.Params.ParamByName('complemento').Value := umTransportadora.getumEndereco.getComplemento;
            QTransportadora.Params.ParamByName('idcidade').Value := umTransportadora.getumEndereco.getumaCidade.getId;

            QTransportadora.Params.ParamByName('email').Value := umTransportadora.getEmail;
            QTransportadora.Params.ParamByName('telefone').Value := umTransportadora.getTelefone;
            QTransportadora.Params.ParamByName('celular').Value := umTransportadora.getCelular;
            QTransportadora.Params.ParamByName('cnpj').Value := umTransportadora.getCPF_CNPJ;
            QTransportadora.Params.ParamByName('ie').Value := umTransportadora.getRG_IE;
            QTransportadora.Params.ParamByName('idcondicaopagamento').Value := umTransportadora.getUmaCondicaoPgto.getId;
            if umTransportadora.getDataNasc_Fund <> StrToDateTime('30/12/1899') then
              QTransportadora.Params.ParamByName('datafundacao').Value := umTransportadora.getDataNasc_Fund;
            QTransportadora.Params.ParamByName('datacadastro').Value := umTransportadora.getDataCadastro;
            QTransportadora.Params.ParamByName('dataalteracao').Value := umTransportadora.getDataUltAlteracao;
            QTransportadora.Params.ParamByName('observacao').Value := umTransportadora.getObservacao;

            QTransportadora.ExecSQL;
            Commit;
            result := 'Transportadora salva com sucesso!';
        except
          on e: Exception do
          begin
              rollback;
              Result := 'Ocorreu um erro! Transportadora não foi salva. Erro: '+e.Message;
          end;
        end;
    end;
    Self.AtualizaGrid;
end;
end.
