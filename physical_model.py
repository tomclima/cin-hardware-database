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

# Listar todos os itens em estoque
res = cur.execute("""
    SELECT NOME, QUANTIDADE_DISP, DESC_TIPO_ITEM
    FROM tipo_item
    WHERE QUANTIDADE_DISP > 0
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
    JOIN item ON solicita.ID_ITEM = item.ID_ITEM
    JOIN tipo_item ON item.ID_TIPO = tipo_item.ID_TIPO
    WHERE solicita.ID_SOLICITACAO = 1
""")

print(f"------------------------------------")
for row in res:
    print(f"{row}")
print(f"------------------------------------")

# Listar todos os empréstimos de itens (solicitações aprovadas com itens associados)
res = cur.execute("""
    SELECT s.*, so.*, r.*
    FROM solicitacao s
    JOIN solicita so ON s.ID_SOLICITACAO = so.ID_SOLICITACAO
    LEFT JOIN responsavel r ON so.ID_ITEM = r.ID_ITEM AND s.ID_SOLICITACAO = r.ID_SOLICITACAO
    WHERE s.STATUS_SOL = 'aprovada'
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

# Listar todos os empréstimos de um item (id = 1)
res = cur.execute("""
    SELECT ti.NOME, s.*
    FROM solicitacao s
    JOIN solicita so ON s.ID_SOLICITACAO = so.ID_SOLICITACAO
    JOIN item i ON so.ID_ITEM = i.ID_ITEM
    JOIN tipo_item ti ON i.ID_TIPO = ti.ID_TIPO
    WHERE i.ID_ITEM = 1
    AND s.STATUS_SOL = 'aprovada'
""")

print(f"------------------------------------")
for row in res:
    print(f"{row}")
print(f"------------------------------------")