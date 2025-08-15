import sqlite3

def create_tables(conn):
    cursor = conn.cursor()

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS pessoa_fisica (
    CPF TEXT PRIMARY KEY
        CHECK (
            -- 1. Garante o formato de 11 dígitos numéricos
            length(CPF) = 11 AND CPF GLOB '[0-9]*'
                   
            -- 2. Rejeita CPFs inválidos com todos os dígitos iguais
            AND CPF NOT IN (
                '00000000000', '11111111111', '22222222222', '33333333333',
                '44444444444', '55555555555', '66666666666', '77777777777',
                '88888888888', '99999999999'
            )
                   
            -- 3. Valida o primeiro dígito verificador
            AND CAST(substr(CPF, 10, 1) AS INTEGER) =
                CASE
                    WHEN (
                        (CAST(substr(CPF,1,1) AS INTEGER)*10 + CAST(substr(CPF,2,1) AS INTEGER)*9 +
                         CAST(substr(CPF,3,1) AS INTEGER)*8 + CAST(substr(CPF,4,1) AS INTEGER)*7 +
                         CAST(substr(CPF,5,1) AS INTEGER)*6 + CAST(substr(CPF,6,1) AS INTEGER)*5 +
                         CAST(substr(CPF,7,1) AS INTEGER)*4 + CAST(substr(CPF,8,1) AS INTEGER)*3 +
                         CAST(substr(CPF,9,1) AS INTEGER)*2) % 11
                    ) < 2 THEN 0
                    ELSE 11 - (
                        (CAST(substr(CPF,1,1) AS INTEGER)*10 + CAST(substr(CPF,2,1) AS INTEGER)*9 +
                         CAST(substr(CPF,3,1) AS INTEGER)*8 + CAST(substr(CPF,4,1) AS INTEGER)*7 +
                         CAST(substr(CPF,5,1) AS INTEGER)*6 + CAST(substr(CPF,6,1) AS INTEGER)*5 +
                         CAST(substr(CPF,7,1) AS INTEGER)*4 + CAST(substr(CPF,8,1) AS INTEGER)*3 +
                         CAST(substr(CPF,9,1) AS INTEGER)*2) % 11
                    )
                END
            -- 4. Valida o segundo dígito verificador
            AND CAST(substr(CPF, 11, 1) AS INTEGER) =
                CASE
                    WHEN (
                        (CAST(substr(CPF,1,1) AS INTEGER)*11 + CAST(substr(CPF,2,1) AS INTEGER)*10 +
                         CAST(substr(CPF,3,1) AS INTEGER)*9  + CAST(substr(CPF,4,1) AS INTEGER)*8  +
                         CAST(substr(CPF,5,1) AS INTEGER)*7  + CAST(substr(CPF,6,1) AS INTEGER)*6  +
                         CAST(substr(CPF,7,1) AS INTEGER)*5  + CAST(substr(CPF,8,1) AS INTEGER)*4  +
                         CAST(substr(CPF,9,1) AS INTEGER)*3  + CAST(substr(CPF,10,1) AS INTEGER)*2) % 11
                    ) < 2 THEN 0
                    ELSE 11 - (
                        (CAST(substr(CPF,1,1) AS INTEGER)*11 + CAST(substr(CPF,2,1) AS INTEGER)*10 +
                         CAST(substr(CPF,3,1) AS INTEGER)*9  + CAST(substr(CPF,4,1) AS INTEGER)*8  +
                         CAST(substr(CPF,5,1) AS INTEGER)*7  + CAST(substr(CPF,6,1) AS INTEGER)*6  +
                         CAST(substr(CPF,7,1) AS INTEGER)*5  + CAST(substr(CPF,8,1) AS INTEGER)*4  +
                         CAST(substr(CPF,9,1) AS INTEGER)*3  + CAST(substr(CPF,10,1) AS INTEGER)*2) % 11
                    )
                END
        ),
    NOME  TEXT NOT NULL,
    EMAIL TEXT UNIQUE
);
    """)

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS professor (
        CPF TEXT PRIMARY KEY,
        FOREIGN KEY (CPF) REFERENCES pessoa_fisica (CPF)
    );
    """)

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS disciplina (
        ID_DISCIPLINA TEXT PRIMARY KEY,
        nome TEXT NOT NULL
    );
    """)

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS ministra (
        ID_DISCIPLINA TEXT,
        CPF TEXT,
        PRIMARY KEY (ID_DISCIPLINA, CPF),
        FOREIGN KEY (ID_DISCIPLINA) REFERENCES disciplina (ID_DISCIPLINA),
        FOREIGN KEY (CPF) REFERENCES professor (CPF)
    );
    """)

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS localizacao (
        ID_LOCAL INTEGER PRIMARY KEY AUTOINCREMENT
    );
    """)

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS armario (
        ID_LOCAL INTEGER PRIMARY KEY,
        CPF TEXT,
        FOREIGN KEY (ID_LOCAL) REFERENCES localizacao (ID_LOCAL),
        FOREIGN KEY (CPF) REFERENCES professor (CPF)
    );
    """)

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS mesa (
        ID_LOCAL INTEGER PRIMARY KEY,
        ID_MESA INTEGER,
        FOREIGN KEY (ID_LOCAL) REFERENCES localizacao (ID_LOCAL)
    );
    """)

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS tipo_item (
        ID_TIPO INTEGER PRIMARY KEY AUTOINCREMENT,
        QUANTIDADE_MAX INTEGER,
        QUANTIDADE_DISP INTEGER,
        DESC_TIPO_ITEM TEXT,
        NOME TEXT
    );
    """)

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS item (
        ID_ITEM INTEGER PRIMARY KEY AUTOINCREMENT,
        ID_TIPO INTEGER,
        QUEBRADO INTEGER DEFAULT 0,
        ID_LOCAL INTEGER,
        FOREIGN KEY (ID_TIPO) REFERENCES tipo_item (ID_TIPO),
        FOREIGN KEY (ID_LOCAL) REFERENCES localizacao (ID_LOCAL),
        CHECK (QUEBRADO IN (0, 1))
    );
    """)

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS solicitacao (
        ID_SOLICITACAO INTEGER PRIMARY KEY AUTOINCREMENT,
        DATA_SOLICITACAO TEXT,
        STATUS_SOL TEXT,
        DATA_ENTREGA TEXT,
        DATA_DEVOLUCAO TEXT,
        DESCRICAO_SOLICITACAO TEXT,
        CPF TEXT NOT NULL,
        FOREIGN KEY (CPF) REFERENCES pessoa_fisica (CPF)
    );
    """)

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS solicita (
        ID_SOLICITACAO INTEGER,
        ID_TIPO INTEGER,
        QUANTIDADE INTEGER,
        PRIMARY KEY (ID_SOLICITACAO, ID_TIPO),
        FOREIGN KEY (ID_SOLICITACAO) REFERENCES solicitacao (ID_SOLICITACAO),
        FOREIGN KEY (ID_TIPO) REFERENCES tipo_item (ID_TIPO)
    );
    """)

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS responsavel (
        ID_ITEM INTEGER,
        ID_SOLICITACAO INTEGER,
        DATA_RESP TEXT,
        PRIMARY KEY (ID_ITEM, ID_SOLICITACAO),
        FOREIGN KEY (ID_ITEM) REFERENCES item (ID_ITEM),
        FOREIGN KEY (ID_SOLICITACAO) REFERENCES solicitacao (ID_SOLICITACAO)
    );
    """)

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS projeto (
        ID_PROJETO INTEGER PRIMARY KEY AUTOINCREMENT,
        NOME_PROJETO TEXT,
        DESCRICAO_PROJETO TEXT,
        CPF TEXT,
        FOREIGN KEY (CPF) REFERENCES pessoa_fisica (CPF)
    );
    """)

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS projeto_usa (
        ID_PROJETO INTEGER,
        ID_ITEM INTEGER,
        PRIMARY KEY (ID_PROJETO, ID_ITEM),
        FOREIGN KEY (ID_ITEM) REFERENCES item (ID_ITEM),
        FOREIGN KEY (ID_PROJETO) REFERENCES projeto (ID_PROJETO)
    );
    """)

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS aluno (
        CPF TEXT PRIMARY KEY,
        login_aluno TEXT,
        matricula TEXT,
        FOREIGN KEY (CPF) REFERENCES pessoa_fisica (CPF)
    );
    """)

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS tecnico (
        CPF TEXT PRIMARY KEY,
        FOREIGN KEY (CPF) REFERENCES pessoa_fisica (CPF)
    );
    """)

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS compra (
        CPF TEXT,
        ID_ITEM INTEGER,
        DATA_COMPRA TEXT,
        QUANTIDADE_COMPRA INTEGER,
        PRIMARY KEY(CPF, ID_ITEM),
        FOREIGN KEY (CPF) REFERENCES pessoa_fisica (CPF),
        FOREIGN KEY (ID_ITEM) REFERENCES item (ID_ITEM)
    );
    """)

    conn.commit()

conn = sqlite3.connect("cin_hardware.db")
create_tables(conn)