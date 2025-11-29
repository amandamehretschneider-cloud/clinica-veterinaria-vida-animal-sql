USE clinica_vet;

-- TUTORES
INSERT INTO TUTOR (nome, cpf, telefone, email, endereco, data_cadastro) VALUES
('Ana Silva',   '123.456.789-00', '(41) 99999-0001', 'ana.silva@example.com',   'Rua das Flores, 100 - Campo Largo/PR', '2025-01-05'),
('Bruno Costa', '987.654.321-00', '(41) 98888-0002', 'bruno.costa@example.com', 'Av. Central, 250 - Curitiba/PR',       '2025-02-10'),
('Carla Souza', '555.666.777-00', '(41) 97777-0003', 'carla.souza@example.com', 'Rua das Acácias, 45 - Araucária/PR',   '2025-03-15');

-- PETS
INSERT INTO PET (nome, especie, raca, data_nascimento, sexo, porte, id_tutor) VALUES
('Luna', 'Cão', 'Poodle',        '2020-05-10', 'F', 'Pequeno', 1),
('Thor', 'Cão', 'Labrador',      '2018-09-22', 'M', 'Grande',  1),
('Mimi', 'Gato','SRD',           '2021-01-15', 'F', 'Pequeno', 2),
('Nina', 'Cão', 'Vira-lata',     '2019-07-30', 'F', 'Médio',   3);

-- VETERINÁRIOS
INSERT INTO VETERINARIO (nome, crmv, especialidade, telefone, email) VALUES
('Dr. João Pereira',   'CRMV-PR1234', 'Clínica geral',     '(41) 99900-1000', 'joao.pereira@vida-animal.com'),
('Dra. Mariana Lima',  'CRMV-PR5678', 'Dermatologia',      '(41) 98800-2000', 'mariana.lima@vida-animal.com');

-- CONSULTAS
INSERT INTO CONSULTA (data_consulta, hora_consulta, tipo_consulta, status, id_pet, id_veterinario) VALUES
('2025-11-10', '09:00:00', 'Rotina',    'realizada', 1, 1),
('2025-11-11', '14:30:00', 'Vacina',    'realizada', 2, 2),
('2025-11-12', '16:00:00', 'Emergência','realizada', 3, 1),
('2025-11-15', '10:00:00', 'Rotina',    'agendada',  4, 2);

-- ATENDIMENTOS
INSERT INTO ATENDIMENTO (data_hora_atendimento, sintomas, diagnostico, observacoes, id_consulta, id_pet, id_veterinario) VALUES
('2025-11-10 09:15:00', 'Coceira nas orelhas', 'Otite leve',  'Prescrito limpeza semanal.',        1, 1, 1),
('2025-11-11 14:40:00', 'Aplicação de vacina', 'Saudável',    'Vacina V8 aplicada sem reação.',    2, 2, 2),
('2025-11-12 16:10:00', 'Vômito e apatia',     'Gastrite aguda','Recomendado exame de sangue.',   3, 3, 1);

-- SERVIÇOS
INSERT INTO SERVICO (nome_servico, descricao, valor_base, ativo) VALUES
('Consulta clínica', 'Avaliação clínica geral do animal.',                     150.00, TRUE),
('Vacina V8',        'Aplicação de dose única da vacina V8.',                   90.00, TRUE),
('Exame de sangue',  'Coleta e análise laboratorial de sangue.',               120.00, TRUE),
('Limpeza de ouvido','Higienização e limpeza de conduto auditivo.',             60.00, TRUE);

-- ATENDIMENTO_SERVICO
INSERT INTO ATENDIMENTO_SERVICO (id_atendimento, id_servico, quantidade, valor_unitario, valor_total_item) VALUES
(1, 1, 1, 150.00, 150.00),  -- atendimento 1: consulta clínica
(1, 4, 1,  60.00,  60.00),  -- atendimento 1: limpeza de ouvido
(2, 1, 1, 150.00, 150.00),  -- atendimento 2: consulta
(2, 2, 1,  90.00,  90.00),  -- atendimento 2: vacina
(3, 1, 1, 150.00, 150.00),  -- atendimento 3: consulta
(3, 3, 1, 120.00, 120.00);  -- atendimento 3: exame de sangue

-- PAGAMENTOS
INSERT INTO PAGAMENTO (data_pagamento, valor_total, forma_pagamento, status_pagamento, id_atendimento) VALUES
('2025-11-10', 210.00, 'cartao', 'pago',      1),
('2025-11-11', 240.00, 'pix',    'pago',      2),
('2025-11-12', 270.00, 'dinheiro','pendente', 3);

-- PRONTUÁRIOS
INSERT INTO PRONTUARIO (data_abertura, observacoes_gerais, id_pet) VALUES
('2025-05-01', 'Histórico de otites recorrentes.',                1),
('2025-06-10', 'Animal muito ativo, sem comorbidades conhecidas.',2),
('2025-07-20', 'Gato resgatado, histórico clínico incompleto.',   3),
('2025-08-05', 'Cão sociável, sem alergias registradas.',         4);
