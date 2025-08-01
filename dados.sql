-- =========================
-- TABELA: pessoa_fisica
-- =========================
INSERT INTO pessoa_fisica (CPF, nome, email) VALUES
('12345678900', 'Ana Silva', 'ana.silva@cin.ufpe.br'),
('98765432100', 'Bruno Costa', 'bruno.costa@cin.ufpe.br'),
('45678912300', 'Carlos Souza', 'carlos.souza@cin.ufpe.br'),
('78912345600', 'Diana Rocha', 'diana.rocha@cin.ufpe.br'),
('11122233344', 'Eduardo Lima', 'eduardo.lima@cin.ufpe.br'),
('22233344455', 'Fernanda Alves', 'fernanda.alves@cin.ufpe.br'),
('33344455566', 'Gabriel Moura', 'gabriel.moura@cin.ufpe.br'),
('44455566677', 'Helena Souza', 'helena.souza@cin.ufpe.br'),
('55566677788', 'Igor Fernandes', 'igor.fernandes@cin.ufpe.br'),
('66677788899', 'Julia Ramos', 'julia.ramos@cin.ufpe.br'),
('77788899900', 'Lucas Pereira', 'lucas.pereira@cin.ufpe.br'),
('88899900011', 'Marina Torres', 'marina.torres@cin.ufpe.br'),
('99900011122', 'Fernando Lima', 'fernando.lima@cin.ufpe.br'),
('00011122233', 'Gabriela Alves', 'gabriela.alves@cin.ufpe.br'),
('11122233300', 'Henrique Santos', 'henrique.santos@cin.ufpe.br'),
('22233344400', 'Isabela Pereira', 'isabela.pereira@cin.ufpe.br'),
('33344455500', 'João Silva', 'joao.silva@cin.ufpe.br'),
('44455566600', 'Karina Costa', 'karina.costa@cin.ufpe.br'),
('55566677700', 'Leonardo Souza', 'leonardo.souza@cin.ufpe.br'),
('66677788800', 'Mariana Dias', 'mariana.dias@cin.ufpe.br'),
('77788899901', 'Nicolas Martins', 'nicolas.martins@cin.ufpe.br'),
('88899900002', 'Olivia Rocha', 'olivia.rocha@cin.ufpe.br'),
('99900011103', 'Pedro Costa', 'pedro.costa@cin.ufpe.br'),
('00011122204', 'Queila Lima', 'queila.lima@cin.ufpe.br'),
('11122233305', 'Rafael Torres', 'rafael.torres@cin.ufpe.br'),
('22233344406', 'Tiago Carvalho', 'tiago.carvalho@cin.ufpe.br'),
('33344455507', 'Vanessa Dias', 'vanessa.dias@cin.ufpe.br'),
('44455566608', 'Wesley Souza', 'wesley.souza@cin.ufpe.br'),
('55566677709', 'Xavier Lopes', 'xavier.lopes@cin.ufpe.br'),
('66677788810', 'Yara Moura', 'yara.moura@cin.ufpe.br');

-- =========================
-- TABELA: professor
-- =========================
INSERT INTO professor (CPF) VALUES
('12345678900'), ('98765432100'), ('11122233344'),
('33344455566'), ('44455566677'), ('55566677788'),
('66677788899'), ('77788899900'), ('88899900011'), ('99900011122');

-- =========================
-- TABELA: aluno
-- =========================
INSERT INTO aluno (CPF, login_aluno, matricula) VALUES
('45678912300', 'carlossouza', 20231001),
('78912345600', 'dianarocha', 20231002),
('00011122233', 'gabrielaalves', 20231003),
('11122233300', 'henriquesantos', 20231004),
('22233344400', 'isabelapereira', 20231005),
('33344455500', 'joaosilva', 20231006),
('44455566600', 'karinacosta', 20231007),
('55566677700', 'leonardosouza', 20231008),
('66677788800', 'marianadias', 20231009),
('77788899901', 'nicolasmartins', 20231010),
('88899900002', 'oliviarocha', 20231011),
('99900011103', 'pedrocosta', 20231012),
('00011122204', 'queilalima', 20231013),
('11122233305', 'rafaeltorres', 20231014);

-- =========================
-- TABELA: tecnico
-- =========================
INSERT INTO tecnico (CPF) VALUES
('22233344406'), ('33344455507'), ('44455566608'),
('55566677709'), ('66677788810');

-- =========================
-- TABELA: disciplina
-- =========================
INSERT INTO disciplina (nome) VALUES
('Circuitos Elétricos'),
('Sistemas Digitais'),
('Programação para Engenharia'),
('Arquitetura de Computadores'),
('Redes de Computadores'),
('Inteligência Artificial'),
('Banco de Dados'),
('Engenharia de Software'),
('Sistemas Embarcados'),
('Matemática Discreta'),
('Teoria da Computação'),
('Organização de Computadores'),
('Eletrônica Analógica'),
('Controle de Sistemas'),
('Processamento de Sinais');

-- =========================
-- TABELA: ministra
-- (Liga disciplinas a professores)
-- =========================
INSERT INTO ministra (id_disciplina, CPF) VALUES
(1, '12345678900'),
(2, '98765432100'),
(3, '11122233344'),
(4, '33344455566'),
(5, '44455566677'),
(6, '55566677788'),
(7, '66677788899'),
(8, '77788899900'),
(9, '88899900011'),
(10, '99900011122'),
(11, '12345678900'),
(12, '98765432100'),
(13, '11122233344'),
(14, '33344455566'),
(15, '44455566677');

-- =========================
-- TABELA: localizacao
-- =========================
INSERT INTO localizacao DEFAULT VALUES;
INSERT INTO localizacao DEFAULT VALUES;
INSERT INTO localizacao DEFAULT VALUES;
INSERT INTO localizacao DEFAULT VALUES;
INSERT INTO localizacao DEFAULT VALUES;
INSERT INTO localizacao DEFAULT VALUES;
INSERT INTO localizacao DEFAULT VALUES;
INSERT INTO localizacao DEFAULT VALUES;
INSERT INTO localizacao DEFAULT VALUES;
INSERT INTO localizacao DEFAULT VALUES;

-- =========================
-- TABELA: armario
-- =========================
INSERT INTO armario (id_local, CPF) VALUES
(1, '12345678900'),
(2, '98765432100'),
(3, '11122233344'),
(4, '33344455566'),
(5, '44455566677');

-- =========================
-- TABELA: mesa
-- =========================
INSERT INTO mesa (id_local, id_mesa) VALUES
(1, 1),
(1, 2), 
(1, 3),
(2, 1), (2, 2), (2, 3),
(3, 1), (3, 2), (3, 3),
(4, 1), (4, 2), (4, 3);

-- =========================
-- TABELA: tipo_item
-- =========================
INSERT INTO tipo_item (quantidade_max, quantidade_disp, desc_tipo_item, nome) VALUES
(100, 100, 'Resistores de 220 Ohms 1/4W', 'Resistor 220Ω'),
(80, 75, 'Capacitores eletrolíticos 100uF', 'Capacitor 100uF'),
(40, 35, 'Placas Arduino UNO R3', 'Arduino UNO'),
(100, 100, 'LEDs vermelhos 5mm', 'LED Vermelho'),
(50, 48, 'Transistores NPN 2N2222', 'Transistor 2N2222'),
(20, 18, 'Multímetros digitais', 'Multímetro'),
(70, 68, 'Fios jumper macho-fêmea 20cm', 'Fio jumper'),
(8, 7, 'Osciloscópios digitais', 'Osciloscópio'),
(25, 00, 'Protoboards médias', 'Protoboard'),
(15, 13, 'Fonte de alimentação 12V 5A', 'Fonte 12V 5A'),
(30, 28, 'Sensores de temperatura LM35', 'Sensor LM35'),
(20, 19, 'Displays LCD 16x2', 'Display LCD'),
(35, 34, 'Microcontroladores PIC16F877A', 'Microcontrolador PIC'),
(60, 58, 'Cabos USB 2.0', 'Cabo USB'),
(40, 37, 'Relés 5V para controle', 'Relé 5V'),
(25, 23, 'Servomotores padrão SG90', 'Servo Motor'),
(30, 29, 'Módulos WiFi ESP8266', 'Modulo WiFi ESP8266'),
(35, 33, 'Sensores ultrassônicos HC-SR04', 'Sensor Ultrassônico'),
(80, 80, 'Botões pulsadores para circuitos', 'Botão Pulsador'),
(100, 100, 'Resistores de 10k Ohms 1/4W', 'Resistor 10kΩ'),
(70, 69, 'Diodos retificadores 1N4007', 'Diodo 1N4007'),
(20, 19, 'Chaves seletoras de múltiplas posições', 'Chave Seletora'),
(15, 15, 'Placas Raspberry Pi 4', 'Placa Raspberry Pi'),
(25, 24, 'Memórias EEPROM 24C256', 'Memória EEPROM'),
(40, 38, 'Sensores LDR para luminosidade', 'Sensor de Luminosidade'),
(30, 30, 'Conversores ADC MCP3008', 'Conversor Analógico-Digital'),
(20, 00, 'Displays OLED 128x64', 'Display OLED'),
(10, 10, 'Placas FPGA DE0-Nano', 'Placa FPGA'),
(12, 12, 'Fontes de bancada ajustáveis', 'Fonte de bancada'),
(25, 25, 'Kits de ferramentas básicas', 'Kit Ferramentas');

-- =========================
-- TABELA: item
-- =========================
INSERT INTO item (id_item, num_item, status_item, id_local) VALUES
(1, 1, 'disponível', 1),
(1, 2, 'disponível', 1),
(1, 3, 'emprestado', 2),
(1, 4, 'manutenção', 3),
(2, 1, 'disponível', 2),
(2, 2, 'emprestado', 3),
(2, 3, 'disponível', 4),
(3, 1, 'disponível', 5),
(3, 2, 'emprestado', 5),
(3, 3, 'disponível', 6),
(3, 4, 'manutenção', 6),
(4, 1, 'disponível', 7),
(4, 2, 'emprestado', 8),
(4, 3, 'disponível', 9),
(5, 1, 'disponível', 10),
(5, 2, 'manutenção', 9),
(5, 3, 'disponível', 8),
(6, 1, 'disponível', 7),
(6, 2, 'emprestado', 6),
(6, 3, 'disponível', 5),
(7, 1, 'disponível', 4),
(7, 2, 'emprestado', 3),
(7, 3, 'manutenção', 2),
(8, 1, 'disponível', 1),
(8, 2, 'emprestado', 1),
(8, 3, 'disponível', 2),
(9, 1, 'disponível', 2),
(9, 2, 'disponível', 3),
(9, 3, 'manutenção', 3),
(10, 1, 'disponível', 4),
(10, 2, 'emprestado', 4),
(10, 3, 'disponível', 5),
(11, 1, 'disponível', 5),
(11, 2, 'emprestado', 6),
(11, 3, 'manutenção', 7),
(12, 1, 'disponível', 8),
(12, 2, 'disponível', 8),
(12, 3, 'emprestado', 9),
(13, 1, 'disponível', 9),
(13, 2, 'emprestado', 10),
(13, 3, 'manutenção', 10),
(14, 1, 'disponível', 1),
(14, 2, 'emprestado', 2),
(14, 3, 'disponível', 3),
(15, 1, 'disponível', 4),
(15, 2, 'disponível', 5),
(15, 3, 'emprestado', 6),
(16, 1, 'disponível', 7),
(16, 2, 'manutenção', 8),
(16, 3, 'disponível', 9),
(17, 1, 'disponível', 10),
(17, 2, 'emprestado', 1),
(17, 3, 'disponível', 2),
(18, 1, 'disponível', 3),
(18, 2, 'emprestado', 4),
(18, 3, 'manutenção', 5),
(19, 1, 'disponível', 6),
(19, 2, 'emprestado', 7),
(19, 3, 'disponível', 8),
(20, 1, 'disponível', 9),
(20, 2, 'emprestado', 10),
(20, 3, 'manutenção', 1),
(21, 1, 'disponível', 2),
(21, 2, 'emprestado', 3),
(21, 3, 'disponível', 4),
(22, 1, 'disponível', 5),
(22, 2, 'manutenção', 6),
(22, 3, 'disponível', 7),
(23, 1, 'disponível', 8),
(23, 2, 'emprestado', 9),
(23, 3, 'disponível', 10),
(24, 1, 'disponível', 1),
(24, 2, 'manutenção', 2),
(24, 3, 'emprestado', 3),
(25, 1, 'disponível', 4),
(25, 2, 'disponível', 5),
(25, 3, 'manutenção', 6),
(26, 1, 'disponível', 7),
(26, 2, 'emprestado', 8),
(26, 3, 'disponível', 9),
(27, 1, 'disponível', 10),
(27, 2, 'manutenção', 1),
(27, 3, 'emprestado', 2),
(28, 1, 'disponível', 3),
(28, 2, 'disponível', 4),
(28, 3, 'manutenção', 5),
(29, 1, 'disponível', 6),
(29, 2, 'emprestado', 7),
(29, 3, 'disponível', 8),
(30, 1, 'disponível', 9),
(30, 2, 'manutenção', 10),
(30, 3, 'disponível', 1);

-- =========================
-- TABELA: solicitacao
-- =========================
INSERT INTO solicitacao (data_solicitacao, status_solicitacao, data_entrega, data_devolucao, descricao_solicitacao, CPF) VALUES
('2025-01-10', 'aprovada', '2025-01-11', '2025-01-20', 'Uso em projeto de sistemas embarcados', '45678912300'),
('2025-01-12', 'pendente', NULL, NULL, 'Solicitação para aula de laboratório', '78912345600'),
('2025-01-15', 'rejeitada', NULL, NULL, 'Não há estoque suficiente', '00011122233'),
('2025-01-18', 'aprovada', '2025-01-19', '2025-01-25', 'Uso em pesquisa de eletrônica', '11122233300'),
('2025-01-20', 'aprovada', '2025-01-21', '2025-01-30', 'Uso em trabalho final de disciplina', '22233344400'),
('2025-01-22', 'pendente', NULL, NULL, 'Reserva para evento de robótica', '33344455500'),
('2025-01-25', 'aprovada', '2025-01-26', '2025-02-05', 'Projeto de automação residencial', '44455566600'),
('2025-01-28', 'rejeitada', NULL, NULL, 'Item indisponível no momento', '55566677700'),
('2025-02-01', 'aprovada', '2025-02-02', '2025-02-10', 'Competição de programação de hardware', '66677788800'),
('2025-02-03', 'pendente', NULL, NULL, 'Preparação para feira de ciências', '77788899901');

-- =========================
-- TABELA: solicita
-- =========================
INSERT INTO solicita (id_solicitacao, id_item, quantidade, status_item) VALUES
(1, 3, 2, 'emprestado'),
(1, 4, 5, 'emprestado'),
(2, 1, 10, 'pendente'),
(3, 2, 3, 'pendente'),
(4, 6, 1, 'emprestado'),
(5, 7, 15, 'emprestado'),
(6, 8, 2, 'pendente'),
(7, 9, 1, 'emprestado'),
(8, 10, 1, 'pendente'),
(9, 11, 4, 'emprestado'),
(10, 12, 3, 'pendente');

-- =========================
-- TABELA: responsavel
-- =========================
INSERT INTO responsavel (id_item, num_item, id_solicitacao, data_retirada) VALUES
(3, 1, 1, '2025-01-11'),
(3, 2, 1, '2025-01-11'),
(4, 1, 1, '2025-01-11'),
(6, 1, 4, '2025-01-19'),
(7, 1, 5, '2025-01-21'),
(9, 1, 7, '2025-01-26'),
(11, 1, 9, '2025-02-02');

-- =========================
-- TABELA: projeto
-- =========================
INSERT INTO projeto (id_projeto, nome_projeto, descricao_projeto, CPF) VALUES
(1, 'Robô Seguidor de Linha', 'Robô autônomo que segue uma linha usando sensores ópticos', '45678912300'),
(2, 'Estação Meteorológica', 'Sistema que coleta dados climáticos e envia para a nuvem', '78912345600'),
(3, 'Sistema de Irrigação Automático', 'Controle automático de irrigação usando sensores de umidade', '00011122233'),
(4, 'Drone de Entrega', 'Veículo aéreo não tripulado para entregas rápidas', '11122233300'),
(5, 'Controle de Iluminação Inteligente', 'Automação de iluminação residencial via smartphone', '22233344400');

-- =========================
-- TABELA: projeto_usa
-- =========================
INSERT INTO projeto_usa (id_projeto, id_item, num_item) VALUES
(1, 17, 1),
(1, 18, 2),
(2, 11, 1),
(2, 12, 1),
(3, 25, 1),
(4, 8, 1),
(4, 9, 1),
(5, 15, 1),
(5, 16, 1);

-- =========================
-- TABELA: compra
-- =========================
INSERT INTO compra (CPF, id_item, data_compra, quantidade_compra) VALUES
('22233344406', 1, '2025-01-05', 50),
('33344455507', 3, '2025-01-07', 5),
('44455566608', 6, '2025-01-09', 2),
('55566677709', 10, '2025-01-15', 3),
('66677788810', 14, '2025-01-20', 10),
('22233344406', 20, '2025-01-22', 5),
('33344455507', 25, '2025-01-25', 4),
('44455566608', 27, '2025-01-28', 2),
('55566677709', 30, '2025-02-01', 1),
('66677788810', 5, '2025-02-03', 6);
