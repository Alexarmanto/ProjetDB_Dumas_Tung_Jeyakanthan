CREATE TABLE Formation(
   id_formation VARCHAR(50),
   nom_formation VARCHAR(50),
   type_formation VARCHAR(50),
   niveau_formation VARCHAR(50),
   duree_formation INT,
   domaine_etudes VARCHAR(50),
   specialisation VARCHAR(50),
   conditions_admission VARCHAR(50),
   modalite_admission VARCHAR(50),
   description_formation VARCHAR(50),
   PRIMARY KEY(id_formation)
);

CREATE TABLE Matière(
   id_matiere VARCHAR(50),
   nom_matiere VARCHAR(50),
   domaine_matiere VARCHAR(50),
   PRIMARY KEY(id_matiere)
);

CREATE TABLE Etablissement(
   id_etablissement VARCHAR(50),
   nom_etablissement VARCHAR(50),
   type_etablissement VARCHAR(50),
   statut_etablissement VARCHAR(50),
   site_web VARCHAR(50),
   id_etablissement_1 VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_etablissement),
   FOREIGN KEY(id_etablissement_1) REFERENCES Etablissement(id_etablissement)
);

CREATE TABLE Metier(
   id_metier VARCHAR(50),
   nom_matiere VARCHAR(50),
   secteur_activite VARCHAR(50),
   salaire_moyen INT,
   perspectives_emploi VARCHAR(50),
   formation_complementaire VARCHAR(50),
   PRIMARY KEY(id_metier)
);

CREATE TABLE Contact(
   id_contact INT,
   email VARCHAR(50),
   numero INT,
   PRIMARY KEY(id_contact)
);

CREATE TABLE Adresse(
   id_adresse VARCHAR(50),
   num_rue_etablissement INT,
   rue_etablissement VARCHAR(50),
   ville_etablissement VARCHAR(50),
   code_postal INT,
   id_etablissement VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_adresse),
   FOREIGN KEY(id_etablissement) REFERENCES Etablissement(id_etablissement)
);

CREATE TABLE Propose(
   id_formation VARCHAR(50),
   id_etablissement VARCHAR(50),
   frais_scolarite INT,
   nb_places_disponibles INT,
   date_limite_candidature DATE,
   taux_reussite INT,
   taux_insertion INT,
   frais_inscription_concours INT,
   PRIMARY KEY(id_formation, id_etablissement),
   FOREIGN KEY(id_formation) REFERENCES Formation(id_formation),
   FOREIGN KEY(id_etablissement) REFERENCES Etablissement(id_etablissement)
);

CREATE TABLE Enseigne(
   id_formation VARCHAR(50),
   id_matiere VARCHAR(50),
   coefficient_matiere INT,
   volume_horaire INT,
   matiere_obligatoire LOGICAL,
   PRIMARY KEY(id_formation, id_matiere),
   FOREIGN KEY(id_formation) REFERENCES Formation(id_formation),
   FOREIGN KEY(id_matiere) REFERENCES Matière(id_matiere)
);

CREATE TABLE Débouche_sur(
   id_formation VARCHAR(50),
   id_metier VARCHAR(50),
   PRIMARY KEY(id_formation, id_metier),
   FOREIGN KEY(id_formation) REFERENCES Formation(id_formation),
   FOREIGN KEY(id_metier) REFERENCES Metier(id_metier)
);

CREATE TABLE Appartenir(
   id_etablissement VARCHAR(50),
   id_contact INT,
   PRIMARY KEY(id_etablissement, id_contact),
   FOREIGN KEY(id_etablissement) REFERENCES Etablissement(id_etablissement),
   FOREIGN KEY(id_contact) REFERENCES Contact(id_contact)
);
