
ALTER TABLE Formation
ADD CONSTRAINT chk_formation_nom_non_vide CHECK (nom_formation IS NOT NULL AND TRIM(nom_formation) <> ''),
ADD CONSTRAINT chk_formation_duree_non_negative CHECK (duree_formation IS NULL OR duree_formation >= 0),
ADD CONSTRAINT chk_formation_description_longueur CHECK (description_formation IS NULL OR CHAR_LENGTH(description_formation) <= 2000);

ALTER TABLE Matière
ADD CONSTRAINT chk_matiere_nom_non_vide CHECK (nom_matiere IS NOT NULL AND TRIM(nom_matiere) <> ''),
ADD CONSTRAINT chk_matiere_format_intitule CHECK (nom_matiere REGEXP '^[^ -].+ - [A-Z0-9]{2,10}$');

ALTER TABLE Metier
ADD CONSTRAINT chk_metier_nom_non_vide CHECK (nom_metier IS NOT NULL AND TRIM(nom_metier) <> ''),
ADD CONSTRAINT chk_metier_salaire_non_negatif CHECK (salaire_moyen IS NULL OR salaire_moyen >= 0);

ALTER TABLE Contact
ADD CONSTRAINT chk_contact_email_format CHECK (email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+[.][A-Za-z]{2,}$'),
ADD CONSTRAINT chk_contact_numero_format CHECK (numero IS NULL OR numero REGEXP '^[0-9]{6,15}$');

ALTER TABLE Adresse
ADD CONSTRAINT chk_adresse_code_postal_fr CHECK (code_postal IS NULL OR code_postal REGEXP '^[0-9]{5}$'),
ADD CONSTRAINT chk_adresse_num_rue_non_negatif CHECK (num_rue_etablissement IS NULL OR num_rue_etablissement >= 0),
ADD CONSTRAINT chk_adresse_ville_non_vide CHECK (ville_etablissement IS NULL OR TRIM(ville_etablissement) <> '');

ALTER TABLE Etablissement
ADD CONSTRAINT chk_etablissement_site_web_format CHECK (site_web IS NULL OR site_web REGEXP '^(https?://)?[A-Za-z0-9.-]+\.[A-Za-z]{2,}(/.*)?$'),
ADD CONSTRAINT chk_etablissement_nom_non_vide CHECK (nom_etablissement IS NOT NULL AND TRIM(nom_etablissement) <> '');

ALTER TABLE Propose
ADD CONSTRAINT chk_propose_nb_places_non_negatif CHECK (nb_places_disponibles IS NULL OR nb_places_disponibles >= 0),
ADD CONSTRAINT chk_propose_taux_reussite_range CHECK (taux_reussite IS NULL OR (taux_reussite >= 0 AND taux_reussite <= 100)),
ADD CONSTRAINT chk_propose_taux_insertion_range CHECK (taux_insertion IS NULL OR (taux_insertion >= 0 AND taux_insertion <= 100)),
ADD CONSTRAINT chk_propose_frais_non_negatifs CHECK ((frais_scolarite IS NULL OR frais_scolarite >= 0) AND (frais_inscription_concours IS NULL OR frais_inscription_concours >= 0));

ALTER TABLE Enseigne
ADD CONSTRAINT chk_enseigne_coef_non_negatif CHECK (coefficient_matiere IS NULL OR coefficient_matiere >= 0),
ADD CONSTRAINT chk_enseigne_volume_non_negatif CHECK (volume_horaire IS NULL OR volume_horaire >= 0),
ADD CONSTRAINT chk_enseigne_matiere_obligatoire_bool CHECK (matiere_obligatoire IN (0,1));

ALTER TABLE Debouche_sur
ADD CONSTRAINT chk_debouche_ids_non_nuls CHECK (id_formation IS NOT NULL AND id_metier IS NOT NULL);

ALTER TABLE Appartenir
ADD CONSTRAINT chk_appartenir_role_non_vide CHECK (role_contact IS NULL OR TRIM(role_contact) <> '');

ALTER TABLE Formation
ADD CONSTRAINT chk_formation_duree_maximum CHECK (duree_formation IS NULL OR duree_formation <= 120);


