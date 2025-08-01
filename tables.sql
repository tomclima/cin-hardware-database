-- Geral:
    -- Loki: Faz sentido forçar NOT NULL em alguns atributos? e.g TIPO_ITEM.nome garante que so vai poder existir um tipo de item com o nome (obs: isso já pode ter sido grantido de algum modo). Nesse caso seria apenas para deixar essa verificação a nível de banco de dados e não no back. *Checar o trade-off disso


-- Usar CPF como id? Não seria melhor usar o login do CIn?
CREATE TABLE pessoa_fisica (
    CPF TEXT,
    nome TEXT,
    email TEXT UNIQUE, -- Quais implicações de UNIQUE?
    PRIMARY KEY (CPF)
);

CREATE TABLE professor (
    CPF TEXT,
    PRIMARY KEY (CPF),
    FOREIGN KEY (CPF) REFERENCES pessoa_fisica (CPF)
);

CREATE TABLE disciplina (
    id_disciplina INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT
);

CREATE TABLE ministra (
    id_disciplina INTEGER,
    CPF TEXT,
    PRIMARY KEY (id_disciplina, CPF),
    FOREIGN KEY (id_disciplina) REFERENCES disciplina (id_disciplina),
    FOREIGN KEY (CPF) REFERENCES professor (CPF)
);

CREATE TABLE localizacao ( -- "local" eh palavra reservada
    id_local INTEGER PRIMARY KEY AUTOINCREMENT
);

CREATE TABLE armario (
    id_local INTEGER,
    CPF TEXT,
    PRIMARY KEY (id_local),
    FOREIGN KEY (id_local) REFERENCES localizacao (id_local),
    FOREIGN KEY (CPF) REFERENCES professor (CPF)
);

CREATE TABLE mesa ( -- talvez reformular
    id_local INTEGER,
    id_mesa INTEGER,
    PRIMARY KEY (id_local) --, id_mesa),
    FOREIGN KEY (id_local) REFERENCES localizacao (id_local)
);

CREATE TABLE tipo_item (
    id_item INTEGER  PRIMARY KEY AUTOINCREMENT,
    quantidade_max INTEGER,
    quantidade_disp INTEGER,
    desc_tipo_item TEXT, -- "desc" eh palavra reservada
    nome TEXT
);

CREATE TABLE item (
    id_item INTEGER,
    num_item INTEGER, -- talvez um id como string? Não da para colocar autoincrement
    status_item TEXT, -- stats and status eh palavra reservada
    id_local INTEGER,
    PRIMARY KEY (id_item, num_item),
    FOREIGN KEY (id_item) REFERENCES tipo_item (id_item),
    FOREIGN KEY (id_local) REFERENCES localizacao (id_local)
);

CREATE TABLE solicitacao (
    id_solicitacao INTEGER PRIMARY KEY AUTOINCREMENT,
    data_solicitacao DATE,
    status_solicitacao TEXT,
    data_entrega DATE,
    data_devolucao DATE,
    descricao_solicitacao TEXT,
    CPF TEXT,
    FOREIGN KEY (CPF) REFERENCES pessoa_fisica (CPF)
);

CREATE TABLE solicita (
    id_solicitacao INTEGER,
    id_item INTEGER,
    quantidade INTEGER,
    status_item TEXT,
    PRIMARY KEY (id_solicitacao, id_item),
    FOREIGN KEY (id_solicitacao) REFERENCES solicitacao (id_solicitacao),
    FOREIGN KEY (id_item) REFERENCES tipo_item (id_item)
);

CREATE TABLE responsavel (
    id_item INTEGER,
    num_item INTEGER,
    id_solicitacao INTEGER,
    data_retirada date,
    PRIMARY KEY (id_item, num_item, id_solicitacao),
    FOREIGN KEY (id_item) REFERENCES item (id_item),
    FOREIGN KEY (num_item) REFERENCES item (num_item),
    FOREIGN KEY (id_solicitacao) REFERENCES solicitacao (id_solicitacao)
);

CREATE TABLE projeto (
    id_projeto INTEGER,
    nome_projeto TEXT,
    descricao_projeto TEXT,
    CPF TEXT,
    PRIMARY KEY (id_projeto),
    FOREIGN KEY (CPF) REFERENCES pessoa_fisica (CPF)
);

CREATE TABLE projeto_usa (
    id_projeto INTEGER,
    id_item INTEGER,
    num_item INTEGER,
    PRIMARY KEY (id_projeto, id_item, num_item),
    FOREIGN KEY (id_item) REFERENCES item (id_item),
    FOREIGN KEY (num_item) REFERENCES item (num_item),
    FOREIGN KEY (id_projeto) REFERENCES projeto (id_projeto)
);

CREATE TABLE aluno (
    CPF TEXT,
    login_aluno TEXT, -- "login" eh uma palavra reservada
    matricula INTEGER, -- matricula do cin eh o CPF, melhor usa TEXT?
    PRIMARY KEY (CPF),
    FOREIGN KEY (CPF) REFERENCES pessoa_fisica (CPF)
);

CREATE TABLE tecnico (
    CPF TEXT PRIMARY KEY,
    FOREIGN KEY (CPF) REFERENCES pessoa_fisica (CPF)
);

CREATE TABLE compra (
    CPF TEXT,
    id_item INTEGER,
    data_compra DATE,
    quantidade_compra INTEGER, -- Verificar se eh o valor ou quantos itens comprados foram (yoda).
    PRIMARY KEY (CPF, id_item, data_compra),
    FOREIGN KEY (CPF) REFERENCES pessoa_fisica (CPF),
    FOREIGN KEY (id_item) REFERENCES item (id_item)
);
