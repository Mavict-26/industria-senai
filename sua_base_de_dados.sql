-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14/11/2026 às 22:32
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `industria senai`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `componentes_maq`
--

CREATE TABLE `componentes_maq` (
  `id_componente` int(11) NOT NULL,
  `id_maquina` int(11) DEFAULT NULL,
  `nome_componente` varchar(100) DEFAULT NULL,
  `horas_uso_acumulado` int(11) DEFAULT NULL,
  `limite_horas_alerta` int(11) DEFAULT NULL
) ;

--
-- Despejando dados para a tabela `componentes_maq`
--

INSERT INTO `componentes_maq` (`id_componente`, `id_maquina`, `nome_componente`, `horas_uso_acumulado`, `limite_horas_alerta`) VALUES
(9, 1, 'Motor principal', 120, 500),
(10, 2, 'Correia de transmissao', 80, 300),
(11, 3, 'Sensor de temperatura', 200, 600),
(12, 4, 'Bomba hidraulica', 150, 400),
(13, 5, 'Painel eletrico', 90, 350),
(14, 6, 'Ventilador industrial', 110, 400),
(15, 7, 'Filtro de ar', 75, 300),
(16, 8, 'Valvula de controle', 160, 500),
(17, 9, 'Rolamento industrial', 100, 450),
(18, 10, 'Engrenagem principal', 130, 500);

-- --------------------------------------------------------

--
-- Estrutura para tabela `estoque_pecas`
--

CREATE TABLE `estoque_pecas` (
  `id_peca` int(11) NOT NULL,
  `codigo_part_number` varchar(50) DEFAULT NULL,
  `descricao` varchar(150) DEFAULT NULL,
  `qtd_estoque` int(11) DEFAULT NULL,
  `preco_unitario` decimal(10,2) DEFAULT NULL
) ;

--
-- Despejando dados para a tabela `estoque_pecas`
--

INSERT INTO `estoque_pecas` (`id_peca`, `codigo_part_number`, `descricao`, `qtd_estoque`, `preco_unitario`) VALUES
(1, 'PC006', 'Valvula industrial', 15, 120.00),
(2, 'PC007', 'Sensor de temperatura', 25, 85.50),
(3, 'PC008', 'Filtro de oleo', 40, 32.00),
(4, 'PC009', 'Eixo metalico', 12, 180.00),
(5, 'PC010', 'Bucha de bronze', 60, 18.90),
(6, 'PC011', 'Mola de compressao', 35, 12.50),
(7, 'PC012', 'Rolamento axial', 22, 65.00),
(8, 'PC013', 'Polia industrial', 18, 95.00),
(9, 'PC014', 'Conector eletrico', 80, 8.50),
(10, 'PC015', 'Disjuntor industrial', 14, 55.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico_sensores`
--

CREATE TABLE `historico_sensores` (
  `id_leitura` int(11) NOT NULL,
  `id_ordem` int(11) DEFAULT NULL,
  `temperatura_medida` decimal(5,2) DEFAULT NULL,
  `vibracao_mm_s` decimal(5,2) DEFAULT NULL,
  `data_hora_leitura` datetime DEFAULT NULL,
  `prompt__geracao_ia` varchar(100) DEFAULT 'GERADO_POR_LLM'
) ;

--
-- Despejando dados para a tabela `historico_sensores`
--

INSERT INTO `historico_sensores` (`id_leitura`, `id_ordem`, `temperatura_medida`, `vibracao_mm_s`, `data_hora_leitura`, `prompt__geracao_ia`) VALUES
(1, 1, 68.50, 1.20, '2026-11-10 08:00:00', 'Gere leitura normal de sensor pos manutencao'),
(2, 2, 85.20, 2.45, '2026-11-11 09:15:00', 'Gere leitura com vibracao alta'),
(3, 3, 72.10, 1.05, '2026-11-11 10:30:00', 'Gere leitura estavel de temperatura'),
(4, 4, 65.00, 0.85, '2026-11-12 08:45:00', 'Gere leitura normal apos preventiva'),
(5, 5, 92.40, 3.10, '2026-11-12 14:20:00', 'Gere leitura com aquecimento'),
(6, 6, 70.80, 1.15, '2026-11-13 09:00:00', 'Gere leitura normal'),
(7, 7, 88.90, 2.80, '2026-11-13 11:10:00', 'Gere leitura com vibracao moderada'),
(8, 8, 75.30, 1.40, '2026-11-14 08:20:00', 'Gere leitura pos preditiva'),
(9, 9, 69.60, 0.95, '2026-11-14 09:30:00', 'Gere leitura estavel'),
(10, 10, 95.00, 3.50, '2026-11-14 10:00:00', 'Gere leitura critica de temperatura'),
(11, 11, 71.20, 1.10, '2026-11-14 11:00:00', 'Gere leitura normal'),
(12, 12, 66.40, 0.90, '2026-11-14 13:00:00', 'Gere leitura pos cancelamento'),
(13, 13, 82.70, 2.20, '2026-11-14 14:00:00', 'Gere leitura com vibracao'),
(14, 14, 73.90, 1.30, '2026-11-14 15:00:00', 'Gere leitura normal apos preventiva'),
(15, 15, 90.10, 2.90, '2026-11-14 16:00:00', 'Gere leitura com alerta');

-- --------------------------------------------------------

--
-- Estrutura para tabela `linhas_producao`
--

CREATE TABLE `linhas_producao` (
  `id_linha` int(11) NOT NULL,
  `id_unidade` int(11) DEFAULT NULL,
  `nome_linha` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `linhas_producao`
--

INSERT INTO `linhas_producao` (`id_linha`, `id_unidade`, `nome_linha`) VALUES
(11, 1, 'Linha de Montagem'),
(12, 2, 'Linha de Producao A'),
(13, 3, 'Linha de Producao B'),
(14, 4, 'Linha de Motores'),
(15, 5, 'Linha de Componentes'),
(16, 6, 'Linha de Automacao'),
(17, 7, 'Linha de Robotica'),
(18, 8, 'Linha de Embalagem'),
(19, 9, 'Linha de Manutencao'),
(20, 10, 'Linha de Testes');

-- --------------------------------------------------------

--
-- Estrutura para tabela `maquinas_senai`
--

CREATE TABLE `maquinas_senai` (
  `id_maquina` int(11) NOT NULL,
  `id_linha` int(11) DEFAULT NULL,
  `id_tipo` int(11) DEFAULT NULL,
  `tag_patrimonio` varchar(30) DEFAULT NULL,
  `data_aquisicao` date DEFAULT NULL,
  `status_operacao` varchar(20) DEFAULT NULL
) ;

--
-- Despejando dados para a tabela `maquinas_senai`
--

INSERT INTO `maquinas_senai` (`id_maquina`, `id_linha`, `id_tipo`, `tag_patrimonio`, `data_aquisicao`, `status_operacao`) VALUES
(1, 11, 1, 'MAQ001', '2024-01-10', 'Ativa'),
(2, 12, 2, 'MAQ002', '2024-02-15', 'Ativa'),
(3, 13, 3, 'MAQ003', '2024-03-20', 'Ativa'),
(4, 14, 4, 'MAQ004', '2024-04-10', 'Ativa'),
(5, 15, 5, 'MAQ005', '2024-05-12', 'Ativa'),
(6, 16, 6, 'MAQ006', '2024-06-18', 'Ativa'),
(7, 17, 7, 'MAQ007', '2024-07-22', 'Ativa'),
(8, 18, 8, 'MAQ008', '2024-08-14', 'Ativa'),
(9, 19, 9, 'MAQ009', '2024-09-16', 'Ativa'),
(10, 20, 10, 'MAQ010', '2024-10-25', 'Ativa');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ordens_servico`
--

CREATE TABLE `ordens_servico` (
  `id_ordem` int(11) NOT NULL,
  `id_maquina` int(11) DEFAULT NULL,
  `id_tecnico` int(11) DEFAULT NULL,
  `data_abertura` datetime DEFAULT NULL,
  `tipo_manutencao` varchar(20) DEFAULT NULL,
  `status_os` varchar(20) DEFAULT NULL
) ;

--
-- Despejando dados para a tabela `ordens_servico`
--

INSERT INTO `ordens_servico` (`id_ordem`, `id_maquina`, `id_tecnico`, `data_abertura`, `tipo_manutencao`, `status_os`) VALUES
(1, 1, 1, '2026-11-10 00:00:00', 'PREVENTIVA', 'CONCLUIDA'),
(2, 2, 2, '2026-11-11 00:00:00', 'CORRETIVA', 'EM_ANDAMENTO'),
(3, 3, 3, '2026-11-11 00:00:00', 'PREDITIVA', 'ABERTA'),
(4, 4, 4, '2026-11-12 00:00:00', 'PREVENTIVA', 'ABERTA'),
(5, 5, 5, '2026-11-12 00:00:00', 'CORRETIVA', 'CONCLUIDA'),
(6, 6, 6, '2026-11-13 00:00:00', 'PREVENTIVA', 'EM_ANDAMENTO'),
(7, 7, 7, '2026-11-13 00:00:00', 'CORRETIVA', 'ABERTA'),
(8, 8, 8, '2026-11-14 00:00:00', 'PREDITIVA', 'CONCLUIDA'),
(9, 9, 9, '2026-11-14 00:00:00', 'PREVENTIVA', 'CONCLUIDA'),
(10, 10, 10, '2026-11-14 00:00:00', 'CORRETIVA', 'EM_ANDAMENTO'),
(11, 1, 11, '2026-11-14 00:00:00', 'PREDITIVA', 'ABERTA'),
(12, 2, 12, '2026-11-14 00:00:00', 'PREVENTIVA', 'CANCELADA'),
(13, 3, 13, '2026-11-14 00:00:00', 'CORRETIVA', 'EM_ANDAMENTO'),
(14, 4, 14, '2026-11-14 00:00:00', 'PREVENTIVA', 'CONCLUIDA'),
(15, 5, 15, '2026-11-14 00:00:00', 'PREDITIVA', 'CANCELADA');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pecas_os`
--

CREATE TABLE `pecas_os` (
  `id_ordem` int(11) NOT NULL,
  `id_peca` int(11) NOT NULL,
  `qtd_utilizada` int(11) DEFAULT NULL,
  `preco_aplicado` decimal(10,2) DEFAULT NULL
) ;

--
-- Despejando dados para a tabela `pecas_os`
--

INSERT INTO `pecas_os` (`id_ordem`, `id_peca`, `qtd_utilizada`, `preco_aplicado`) VALUES
(1, 1, 1, 120.00),
(2, 2, 2, 85.50),
(3, 3, 1, 32.00),
(4, 4, 1, 180.00),
(5, 5, 2, 18.90),
(6, 6, 4, 12.50),
(7, 7, 1, 65.00),
(8, 8, 1, 95.00),
(9, 9, 3, 8.50),
(10, 10, 1, 55.00),
(11, 3, 2, 32.00),
(12, 5, 1, 18.90),
(13, 2, 1, 85.50),
(14, 7, 2, 65.00),
(15, 9, 2, 8.50);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tecnicos`
--

CREATE TABLE `tecnicos` (
  `id_tecnico` int(11) NOT NULL,
  `nome_tecnico` varchar(100) DEFAULT NULL,
  `especialidade` varchar(50) DEFAULT NULL,
  `nivel_certificacao` varchar(30) DEFAULT NULL
) ;

--
-- Despejando dados para a tabela `tecnicos`
--

INSERT INTO `tecnicos` (`id_tecnico`, `nome_tecnico`, `especialidade`, `nivel_certificacao`) VALUES
(1, 'Matheus Cardoso', 'Elétrica Industrial', 'PLENO'),
(2, 'Amanda Ferreira', 'Mecânica', 'SENIOR'),
(3, 'Diego Santos', 'Automação', 'SPECIALIST'),
(4, 'Patrícia Mendes', 'Soldagem', 'JUNIOR'),
(5, 'Felipe Costa', 'Manutenção Industrial', 'PLENO'),
(6, 'Carolina Alves', 'Elétrica Predial', 'SENIOR'),
(7, 'Vinicius Ribeiro', 'Refrigeração', 'JUNIOR'),
(8, 'Renata Oliveira', 'Automação', 'SPECIALIST'),
(9, 'Gustavo Lima', 'Mecânica', 'SENIOR'),
(10, 'Mariana Souza', 'Soldagem', 'PLENO'),
(11, 'Leonardo Pinto', 'Elétrica Industrial', 'JUNIOR'),
(12, 'Isabela Castro', 'Manutenção Industrial', 'SPECIALIST'),
(13, 'André Luiz', 'Automação', 'SENIOR'),
(14, 'Vanessa Moreira', 'Refrigeração', 'SPECIALIST'),
(15, 'Eduardo Nunes', 'Mecânica', 'SENIOR');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipos_maquina`
--

CREATE TABLE `tipos_maquina` (
  `id_tipo` int(11) NOT NULL,
  `nome_tipo` varchar(50) DEFAULT NULL,
  `horas_revisao_padrao` int(11) DEFAULT NULL
) ;

--
-- Despejando dados para a tabela `tipos_maquina`
--

INSERT INTO `tipos_maquina` (`id_tipo`, `nome_tipo`, `horas_revisao_padrao`) VALUES
(1, 'Torno CNC', 500),
(2, 'Fresadora', 400),
(3, 'Prensa Hidraulica', 600),
(4, 'Esteira Industrial', 300),
(5, 'Compressor', 450),
(6, 'Injetora Plastica', 550),
(7, 'Robô Industrial', 700),
(8, 'Furadeira Industrial', 350),
(9, 'Retifica', 500),
(10, 'Maquina de Solda', 400);

-- --------------------------------------------------------

--
-- Estrutura para tabela `unidades_senai`
--

CREATE TABLE `unidades_senai` (
  `id_unidade` int(11) NOT NULL,
  `nome_unidade` varchar(100) NOT NULL,
  `cidade` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `unidades_senai`
--

INSERT INTO `unidades_senai` (`id_unidade`, `nome_unidade`, `cidade`) VALUES
(1, 'Unidade Industrial', 'Curitiba'),
(2, 'Unidade Tecnologica', 'Maringa'),
(3, 'Unidade Automotiva', 'Londrina'),
(4, 'Unidade Mecanica', 'Cascavel'),
(5, 'Unidade Eletrica', 'Ponta Grossa'),
(6, 'Unidade de Automacao', 'Sao Paulo'),
(7, 'Unidade de Robotica', 'Campinas'),
(8, 'Unidade de Producao', 'Joinville'),
(9, 'Unidade de Manutencao', 'Sorocaba'),
(10, 'Unidade de Tecnologia', 'Florianopolis'),
(11, 'Unidade de Engenharia', 'Brasilia'),
(12, 'Unidade de Pesquisa', 'Goiania'),
(13, 'Unidade de Metalurgia', 'Betim'),
(14, 'Unidade de Eletronica', 'Manaus'),
(15, 'Unidade de Logistica', 'Recife'),
(16, 'Unidade de Desenvolvimento', 'Santos'),
(17, 'Unidade de Montagem', 'Guarulhos'),
(18, 'Unidade de Qualidade', 'Uberlandia'),
(19, 'Unidade de Manufatura', 'Blumenau'),
(20, 'Unidade de Projetos', 'Natal');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `componentes_maq`
--
ALTER TABLE `componentes_maq`
  ADD PRIMARY KEY (`id_componente`),
  ADD KEY `fk_id_maquina` (`id_maquina`);

--
-- Índices de tabela `estoque_pecas`
--
ALTER TABLE `estoque_pecas`
  ADD PRIMARY KEY (`id_peca`),
  ADD UNIQUE KEY `uk_codigo_part_number` (`codigo_part_number`);

--
-- Índices de tabela `historico_sensores`
--
ALTER TABLE `historico_sensores`
  ADD PRIMARY KEY (`id_leitura`),
  ADD KEY `fk_historico_ordem` (`id_ordem`);

--
-- Índices de tabela `linhas_producao`
--
ALTER TABLE `linhas_producao`
  ADD PRIMARY KEY (`id_linha`),
  ADD KEY `fk_unidades_senai_linhas_producao` (`id_unidade`);

--
-- Índices de tabela `maquinas_senai`
--
ALTER TABLE `maquinas_senai`
  ADD PRIMARY KEY (`id_maquina`),
  ADD UNIQUE KEY `uk_tag_patrimonio` (`tag_patrimonio`),
  ADD KEY `fk_linha` (`id_linha`),
  ADD KEY `fk_id_tipo` (`id_tipo`);

--
-- Índices de tabela `ordens_servico`
--
ALTER TABLE `ordens_servico`
  ADD PRIMARY KEY (`id_ordem`),
  ADD KEY `fk_ordens_maquina` (`id_maquina`),
  ADD KEY `fk_ordens_tecnico` (`id_tecnico`);

--
-- Índices de tabela `pecas_os`
--
ALTER TABLE `pecas_os`
  ADD PRIMARY KEY (`id_ordem`,`id_peca`),
  ADD KEY `fk_id_pecas` (`id_peca`);

--
-- Índices de tabela `tecnicos`
--
ALTER TABLE `tecnicos`
  ADD PRIMARY KEY (`id_tecnico`);

--
-- Índices de tabela `tipos_maquina`
--
ALTER TABLE `tipos_maquina`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Índices de tabela `unidades_senai`
--
ALTER TABLE `unidades_senai`
  ADD PRIMARY KEY (`id_unidade`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `componentes_maq`
--
ALTER TABLE `componentes_maq`
  MODIFY `id_componente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `estoque_pecas`
--
ALTER TABLE `estoque_pecas`
  MODIFY `id_peca` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `historico_sensores`
--
ALTER TABLE `historico_sensores`
  MODIFY `id_leitura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `linhas_producao`
--
ALTER TABLE `linhas_producao`
  MODIFY `id_linha` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `maquinas_senai`
--
ALTER TABLE `maquinas_senai`
  MODIFY `id_maquina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ordens_servico`
--
ALTER TABLE `ordens_servico`
  MODIFY `id_ordem` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tecnicos`
--
ALTER TABLE `tecnicos`
  MODIFY `id_tecnico` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipos_maquina`
--
ALTER TABLE `tipos_maquina`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `unidades_senai`
--
ALTER TABLE `unidades_senai`
  MODIFY `id_unidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `componentes_maq`
--
ALTER TABLE `componentes_maq`
  ADD CONSTRAINT `fk_id_maquina` FOREIGN KEY (`id_maquina`) REFERENCES `maquinas_senai` (`id_maquina`);

--
-- Restrições para tabelas `historico_sensores`
--
ALTER TABLE `historico_sensores`
  ADD CONSTRAINT `fk_historico_ordem` FOREIGN KEY (`id_ordem`) REFERENCES `ordens_servico` (`id_ordem`);

--
-- Restrições para tabelas `linhas_producao`
--
ALTER TABLE `linhas_producao`
  ADD CONSTRAINT `fk_unidades_senai_linhas_producao` FOREIGN KEY (`id_unidade`) REFERENCES `unidades_senai` (`id_unidade`);

--
-- Restrições para tabelas `maquinas_senai`
--
ALTER TABLE `maquinas_senai`
  ADD CONSTRAINT `fk_id_tipo` FOREIGN KEY (`id_tipo`) REFERENCES `tipos_maquina` (`id_tipo`),
  ADD CONSTRAINT `fk_linha` FOREIGN KEY (`id_linha`) REFERENCES `linhas_producao` (`id_linha`);

--
-- Restrições para tabelas `ordens_servico`
--
ALTER TABLE `ordens_servico`
  ADD CONSTRAINT `fk_ordens_maquina` FOREIGN KEY (`id_maquina`) REFERENCES `maquinas_senai` (`id_maquina`),
  ADD CONSTRAINT `fk_ordens_tecnico` FOREIGN KEY (`id_tecnico`) REFERENCES `tecnicos` (`id_tecnico`);

--
-- Restrições para tabelas `pecas_os`
--
ALTER TABLE `pecas_os`
  ADD CONSTRAINT `fk_id_ordem` FOREIGN KEY (`id_ordem`) REFERENCES `ordens_servico` (`id_ordem`),
  ADD CONSTRAINT `fk_id_pecas` FOREIGN KEY (`id_peca`) REFERENCES `estoque_pecas` (`id_peca`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
