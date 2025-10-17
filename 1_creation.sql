CREATE TABLE Formation (
    id_formation VARCHAR(50) PRIMARY KEY,
    nom_formation VARCHAR(50) NOT NULL,
    type_formation VARCHAR(50),
    niveau_formation VARCHAR(50),
    duree_formation INT CHECK (duree_formation >= 0),
    domaine_etudes VARCHAR(50),
    specialisation VARCHAR(50),
    conditions_admission VARCHAR(255),
    modalite_admission VARCHAR(255),
    description_formation VARCHAR(1000)
);

CREATE TABLE Matiere (
    id_matiere VARCHAR(50) PRIMARY KEY,
    nom_matiere VARCHAR(100) NOT NULL,
    domaine_matiere VARCHAR(50)
);

CREATE TABLE Metier (
    id_metier VARCHAR(50) PRIMARY KEY,
    nom_metier VARCHAR(100) NOT NULL,
    secteur_activite VARCHAR(100),
    salaire_moyen INT CHECK (salaire_moyen >= 0),
    perspectives_emploi VARCHAR(255),
    formation_complementaire VARCHAR(255)
);

CREATE TABLE Etablissement (
    id_etablissement VARCHAR(50) PRIMARY KEY,
    nom_etablissement VARCHAR(200) NOT NULL,
    type_etablissement VARCHAR(100),
    statut_etablissement VARCHAR(100),
    site_web VARCHAR(255),
    parent_etablissement_id VARCHAR(50),
    CONSTRAINT fk_etablissement_parent
      FOREIGN KEY (parent_etablissement_id) REFERENCES Etablissement(id_etablissement) ON DELETE SET NULL
);

CREATE TABLE Contact (
    id_contact INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    numero VARCHAR(50),
    CHECK (email REGEXP '^[^@]+@[^@]+\\.[^@]+$')
);


CREATE TABLE Adresse (
    id_adresse VARCHAR(50) PRIMARY KEY,
    num_rue_etablissement INT CHECK (num_rue_etablissement >= 0),
    rue_etablissement VARCHAR(200),
    ville_etablissement VARCHAR(100),
    code_postal INT CHECK (code_postal >= 0),
    id_etablissement VARCHAR(50) NOT NULL,
    CONSTRAINT fk_adresse_etablissement
      FOREIGN KEY (id_etablissement) REFERENCES Etablissement(id_etablissement) ON DELETE CASCADE
);

CREATE TABLE Propose (
    id_formation VARCHAR(50) NOT NULL,
    id_etablissement VARCHAR(50) NOT NULL,
    frais_scolarite INT CHECK (frais_scolarite >= 0),
    nb_places_disponibles INT CHECK (nb_places_disponibles >= 0),
    date_limite_candidature DATE,
    taux_reussite INT CHECK (taux_reussite BETWEEN 0 AND 100),
    taux_insertion INT CHECK (taux_insertion BETWEEN 0 AND 100),
    frais_inscription_concours INT CHECK (frais_inscription_concours >= 0),
    PRIMARY KEY (id_formation, id_etablissement),
    CONSTRAINT fk_propose_formation FOREIGN KEY (id_formation) REFERENCES Formation(id_formation) ON DELETE CASCADE,
    CONSTRAINT fk_propose_etablissement FOREIGN KEY (id_etablissement) REFERENCES Etablissement(id_etablissement) ON DELETE CASCADE
);

CREATE TABLE Enseigne (
    id_formation VARCHAR(50) NOT NULL,
    id_matiere VARCHAR(50) NOT NULL,
    coefficient_matiere INT CHECK (coefficient_matiere >= 0),
    volume_horaire INT CHECK (volume_horaire >= 0),
    matiere_obligatoire BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (id_formation, id_matiere),
    CONSTRAINT fk_enseigne_formation FOREIGN KEY (id_formation) REFERENCES Formation(id_formation) ON DELETE CASCADE,
    CONSTRAINT fk_enseigne_matiere FOREIGN KEY (id_matiere) REFERENCES Matiere(id_matiere) ON DELETE CASCADE
);

CREATE TABLE Debouche_sur (
    id_formation VARCHAR(50) NOT NULL,
    id_metier VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_formation, id_metier),
    CONSTRAINT fk_debouche_formation FOREIGN KEY (id_formation) REFERENCES Formation(id_formation) ON DELETE CASCADE,
    CONSTRAINT fk_debouche_metier FOREIGN KEY (id_metier) REFERENCES Metier(id_metier) ON DELETE CASCADE
);

CREATE TABLE Appartenir (
    id_etablissement VARCHAR(50) NOT NULL,
    id_contact INT NOT NULL,
    role_contact VARCHAR(100), 
    PRIMARY KEY (id_etablissement, id_contact),
    CONSTRAINT fk_appartenir_etablissement FOREIGN KEY (id_etablissement) REFERENCES Etablissement(id_etablissement) ON DELETE CASCADE,
    CONSTRAINT fk_appartenir_contact FOREIGN KEY (id_contact) REFERENCES Contact(id_contact) ON DELETE CASCADE
);
