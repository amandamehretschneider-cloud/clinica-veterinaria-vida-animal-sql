USE clinica_vet;

-- 1) Listar todos os pets com o nome do tutor, ordenando pelo nome do tutor
SELECT
    p.id_pet,
    p.nome AS nome_pet,
    p.especie,
    p.raca,
    t.nome AS nome_tutor
FROM PET p
JOIN TUTOR t ON p.id_tutor = t.id_tutor
ORDER BY t.nome, p.nome;

-- 2) Listar atendimentos com o valor total calculado a partir dos serviços
SELECT
    a.id_atendimento,
    p.nome AS nome_pet,
    v.nome AS nome_veterinario,
    a.data_hora_atendimento,
    SUM(asv.valor_total_item) AS valor_total_atendimento
FROM ATENDIMENTO a
JOIN PET p ON a.id_pet = p.id_pet
JOIN VETERINARIO v ON a.id_veterinario = v.id_veterinario
JOIN ATENDIMENTO_SERVICO asv ON a.id_atendimento = asv.id_atendimento
GROUP BY a.id_atendimento, p.nome, v.nome, a.data_hora_atendimento
ORDER BY a.data_hora_atendimento DESC;

-- 3) Consultar histórico de atendimentos de um tutor específico (Ana Silva)
SELECT
    t.nome AS tutor,
    p.nome AS pet,
    a.data_hora_atendimento,
    a.sintomas,
    a.diagnostico
FROM ATENDIMENTO a
JOIN PET p ON a.id_pet = p.id_pet
JOIN TUTOR t ON p.id_tutor = t.id_tutor
WHERE t.nome = 'Ana Silva'
ORDER BY a.data_hora_atendimento;

-- 4) Quantidade de atendimentos por veterinário (com LIMIT)
SELECT
    v.nome AS veterinario,
    COUNT(a.id_atendimento) AS total_atendimentos
FROM VETERINARIO v
LEFT JOIN ATENDIMENTO a ON v.id_veterinario = a.id_veterinario
GROUP BY v.nome
ORDER BY total_atendimentos DESC
LIMIT 5;

-- 5) Lista de consultas futuras ou ainda não realizadas
SELECT
    c.id_consulta,
    c.data_consulta,
    c.hora_consulta,
    c.tipo_consulta,
    c.status,
    p.nome AS pet,
    v.nome AS veterinario
FROM CONSULTA c
JOIN PET p ON c.id_pet = p.id_pet
JOIN VETERINARIO v ON c.id_veterinario = v.id_veterinario
WHERE c.status <> 'realizada'
ORDER BY c.data_consulta, c.hora_consulta;
