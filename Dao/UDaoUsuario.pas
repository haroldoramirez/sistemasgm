unit UDaoUsuario;

interface
      uses uDao, DB, SysUtils, Messages, UUsuario, UDaoFuncionario;
      type DaoUsuario = class(Dao)
      private

      protected
         umUsuario : Usuario;
         umaDaoFuncionario : DaoFuncionario;
      public
          Constructor CrieObjeto;
          Destructor Destrua_se;
          function Salvar(obj:TObject): string;      override;
          function GetDS : TDataSource;              override;
          function Carrega(obj:TObject): TObject;    override;
          function Buscar(obj : TObject) : Boolean;  override;
          function Excluir(obj : TObject) : string ; override;
          function validaUsuario(vUsuario: Usuario): Boolean;
          function BuscarFuncionario(id : Integer) : Boolean;
          function BuscarUsuario(usuario : String) : Boolean;
          function CarregaUsuario(obj:TObject): TObject;
          procedure AtualizaGrid;
          procedure Ordena(campo: string);
end;

implementation

uses UAplicacao;

{ DaoUsuario }

function DaoUsuario.Buscar(obj: TObject): Boolean;
var
    prim: Boolean;
    sql, e, onde: string;
    umUsuario: Usuario;
begin
    e := ' and ';
    onde := ' where';
    prim := true;
    umUsuario := Usuario(obj);
    sql := 'select * from usuario';
    if umUsuario.getIdUsuario <> 0 then
    begin
        if prim then  //SE FOR O PRIMEIRO, SETA COMO FLAG COMO FALSO PQ É O PRIMEIRO
        begin
            prim := false;
            sql := sql+onde;
        end
        else //SE NAO, COLOCA CLAUSULA AND PARA JUNTAR CONDIÇOES
            sql := sql+e;
        sql := sql+' idusuario = '+inttostr(umUsuario.getIdUsuario); //COLOCA CONDIÇAO NO SQL
    end;
    if umUsuario.getLogin <> '' then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' login like '+quotedstr('%'+umUsuario.getLogin+'%');
    end;
    if umUsuario.getUmFuncionario.getId <> 0 then
    begin
        if prim then
         begin
            prim := false;
            sql := sql+onde;
        end
        else
            sql := sql+e;
        sql := sql+' idfuncionario = '+inttostr(umUsuario.getUmFuncionario.getId);
    end;
    with umDM do
    begin
        QUsuario.Close;
        QUsuario.sql.Text := sql +' order by idusuario';
        QUsuario.Open;
        if QUsuario.RecordCount > 0 then
          result := True
        else
          result := false;
    end;
end;

function DaoUsuario.BuscarFuncionario(id : Integer) : Boolean;
begin
  with umDM do
    begin
        QUsuario.Close;
        QUsuario.sql.Text := 'select * from usuario where idfuncionario = '+ IntToStr(id);
        QUsuario.Open;
        if QUsuario.RecordCount > 0 then
          result := True
        else
          result := false;
    end;
    Self.AtualizaGrid;
end;

function DaoUsuario.BuscarUsuario(usuario : String) : Boolean;
begin
  with umDM do
    begin
        QUsuario.Close;
        QUsuario.sql.Text := 'select * from usuario where login = '''+ usuario+ '''';
        QUsuario.Open;
        if QUsuario.RecordCount > 0 then
          result := True
        else
          result := false;
    end;
    Self.AtualizaGrid;

end;

function DaoUsuario.validaUsuario(vUsuario: Usuario): Boolean;
begin
  with umDM do
  begin
    QUsuario.Close;
    QUsuario.SQL.Text := 'select * from usuario where login like '+quotedstr(vUsuario.getLogin)+
    ' and senha like '+quotedstr(vUsuario.getSenha);
    QUsuario.Open;
    if QUsuario.RecordCount > 0 then
    begin
      vUsuario.setIdUsuario(QUsuarioidusuario.AsInteger);
      vUsuario.setSenha(QUsuariosenha.AsString);
      vUsuario.setLogin(QUsuariologin.AsString);
      vUsuario.setStatus(QUsuariostatus.AsString);
      result := True;
    end
    else
      result := False;
  end;
end;

procedure DaoUsuario.AtualizaGrid;
begin
  with umDM do
    begin
        QUsuario.Close;
        QUsuario.sql.Text := 'select * from usuario order by idusuario';
        QUsuario.Open;
    end;
end;

function DaoUsuario.Carrega(obj: TObject): TObject;
var
    umUsuario: Usuario;
begin
    umUsuario := Usuario(obj);
    with umDM do
    begin
        if not QUsuario.Active then
            QUsuario.Open;

        if umUsuario.getIdUsuario <> 0 then
          begin
            QUsuario.Close;
            QUsuario.SQL.Text := 'select * from usuario where idusuario = '+IntToStr(umUsuario.getIdUsuario);
            QUsuario.Open;
          end;

        umUsuario.setIdUsuario(QUsuarioidusuario.AsInteger);
        umUsuario.setLogin(QUsuariologin.AsString);
        umUsuario.setSenha(QUsuariosenha.AsString);
        umUsuario.setStatus(QUsuariostatus.AsString);
        umUsuario.setPerfil(QUsuarioperfil.AsString);
        umUsuario.setDataCadastro(QUsuariodatacadastro.AsDateTime);
        umUsuario.setDataAlteracao(QUsuariodataalteracao.AsDateTime);

        // Busca o Funcionário referente ao Usuario
        umUsuario.getumFuncionario.setId(QUsuarioidfuncionario.AsInteger);
        umaDaoFuncionario.Carrega(umUsuario.getUmFuncionario);
    end;
    result := umUsuario;
    Self.AtualizaGrid;
end;

function DaoUsuario.CarregaUsuario(obj: TObject): TObject;
var
    umUsuario: Usuario;
begin
    umUsuario := Usuario(obj);
    with umDM do
    begin
        if not QUsuario.Active then
            QUsuario.Open;

        if umUsuario.getIdUsuario <> 0 then
          begin
            QUsuario.Close;
            QUsuario.SQL.Text := 'select * from usuario where idusuario = '+IntToStr(umUsuario.getIdUsuario);
            QUsuario.Open;
          end;

        umUsuario.setIdUsuario(QUsuarioidusuario.AsInteger);
        umUsuario.setLogin(QUsuariologin.AsString);
        umUsuario.setSenha(QUsuariosenha.AsString);
        umUsuario.setPerfil(QUsuarioperfil.AsString);
        umUsuario.setStatus(QUsuariostatus.AsString);
        umUsuario.setDataCadastro(QUsuariodatacadastro.AsDateTime);
        umUsuario.setDataAlteracao(QUsuariodataalteracao.AsDateTime);
    end;
    result := umUsuario;
    Self.AtualizaGrid;
end;

constructor DaoUsuario.CrieObjeto;
begin
    inherited;
    umaDaoFuncionario := DaoFuncionario.CrieObjeto;
end;

destructor DaoUsuario.Destrua_se;
begin
    inherited;
end;

function DaoUsuario.Excluir(obj: TObject): string;
var
    umUsuario: Usuario;
begin
    umUsuario := Usuario(obj);
    with umDM do
    begin
        try
            beginTrans;
            QUsuario.SQL := UpdateUsuario.DeleteSQL;
            QUsuario.Params.ParamByName('OLD_idusuario').Value := umUsuario.getIdUsuario;
            QUsuario.ExecSQL;
            Commit;
            result := 'Usuario excluído com sucesso!';
        except
            on e:Exception do
            begin
                rollback;
                if pos('chave estrangeira',e.Message)>0 then
                    result := 'Ocorreu um erro! O Usuario não pode ser excluído pois ja está sendo usado pelo sistema.'
                else
                    result := 'Ocorreu um erro! Usuario não foi excluído. Erro: '+e.Message;
            end;
        end;
    end;
    Self.AtualizaGrid;
end;

function DaoUsuario.GetDS: TDataSource;
begin
    umDM.QUsuario.FieldByName('senha').Visible := False;
    Self.AtualizaGrid;
    result := umDM.DSUsuario;
end;

procedure DaoUsuario.Ordena(campo: string);
begin
    umDM.QUsuario.IndexFieldNames := campo;
end;

function DaoUsuario.Salvar(obj: TObject): string;
var
    umUsuario : Usuario;
begin
    umUsuario := Usuario(obj);
    with umDM do
    begin
        try
            beginTrans;
            QUsuario.Close;
            if (idLogado <> umUsuario.getUmFuncionario.getId) and (idUserLogado = umUsuario.getIdUsuario) then
            begin
              idUserLogado := umUsuario.getIdUsuario;
              idLogado     := umUsuario.getUmFuncionario.getId;
            end;
            if (nomeLogado <> umUsuario.getUmFuncionario.getNome_RazaoSoCial) and (idUserLogado = umUsuario.getIdUsuario) then
              nomeLogado := umUsuario.getUmFuncionario.getNome_RazaoSoCial;             
            
            if umUsuario.getIdUsuario = 0 then
            begin
                if(Self.Buscar(umUsuario)) then
                begin
                  Result := 'Esse usuário já existe!';
                  Self.AtualizaGrid;
                  Exit;
                end;
                QUsuario.SQL := UpdateUsuario.InsertSQL
            end
            else
            begin
                if(not Self.Buscar(umUsuario)) then
                begin
                  if (Self.BuscarUsuario(umUsuario.getLogin)) and (umUsuario.verificaLogin) then
                  begin
                    Result := 'Esse usuário já existe!';
                    Self.AtualizaGrid;
                    Exit;
                  end
                  else
                  begin
                    QUsuario.SQL := UpdateUsuario.ModifySQL;
                    QUsuario.Params.ParamByName('OLD_idusuario').Value := umUsuario.getIdUsuario;
                  end;
                end
                else
                begin
                  QUsuario.SQL := UpdateUsuario.ModifySQL;
                  QUsuario.Params.ParamByName('OLD_idusuario').Value := umUsuario.getIdUsuario;
                end;
            end;
            QUsuario.Params.ParamByName('login').Value := umUsuario.getLogin;
            QUsuario.Params.ParamByName('senha').Value := umUsuario.getSenha;
            QUsuario.Params.ParamByName('status').Value := umUsuario.getStatus;
            QUsuario.Params.ParamByName('perfil').Value := umUsuario.getPerfil;
            QUsuario.Params.ParamByName('idfuncionario').Value := umUsuario.getUmFuncionario.getId;
            QUsuario.Params.ParamByName('datacadastro').Value := umUsuario.getDataCadastro;
            QUsuario.Params.ParamByName('dataalteracao').Value := umUsuario.getDataAlteracao;

            QUsuario.ExecSQL;
            Commit;
            result := 'Usuário salvo com sucesso!';
        except
          on e: Exception do
          begin
              rollback;
              Result := 'Ocorreu um erro! Usuário não foi salvo. Erro: '+e.Message;
          end;
        end;
    end;
    Self.AtualizaGrid;
end;

end.
