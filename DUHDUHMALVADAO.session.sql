-- Tabela Estudante
CREATE TABLE Estudante (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ENDERECO_ID INT, -- Referência ao ID do endereço
    CPF VARCHAR(11) UNIQUE,
    TELEFONES VARCHAR(255),
    FOTO VARCHAR(300),
    RA VARCHAR(50),
    RM VARCHAR(50),
    NOME VARCHAR(255),
    DATANASCIMENTO DATE,
    SENHA VARCHAR(255),
    GENERO VARCHAR(10),
    FOREIGN KEY (ENDERECO_ID) REFERENCES Endereco(ID)
);

-- Tabela Professor
CREATE TABLE Professor (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ENDERECO_ID INT, -- Referência ao ID do endereço
    CPF VARCHAR(11) UNIQUE,
    TELEFONES VARCHAR(255),
    FOTO BLOB,
    RA VARCHAR(10),
    RM VARCHAR(10),
    NOME VARCHAR(255),
    GENERO VARCHAR(10),
    DATANASCIMENTO DATE,
    SENHA VARCHAR(255),
    FOREIGN KEY (ENDERECO_ID) REFERENCES Endereco(ID)
);

-- Tabela Curso
CREATE TABLE Curso (
    SIGLA VARCHAR(10) PRIMARY KEY,
    NOME VARCHAR(255),
    CARGA_HORARIA INT,
    COORDENADOR INT, -- Referência ao ID do Professor que é o coordenador do curso
    FOREIGN KEY (COORDENADOR) REFERENCES Professor(ID)
);

-- Tabela Disciplina
CREATE TABLE Disciplina (
    CODIGO INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(255),
    SIGLA VARCHAR(10),
    PROFESSOR INT, -- Referência ao ID do Professor que ministra a disciplina
    CARGA_HORARIA INT,
    CURSO_SIGLA VARCHAR(10), -- Referência à SIGLA do Curso ao qual a disciplina pertence
    FOREIGN KEY (PROFESSOR) REFERENCES Professor(ID),
    FOREIGN KEY (CURSO_SIGLA) REFERENCES Curso(SIGLA)
);

-- Tabela Turma
CREATE TABLE Turma (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(255),
    CURSO_SIGLA VARCHAR(10), -- Referência à SIGLA do Curso da Turma
    PROFESSOR INT, -- Referência ao ID do Professor responsável pela Turma
    ALUNOS VARCHAR(255), -- Lista de IDs de alunos na turma (pode ser uma string JSON, por exemplo)
    FOREIGN KEY (CURSO_SIGLA) REFERENCES Curso(SIGLA),
    FOREIGN KEY (PROFESSOR) REFERENCES Professor(ID)
);

-- Tabela Matricula
CREATE TABLE Matricula (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ALUNO INT, -- Referência ao ID do aluno
    DISCIPLINA INT, -- Referência ao CODIGO da disciplina
    NOTA_ATIVIDADE DECIMAL(5, 2),
    MEDIA_BIMESTRAL DECIMAL(5, 2),
    PRESENCA INT, -- 0 para ausente, 1 para presente
    FALTAS INT,
    FOREIGN KEY (ALUNO) REFERENCES Estudante(ID),
    FOREIGN KEY (DISCIPLINA) REFERENCES Disciplina(CODIGO)
);

-- Tabela Agenda
CREATE TABLE Agenda (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    TITULO VARCHAR(255),
    DESCRICAO TEXT,
    DATA_HORA DATETIME,
    TIPO VARCHAR(20),
    ALUNO INT, -- Referência ao ID do aluno (se aplicável)
    PROFESSOR INT, -- Referência ao ID do professor (se aplicável)
    FOREIGN KEY (ALUNO) REFERENCES Estudante(ID),
    FOREIGN KEY (PROFESSOR) REFERENCES Professor(ID)
);

-- Tabela Noticias
CREATE TABLE Noticias (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    TITULO VARCHAR(255),
    CONTEUDO TEXT,
    DATA_PUBLICACAO DATETIME,
    AUTOR INT, -- Referência ao ID do Professor que publicou a notícia
    FOREIGN KEY (AUTOR) REFERENCES Professor(ID)
);

-- Tabela Atividades
CREATE TABLE Atividades (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    DESCRICAO TEXT,
    DATA_ENTREGA DATE,
    DISCIPLINA INT, -- Referência ao CODIGO da disciplina
    FOREIGN KEY (DISCIPLINA) REFERENCES Disciplina(CODIGO)
);

-- Tabela Presenca
CREATE TABLE Presenca (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    DATA_AULA DATE,
    DISCIPLINA INT, -- Referência ao CODIGO da disciplina
    ALUNO INT, -- Referência ao ID do aluno
    PRESENTE BOOLEAN,
    FOREIGN KEY (DISCIPLINA) REFERENCES Disciplina(CODIGO),
    FOREIGN KEY (ALUNO) REFERENCES Estudante(ID)
);
