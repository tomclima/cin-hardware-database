import sqlite3

con = sqlite3.connect("test.db")
cur = con.cursor()

# Listar todos os itens
res = cur.execute("""
    SELECT nome, quantidade_disp, desc_tipo_item
    FROM tipo_item
""")

print(f"------------------------------------")
for row in res:
    print(f"{row[0]:30}\t{row[1]:03}\t{row[2]}")
print(f"------------------------------------")

# Listar todos os itens em estoque
res = cur.execute("""
    SELECT nome, quantidade_disp, desc_tipo_item
    FROM tipo_item
    WHERE quantidade_disp > 0
""")

print(f"------------------------------------")
for row in res:
    print(f"{row[0]:30}\t{row[1]:03}\t{row[2]}")
print(f"------------------------------------")

# Listar todos os itens não disponíveis
res = cur.execute("""
    SELECT nome
    FROM tipo_item
    WHERE quantidade_disp = 0
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
    WHERE status_solicitacao = 'pendente'
""")

print(f"------------------------------------")
for row in res:
    print(f"{row}")
print(f"------------------------------------")

# Listar todas solicitações aprovadas
res = cur.execute("""
    SELECT *
    FROM solicitacao
    WHERE status_solicitacao = 'aprovada'
""")

print(f"------------------------------------")
for row in res:
    print(f"{row}")
print(f"------------------------------------")

# Listar todas as solicitações rejeitadas
res = cur.execute("""
    SELECT *
    FROM solicitacao
    WHERE status_solicitacao = 'rejeitada'
""")

print(f"------------------------------------")
for row in res:
    print(f"{row}")
print(f"------------------------------------")

# Listar todas as solicitações de uma pessoa numa data específica
res = cur.execute("""
    SELECT pessoa_fisica.nome, solicitacao.*
    FROM
    pessoa_fisica JOIN solicitacao
    ON pessoa_fisica.CPF = solicitacao.CPF
    where data_solicitacao = '2025-01-18'
""")

print(f"------------------------------------")
for row in res:
    print(f"{row}")
print(f"------------------------------------")

# Listar os itens de uma solicitação (solicitacao de id = 1)
res = cur.execute("""
    SELECT tipo_item.nome, solicita.quantidade
    FROM tipo_item
    JOIN solicita
    ON tipo_item.id_item = solicita.id_item
    WHERE solicita.id_solicitacao = 1
""")

print(f"------------------------------------")
for row in res:
    print(f"{row}")
print(f"------------------------------------")

# Listar todos os empréstimos de itens -- Não sei se entendi
res = cur.execute("""
    SELECT *
    FROM solicitacao s
    JOIN solicita so ON s.id_solicitacao = so.id_solicitacao
    JOIN responsavel r ON so.id_item = r.id_item
    WHERE s.status_solicitacao = 'aprovada'
""")

print(f"------------------------------------")
for row in res:
    print(f"{row}")
print(f"------------------------------------")

# Listar todas as devoluções
res = cur.execute("""
    SELECT *
    FROM solicitacao
    WHERE data_devolucao IS NOT NULL
""")

print(f"------------------------------------")
for row in res:
    print(f"{row}")
print(f"------------------------------------")

# Listar todos os empréstimos de um item (id = 1)
res = cur.execute("""
    SELECT ti.nome, s.*
    FROM solicitacao s
    JOIN solicita so ON s.id_solicitacao = so.id_solicitacao
    JOIN item i ON so.id_item = i.id_item
    JOIN tipo_item ti ON i.id_item = ti.id_item
    WHERE i.id_item = 3
    AND s.status_solicitacao = 'aprovada'
""")

print(f"------------------------------------")
for row in res:
    print(f"{row}")
print(f"------------------------------------")