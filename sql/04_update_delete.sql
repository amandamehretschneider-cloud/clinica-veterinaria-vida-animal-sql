USE clinica_vet;

-- ===========================
-- COMANDOS UPDATE (3 exemplos)
-- ===========================

-- 1) Atualizar telefone de um tutor
UPDATE TUTOR
SET telefone = '(41) 99999-1111'
WHERE nome = 'Ana Silva';

-- 2) Corrigir porte do pet Thor
UPDATE PET
SET porte = 'Médio'
WHERE nome = 'Thor';

-- 3) Marcar pagamento pendente como pago
UPDATE PAGAMENTO
SET status_pagamento = 'pago',
    forma_pagamento = 'cartao'
WHERE id_pagamento = 3;

-- ==================================
-- COMANDOS DELETE (3 exemplos com FK)
-- ==================================

-- 1) Remover um serviço que não será mais oferecido
-- (primeiro remover vínculos na tabela associativa)
DELETE FROM ATENDIMENTO_SERVICO
WHERE id_servico = 4;  -- Limpeza de ouvido

DELETE FROM SERVICO
WHERE id_servico = 4;

-- 2) Remover uma consulta agendada que foi cancelada antes do atendimento
DELETE FROM CONSULTA
WHERE status = 'agendada'
  AND id_consulta = 4;

-- 3) Excluir um pet que foi removido do cadastro

-- remover o prontuário do pet
DELETE FROM PRONTUARIO
WHERE id_pet = 4;

-- remover atendimentos do pet (se existissem serviços, seriam apagados antes em ATENDIMENTO_SERVICO)
DELETE FROM ATENDIMENTO
WHERE id_pet = 4;

-- finalmente remover o pet
DELETE FROM PET
WHERE id_pet = 4;
