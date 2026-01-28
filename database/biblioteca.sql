#Atividade avaliativa aula 11 - A2-2 - 14/11/2024                Gabriela Pedroso dos Santos Pontes
DROP DATABASE IF EXISTS biblioteca; #excluido banco de dados ja existente se tiver
#1) Criar a base de dados e prepará-la para uso. 
#Criação do banco de dados, comandos para não gerar problemas de compatibilidade de caracteres e deixar o BD mais flexível
CREATE DATABASE biblioteca CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci; 
USE biblioteca; #Permite a realização de operaçês no BD
/*2) Criar as tabelas de acordo com o modelo lógico relacional idealizado na avaliação anterior, considerando 
as restrições de integridade; a base de dados deve conter pelo menos cinco tabelas, análogas a: livro, 
autor, membro, categoria, empréstimo.*/
#Criação da tabela Membros
CREATE TABLE MEMBROS (
        id_membro INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome_membro VARCHAR(50) NOT NULL,
    num_ident INTEGER NOT NULL, 
    email VARCHAR(60)
);
DESCRIBE MEMBROS; #Dicionário de dados da tabela Membros
#Criação da tabela endereço - atributo composto de Membros 
CREATE TABLE ENDERECOS(
        id_endereco INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_meb_fk INTEGER,
    rua VARCHAR(100) NOT NULL,
    bairro VARCHAR(20) NOT NULL,
    numero TINYINT NOT NULL, 
    cep CHAR(8),
    complemento VARCHAR(30),
FOREIGN KEY (id_meb_fk) REFERENCES membros (id_membro)
ON UPDATE CASCADE ON DELETE CASCADE
);
DESCRIBE ENDERECOS; #Dicionário de dados da tabela Enderecos
#Criação da tabela Autores
CREATE TABLE AUTORES(
        id_autor INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    nome_autor VARCHAR(50) NOT NULL, 
    genero_obras VARCHAR(30) NOT NULL, 
    num_obras INTEGER, 
    nacionalidade VARCHAR(20)
);
DESCRIBE autores; #Dicionário de dados da tabela Autores
#Criação da tabela categorias
CREATE TABLE CATEGORIAS(
        id_categoria INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    local_categoria VARCHAR(50) NOT NULL, 
    classificacao ENUM ('Infantil', 'Juvenil', 'Adulto') NOT NULL,
    descricao VARCHAR(60) NOT NULL
);
DESCRIBE categorias; #Dicionário de dados da tabela Categorias
#Criação da tabela Livros 
CREATE TABLE LIVROS(
        id_livro INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_autor_fk INTEGER,
    id_categoria_fk INTEGER, 
    titulo VARCHAR(40) NOT NULL,
    ano_publi DATE NOT NULL,
    num_exemplares INTEGER NOT NULL,
    genero_livro ENUM ('Ação/Aventura', 'Fantasia', 'Ficção Científica', 'Suspense', 'Terror', 'Romance', 'Acadêmico'),
        editora VARCHAR(30),
        edicao VARCHAR(30),
FOREIGN KEY (id_autor_fk) REFERENCES autores (id_autor)
ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (id_categoria_fk) REFERENCES categorias (id_categoria)
ON UPDATE CASCADE ON DELETE CASCADE
);
DESCRIBE livros; #Dicionário de dados da tabela Livros
#Criação da tabela emprestimos
CREATE TABLE EMPRESTIMOS(
        id_emprestimo INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    id_emp_livro_fk INTEGER, 
    id_emp_membro_fk INTEGER, 
    dt_emprestimo DATE NOT NULL,
    dt_devolucao DATE NOT NULL,
    dt_devolucao_real DATE NOT NULL,
FOREIGN KEY (id_emp_livro_fk) REFERENCES livros (id_livro)
ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (id_emp_membro_fk) REFERENCES membros (id_membro)
ON UPDATE CASCADE ON DELETE CASCADE
);
DESCRIBE emprestimos; #Dicionário de dados da tabela Emprestimos
#3) Inserir pelo menos 5 registros em cada tabela.
#Inserindo registros na tabela Membros
INSERT INTO membros (nome_membro, num_ident, email) VALUES 
('Alice Silva', '123456789', 'alice.silva@email.com'),
('Carlos Pereira', '987654321', 'carlos.pereira@email.com'),
('Fernanda Souza', '456789123', 'fernanda.souza@email.com'),
('José Santos', '741258963', 'jose.santos@email.com'),
('Mariana Oliveira', '852963741', 'mariana.oliveira@email.com');
SELECT * FROM membros; #Visualizando registros armazenados em colunas na tabela Membros
INSERT INTO enderecos (id_endereco, id_meb_fk, rua, bairro, numero, cep, complemento) VALUES 
('1', '5','Rua das Flores', 'Vila Nova', '115', '04156000', 'apto 42'),
('2', '2', 'Avenida Brasil', 'Centro', '110', '20030040', 'bloco B'),
('3', '4', 'Rua 7 de Setembro', 'Bairro Alto', '123', '50670090', 'casa'),
('4', '3', 'Travessa da Paz', 'Parque Industrial', '018', '14490450', 'casa'),
('5', '1', 'Rua Rio de Janeiro', 'Vila Santa Maria', '111', '30150200', 'apto 303');
SELECT*FROM enderecos; #Visualizando registros armazenados em colunas na tabela Endereços
#Inserindo registros na tabela Autores
INSERT INTO AUTORES (id_autor, nome_autor, genero_obras, num_obras, nacionalidade) VALUES
('1', 'J.R.R. Tolkien', 'Fantasia', '30', 'Britânico'),
('2', 'George Orwell', 'Ficção Científica', '12', 'Britânico'),
('3', 'Gabriel García Márquez', 'Romance', '26', 'Colombiano'),
('4', 'William Gibson', 'Ficção Científica', '15', 'Americano'),
('5', 'F. Scott Fitzgerald', 'Romance', '9', 'Americano'),
('6', 'Dan Brown', 'Suspense', '10', 'Americano'),
('7', 'Arthur Conan Doyle', 'Ação/Aventura', '50', 'Britânico'),
('8', 'Stephen King', 'Terror', '60', 'Americano'),
('9', 'H.G. Wells', 'Ficção Científica', '30', 'Britânico'),
('10', 'Margaret Atwood', 'Ficção Científica', '15', 'Canadense'),
('11', 'H.G. Wells', 'Ficção Científica', '30', 'Britânico'),
('12', 'J.R.R. Tolkien', 'Fantasia', '30', 'Britânico'),
('13', 'Margaret Atwood', 'Ficção Científica', '15', 'Canadense'),
('14', 'Dan Brown', 'Suspense', '10', 'Americano'),
('15', 'J.R.R. Tolkien', 'Fantasia', '30', 'Britânico'),
('16', 'J.R.R. Tolkien', 'Fantasia', '30', 'Britânico'),
('17', 'Dan Brown', 'Suspense', '10', 'Americano'),
('18', 'Iain Pears', 'Suspense', '10', 'Britânico'),
('19', 'Michael A. Singer', 'Ficção Científica', '4', 'Americano'),
('20', 'Joe Abercrombie', 'Ação/Aventura', '5', 'Britânico'),
('21', 'Orson Scott Card', 'Ficção Científica', '28', 'Americano'),
('22', 'Terry Brooks', 'Fantasia', '24', 'Americano'),
('23', 'L. Frank Baum', 'Fantasia', '20', 'Americano'),
('24', 'Jane Austen', 'Romance', '6', 'Britânica'),
('25', 'Markus Zusak', 'Suspense', '8', 'Australiano'),
('26', 'C.S. Lewis', 'Fantasia', '20', 'Britânico'),
('27', 'Ray Bradbury', 'Ficção Científica', '15', 'Americano'),
('28', 'James Fenimore Cooper', 'Ação/Aventura', '30', 'Americano'),
('29', 'Mary Shelley', 'Terror', '10', 'Britânica'),
('30', 'Paul Auster', 'Suspense', '5', 'Americano'),
('31', 'Douglas Adams', 'Ficção Científica', '10', 'Britânico'),
('32', 'Bram Stoker', 'Terror', '7', 'Irlandês'),
('33', 'Dan Brown', 'Suspense', '10', 'Americano'),
('34', 'Robert Louis Stevenson', 'Ação/Aventura', '20', 'Escocês'),
('35', 'Arthur Conan Doyle', 'Suspense', '50', 'Britânico'),
('36', 'John Dickson Carr', 'Suspense', '15', 'Americano'),
('37', 'Anthony Burgess', 'Ficção Científica', '12', 'Britânico'),
('38', 'George R.R. Martin', 'Fantasia', '20', 'Americano'),
('39', 'William Peter Blatty', 'Terror', '5', 'Americano'),
('40', 'Franz Kafka', 'Suspense', '9', 'Alemão'),
('41', 'Marion Zimmer Bradley', 'Fantasia', '20', 'Americana'),
('42', 'Patrick Rothfuss', 'Fantasia', '5', 'Americano'),
('43', 'Arthur Conan Doyle', 'Suspense', '50', 'Britânico'),
('44', 'Niccolò Machiavelli', 'Acadêmico', '10', 'Italiano'),
('45', 'José Saramago', 'Romance', '20', 'Português'),
('46', 'Glenn Kaplan', 'Suspense', '3', 'Americano'),
('47', 'J.K. Rowling', 'Suspense', '12', 'Britânica'),
('48', 'Ken Follett', 'Ação/Aventura', '20', 'Britânico'),
('49', 'Mario Puzo', 'Suspense', '8', 'Americano'),
('50', 'George R.R. Martin', 'Fantasia', '20', 'Americano');
SELECT * FROM autores; #Visualizando registros armazenados em colunas na tabela Autores
#Inserindo registros na tabela Categorias
INSERT INTO categorias (id_categoria, local_categoria, classificacao, descricao) VALUES 
('1', 'Andar 1 Corredor 2', 'Infantil', 'Área de estantes da cor amarela e brinquedos educativos'),
('2', 'Andar 2 Corredor 3', 'Juvenil', 'Espaço moderno, com estantes da cor azul e pufes coloridos'),
('3', 'Andar 3 Corredor 1', 'Adulto', 'Área silenciona de estantes vermelhas e mesas de estudo');
SELECT * FROM categorias; #Visualizando registros armazenados em colunas na tabela Categorias
#Inserindo registros na tabela Livros
INSERT INTO livros (id_livro, id_autor_fk, id_categoria_fk, titulo, ano_publi, num_exemplares, genero_livro, editora, edicao) VALUES
('1', '1', '2', 'O Hobbit', '2024-09-21', '15', 'Fantasia', 'Martins', '1ª'),
('2', '2', '2', '1984', '2021-06-08', '20', 'Ficção Científica', 'Companhia das Letras', '1ª'),
('3', '3', '3', 'O Senhor dos Anéis: A Sociedade do Anel', '2020-07-29', '25', 'Fantasia', 'HarperCollins', '1ª'),
('4', '4', '2', 'Cem Anos de Solidão', '2024-06-05', '3', 'Romance', 'Record', '1ª'),
('5', '5', '3', 'Neuromancer', '2023-07-01', '10', 'Ficção Científica', 'Rocco', '1ª'),
('6', '6', '2', 'O Grande Gatsby', '2021-04-10', '8', 'Romance', 'Sextante', '1ª'),
('7', '7', '2', 'O Código Da Vinci', '2020-03-18', '22', 'Suspense', 'Objetiva', '1ª'),
('8', '8', '3', 'O Mundo Perdido', '2023-11-25', '14', 'Ação/Aventura', 'Record', '1ª'),
('9', '9', '2', 'O Iluminado', '1977-01-28', '18', 'Terror', 'Suma de Letras', '1ª'),
('10', '10', '3', 'A Dança da Morte', '1978-05-22', '12', 'Terror', 'Bertrand Brasil', '1ª'),
('11', '11', '2', 'A Máquina do Tempo', '1895-01-01', '13', 'Ficção Científica', 'Editora Globo', '1ª'),
('12', '12', '2', 'O Senhor dos Anéis: As Duas Torres', '1954-11-11', '11', 'Fantasia', 'HarperCollins', '1ª'),
('13', '13', '3', 'O Homem Invisível', '1897-03-01', '9', 'Ficção Científica', 'Editora 34', '1ª'),
('14', '14', '2', 'O Conto da Aia', '1985-12-01', '7', 'Ficção Científica', 'Record', '1ª'),
('15', '15', '2', 'O Senhor dos Anéis: O Retorno do Rei', '1955-10-20', '10', 'Fantasia', 'HarperCollins', '1ª'),
('16', '16', '3', 'O Silmarillion', '1977-09-15', '17', 'Fantasia', 'HarperCollins', '1ª'),
('17', '17', '2', 'O Sistema Operacional', '2022-05-14', '2', 'Suspense', 'Objetiva', '1ª'),
('18', '18', '2', 'O Enigma do Quatro', '2004-07-12', '16', 'Suspense', 'Cia das Letras', '1ª'),
('19', '19', '2', 'O Sistema da Mente', '2016-03-29', '4', 'Suspense', 'Leya', '1ª'),
('20', '20', '2', 'A Ronda da Noite', '2019-02-16', '11', 'Ação/Aventura', 'Companhia das Letras', '1ª'),
('21', '21', '2', 'O Jogo do Exterminador', '1985-11-01', '9', 'Ficção Científica', 'Rocco', '1ª'),
('22', '22', '3', 'A Espada de Shannara', '1977-04-23', '1', 'Fantasia', 'HarperCollins', '1ª'),
('23', '23', '3', 'O Mágico de Oz', '1900-05-01', '2', 'Fantasia', 'L&PM', '1ª'),
('24', '24', '2', 'Orgulho e Preconceito', '1813-01-28', '6', 'Romance', 'Penguin', '1ª'),
('25', '25', '2', 'A Menina que Roubava Livros', '2005-09-15', '15', 'Suspense', 'Intrínseca', '1ª'),
('26', '26', '2', 'As Crônicas de Nárnia', '1950-10-16', '3', 'Fantasia', 'HarperCollins', '1ª'),
('27', '27', '2', 'Fahrenheit 451', '1953-10-19', '18', 'Ficção Científica', 'Record', '1ª'),
('28', '28', '3', 'O Último dos Moicanos', '1826-02-15', '7', 'Ação/Aventura', 'Companhia das Letras', '1ª'),
('29', '29', '2', 'Frankenstein', '1818-01-01', '20', 'Terror', 'Penguin', '1ª'),
('30', '30', '3', 'Vingança', '1996-09-10', '13', 'Suspense', 'Record', '1ª'),
('31', '31', '2', 'O Guia do Mochileiro das Galáxias', '1979-10-12', '3', 'Ficção Científica', 'Aleph', '1ª'),
('32', '32', '3', 'Drácula', '1897-05-26', '17', 'Terror', 'Suma de Letras', '1ª'),
('33', '33', '2', 'O Sistema do Caos', '2015-02-10', '12', 'Suspense', 'Rocco', '1ª'),
('34', '34', '3', 'Ilha do Tesouro', '1883-01-01', '2', 'Ação/Aventura', 'Martin Claret', '1ª'),
('35', '35', '2', 'As Aventuras de Sherlock Holmes', '1892-10-14', '8', 'Suspense', 'Editora 34', '1ª'),
('36', '36', '3', 'O Mistério dos Sete Relógios', '1982-04-03', '1', 'Suspense', 'Record', '1ª'),
('37', '37', '2', 'A Laranja Mecânica', '1962-04-01', '25', 'Ficção Científica', 'Suma de Letras', '1ª'),
('38', '38', '3', 'A Guerra dos Tronos', '1996-08-06', '9', 'Fantasia', 'LeYa', '1ª'),
('39', '39', '2', 'O Exorcista', '1971-03-11', '6', 'Terror', 'HarperCollins', '1ª'),
('40', '40', '2', 'O Processo', '1925-08-19', '19', 'Suspense', 'Martins', '1ª'),
('41', '41', '3', 'As Brumas de Avalon', '1983-05-23', '15', 'Fantasia', 'Record', '1ª'),
('42', '42', '2', 'O Nome do Vento', '2007-05-14', '24', 'Fantasia', 'Rocco', '1ª'),
('43', '43', '2', 'O Cão dos Baskervilles', '1902-04-01', '11', 'Suspense', 'Editora 34', '1ª'),
('44', '44', '3', 'O Príncipe', '1532-03-10', '12', 'Acadêmico', 'Martins', '1ª'),
('45', '45', '2', 'A Caverna', '2000-04-05', '19', 'Romance', 'Cia das Letras', '1ª'),
('46', '46', '2', 'O Demônio de Dover', '2010-06-15', '20', 'Suspense', 'Intrínseca', '1ª'),
('47', '47', '2', 'Morte Súbita', '2012-05-17', '25', 'Suspense', 'Rocco', '1ª'),
('48', '48', '3', 'Os Pilares da Terra', '1989-05-12', '22', 'Ação/Aventura', 'Record', '1ª'),
('49', '49', '2', 'O Padrinho', '1969-05-01', '10', 'Suspense', 'Cia das Letras', '1ª'),
('50', '50', '2', 'A Guerra dos Tronos', '2000-07-03', '7', 'Fantasia', 'LeYa', '1ª');
SELECT * FROM livros; #Visualizando registros armazenados em colunas na tabela Livros
#Inserindo registros na tabela Emprestimos
INSERT INTO emprestimos (id_emprestimo, id_emp_livro_fk, id_emp_membro_fk, dt_emprestimo, dt_devolucao, dt_devolucao_real) VALUES 
(10, 3, 5, '2024-07-10', '2024-07-25', '2024-07-23'),
(2, 5, 1, '2013-05-02', '2013-05-10', '2013-05-10'),
(7, 7, 1, '2024-06-12', '2024-06-19', '2024-06-18'), 
(4, 8, 4, '2000-06-01', '2000-06-15', '2000-06-15'), 
(1, 12, 1, '2000-05-01', '2000-05-15', '2000-05-16'), 
(9, 15, 3, '2024-11-15', '2024-11-20', '2024-11-20'), 
(5, 19, 1, '2023-06-03', '2023-06-17', '2023-06-17'),
(8, 20, 4, '2018-07-01', '2018-07-10', '2018-07-11'), 
(3, 25, 3, '2023-05-05', '2023-05-20', '2023-05-19'),  
(6, 33, 5, '2018-06-10', '2018-06-25', '2018-06-27');
SELECT * FROM emprestimos; #Visualizando registros armazenados em colunas na tabela Emprestimos
#1) Listar o título do livro e o nome do autor para todos os livros cadastrados na base
SELECT l.titulo, a.nome_autor FROM livros l JOIN autores a ON l.id_autor_fk = a.id_autor ORDER BY a.nome_autor;
#2) Listar a data de empréstimo, o nome do membro que emprestou, e o título do livro de todos os empréstimos feitos neste ano.
SELECT emp.dt_emprestimo, memb.nome_membro, l.titulo FROM emprestimos emp 
JOIN membros memb ON emp.id_emp_membro_fk = memb.id_membro 
JOIN livros l ON l.id_livro = emp.id_emp_livro_fk
WHERE YEAR (emp.dt_emprestimo) = YEAR(CURRENT_DATE) #filtra os registro da data de emprestimos de acordo com o ano atual do sistema
ORDER BY memb.nome_membro;
#3) Listar o nome da categoria e o título do livro de todos os livros cadastrados na base.
SELECT cat.classificacao, l.titulo FROM livros l JOIN categorias cat ON l.id_categoria_fk = cat.id_categoria;
#4) Listar o título do livro, a data de empréstimo e a data da devolução real de todos os livros da base.
SELECT l.titulo, emp.dt_emprestimo, emp.dt_devolucao_real FROM emprestimos emp 
JOIN livros l ON emp.id_emp_livro_fk = l.id_livro ORDER BY l.titulo;
#5) Listar a data de empréstimo, data da devolução real, nome do membro que emprestou, título do livro, 
# nome da categoria e nome do autor (ou autores) de todos os empréstimos realizados.
SELECT emp.dt_emprestimo, emp.dt_devolucao_real, memb.nome_membro, l.titulo, cat.classificacao, a.nome_autor FROM emprestimos emp 
JOIN membros memb ON emp.id_emp_membro_fk = memb.id_membro
JOIN livros l ON emp.id_emp_livro_fk = l.id_livro
JOIN categorias cat ON l.id_categoria_fk = cat.id_categoria
JOIN autores a ON l.id_autor_fk = a.id_autor
ORDER BY emp.dt_emprestimo;
#6) Contar quantos livros estão cadastrados na base.
SELECT COUNT(id_livro) AS livros_cadastrados FROM livros;
#7) Contar quantos empréstimos foram feitos no ano passado.
SELECT COUNT(dt_emprestimo) AS emp_ano_passado FROM emprestimos WHERE YEAR (dt_emprestimo) = YEAR(CURRENT_DATE)-1; #retorna o ano atual e o 
subtrai por 1, gerando como resultado o ano passado
#8) Listar o nome da categoria e a quantidade de livros por categoria.
SELECT cat.classificacao, COUNT(l.id_livro) AS quant_categoria FROM categorias cat
LEFT JOIN livros l ON l.id_categoria_fk = cat.id_categoria
GROUP BY cat.classificacao;
#9) Listar o título do livro e o nome do membro de todos os livros emprestados na semana corrente, agrupados e ordenados por data de 
empréstimo.
SELECT l.titulo, memb.nome_membro, emp.dt_emprestimo FROM emprestimos emp 
JOIN membros memb ON emp.id_emp_membro_fk = memb.id_membro
JOIN livros l ON emp.id_emp_livro_fk = l.id_livro
WHERE emp.dt_emprestimo >= CURRENT_DATE - INTERVAL 7 DAY 
ORDER BY emp.dt_emprestimo;
#CURRENT_DATE retorna a data atual do sistema
#INTERVAL 7 DAY manipula a data para o intervalo de 7 dias
#10) Listar o total de livros emprestados no ano atual, agrupados e ordenados cronologicamente por mês, sendo que o nome do mês deve ser 
apresentado por extenso.
SET lc_time_names = 'pt_BR'; #formata as datas e horas para o idioma português Brasil
SELECT COUNT(emp.id_emp_livro_fk) AS quant_livros_emp, DATE_FORMAT(emp.dt_emprestimo, '%M') AS mes_emprestimo FROM emprestimos emp
JOIN livros l ON l.id_livro = emp.id_emp_livro_fk 
GROUP BY mes_emprestimo, MONTH(emp.dt_emprestimo) #Agrupa o resultado da variável mes_emprestimo com o número extraido pela função MOUTH() da 
coluna dt_emprestimo 
ORDER BY MONTH (emp.dt_emprestimo); #Ordena os resultados da consulta em ordem crescente com base no número extraído do mês  
#DATE_FORMAT formata a coluna apresentada para nome completo do mês -> Argumento 1: nome da coluna, Argumento 2: formato da saída  
#MOUTH extrai o número do mês a partir de uma data
#Excluindo tabelas do Banco de Dados
DROP TABLE emprestimos;
DROP TABLE livros;
DROP TABLE categorias;
DROP TABLE autores;
DROP TABLE enderecos;
DROP TABLE membros;
DROP DATABASE biblioteca; #Excluindo o Banco de Dados
