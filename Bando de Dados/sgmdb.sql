--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.4
-- Dumped by pg_dump version 9.4.4
-- Started on 2015-11-12 15:11:08

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 218 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2238 (class 0 OID 0)
-- Dependencies: 218
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 172 (class 1259 OID 29770)
-- Name: cargo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cargo (
    idcargo integer NOT NULL,
    descricao character varying(100) NOT NULL,
    datacadastro date,
    dataalteracao date NOT NULL
);


ALTER TABLE cargo OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 29773)
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categoria (
    idcategoria integer NOT NULL,
    descricao character varying(100) NOT NULL,
    datacadastro date,
    dataalteracao date
);


ALTER TABLE categoria OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 29776)
-- Name: cfop; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cfop (
    idcfop integer NOT NULL,
    nome character varying(100) NOT NULL,
    datacadastro date,
    dataalteracao date,
    numero character varying(5)
);


ALTER TABLE cfop OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 29779)
-- Name: cidade; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cidade (
    idcidade integer NOT NULL,
    descricao character varying(100) NOT NULL,
    ddd character varying(2),
    idestado integer NOT NULL,
    datacadastro date,
    dataalteracao date
);


ALTER TABLE cidade OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 29782)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cliente (
    idcliente integer NOT NULL,
    nome_razaosocial character varying(100) NOT NULL,
    logradouro character varying(100) NOT NULL,
    numero character varying(10) NOT NULL,
    cep character varying(9),
    bairro character varying(50) NOT NULL,
    complemento character varying(50),
    idcidade integer NOT NULL,
    email character varying(100),
    telefone character varying(20),
    celular character varying(20),
    cpf_cnpj character varying(18),
    rg_ie character varying(10),
    tipopessoa character varying(8) NOT NULL,
    idcondicaopagamento integer NOT NULL,
    datanasc_fund date,
    datacadastro date NOT NULL,
    dataalteracao date NOT NULL,
    observacao character varying(255)
);


ALTER TABLE cliente OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 29788)
-- Name: compra; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE compra (
    idcompra integer NOT NULL,
    numnota integer NOT NULL,
    serienota character varying(2) NOT NULL,
    idfornecedor integer NOT NULL,
    idcondicaopagamento integer NOT NULL,
    idusuario integer NOT NULL,
    idtransportadora integer,
    tipofrete integer NOT NULL,
    base_icms real NOT NULL,
    valor_frete real,
    total_icms real,
    total_ipi real,
    valor_desconto real NOT NULL,
    total_produto real NOT NULL,
    total_nota real NOT NULL,
    status character varying(15) NOT NULL,
    datacompra date NOT NULL,
    dataemissao date NOT NULL,
    datacadastro date NOT NULL,
    dataalteracao date NOT NULL,
    observacao character varying(255)
);


ALTER TABLE compra OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 29791)
-- Name: compra_idcompra_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE compra_idcompra_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE compra_idcompra_seq OWNER TO postgres;

--
-- TOC entry 2239 (class 0 OID 0)
-- Dependencies: 178
-- Name: compra_idcompra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE compra_idcompra_seq OWNED BY compra.idcompra;


--
-- TOC entry 179 (class 1259 OID 29793)
-- Name: condicaopagamento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE condicaopagamento (
    idcondicaopagamento integer NOT NULL,
    idformapagamento integer NOT NULL,
    descricao character varying(100) NOT NULL,
    datacadastro date NOT NULL,
    dataalteracao date NOT NULL
);


ALTER TABLE condicaopagamento OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 29796)
-- Name: contapagar; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contapagar (
    idcontapagar integer NOT NULL,
    idcompra integer,
    numnota integer NOT NULL,
    serienota character varying(2) NOT NULL,
    numparcela integer NOT NULL,
    idfornecedor integer NOT NULL,
    idusuario integer NOT NULL,
    idformapagamento integer NOT NULL,
    dataemissao date NOT NULL,
    datavencimento date NOT NULL,
    datapagamento date,
    valor real,
    multa real,
    juros real,
    desconto real,
    status character varying(15),
    datacadastro date,
    dataalteracao date,
    observacao character varying(255)
);


ALTER TABLE contapagar OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 29799)
-- Name: contapagar_idcontapagar_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contapagar_idcontapagar_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contapagar_idcontapagar_seq OWNER TO postgres;

--
-- TOC entry 2240 (class 0 OID 0)
-- Dependencies: 181
-- Name: contapagar_idcontapagar_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contapagar_idcontapagar_seq OWNED BY contapagar.idcontapagar;


--
-- TOC entry 182 (class 1259 OID 29801)
-- Name: contareceber; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contareceber (
    numnota integer NOT NULL,
    serienota character varying(2) NOT NULL,
    numparcela integer NOT NULL,
    idcliente integer NOT NULL,
    idformapagamento integer NOT NULL,
    idusuario integer NOT NULL,
    dataemissao date,
    datavencimento date,
    datapagamento date,
    valor real,
    juros real,
    multa real,
    desconto real,
    status character varying(15) NOT NULL,
    datacadastro date,
    dataalteracao date,
    observacao character varying(255)
);


ALTER TABLE contareceber OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 29804)
-- Name: estado; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estado (
    idestado integer NOT NULL,
    descricao character varying(100) NOT NULL,
    uf character varying(3),
    idpais integer NOT NULL,
    datacadastro date,
    dataalteracao date
);


ALTER TABLE estado OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 29807)
-- Name: formapagamento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE formapagamento (
    idformapagamento integer NOT NULL,
    descricao character varying(100) NOT NULL,
    datacadastro date,
    dataalteracao date
);


ALTER TABLE formapagamento OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 29810)
-- Name: fornecedor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fornecedor (
    idfornecedor integer NOT NULL,
    nome_razaosocial character varying(100) NOT NULL,
    logradouro character varying(100) NOT NULL,
    numero character varying(10) NOT NULL,
    cep character varying(9),
    bairro character varying(50) NOT NULL,
    complemento character varying(50),
    idcidade integer NOT NULL,
    email character varying(100),
    telefone character varying(20),
    celular character varying(20),
    cpf_cnpj character varying(18),
    rg_ie character varying(10),
    tipopessoa character varying(8) NOT NULL,
    tipofavorecido character varying(1) NOT NULL,
    datanasc_fund date NOT NULL,
    idcondicaopagamento integer NOT NULL,
    datacadastro date NOT NULL,
    dataalteracao date NOT NULL,
    observacao character varying(255)
);


ALTER TABLE fornecedor OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 29816)
-- Name: funcionario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE funcionario (
    idfuncionario integer NOT NULL,
    nome character varying(100) NOT NULL,
    idcargo integer NOT NULL,
    logradouro character varying(100) NOT NULL,
    numero character varying(10),
    cep character varying(9) NOT NULL,
    bairro character varying(50) NOT NULL,
    complemento character varying(50),
    idcidade integer NOT NULL,
    email character varying(100),
    telefone character varying(20),
    celular character varying(20),
    cpf character varying(14),
    rg character varying(10),
    datanascimento date NOT NULL,
    ctps character varying(8),
    cnh character varying(11),
    datavencimento date,
    datacadastro date NOT NULL,
    dataalteracao date,
    dataadmissao date,
    datademissao date,
    observacao character varying(255)
);


ALTER TABLE funcionario OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 29822)
-- Name: idcargo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE idcargo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE idcargo_seq OWNER TO postgres;

--
-- TOC entry 2241 (class 0 OID 0)
-- Dependencies: 187
-- Name: idcargo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE idcargo_seq OWNED BY cargo.idcargo;


--
-- TOC entry 188 (class 1259 OID 29824)
-- Name: idcategoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE idcategoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE idcategoria_seq OWNER TO postgres;

--
-- TOC entry 2242 (class 0 OID 0)
-- Dependencies: 188
-- Name: idcategoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE idcategoria_seq OWNED BY categoria.idcategoria;


--
-- TOC entry 189 (class 1259 OID 29826)
-- Name: idcfop_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE idcfop_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE idcfop_seq OWNER TO postgres;

--
-- TOC entry 2243 (class 0 OID 0)
-- Dependencies: 189
-- Name: idcfop_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE idcfop_seq OWNED BY cfop.idcfop;


--
-- TOC entry 190 (class 1259 OID 29828)
-- Name: idcidade_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE idcidade_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE idcidade_seq OWNER TO postgres;

--
-- TOC entry 2244 (class 0 OID 0)
-- Dependencies: 190
-- Name: idcidade_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE idcidade_seq OWNED BY cidade.idcidade;


--
-- TOC entry 191 (class 1259 OID 29830)
-- Name: idcliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE idcliente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE idcliente_seq OWNER TO postgres;

--
-- TOC entry 2245 (class 0 OID 0)
-- Dependencies: 191
-- Name: idcliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE idcliente_seq OWNED BY cliente.idcliente;


--
-- TOC entry 192 (class 1259 OID 29832)
-- Name: idcondicaopagamento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE idcondicaopagamento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE idcondicaopagamento_seq OWNER TO postgres;

--
-- TOC entry 2246 (class 0 OID 0)
-- Dependencies: 192
-- Name: idcondicaopagamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE idcondicaopagamento_seq OWNED BY condicaopagamento.idcondicaopagamento;


--
-- TOC entry 193 (class 1259 OID 29834)
-- Name: idestado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE idestado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE idestado_seq OWNER TO postgres;

--
-- TOC entry 2247 (class 0 OID 0)
-- Dependencies: 193
-- Name: idestado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE idestado_seq OWNED BY estado.idestado;


--
-- TOC entry 194 (class 1259 OID 29836)
-- Name: idformapagamento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE idformapagamento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE idformapagamento_seq OWNER TO postgres;

--
-- TOC entry 2248 (class 0 OID 0)
-- Dependencies: 194
-- Name: idformapagamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE idformapagamento_seq OWNED BY formapagamento.idformapagamento;


--
-- TOC entry 195 (class 1259 OID 29838)
-- Name: idfornecedor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE idfornecedor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE idfornecedor_seq OWNER TO postgres;

--
-- TOC entry 2249 (class 0 OID 0)
-- Dependencies: 195
-- Name: idfornecedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE idfornecedor_seq OWNED BY fornecedor.idfornecedor;


--
-- TOC entry 196 (class 1259 OID 29840)
-- Name: idfuncionario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE idfuncionario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE idfuncionario_seq OWNER TO postgres;

--
-- TOC entry 2250 (class 0 OID 0)
-- Dependencies: 196
-- Name: idfuncionario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE idfuncionario_seq OWNED BY funcionario.idfuncionario;


--
-- TOC entry 197 (class 1259 OID 29842)
-- Name: marca; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE marca (
    idmarca integer NOT NULL,
    descricao character varying(50) NOT NULL,
    datacadastro date,
    dataalteracao date
);


ALTER TABLE marca OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 29845)
-- Name: idmarca_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE idmarca_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE idmarca_seq OWNER TO postgres;

--
-- TOC entry 2251 (class 0 OID 0)
-- Dependencies: 198
-- Name: idmarca_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE idmarca_seq OWNED BY marca.idmarca;


--
-- TOC entry 199 (class 1259 OID 29847)
-- Name: ncm; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ncm (
    idncm integer NOT NULL,
    numero integer NOT NULL,
    porcentagem_ipi real,
    datacadastro date,
    dataalteracao date
);


ALTER TABLE ncm OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 29850)
-- Name: idncm_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE idncm_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE idncm_seq OWNER TO postgres;

--
-- TOC entry 2252 (class 0 OID 0)
-- Dependencies: 200
-- Name: idncm_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE idncm_seq OWNED BY ncm.idncm;


--
-- TOC entry 201 (class 1259 OID 29852)
-- Name: pais; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pais (
    idpais integer NOT NULL,
    descricao character varying(100) NOT NULL,
    ddi character varying(4),
    sigla character varying(4),
    datacadastro date,
    dataalteracao date
);


ALTER TABLE pais OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 29855)
-- Name: idpais_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE idpais_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE idpais_seq OWNER TO postgres;

--
-- TOC entry 2253 (class 0 OID 0)
-- Dependencies: 202
-- Name: idpais_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE idpais_seq OWNED BY pais.idpais;


--
-- TOC entry 203 (class 1259 OID 29857)
-- Name: produto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE produto (
    idproduto integer NOT NULL,
    descricao character varying(60) NOT NULL,
    quantidade real,
    icms real,
    ipi real,
    preco_compra double precision,
    preco_venda double precision NOT NULL,
    icms_anterior real,
    ipi_anterior real,
    preco_compra_ant real,
    idmarca integer,
    idcategoria integer,
    observacao character varying(255),
    datacadastro date,
    dataalteracao date,
    cst character varying(4),
    idncm integer,
    unidade character varying(4)
);


ALTER TABLE produto OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 29860)
-- Name: idproduto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE idproduto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE idproduto_seq OWNER TO postgres;

--
-- TOC entry 2254 (class 0 OID 0)
-- Dependencies: 204
-- Name: idproduto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE idproduto_seq OWNED BY produto.idproduto;


--
-- TOC entry 205 (class 1259 OID 29862)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario (
    idusuario integer NOT NULL,
    login character varying(30) NOT NULL,
    senha character varying(10) NOT NULL,
    idfuncionario integer NOT NULL,
    status character varying(15) NOT NULL,
    perfil character varying(3) NOT NULL,
    datacadastro date NOT NULL,
    dataalteracao date NOT NULL
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 29865)
-- Name: idusuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE idusuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE idusuario_seq OWNER TO postgres;

--
-- TOC entry 2255 (class 0 OID 0)
-- Dependencies: 206
-- Name: idusuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE idusuario_seq OWNED BY usuario.idusuario;


--
-- TOC entry 207 (class 1259 OID 29867)
-- Name: veiculo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE veiculo (
    idveiculo integer NOT NULL,
    antt character varying(20) NOT NULL,
    placa character varying(8) NOT NULL,
    uf character varying(2) NOT NULL,
    datacadastro date,
    dataalteracao date
);


ALTER TABLE veiculo OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 29870)
-- Name: idveiculo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE idveiculo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE idveiculo_seq OWNER TO postgres;

--
-- TOC entry 2256 (class 0 OID 0)
-- Dependencies: 208
-- Name: idveiculo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE idveiculo_seq OWNED BY veiculo.idveiculo;


--
-- TOC entry 209 (class 1259 OID 29872)
-- Name: venda; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE venda (
    numnota integer NOT NULL,
    serienota character varying(2) NOT NULL,
    idordemservico integer,
    idcliente integer NOT NULL,
    idcondicaopagamento integer NOT NULL,
    idusuario integer NOT NULL,
    status character varying(15),
    datavenda date NOT NULL,
    dataemissao date NOT NULL,
    datacadastro date NOT NULL,
    dataalteracao date NOT NULL,
    observacao character varying(255)
);


ALTER TABLE venda OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 29875)
-- Name: numnota_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE numnota_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE numnota_seq OWNER TO postgres;

--
-- TOC entry 2257 (class 0 OID 0)
-- Dependencies: 210
-- Name: numnota_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE numnota_seq OWNED BY venda.numnota;


--
-- TOC entry 211 (class 1259 OID 29877)
-- Name: parcelas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE parcelas (
    idcondicaopagamento integer NOT NULL,
    numparcela integer NOT NULL,
    numdias integer NOT NULL,
    porcentagem double precision
);


ALTER TABLE parcelas OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 29880)
-- Name: produto_compra; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE produto_compra (
    idcompra integer NOT NULL,
    numnota integer NOT NULL,
    serienota character varying(2) NOT NULL,
    idfornecedor integer NOT NULL,
    idproduto integer NOT NULL,
    ncm_sh character varying(8) NOT NULL,
    cst integer NOT NULL,
    unidade character varying(20) NOT NULL,
    quantidade real NOT NULL,
    precocusto real NOT NULL,
    desconto real,
    valortotal real NOT NULL,
    baseicms real NOT NULL,
    valoricms real NOT NULL,
    valoripi real,
    icms real NOT NULL,
    ipi real,
    idcfop integer
);


ALTER TABLE produto_compra OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 29883)
-- Name: produto_fornecedor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE produto_fornecedor (
    idfornecedor integer NOT NULL,
    idproduto integer NOT NULL
);


ALTER TABLE produto_fornecedor OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 29886)
-- Name: produto_venda; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE produto_venda (
    idproduto_venda integer NOT NULL,
    numnota integer NOT NULL,
    idproduto integer NOT NULL,
    serienota character varying(2) NOT NULL,
    valorunitario real NOT NULL,
    quantidade real,
    desconto real
);


ALTER TABLE produto_venda OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 29889)
-- Name: produto_venda_idproduto_venda_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE produto_venda_idproduto_venda_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE produto_venda_idproduto_venda_seq OWNER TO postgres;

--
-- TOC entry 2258 (class 0 OID 0)
-- Dependencies: 215
-- Name: produto_venda_idproduto_venda_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE produto_venda_idproduto_venda_seq OWNED BY produto_venda.idproduto_venda;


--
-- TOC entry 216 (class 1259 OID 29891)
-- Name: unidade; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE unidade (
    idunidade integer NOT NULL,
    descricao character varying(20) NOT NULL,
    datacadastro date,
    dataalteracao date
);


ALTER TABLE unidade OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 29894)
-- Name: unidade_idunidade_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE unidade_idunidade_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE unidade_idunidade_seq OWNER TO postgres;

--
-- TOC entry 2259 (class 0 OID 0)
-- Dependencies: 217
-- Name: unidade_idunidade_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE unidade_idunidade_seq OWNED BY unidade.idunidade;


--
-- TOC entry 2020 (class 2604 OID 29896)
-- Name: idcargo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cargo ALTER COLUMN idcargo SET DEFAULT nextval('idcargo_seq'::regclass);


--
-- TOC entry 2021 (class 2604 OID 29897)
-- Name: idcategoria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria ALTER COLUMN idcategoria SET DEFAULT nextval('idcategoria_seq'::regclass);


--
-- TOC entry 2022 (class 2604 OID 29898)
-- Name: idcfop; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cfop ALTER COLUMN idcfop SET DEFAULT nextval('idcfop_seq'::regclass);


--
-- TOC entry 2023 (class 2604 OID 29899)
-- Name: idcidade; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cidade ALTER COLUMN idcidade SET DEFAULT nextval('idcidade_seq'::regclass);


--
-- TOC entry 2024 (class 2604 OID 29900)
-- Name: idcliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente ALTER COLUMN idcliente SET DEFAULT nextval('idcliente_seq'::regclass);


--
-- TOC entry 2025 (class 2604 OID 29901)
-- Name: idcompra; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY compra ALTER COLUMN idcompra SET DEFAULT nextval('compra_idcompra_seq'::regclass);


--
-- TOC entry 2026 (class 2604 OID 29902)
-- Name: idcondicaopagamento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY condicaopagamento ALTER COLUMN idcondicaopagamento SET DEFAULT nextval('idcondicaopagamento_seq'::regclass);


--
-- TOC entry 2027 (class 2604 OID 29903)
-- Name: idcontapagar; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contapagar ALTER COLUMN idcontapagar SET DEFAULT nextval('contapagar_idcontapagar_seq'::regclass);


--
-- TOC entry 2028 (class 2604 OID 29904)
-- Name: idestado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado ALTER COLUMN idestado SET DEFAULT nextval('idestado_seq'::regclass);


--
-- TOC entry 2029 (class 2604 OID 29905)
-- Name: idformapagamento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY formapagamento ALTER COLUMN idformapagamento SET DEFAULT nextval('idformapagamento_seq'::regclass);


--
-- TOC entry 2030 (class 2604 OID 29906)
-- Name: idfornecedor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fornecedor ALTER COLUMN idfornecedor SET DEFAULT nextval('idfornecedor_seq'::regclass);


--
-- TOC entry 2031 (class 2604 OID 29907)
-- Name: idfuncionario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario ALTER COLUMN idfuncionario SET DEFAULT nextval('idfuncionario_seq'::regclass);


--
-- TOC entry 2032 (class 2604 OID 29908)
-- Name: idmarca; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY marca ALTER COLUMN idmarca SET DEFAULT nextval('idmarca_seq'::regclass);


--
-- TOC entry 2033 (class 2604 OID 29909)
-- Name: idncm; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ncm ALTER COLUMN idncm SET DEFAULT nextval('idncm_seq'::regclass);


--
-- TOC entry 2034 (class 2604 OID 29910)
-- Name: idpais; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pais ALTER COLUMN idpais SET DEFAULT nextval('idpais_seq'::regclass);


--
-- TOC entry 2035 (class 2604 OID 29911)
-- Name: idproduto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto ALTER COLUMN idproduto SET DEFAULT nextval('idproduto_seq'::regclass);


--
-- TOC entry 2039 (class 2604 OID 29912)
-- Name: idproduto_venda; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto_venda ALTER COLUMN idproduto_venda SET DEFAULT nextval('produto_venda_idproduto_venda_seq'::regclass);


--
-- TOC entry 2040 (class 2604 OID 29913)
-- Name: idunidade; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unidade ALTER COLUMN idunidade SET DEFAULT nextval('unidade_idunidade_seq'::regclass);


--
-- TOC entry 2036 (class 2604 OID 29914)
-- Name: idusuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario ALTER COLUMN idusuario SET DEFAULT nextval('idusuario_seq'::regclass);


--
-- TOC entry 2037 (class 2604 OID 29915)
-- Name: idveiculo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY veiculo ALTER COLUMN idveiculo SET DEFAULT nextval('idveiculo_seq'::regclass);


--
-- TOC entry 2038 (class 2604 OID 29916)
-- Name: numnota; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venda ALTER COLUMN numnota SET DEFAULT nextval('numnota_seq'::regclass);


--
-- TOC entry 2042 (class 2606 OID 29918)
-- Name: cargo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cargo
    ADD CONSTRAINT cargo_pkey PRIMARY KEY (idcargo);


--
-- TOC entry 2044 (class 2606 OID 29920)
-- Name: categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (idcategoria);


--
-- TOC entry 2046 (class 2606 OID 29922)
-- Name: cfop_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cfop
    ADD CONSTRAINT cfop_pkey PRIMARY KEY (idcfop);


--
-- TOC entry 2048 (class 2606 OID 29924)
-- Name: cidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cidade
    ADD CONSTRAINT cidade_pkey PRIMARY KEY (idcidade);


--
-- TOC entry 2050 (class 2606 OID 29926)
-- Name: cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (idcliente);


--
-- TOC entry 2052 (class 2606 OID 29928)
-- Name: compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY compra
    ADD CONSTRAINT compra_pkey PRIMARY KEY (idcompra, numnota, serienota, idfornecedor);


--
-- TOC entry 2054 (class 2606 OID 29930)
-- Name: condicaopagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY condicaopagamento
    ADD CONSTRAINT condicaopagamento_pkey PRIMARY KEY (idcondicaopagamento);


--
-- TOC entry 2056 (class 2606 OID 29932)
-- Name: contapagar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contapagar
    ADD CONSTRAINT contapagar_pkey PRIMARY KEY (idcontapagar, numnota, serienota, numparcela, idfornecedor);


--
-- TOC entry 2058 (class 2606 OID 29934)
-- Name: contareceber_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contareceber
    ADD CONSTRAINT contareceber_pkey PRIMARY KEY (numnota, serienota, numparcela);


--
-- TOC entry 2060 (class 2606 OID 29936)
-- Name: estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (idestado);


--
-- TOC entry 2062 (class 2606 OID 29938)
-- Name: formapagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY formapagamento
    ADD CONSTRAINT formapagamento_pkey PRIMARY KEY (idformapagamento);


--
-- TOC entry 2064 (class 2606 OID 29940)
-- Name: fornecedor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fornecedor
    ADD CONSTRAINT fornecedor_pkey PRIMARY KEY (idfornecedor);


--
-- TOC entry 2066 (class 2606 OID 29942)
-- Name: funcionario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (idfuncionario);


--
-- TOC entry 2068 (class 2606 OID 29944)
-- Name: marca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY marca
    ADD CONSTRAINT marca_pkey PRIMARY KEY (idmarca);


--
-- TOC entry 2070 (class 2606 OID 29946)
-- Name: ncm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ncm
    ADD CONSTRAINT ncm_pkey PRIMARY KEY (idncm);


--
-- TOC entry 2072 (class 2606 OID 29948)
-- Name: pais_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pais
    ADD CONSTRAINT pais_pkey PRIMARY KEY (idpais);


--
-- TOC entry 2082 (class 2606 OID 29950)
-- Name: parcelas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY parcelas
    ADD CONSTRAINT parcelas_pkey PRIMARY KEY (idcondicaopagamento, numparcela);


--
-- TOC entry 2084 (class 2606 OID 29952)
-- Name: produto_compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY produto_compra
    ADD CONSTRAINT produto_compra_pkey PRIMARY KEY (idcompra, numnota, serienota, idfornecedor, idproduto);


--
-- TOC entry 2086 (class 2606 OID 29954)
-- Name: produto_fornecedor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY produto_fornecedor
    ADD CONSTRAINT produto_fornecedor_pkey PRIMARY KEY (idfornecedor, idproduto);


--
-- TOC entry 2074 (class 2606 OID 29956)
-- Name: produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (idproduto);


--
-- TOC entry 2088 (class 2606 OID 29958)
-- Name: produto_venda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY produto_venda
    ADD CONSTRAINT produto_venda_pkey PRIMARY KEY (idproduto_venda, numnota, idproduto, serienota);


--
-- TOC entry 2090 (class 2606 OID 29960)
-- Name: unidade_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unidade
    ADD CONSTRAINT unidade_pk PRIMARY KEY (idunidade);


--
-- TOC entry 2076 (class 2606 OID 29962)
-- Name: usuario_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pk PRIMARY KEY (idusuario);


--
-- TOC entry 2078 (class 2606 OID 29964)
-- Name: veiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY veiculo
    ADD CONSTRAINT veiculo_pkey PRIMARY KEY (idveiculo);


--
-- TOC entry 2080 (class 2606 OID 29966)
-- Name: venda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY venda
    ADD CONSTRAINT venda_pkey PRIMARY KEY (numnota, serienota);


--
-- TOC entry 2091 (class 2606 OID 29967)
-- Name: cidade_idestado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cidade
    ADD CONSTRAINT cidade_idestado_fkey FOREIGN KEY (idestado) REFERENCES estado(idestado);


--
-- TOC entry 2092 (class 2606 OID 29972)
-- Name: cliente_idcidade_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_idcidade_fkey FOREIGN KEY (idcidade) REFERENCES cidade(idcidade);


--
-- TOC entry 2093 (class 2606 OID 29977)
-- Name: cliente_idcondicaopagamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_idcondicaopagamento_fkey FOREIGN KEY (idcondicaopagamento) REFERENCES condicaopagamento(idcondicaopagamento);


--
-- TOC entry 2094 (class 2606 OID 29982)
-- Name: compra_idcondicaopagamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY compra
    ADD CONSTRAINT compra_idcondicaopagamento_fkey FOREIGN KEY (idcondicaopagamento) REFERENCES condicaopagamento(idcondicaopagamento);


--
-- TOC entry 2095 (class 2606 OID 29987)
-- Name: compra_idfornecedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY compra
    ADD CONSTRAINT compra_idfornecedor_fkey FOREIGN KEY (idfornecedor) REFERENCES fornecedor(idfornecedor);


--
-- TOC entry 2097 (class 2606 OID 29992)
-- Name: condicaopagamento_idformapagamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY condicaopagamento
    ADD CONSTRAINT condicaopagamento_idformapagamento_fkey FOREIGN KEY (idformapagamento) REFERENCES formapagamento(idformapagamento);


--
-- TOC entry 2098 (class 2606 OID 29997)
-- Name: contapagar_idformapagamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contapagar
    ADD CONSTRAINT contapagar_idformapagamento_fkey FOREIGN KEY (idformapagamento) REFERENCES formapagamento(idformapagamento);


--
-- TOC entry 2100 (class 2606 OID 30002)
-- Name: contareceber_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contareceber
    ADD CONSTRAINT contareceber_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES cliente(idcliente);


--
-- TOC entry 2101 (class 2606 OID 30007)
-- Name: contareceber_idformapagamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contareceber
    ADD CONSTRAINT contareceber_idformapagamento_fkey FOREIGN KEY (idformapagamento) REFERENCES formapagamento(idformapagamento);


--
-- TOC entry 2102 (class 2606 OID 30012)
-- Name: contareceber_numnota_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contareceber
    ADD CONSTRAINT contareceber_numnota_fkey FOREIGN KEY (serienota, numnota) REFERENCES venda(serienota, numnota);


--
-- TOC entry 2104 (class 2606 OID 30017)
-- Name: estado_idpais_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT estado_idpais_fkey FOREIGN KEY (idpais) REFERENCES pais(idpais);


--
-- TOC entry 2105 (class 2606 OID 30022)
-- Name: fornecedor_idcidade_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fornecedor
    ADD CONSTRAINT fornecedor_idcidade_fkey FOREIGN KEY (idcidade) REFERENCES cidade(idcidade);


--
-- TOC entry 2106 (class 2606 OID 30027)
-- Name: funcionario_idcargo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT funcionario_idcargo_fkey FOREIGN KEY (idcargo) REFERENCES cargo(idcargo);


--
-- TOC entry 2107 (class 2606 OID 30032)
-- Name: funcionario_idcidade_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT funcionario_idcidade_fkey FOREIGN KEY (idcidade) REFERENCES cidade(idcidade);


--
-- TOC entry 2110 (class 2606 OID 30037)
-- Name: funcionario_usuario_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT funcionario_usuario_fk FOREIGN KEY (idfuncionario) REFERENCES funcionario(idfuncionario);


--
-- TOC entry 2114 (class 2606 OID 30042)
-- Name: parcelas_idcondicaopagamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY parcelas
    ADD CONSTRAINT parcelas_idcondicaopagamento_fkey FOREIGN KEY (idcondicaopagamento) REFERENCES condicaopagamento(idcondicaopagamento);


--
-- TOC entry 2115 (class 2606 OID 30047)
-- Name: produto_compra_idcfop_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto_compra
    ADD CONSTRAINT produto_compra_idcfop_fkey FOREIGN KEY (idcfop) REFERENCES cfop(idcfop) MATCH FULL;


--
-- TOC entry 2116 (class 2606 OID 30052)
-- Name: produto_compra_idfornecedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto_compra
    ADD CONSTRAINT produto_compra_idfornecedor_fkey FOREIGN KEY (numnota, serienota, idfornecedor, idcompra) REFERENCES compra(numnota, serienota, idfornecedor, idcompra);


--
-- TOC entry 2117 (class 2606 OID 30057)
-- Name: produto_compra_idproduto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto_compra
    ADD CONSTRAINT produto_compra_idproduto_fkey FOREIGN KEY (idproduto) REFERENCES produto(idproduto);


--
-- TOC entry 2118 (class 2606 OID 30062)
-- Name: produto_fornecedor_idfornecedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto_fornecedor
    ADD CONSTRAINT produto_fornecedor_idfornecedor_fkey FOREIGN KEY (idfornecedor) REFERENCES fornecedor(idfornecedor);


--
-- TOC entry 2119 (class 2606 OID 30067)
-- Name: produto_fornecedor_idproduto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto_fornecedor
    ADD CONSTRAINT produto_fornecedor_idproduto_fkey FOREIGN KEY (idproduto) REFERENCES produto(idproduto);


--
-- TOC entry 2108 (class 2606 OID 30072)
-- Name: produto_idmarca_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto
    ADD CONSTRAINT produto_idmarca_fkey FOREIGN KEY (idmarca) REFERENCES marca(idmarca);


--
-- TOC entry 2109 (class 2606 OID 30077)
-- Name: produto_idncm_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto
    ADD CONSTRAINT produto_idncm_fkey FOREIGN KEY (idncm) REFERENCES ncm(idncm) MATCH FULL;


--
-- TOC entry 2120 (class 2606 OID 30082)
-- Name: produto_venda_idproduto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto_venda
    ADD CONSTRAINT produto_venda_idproduto_fkey FOREIGN KEY (idproduto) REFERENCES produto(idproduto);


--
-- TOC entry 2121 (class 2606 OID 30087)
-- Name: produto_venda_numnota_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto_venda
    ADD CONSTRAINT produto_venda_numnota_fkey FOREIGN KEY (serienota, numnota) REFERENCES venda(serienota, numnota);


--
-- TOC entry 2096 (class 2606 OID 30092)
-- Name: usuario_compra_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY compra
    ADD CONSTRAINT usuario_compra_fk FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2099 (class 2606 OID 30097)
-- Name: usuario_contapagar_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contapagar
    ADD CONSTRAINT usuario_contapagar_fk FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2103 (class 2606 OID 30102)
-- Name: usuario_contareceber_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contareceber
    ADD CONSTRAINT usuario_contareceber_fk FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2111 (class 2606 OID 30107)
-- Name: usuario_venda_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venda
    ADD CONSTRAINT usuario_venda_fk FOREIGN KEY (idusuario) REFERENCES usuario(idusuario);


--
-- TOC entry 2112 (class 2606 OID 30112)
-- Name: venda_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venda
    ADD CONSTRAINT venda_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES cliente(idcliente);


--
-- TOC entry 2113 (class 2606 OID 30117)
-- Name: venda_idcondicaopagamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venda
    ADD CONSTRAINT venda_idcondicaopagamento_fkey FOREIGN KEY (idcondicaopagamento) REFERENCES condicaopagamento(idcondicaopagamento);


--
-- TOC entry 2237 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-11-12 15:11:10

--
-- PostgreSQL database dump complete
--
