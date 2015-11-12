INSERT INTO unidade (descricao, datacadastro, dataalteracao) VALUES ('MT2',  CURRENT_DATE , CURRENT_DATE );
INSERT INTO unidade (descricao, datacadastro, dataalteracao) VALUES ('MT',  CURRENT_DATE , CURRENT_DATE );
INSERT INTO unidade (descricao, datacadastro, dataalteracao) VALUES ('UNI',  CURRENT_DATE , CURRENT_DATE );
INSERT INTO unidade (descricao, datacadastro, dataalteracao) VALUES ('Q',  CURRENT_DATE , CURRENT_DATE );

INSERT INTO pais (descricao, ddi, datacadastro, dataalteracao) VALUES ('BRASIL','+55', CURRENT_DATE, CURRENT_DATE);
INSERT INTO estado (descricao, uf, idpais, datacadastro,dataalteracao) VALUES ('PARANA','PR',1,CURRENT_DATE, CURRENT_DATE);
INSERT INTO cidade (descricao, ddd, idestado, datacadastro,dataalteracao) VALUES ('FOZ DO IGUAÇU','45',1, CURRENT_DATE, CURRENT_DATE);


INSERT INTO cargo (descricao, datacadastro,dataalteracao) VALUES ('VENDEDOR', CURRENT_DATE, CURRENT_DATE);
INSERT INTO funcionario (
            nome, 
            idcargo, 
            logradouro, 
            numero, 
            cep, 
            bairro, 
            complemento, 
            idcidade, 
            email, 
            telefone, 
            celular, 
            cpf, 
            rg, 
            datanascimento, 
            ctps, 
            cnh, 
            datavencimento, 
            datacadastro, 
            dataalteracao, 
            dataadmissao, 
            datademissao, 
            observacao) 
            VALUES ('ADMIN', 1, 'RUA', '1234', '85875-000', 'CENTRO', 'CASA', 1, 'email@email.com', '', '', '732.288.769-77', '', '1900-01-01', '12345678', '', NULL, CURRENT_DATE, CURRENT_DATE, NULL, NULL, '');


INSERT INTO usuario (login, senha, idfuncionario, status, perfil, datacadastro, dataalteracao) VALUES ('ADMIN', 'ADMIN', 1, 'ATIVO', 'ADM', CURRENT_DATE, CURRENT_DATE);
