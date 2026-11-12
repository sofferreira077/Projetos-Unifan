CREATE DATABASE IF NOT EXISTS barbearia;
USE barbearia;

CREATE TABLE IF NOT EXISTS servicos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    preco DECIMAL(5, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    servicos_id INT,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (servicos_id) REFERENCES servicos(id)
) AUTO_INCREMENT = 100;

CREATE TABLE IF NOT EXISTS fila_atendimento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT NOT NULL,
    servico_id INT NOT NULL,
    posicao INT NOT NULL,
    status VARCHAR(20) DEFAULT 'Aguardando',
    data_entrada TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (servico_id) REFERENCES servicos(id)
);

CREATE TABLE IF NOT EXISTS historico_atendimento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT NOT NULL,
    servico_id INT NOT NULL,
    data_atendimento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    valor_pago DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (servico_id) REFERENCES servicos(id)
);

INSERT IGNORE INTO servicos (id, nome, preco) VALUES
(1, 'Corte Masculino', 30.00),
(2, 'Barba', 20.00),
(3, 'Corte e Barba', 45.00),
(4, 'Sobrancelha', 15.00);