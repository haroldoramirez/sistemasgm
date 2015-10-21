unit UDaoFuncionario;

interface
      uses uDao, DB, SysUtils, Messages, UFuncionario, UEndereco, UDaoCidade,
      UDaoCargo, UUsuario;
      type DaoFuncionario = class(Dao)
      private

      protected
         umFuncionario : Funcionario;
         umEndereco    : Endereco;
         umaDaoCidade  : DaoCidade;
         umCargo       : DaoCargo;
         umUsuario     : Usuario;
      public
          Constructor CrieObjeto;
          Destructor Destrua_se;
          function Salvar(obj:TObject): string;      override;
          function GetDS : TDataSource;              override;
          function Carrega(obj:TObject): TObject;    override;
          function Buscar(obj : TObject) : Boolean;  override;
          function Excluir(obj : TObject) : string ; override;
          function VefiricaCPF(obj : TObject) : Boolean;
          procedure AtualizaGrid;
          procedure Ordena(campo: string);
end;

implementation

uses UDaoUsuario, UAplicacao;
var  umaDaoUsuario : DaoUsuario;

{ DaoFuncionario }

function DaoFuncionario.Buscar(obj: TObject): Boolean;
var
    prim: Boolean;
    sql, e, onde: string;
    umFuncionario: Funcionario;
begin
    e := ' and ';
    onde := ' where';
    prim := true;
    umFuncionario := Funcionario(obj);
    sql := 'select * from funcionario';
    if umFuncionario.getId <> 0 then
    begin
        if prim then  //SE FOR O PRIMEIRO, SETA COMO FLAG COMO FALSO PQ É O PRIMEIRO
        begin
            prim := false;
            sql := sql+onde;
        end
        else //SE NAO, COLOCA CLAUSULA AND PARA JUNTAR CONDIÇOES
            sql := sql+e;
        sql := sql+' idfuncionario = '+inttostr(umFuncionario.getId); //COLOCA CONDIÇAO NO SQL
    end;
    if umFuncionario.getNome_RazaoSoCial <> '' then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' nome like '+quotedstr('%'+umFuncionario.getNome_RazaoSoCial+'%');
    end;
    if umFuncionario.getCPF_CNPJ <> '' then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' cpf = '''+umFuncionario.getCPF_CNPJ+'''';
    end;
    with umDM do
    begin
        QFuncionario.Close;
        QFuncionario.sql.Text := sql+' order by idfuncionario';
        QFuncionario.Open;
        if QFuncionario.RecordCount > 0 then
          result := True
        else
          result := false;
    end;
end;

procedure DaoFuncionario.AtualizaGrid;
begin
  with umDM do
    begin
        QFuncionario.Close;
        QFuncionario.sql.Text := 'select * from funcionario order by idfuncionario';
        QFuncionario.Open;
    end;
end;

function DaoFuncionario.VefiricaCPF(obj: TObject): Boolean;
var sql : string;
    umFuncionario : Funcionario;
begin
  umFuncionario := Funcionario(obj);
  sql := 'select * from funcionario where cpf = '''+umFuncionario.getCPF_CNPJ+''' and datademissao IS NULL';
  with umDM do
  begin
    QFuncionario.Close;
    QFuncionario.sql.Text := sql+' order by idfuncionario';
    QFuncionario.Open;
    if QFuncionario.RecordCount > 0 then
      result := True
    else
      result := false;
  end;
end;

function DaoFuncionario.Carrega(obj: TObject): TObject;
var
    umFuncionario  : Funcionario;
    umEndereco : Endereco;
begin
    umFuncionario := Funcionario(obj);
    umEndereco := Endereco.CrieObjeto;
    with umDM do
    begin
        if not QFuncionario.Active then
            QFuncionario.Open;

        if umFuncionario.getId <> 0 then
        begin
          QFuncionario.Close;
          QFuncionario.SQL.Text := 'select * from funcionario where idfuncionario = '+IntToStr(umFuncionario.getId);
          QFuncionario.Open;
        end;

        umFuncionario.setId(QFuncionarioidfuncionario.AsInteger);
        umFuncionario.setNome_RazaoSoCial(QFuncionarionome.AsString);
        //Endereço
        umEndereco.setLogradouro(QFuncionariologradouro.AsString);
        umEndereco.setNumero(QFuncionarionumero.AsString);
        umEndereco.setCEP(QFuncionariocep.AsString);
        umEndereco.setBairro(QFuncionariobairro.AsString);
        umEndereco.setComplemento(QFuncionariocomplemento.AsString);

        umFuncionario.setumEndereco(umEndereco);
        umFuncionario.setEmail(QFuncionarioemail.AsString);
        umFuncionario.setTelefone(QFuncionariotelefone.AsString);
        umFuncionario.setCelular(QFuncionariocelular.AsString);
        umFuncionario.setCPF_CNPJ(QFuncionariocpf.AsString);
        umFuncionario.setRG_IE(QFuncionariorg.AsString);
        umFuncionario.setCTPS(QFuncionarioctps.AsString);
        umFuncionario.setCNH(QFuncionariocnh.AsString);

        umFuncionario.setDataAdmissao(QFuncionariodataadmissao.AsDateTime);
        umFuncionario.setDataDemissao(QFuncionariodatademissao.AsDateTime);
        umFuncionario.setDataVencimento(QFuncionariodatavencimento.AsDateTime);

        umFuncionario.setDataNasc_Fund(QFuncionariodatanascimento.AsDateTime);
        umFuncionario.setDataCadastro(QFuncionariodatacadastro.AsDateTime);
        umFuncionario.setDataUltAlteracao(QFuncionariodataalteracao.AsDateTime);
        umFuncionario.setObservacao(QFuncionarioobservacao.AsString);
        //Busca a Cidade referente ao Funcionario
        umFuncionario.getumEndereco.getumaCidade.setId(QFuncionarioidcidade.AsInteger);
        umaDaoCidade.Carrega(umFuncionario.getumEndereco.getumaCidade);
        //Busca o Cargo referente ao Funcionario
        umFuncionario.getUmCargo.setId(QFuncionarioidcargo.AsInteger);
        umCargo.Carrega(umFuncionario.getUmCargo);
    end;
    result := umFuncionario;
    Self.AtualizaGrid;
end;

constructor DaoFuncionario.CrieObjeto;
begin
    inherited;
    umaDaoCidade  := DaoCidade.CrieObjeto;
    umCargo       := DaoCargo.CrieObjeto;
end;

destructor DaoFuncionario.Destrua_se;
begin
    inherited;
end;

function DaoFuncionario.Excluir(obj: TObject): string;
var
    umFuncionario: Funcionario;
begin
    umFuncionario := Funcionario(obj);
    with umDM do
    begin
        try
            beginTrans;
            QFuncionario.SQL := UpdateFuncionario.DeleteSQL;
            QFuncionario.Params.ParamByName('OLD_idfuncionario').Value := umFuncionario.getId;
            QFuncionario.ExecSQL;
            Commit;
            result := 'Funcionario excluído com sucesso!';
        except
            on e:Exception do
            begin
                rollback;
                if pos('chave estrangeira',e.Message)>0 then
                    result := 'Ocorreu um erro! O Funcionario não pode ser excluído pois ja está sendo usado pelo sistema.'
                else
                    result := 'Ocorreu um erro! Funcionario não foi excluído. Erro: '+e.Message;
            end;
        end;
    end;
    Self.AtualizaGrid;
end;

function DaoFuncionario.GetDS: TDataSource;
begin
    umDM.QFuncionario.FieldByName('nome').DisplayWidth := 60;
    umDM.QFuncionario.FieldByName('logradouro').DisplayWidth := 60;
    Self.AtualizaGrid;
    result := umDM.DSFuncionario;
end;

procedure DaoFuncionario.Ordena(campo: string);
begin
    umDM.QFuncionario.IndexFieldNames := campo;
end;

function DaoFuncionario.Salvar(obj: TObject): string;
var
    umFuncionario : Funcionario;
begin
    umFuncionario := Funcionario(obj);
    with umDM do
    begin
        try
            beginTrans;
            QFuncionario.Close;
            if (idLogado = umFuncionario.getId) then
              nomeLogado := umFuncionario.getNome_RazaoSoCial;

            if umFuncionario.getId = 0 then
            begin
                if (Self.Buscar(umFuncionario)) then
                begin
                   Result := 'Já existe um funcionário com esse CPF cadastrado!';
                   Self.AtualizaGrid;
                   Exit;
                end;
                QFuncionario.SQL := UpdateFuncionario.InsertSQL
            end
            else
            begin
                if (not Self.Buscar(umFuncionario)) and (not umFuncionario.verificaNome)  then
                begin
                  if (not Self.VefiricaCPF(umFuncionario)) then
                  begin
                    QFuncionario.SQL := UpdateFuncionario.ModifySQL;
                    QFuncionario.Params.ParamByName('OLD_idfuncionario').Value := umFuncionario.getId;
                  end
                  else
                  begin
                     Result := 'Já existe um funcionário com esse CPF cadastrado!';
                     Self.AtualizaGrid;
                     Exit;
                  end;
                end
                else
                begin
                  QFuncionario.SQL := UpdateFuncionario.ModifySQL;
                  QFuncionario.Params.ParamByName('OLD_idfuncionario').Value := umFuncionario.getId;
                end;
            end;
            QFuncionario.Params.ParamByName('nome').Value := umFuncionario.getNome_RazaoSoCial;
            QFuncionario.Params.ParamByName('logradouro').Value := umFuncionario.getumEndereco.getLogradouro;
            QFuncionario.Params.ParamByName('numero').Value := umFuncionario.getumEndereco.getNumero;
            QFuncionario.Params.ParamByName('cep').Value := umFuncionario.getumEndereco.getCEP;
            QFuncionario.Params.ParamByName('bairro').Value := umFuncionario.getumEndereco.getBairro;
            QFuncionario.Params.ParamByName('complemento').Value := umFuncionario.getumEndereco.getComplemento;
            QFuncionario.Params.ParamByName('idcidade').Value := umFuncionario.getumEndereco.getumaCidade.getId;
            QFuncionario.Params.ParamByName('email').Value := umFuncionario.getEmail;
            QFuncionario.Params.ParamByName('telefone').Value := umFuncionario.getTelefone;
            QFuncionario.Params.ParamByName('celular').Value := umFuncionario.getCelular;
            QFuncionario.Params.ParamByName('cpf').Value := umFuncionario.getCPF_CNPJ;
            QFuncionario.Params.ParamByName('rg').Value := umFuncionario.getRG_IE;
            QFuncionario.Params.ParamByName('ctps').Value := umFuncionario.getCTPS;
            QFuncionario.Params.ParamByName('cnh').Value := umFuncionario.getCNH;
            if umFuncionario.getDataVencimento <> StrToDateTime('30/12/1899') then
              QFuncionario.Params.ParamByName('datavencimento').Value := umFuncionario.getDataVencimento;
            if umFuncionario.getDataAdmissao <> StrToDateTime('30/12/1899') then
              QFuncionario.Params.ParamByName('dataadmissao').Value := umFuncionario.getDataAdmissao;
            if umFuncionario.getDataDemissao <> StrToDateTime('30/12/1899') then
            begin
              QFuncionario.Params.ParamByName('datademissao').Value := umFuncionario.getDataDemissao;

              if umFuncionario.getId <> 0 then
              begin
                umaDaoUsuario := DaoUsuario.CrieObjeto;
                umUsuario     := Usuario.CrieObjeto;
                umaDaoUsuario.BuscarFuncionario(umFuncionario.getId);
                umaDaoUsuario.CarregaUsuario(umUsuario);

                umUsuario.getUmFuncionario.setId(umFuncionario.getId);
                umUsuario.setStatus('BLOQUEADO');
                umaDaoUsuario.Salvar(umUsuario);
              end;
            end;
            QFuncionario.Params.ParamByName('idcargo').Value := umFuncionario.getUmCargo.getId;
            QFuncionario.Params.ParamByName('datanascimento').Value := umFuncionario.getDataNasc_Fund;
            QFuncionario.Params.ParamByName('datacadastro').Value := umFuncionario.getDataCadastro;
            QFuncionario.Params.ParamByName('dataalteracao').Value := umFuncionario.getDataUltAlteracao;
            QFuncionario.Params.ParamByName('observacao').Value := umFuncionario.getObservacao;

            QFuncionario.ExecSQL;
            Commit;
            result := 'Funcionário salvo com sucesso!';
        except
          on e: Exception do
          begin
              rollback;
              Result := 'Ocorreu um erro! Funcionário não foi salvo. Erro: '+e.Message;
          end;
        end;
    end;
    Self.AtualizaGrid;
end;

end.
