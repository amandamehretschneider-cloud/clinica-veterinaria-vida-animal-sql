-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS clinica_vet;
USE clinica_vet;

-- Tabela de tutores
CREATE TABLE TUTOR (
    id_tutor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14),
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco VARCHAR(200),
    data_cadastro DATE
);

-- Tabela de pets
CREATE TABLE PET (
    id_pet INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    especie VARCHAR(30),
    raca VARCHAR(50),
    data_nascimento DATE,
    sexo CHAR(1),
    porte VARCHAR(20),
    id_tutor INT NOT NULL,
    CONSTRAINT fk_pet_tutor
        FOREIGN KEY (id_tutor) REFERENCES TUTOR(id_tutor)
);

-- Tabela de veterinários
CREATE TABLE VETERINARIO (
    id_veterinario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    crmv VARCHAR(20),
    especialidade VARCHAR(50),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

-- Tabela de consultas
CREATE TABLE CONSULTA (
    id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    data_consulta DATE NOT NULL,
    hora_consulta TIME NOT NULL,
    tipo_consulta VARCHAR(50),
    status VARCHAR(20),
    id_pet INT NOT NULL,
    id_veterinario INT NOT NULL,
    CONSTRAINT fk_consulta_pet
        FOREIGN KEY (id_pet) REFERENCES PET(id_pet),
    CONSTRAINT fk_consulta_veterinario
        FOREIGN KEY (id_veterinario) REFERENCES VETERINARIO(id_veterinario)
);

-- Tabela de atendimentos
CREATE TABLE ATENDIMENTO (
    id_atendimento INT AUTO_INCREMENT PRIMARY KEY,
    data_hora_atendimento DATETIME NOT NULL,
    sintomas TEXT,
    diagnostico TEXT,
    observacoes TEXT,
    id_consulta INT NOT NULL,
    id_pet INT NOT NULL,
    id_veterinario INT NOT NULL,
    CONSTRAINT fk_atend_consulta
        FOREIGN KEY (id_consulta) REFERENCES CONSULTA(id_consulta),
    CONSTRAINT fk_atend_pet
        FOREIGN KEY (id_pet) REFERENCES PET(id_pet),
    CONSTRAINT fk_atend_vet
        FOREIGN KEY (id_veterinario) REFERENCES VETERINARIO(id_veterinario)
);

-- Tabela de serviços
CREATE TABLE SERVICO (
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    nome_servico VARCHAR(80) NOT NULL,
    descricao TEXT,
    valor_base DECIMAL(10,2),
    ativo BOOLEAN DEFAULT TRUE
);

-- Tabela associativa entre atendimento e serviço
CREATE TABLE ATENDIMENTO_SERVICO (
    id_atendimento INT NOT NULL,
    id_servico INT NOT NULL,
    quantidade INT NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL,
    valor_total_item DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_atendimento, id_servico),
    CONSTRAINT fk_atend_serv_atendimento
        FOREIGN KEY (id_atendimento) REFERENCES ATENDIMENTO(id_atendimento),
    CONSTRAINT fk_atend_serv_servico
        FOREIGN KEY (id_servico) REFERENCES SERVICO(id_servico)
);

-- Tabela de pagamentos
CREATE TABLE PAGAMENTO (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    data_pagamento DATE NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    forma_pagamento VARCHAR(20),
    status_pagamento VARCHAR(20),
    id_atendimento INT NOT NULL,
    CONSTRAINT fk_pag_atendimento
        FOREIGN KEY (id_atendimento) REFERENCES ATENDIMENTO(id_atendimento)
);

-- Tabela de prontuários
CREATE TABLE PRONTUARIO (
    id_prontuario INT AUTO_INCREMENT PRIMARY KEY,
    data_abertura DATE NOT NULL,
    observacoes_gerais TEXT,
    id_pet INT NOT NULL UNIQUE,
    CONSTRAINT fk_pront_pet
        FOREIGN KEY (id_pet) REFERENCES PET(id_pet)
);
