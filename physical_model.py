import sqlite3

con = sqlite3.connect("cin_hardware.db")
cur = con.cursor()

# Listar todos os itens
res = cur.execute("""
    SELECT NOME, QUANTIDADE_DISP, DESC_TIPO_ITEM
    FROM tipo_item
""")

print(f"------------------------------------")
for row in res:
    print(f"{row[0]:30}\t{row[1]:03}\t{row[2]}")
print(f"------------------------------------")



# Listar todos os itens não disponíveis
res = cur.execute("""
    SELECT NOME
    FROM tipo_item
    WHERE QUANTIDADE_DISP = 0
""")

print(f"------------------------------------")
for row in res:
    print(f"{row[0]}")
print(f"------------------------------------")

# Listar todas as solicitações recebidas.
res = cur.execute("""
    SELECT *
    FROM solicitacao
""")

print(f"------------------------------------")
for row in res:
    print(f"{row}")
print(f"------------------------------------")

# Listar todas solicitações pendentes
res = cur.execute("""
    SELECT *
    FROM solicitacao
    WHERE STATUS_SOL = 'pendente'
""")

print(f"------------------------------------")
for row in res:
    print(f"{row}")
print(f"------------------------------------")

# Listar todas solicitações aprovadas
res = cur.execute("""
    SELECT *
    FROM solicitacao
    WHERE STATUS_SOL = 'aprovada'
""")

print(f"------------------------------------")
for row in res:
    print(f"{row}")
print(f"------------------------------------")

# Listar todas as solicitações rejeitadas
res = cur.execute("""
    SELECT *
    FROM solicitacao
    WHERE STATUS_SOL = 'rejeitada'
""")

print(f"------------------------------------")
for row in res:
    print(f"{row}")
print(f"------------------------------------")

# Listar todas as solicitações de uma pessoa numa data específica
res = cur.execute("""
    SELECT pessoa_fisica.NOME, solicitacao.*
    FROM pessoa_fisica
    JOIN solicitacao ON pessoa_fisica.CPF = solicitacao.CPF
    WHERE DATA_SOLICITACAO = '2025-01-18'
""")

print(f"------------------------------------")
for row in res:
    print(f"{row}")
print(f"------------------------------------")

# Listar os itens de uma solicitação (solicitação de id = 1)
res = cur.execute("""
    SELECT tipo_item.NOME, solicita.QUANTIDADE
    FROM solicita
    JOIN tipo_item ON solicita.ID_TIPO = tipo_item.ID_TIPO
    WHERE solicita.ID_SOLICITACAO = 1
""")

print(f"------------------------------------")
for row in res:
    print(f"{row}")
print(f"------------------------------------")

# Listar todos os itens disponíveis
res = cur.execute("""
SELECT i.*
FROM item i
LEFT JOIN responsavel r ON i.ID_ITEM = r.ID_ITEM
LEFT JOIN solicitacao s ON r.ID_SOLICITACAO = s.ID_SOLICITACAO
WHERE
    r.ID_ITEM IS NULL  -- never lent
    OR
    (
        DATETIME(r.DATA_RESP) = (
            SELECT MAX(DATETIME(r2.DATA_RESP))
            FROM responsavel r2
            WHERE r2.ID_ITEM = r.ID_ITEM
        )
        AND s.DATA_DEVOLUCAO IS NOT NULL  -- latest loan returned
    )
;


""")

print(f"------------------------------------")
for row in res:
    print(f"{row}")
print(f"------------------------------------")

# Listar todas as devoluções
res = cur.execute("""
    SELECT *
    FROM solicitacao
    WHERE DATA_DEVOLUCAO IS NOT NULL
""")

print(f"------------------------------------")
for row in res:
    print(f"{row}")
print(f"------------------------------------")

# Listar todos os empréstimos de um item (id = 4)
res = cur.execute("""
    SELECT r.DATA_RESP
    FROM responsavel r
    WHERE r.ID_ITEM = 4
    ORDER BY r.DATA_RESP;
""")

print(f"------------------------------------")
for row in res:
    print(f"{row}")
print(f"------------------------------------")