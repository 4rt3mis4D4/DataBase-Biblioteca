# 📚 Sistema de Biblioteca — SQL

## Visão Geral

Este projeto implementa um **banco de dados relacional para gerenciamento de uma biblioteca**, desenvolvido em SQL como atividade avaliativa. O script contempla desde a **criação do banco**, definição de **tabelas com integridade referencial**, **inserção de dados de exemplo**, até **consultas SQL** para extração de informações relevantes sobre livros, autores, membros e empréstimos.

O banco foi configurado com `utf8mb4`, garantindo compatibilidade com caracteres especiais e maior flexibilidade de internacionalização.

---

## 🗄️ Estrutura do Banco de Dados

**Nome do banco:** `biblioteca`

O modelo relacional é composto por **6 tabelas principais**, organizadas para refletir um cenário real de biblioteca.

### 📌 Tabelas

#### 👤 MEMBROS

Armazena informações dos usuários cadastrados na biblioteca.

* Identificador único
* Nome do membro
* Número de identificação
* E-mail

#### 🏠 ENDERECOS

Representa os endereços dos membros (relacionamento 1:N).

* Rua, bairro, número e CEP
* Chave estrangeira vinculada a `MEMBROS`
* Regras de cascata para atualização e exclusão

#### ✍️ AUTORES

Contém dados sobre autores das obras cadastradas.

* Nome do autor
* Gênero predominante das obras
* Quantidade de obras publicadas
* Nacionalidade

#### 🗂️ CATEGORIAS

Define a classificação e localização física dos livros.

* Classificação etária (Infantil, Juvenil, Adulto)
* Descrição do ambiente da categoria

#### 📖 LIVROS

Armazena informações detalhadas dos livros.

* Título, ano de publicação e editora
* Número de exemplares disponíveis
* Gênero literário (ENUM)
* Relacionamentos com `AUTORES` e `CATEGORIAS`

#### 🔄 EMPRESTIMOS

Controla os empréstimos realizados pelos membros.

* Datas de empréstimo, devolução prevista e devolução real
* Relacionamento com `LIVROS` e `MEMBROS`

---

## 🔗 Relacionamentos

* **MEMBROS 1:N ENDERECOS**
* **AUTORES 1:N LIVROS**
* **CATEGORIAS 1:N LIVROS**
* **MEMBROS 1:N EMPRESTIMOS**
* **LIVROS 1:N EMPRESTIMOS**

Todos os relacionamentos utilizam **FOREIGN KEY com `ON UPDATE CASCADE` e `ON DELETE CASCADE`**, garantindo integridade referencial.

---

## 🧪 Dados de Teste

O script insere:

* Múltiplos membros e endereços
* Uma base ampla de autores nacionais e internacionais
* Categorias organizadas por classificação etária
* 50 livros cadastrados
* Registros de empréstimos distribuídos em diferentes anos

Esses dados permitem testes realistas e consultas analíticas.

---

## 📊 Consultas Implementadas

O projeto inclui consultas SQL para:

1. Listar livros e seus respectivos autores
2. Consultar empréstimos realizados no ano atual
3. Relacionar livros às suas categorias
4. Exibir histórico de empréstimos e devoluções
5. Consolidar informações completas dos empréstimos
6. Contar livros cadastrados
7. Contar empréstimos do ano anterior
8. Quantificar livros por categoria
9. Listar empréstimos realizados na última semana
10. Agrupar empréstimos por mês (com nome do mês por extenso em pt-BR)

Essas consultas demonstram o uso de `JOIN`, `GROUP BY`, funções de data e ordenações.

---

## ▶️ Execução do Script

1. Execute o arquivo SQL em um SGBD compatível (ex: MySQL).
2. O script cria o banco, popula as tabelas e executa consultas.
3. Ao final, todas as tabelas e o banco são removidos, garantindo um ciclo completo de testes.

---

## 👩‍💻 Autora

**Gabriela Pedroso dos Santos Pontes**
Atividade avaliativa — Banco de Dados | SQL

---

> Projeto acadêmico com foco em modelagem relacional, integridade de dados e consultas SQL avançadas.

