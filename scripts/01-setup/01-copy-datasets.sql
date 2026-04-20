CREATE SCHEMA datasets;

CREATE TABLE datasets.despesas_por_orgao
(
    mes_ano                    TEXT,
    orgao_superior             TEXT,
    orgao_entidade_vinculada   TEXT,
    valor_empenhado            TEXT,
    valor_liquidado            TEXT,
    valor_pago                 TEXT,
    valor_restos_a_pagar_pagos TEXT,
    extra                      TEXT -- para evitar erros durante o processo COPY pois cada registro termina com delimitador ';'
);

CREATE TABLE datasets.receita_por_orgao
(
    ano                                 TEXT,
    orgao_superior                      TEXT,
    orgao                               TEXT,
    unidade_gestora                     TEXT,
    categoria                           TEXT,
    origem                              TEXT,
    especie                             TEXT,
    detalhamento                        TEXT,
    orçamento_atualizado_valor_previsto TEXT,
    receita_realizada_valor_arrecadado  TEXT,
    previsto_realizado                  TEXT,
    valor_lancado                       TEXT,
    extra                               TEXT -- para evitar erros durante o processo COPY pois cada registro termina com delimitador ';'
);

COPY datasets.despesas_por_orgao (mes_ano, orgao_superior, orgao_entidade_vinculada, valor_empenhado, valor_liquidado,
    valor_pago, valor_restos_a_pagar_pagos, extra)
    FROM '/datasets/despesasPorOrgao-2023.csv'
    DELIMITER ';' CSV HEADER;

COPY datasets.despesas_por_orgao (mes_ano, orgao_superior, orgao_entidade_vinculada, valor_empenhado, valor_liquidado,
    valor_pago, valor_restos_a_pagar_pagos, extra)
    FROM '/datasets/despesasPorOrgao-2024.csv'
    DELIMITER ';' CSV HEADER;

COPY datasets.despesas_por_orgao (mes_ano, orgao_superior, orgao_entidade_vinculada, valor_empenhado, valor_liquidado,
    valor_pago, valor_restos_a_pagar_pagos, extra)
    FROM '/datasets/despesasPorOrgao-2025.csv'
    DELIMITER ';' CSV HEADER;

COPY datasets.despesas_por_orgao (mes_ano, orgao_superior, orgao_entidade_vinculada, valor_empenhado, valor_liquidado,
    valor_pago, valor_restos_a_pagar_pagos, extra)
    FROM '/datasets/despesasPorOrgao-2026.csv'
    DELIMITER ';' CSV HEADER;

COPY datasets.receita_por_orgao (ano, orgao_superior, orgao, unidade_gestora, categoria, origem, especie, detalhamento,
    orçamento_atualizado_valor_previsto, receita_realizada_valor_arrecadado,
    previsto_realizado, valor_lancado, extra)
    FROM '/datasets/receitas-2023-2024.csv'
    DELIMITER ';' CSV HEADER;

COPY datasets.receita_por_orgao (ano, orgao_superior, orgao, unidade_gestora, categoria, origem, especie, detalhamento,
    orçamento_atualizado_valor_previsto, receita_realizada_valor_arrecadado,
    previsto_realizado, valor_lancado, extra)
    FROM '/datasets/receitas-2025-2026.csv'
    DELIMITER ';' CSV HEADER;

-- removendo coluna desnecessaria
ALTER TABLE datasets.despesas_por_orgao
DROP
COLUMN extra;

ALTER TABLE datasets.receita_por_orgao
DROP
COLUMN extra;
