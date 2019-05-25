-- File generated with SQLiteStudio v3.2.1 on dom abr 14 23:30:59 2019
--
-- Text encoding used: Shift_JIS
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Aderecos
DROP TABLE IF EXISTS Aderecos;

CREATE TABLE Aderecos (
    serialNumber      INTEGER PRIMARY KEY
                              NOT NULL,
    fornecedor        TEXT,
    NomeDeAderec      TEXT    NOT NULL,
    ActivityServiceID INTEGER REFERENCES Atividades (ActivityServiceID) 
);


-- Table: Atividades
DROP TABLE IF EXISTS Atividades;

CREATE TABLE Atividades (
    ActivityServiceID INTEGER REFERENCES Servicos (ServiceID) 
                            PRIMARY KEY
                            NOT NULL
);


-- Table: Bilhetes
DROP TABLE IF EXISTS Bilhetes;

CREATE TABLE Bilhetes (
    ClientId   INTEGER REFERENCES Clientes (IDpessoa) 
                       UNIQUE,
    Nbilhete   INTEGER UNIQUE
                       NOT NULL
                       PRIMARY KEY,
    TypeName   TEXT    REFERENCES TipoDeBilhete (TypeName),
    DataInicio DATE,
    DataFim    DATE,
    Preco      DOUBLE
);


-- Table: Carrosseis
DROP TABLE IF EXISTS Carrosseis;

CREATE TABLE Carrosseis (
    CarrousselServiceID INTEGER PRIMARY KEY
                                REFERENCES Atividades (ActivityServiceID) 
                                NOT NULL,
    DataProxManutencao  DATE
);


-- Table: Clientes
DROP TABLE IF EXISTS Clientes;

CREATE TABLE Clientes (
    IDpessoa INTEGER REFERENCES Pessoas (ID) 
                     PRIMARY KEY
                     NOT NULL,
    Altura   REAL    NOT NULL,
    Idade    INTEGER
);


-- Table: Departamentos
DROP TABLE IF EXISTS Departamentos;

CREATE TABLE Departamentos (
    Nome           TEXT    PRIMARY KEY
                           UNIQUE
                           NOT NULL,
    StoreServiceID INTEGER REFERENCES Lojas (StoreServiceID) 
                           NOT NULL,
    Funcao         TEXT
);


-- Table: Epocas
DROP TABLE IF EXISTS Epocas;

CREATE TABLE Epocas (
    NomeDeEpoca TEXT PRIMARY KEY
                     NOT NULL
                     UNIQUE,
    DataInicio  INT  NOT NULL,
    DataFim     INT  NOT NULL
);


-- Table: Especialidades
DROP TABLE IF EXISTS Especialidades;

CREATE TABLE Especialidades (
    NomeEspecialidade TEXT    PRIMARY KEY
                              NOT NULL,
    SalarioBase       DECIMAL,
    ExtraHora         DECIMAL
);


-- Table: Eventos
DROP TABLE IF EXISTS Eventos;

CREATE TABLE Eventos (
    EventServiceID INTEGER PRIMARY KEY
                           REFERENCES Atividades (ActivityServiceID) 
                           NOT NULL,
    DataDeEvento   DATE,
    Duracao        TIME
);


-- Table: FuncionarioDeServico
DROP TABLE IF EXISTS FuncionarioDeServico;

CREATE TABLE FuncionarioDeServico (
    ServiceID        INTEGER REFERENCES Servicos (ServiceID) 
                             NOT NULL,
    IDfuncionario    INTEGER NOT NULL
                             REFERENCES Funcionarios (IDpessoa),
    Func_Internal_ID INTEGER NOT NULL,
    PRIMARY KEY (
        ServiceID,
        IDfuncionario
    ),
    UNIQUE (Func_Internal_ID, ServiceID)

);


-- Table: Funcionarios
DROP TABLE IF EXISTS Funcionarios;

CREATE TABLE Funcionarios (
    IDpessoa          INTEGER PRIMARY KEY REFERENCES Pessoas (ID) 
                              NOT NULL,
    NomeEspecialidade TEXT    REFERENCES Especialidades (NomeEspecialidade) 
                              NOT NULL,
    NIB               INTEGER UNIQUE
);


-- Table: Hierarquias
DROP TABLE IF EXISTS Hierarquias;

CREATE TABLE Hierarquias (
    Subordinado  PRIMARY KEY
                 REFERENCES Funcionarios (IDpessoa) 
                 NOT NULL,
    Chefe        REFERENCES Funcionarios (IDpessoa) 
);


-- Table: Horarios
DROP TABLE IF EXISTS Horarios;

CREATE TABLE Horarios (
    IDhorario  INTEGER PRIMARY KEY,
    HoraInicio TIME,
    HoraFim    TIME,
    DiaSemana  TEXT
);


-- Table: HorariosTrabalho
DROP TABLE IF EXISTS HorariosTrabalho;

CREATE TABLE HorariosTrabalho (
    IDhorario     INTEGER REFERENCES Horarios (IDhorario),
    IDfuncionario INTEGER REFERENCES Funcionarios (IDpessoa) 
                          NOT NULL,
    PRIMARY KEY (
        IDhorario,
        IDfuncionario
    )
);


-- Table: Lojas
DROP TABLE IF EXISTS Lojas;

CREATE TABLE Lojas (
    StoreServiceID INTEGER PRIMARY KEY
                           REFERENCES Servicos (ServiceID) 
                           NOT NULL,
    Inventario     TEXT
);


-- Table: Mes
DROP TABLE IF EXISTS Mes;

CREATE TABLE Mes (
    IDmes             PRIMARY KEY
                      NOT NULL,
    NomeDeMes TEXT,
    Ano       INTEGER
);


-- Table: Pessoas
DROP TABLE IF EXISTS Pessoas;

CREATE TABLE Pessoas (
    ID               INTEGER NOT NULL
                             UNIQUE
                             PRIMARY KEY,
    Nome             TEXT    NOT NULL,
    DataDeNascimento DATE    NOT NULL,
    Genero           TEXT
);


-- Table: RegistoPagamentos
DROP TABLE IF EXISTS RegistoPagamentos;

CREATE TABLE RegistoPagamentos (
    IDmes      INTEGER REFERENCES Mes (IDmes) 
                       NOT NULL,
    ID         INTEGER REFERENCES Funcionarios (IDpessoa),
    HorasExtra INTEGER,
    Bonus      INTEGER,
    Salario    INTEGER,
    PRIMARY KEY (
        IDmes,
        ID
    )
);


-- Table: Restaurantes
DROP TABLE IF EXISTS Restaurantes;

CREATE TABLE Restaurantes (
    RestaurantServiceID INTEGER PRIMARY KEY
                                NOT NULL
                                REFERENCES Servicos (ServiceID),
    Menu                TEXT,
    Nmesas              INTEGER
);


-- Table: Servicos
DROP TABLE IF EXISTS Servicos;

CREATE TABLE Servicos (
    ServiceID     INTEGER PRIMARY KEY
                          NOT NULL
                          UNIQUE,
    NomeDeServico TEXT    NOT NULL
                          UNIQUE,
    IdadeMinima   INTEGER DEFAULT (0),
    AlturaMinima  DOUBLE  DEFAULT (0),
    Local         TEXT    NOT NULL,
    RatingMedio   DOUBLE
);


-- Table: ServicosEpocasHorarios
DROP TABLE IF EXISTS ServicosEpocasHorarios;

CREATE TABLE ServicosEpocasHorarios (
    ServiceID   INTEGER REFERENCES Servicos (ServiceID) 
                        NOT NULL,
    NomeDeEpoca TEXT    REFERENCES Epocas (NomeDeEpoca) 
                        NOT NULL,
    IDhorario   INTEGER REFERENCES Horarios (IDhorario) 
                        NOT NULL,
    PRIMARY KEY (
        ServiceID,
        NomeDeEpoca,
        IDhorario
    )
);


-- Table: TipoDeBilhete
DROP TABLE IF EXISTS TipoDeBilhete;

CREATE TABLE TipoDeBilhete (
    TypeName    TEXT    PRIMARY KEY
                        NOT NULL,
    PrecoDiario DECIMAL NOT NULL
);


-- Table: Visitas
DROP TABLE IF EXISTS Visitas;

CREATE TABLE Visitas (
    IDcliente    INTEGER REFERENCES Clientes (IDpessoa) 
                         NOT NULL,
    ServiceID    INTEGER NOT NULL
                         REFERENCES Servicos (ServiceID),
    DataDeRating DATE,
    Rating       DECIMAL,
    PRIMARY KEY (
        IDcliente,
        ServiceID
    )
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
