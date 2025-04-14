CREATE TABLE FOURNISSEUR --
(
    ID  INT PRIMARY KEY AUTO_INCREMENT,
    NOM VARCHAR(20) NOT NULL
);

CREATE TABLE ARTICLE -- Création de la table Article
(
    ID          INT PRIMARY KEY AUTO_INCREMENT, -- ID clé primaire auto incrémenté
    REF         VARCHAR(20) NOT NULL UNIQUE,
    DESIGNATION VARCHAR(50) NOT NULL,
    PRIX        DECIMAL     NOT NULL,
    ID_FOU      INT         NOT NULL,

    --  Si Fournisseur supprimé ou modifié..
    FOREIGN KEY (ID_FOU) REFERENCES FOURNISSEUR (ID)
        ON DELETE RESTRICT                      -- On empêche la suppression dun fournisseur pour eviter les tables orphelines
        ON UPDATE CASCADE                       -- Si on modifie lid dun fournisseur, elle sera modifier dans ses articles "enfants"
);

CREATE TABLE BON -- Création de la table Bon
(
    ID        INT AUTO_INCREMENT PRIMARY KEY,
    NUMERO    VARCHAR(50) NOT NULL UNIQUE,
    DATE_CMDE DATE        NOT NULL,
    DELAI     INT,
    ID_FOU    INT         NOT NULL,

    FOREIGN KEY (ID_FOU) REFERENCES FOURNISSEUR (ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE COMPO -- Création de la table Compo
(
    ID     INT AUTO_INCREMENT PRIMARY KEY,
    QTE    INT NOT NULL,
    ID_ART INT NOT NULL,
    ID_BON INT NOT NULL,

    --  Relation avec un article
    FOREIGN KEY (ID_ART) REFERENCES ARTICLE (ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    --  Relation avec un bon
    FOREIGN KEY (ID_BON) REFERENCES BON (ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    -- empêche denregistrer le même article dans le même bon
    UNIQUE (ID_ART, ID_BON)
);
