-- Tabela Endereco
CREATE TABLE Endereco (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    RUA VARCHAR(255),
    NUMERO INT,
    BAIRRO VARCHAR(255),
    CIDADE VARCHAR(255),
    ESTADO VARCHAR(255),
    CEP VARCHAR(10)
) Engine=InnoDB;

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
)Engine=InnoDB;

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
)Engine=InnoDB;

-- Tabela Curso
CREATE TABLE Curso (
    SIGLA VARCHAR(10) PRIMARY KEY,
    NOME VARCHAR(255),
    CARGA_HORARIA INT,
    COORDENADOR INT, -- Referência ao ID do Professor que é o coordenador do curso
    FOREIGN KEY (COORDENADOR) REFERENCES Professor(ID)
)Engine=InnoDB;

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
)Engine=InnoDB;

-- Tabela Turma
CREATE TABLE Turma (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(255),
    CURSO_SIGLA VARCHAR(10), -- Referência à SIGLA do Curso da Turma
    PROFESSOR INT, -- Referência ao ID do Professor responsável pela Turma
    ALUNOS VARCHAR(255), -- Lista de IDs de alunos na turma (pode ser uma string JSON, por exemplo)
    FOREIGN KEY (CURSO_SIGLA) REFERENCES Curso(SIGLA),
    FOREIGN KEY (PROFESSOR) REFERENCES Professor(ID)
)Engine=InnoDB;

-- Tabela Disciplina-Media
CREATE TABLE DisciplinaAluno (
    DISCIPLINA_CODIGO INT,
    ESTUDANTE_ID INT,
    FALTAS INT,
    BIMESTRE INT,
    MEDIA VARCHAR(2),
    FOREIGN KEY (ESTUDANTE_ID) REFERENCES Estudante(ID),
    FOREIGN KEY (DISCIPLINA_CODIGO) REFERENCES Disciplina(Codigo)
)ENGINE=InnoDB;

-- Tabela Matricula
CREATE TABLE Matricula (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ALUNO INT, -- Referência ao ID do aluno
    CURSO_SIGLA VARCHAR(10), -- Referência ao CODIGO da disciplina
    FALTAS_TOTAIS INT,
    FOREIGN KEY (ALUNO) REFERENCES Estudante(ID),
    FOREIGN KEY (CURSO_SIGLA) REFERENCES Curso(SIGLA)
)Engine=InnoDB;

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
)Engine=InnoDB;

-- Tabela Noticias
CREATE TABLE Noticias (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    TITULO VARCHAR(255),
    CONTEUDO TEXT,
    DATA_PUBLICACAO DATETIME,
    AUTOR INT, -- Referência ao ID do Professor que publicou a notícia
    FOREIGN KEY (AUTOR) REFERENCES Professor(ID)
)Engine=InnoDB;

-- Tabela Atividades
CREATE TABLE Atividades (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    DESCRICAO TEXT,
    DATA_ENTREGA DATE,
    DATA_INICIO DATE,
    DISCIPLINA INT, -- Referência ao CODIGO da disciplina
    FOREIGN KEY (DISCIPLINA) REFERENCES Disciplina(CODIGO)
)Engine=InnoDB;

CREATE TABLE Atividade_Aluno (
    ALUNO_ID INT,
    ATIVIDADE_ID INT,
    NOTA VARCHAR(2),
    FOREIGN KEY (ALUNO_ID) REFERENCES ESTUDANTE(ID),
    FOREIGN KEY (ATIVIDADE_ID) REFERENCES ATIVIDADES(ID)
)ENGINE=InnoDB;

-- Tabela Presenca
CREATE TABLE Presenca (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    DATA_AULA DATE,
    DISCIPLINA INT, -- Referência ao CODIGO da disciplina
    ALUNO INT, -- Referência ao ID do aluno
    PRESENTE BOOLEAN,
    FOREIGN KEY (DISCIPLINA) REFERENCES Disciplina(CODIGO),
    FOREIGN KEY (ALUNO) REFERENCES Estudante(ID)
)Engine=InnoDB;