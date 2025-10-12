-- =====================
-- Insertion dans Formation
-- =====================
INSERT INTO Formation (id_formation, nom_formation, type_formation, niveau_formation, duree_formation, domaine_etudes, specialisation, conditions_admission, modalite_admission, description_formation) VALUES
('F001', 'Informatique - CS101', 'Licence', 'Bachelor', 36, 'Informatique', 'Développement logiciel', 'Bac', 'Concours', 'Formation centrée sur le développement logiciel.'),
('F002', 'Mathématiques - MATH201', 'Licence', 'Bachelor', 36, 'Mathématiques', 'Statistiques', 'Bac', 'Dossier', 'Formation en mathématiques appliquées.'),
('F003', 'Physique - PHY101', 'Licence', 'Bachelor', 36, 'Physique', 'Mécanique', 'Bac', 'Concours', 'Formation généraliste en physique.'),
('F004', 'Chimie - CHM101', 'Licence', 'Bachelor', 36, 'Chimie', 'Chimie organique', 'Bac', 'Dossier', 'Introduction à la chimie organique.'),
('F005', 'Économie - ECO101', 'Licence', 'Bachelor', 36, 'Économie', 'Finance', 'Bac', 'Concours', 'Introduction aux fondamentaux de l’économie.'),
('F006', 'Droit - LAW101', 'Licence', 'Bachelor', 36, 'Droit', 'Droit public', 'Bac', 'Dossier', 'Formation en droit public.'),
('F007', 'Biologie - BIO101', 'Licence', 'Bachelor', 36, 'Biologie', 'Biotechnologie', 'Bac', 'Concours', 'Formation en biotechnologie.'),
('F008', 'Informatique - CS201', 'Master', 'Master', 24, 'Informatique', 'Intelligence artificielle', 'Licence', 'Concours', 'Approfondissement en IA.'),
('F009', 'Mathématiques - MATH301', 'Master', 'Master', 24, 'Mathématiques', 'Analyse avancée', 'Licence', 'Dossier', 'Formation avancée en analyse.'),
('F010', 'Physique - PHY201', 'Master', 'Master', 24, 'Physique', 'Physique théorique', 'Licence', 'Concours', 'Formation en physique théorique.');

-- =====================
-- Insertion dans Matière
-- =====================
INSERT INTO Matiere (id_matiere, nom_matiere, domaine_matiere) VALUES
('M001', 'Programmation - CS01', 'Informatique'),
('M002', 'Algorithmes - CS02', 'Informatique'),
('M003', 'Structures de données - CS03', 'Informatique'),
('M004', 'Statistiques - MATH01', 'Mathématiques'),
('M005', 'Algèbre - MATH02', 'Mathématiques'),
('M006', 'Calcul différentiel - MATH03', 'Mathématiques'),
('M007', 'Mécanique classique - PHY01', 'Physique'),
('M008', 'Électromagnétisme - PHY02', 'Physique'),
('M009', 'Physique quantique - PHY03', 'Physique'),
('M010', 'Chimie organique - CHM01', 'Chimie'),
('M011', 'Chimie analytique - CHM02', 'Chimie'),
('M012', 'Microéconomie - ECO01', 'Économie'),
('M013', 'Macroéconomie - ECO02', 'Économie'),
('M014', 'Finance - ECO03', 'Économie'),
('M015', 'Droit constitutionnel - LAW01', 'Droit'),
('M016', 'Droit civil - LAW02', 'Droit'),
('M017', 'Biologie cellulaire - BIO01', 'Biologie'),
('M018', 'Génétique - BIO02', 'Biologie'),
('M019', 'Intelligence artificielle - CS04', 'Informatique'),
('M020', 'Apprentissage automatique - CS05', 'Informatique');

-- =====================
-- Insertion dans Metier
-- =====================
INSERT INTO Metier (id_metier, nom_metier, secteur_activite, salaire_moyen, perspectives_emploi, formation_complementaire) VALUES
('MT001', 'Développeur logiciel', 'Informatique', 45000, 'Bonne', 'Master CS'),
('MT002', 'Data Scientist', 'Informatique', 55000, 'Très bonne', 'Master CS/Math'),
('MT003', 'Ingénieur Physicien', 'Recherche', 50000, 'Bonne', 'Master Physique'),
('MT004', 'Chimiste', 'Industrie', 40000, 'Moyenne', 'Master Chimie'),
('MT005', 'Économiste', 'Finance', 42000, 'Bonne', 'Master Économie'),
('MT006', 'Juriste', 'Droit', 38000, 'Moyenne', 'Master Droit'),
('MT007', 'Biologiste', 'Recherche', 39000, 'Bonne', 'Master Biologie'),
('MT008', 'Ingénieur IA', 'Informatique', 60000, 'Très bonne', 'Master IA'),
('MT009', 'Statisticien', 'Mathématiques', 43000, 'Bonne', 'Master Math'),
('MT010', 'Consultant Finance', 'Finance', 45000, 'Bonne', 'Master Économie'),
('MT011', 'Analyste Quantitatif', 'Finance', 55000, 'Très bonne', 'Master Math/Finance'),
('MT012', 'Avocat', 'Droit', 50000, 'Bonne', 'Master Droit'),
('MT013', 'Chercheur Biotech', 'Biotechnologie', 47000, 'Bonne', 'Master Biologie'),
('MT014', 'Enseignant Math', 'Éducation', 35000, 'Moyenne', 'Master Math'),
('MT015', 'Professeur Informatique', 'Éducation', 36000, 'Moyenne', 'Master CS');


-- =====================
-- Insertion dans Etablissement
-- =====================
INSERT INTO Etablissement (id_etablissement, nom_etablissement, type_etablissement, statut_etablissement, site_web) VALUES
('E001', 'Université Paris', 'Université', 'Public', 'https://www.universite-paris.fr'),
('E002', 'École Polytechnique', 'Grande école', 'Public', 'https://www.polytechnique.fr'),
('E003', 'Université Lyon', 'Université', 'Public', 'https://www.universite-lyon.fr'),
('E004', 'École Centrale', 'Grande école', 'Public', 'https://www.ecentrale.fr'),
('E005', 'Université Bordeaux', 'Université', 'Public', 'https://www.universite-bordeaux.fr');


-- =====================
-- Insertion dans Contact
-- =====================
INSERT INTO Contact (id_contact, email, numero) VALUES
(1, 'alice.dupont@mail.fr', 0601020304),
(2, 'ahmed.karim@mail.fr', 0611121314),
(3, 'li.mei@mail.fr', 0622233445),
(4, 'josephine.martin@mail.fr', 0633344556),
(5, 'samuel.nguyen@mail.fr', 0644455667),
(6, 'emma.ramos@mail.fr', 0655566778),
(7, 'lucas.dubois@mail.fr', 0666677889),
(8, 'fatima.ali@mail.fr', 0677788990),
(9, 'youssef.ben@mail.fr', 0688899001),
(10, 'sophie.leclerc@mail.fr', 0699900112);

-- =====================
-- Insertion dans Adresse
-- =====================
INSERT INTO Adresse (id_adresse, num_rue_etablissement, rue_etablissement, ville_etablissement, code_postal, id_etablissement) VALUES
('A001', 1, 'Rue de la Paix', 'Paris', 75001, 'E001'),
('A002', 10, 'Avenue des Sciences', 'Palaiseau', 91120, 'E002'),
('A003', 5, 'Boulevard Lyonnais', 'Lyon', 69001, 'E003'),
('A004', 7, 'Rue Centrale', 'Châtenay', 92290, 'E004'),
('A005', 12, 'Rue Bordeaux', 'Bordeaux', 33000, 'E005');

-- =====================
-- Insertion dans Propose
-- =====================
INSERT INTO Propose (id_formation, id_etablissement, frais_scolarite, nb_places_disponibles, date_limite_candidature, taux_reussite, taux_insertion, frais_inscription_concours) VALUES
('F001','E001',5000,100,'2025-06-30',85,90,200),
('F002','E001',4500,80,'2025-06-15',80,85,150),
('F003','E002',4800,90,'2025-07-01',78,88,180),
('F004','E002',4700,70,'2025-07-10',75,80,160),
('F005','E003',4000,120,'2025-06-20',82,86,140),
('F006','E003',4200,110,'2025-07-05',79,84,150),
('F007','E004',5000,100,'2025-06-25',83,87,200),
('F008','E004',5200,60,'2025-07-15',88,92,250),
('F009','E005',5100,70,'2025-06-30',84,89,220),
('F010','E005',5300,50,'2025-07-20',86,90,230),
('F001','E002',5500,40,'2025-06-30',80,85,210),
('F002','E003',4600,60,'2025-06-15',78,82,170),
('F003','E004',4900,30,'2025-07-01',77,83,180),
('F004','E005',4700,20,'2025-07-10',76,81,160),
('F005','E001',4200,50,'2025-06-20',79,84,150),
('F006','E002',4300,45,'2025-07-05',81,86,160),
('F007','E003',5000,35,'2025-06-25',82,87,200),
('F008','E005',5200,25,'2025-07-15',85,90,240),
('F009','E001',5100,40,'2025-06-30',83,88,220),
('F010','E002',5300,30,'2025-07-20',86,91,230);

-- =====================
-- Insertion dans Enseigne
-- =====================
INSERT INTO Enseigne (id_formation, id_matiere, coefficient_matiere, volume_horaire, matiere_obligatoire) VALUES
('F001','M001',4,60,1),
('F001','M002',3,45,1),
('F001','M003',2,30,1),
('F001','M019',5,70,1),
('F001','M020',4,50,0),
('F002','M004',4,60,1),
('F002','M005',3,50,1),
('F002','M006',3,40,1),
('F003','M007',4,60,1),
('F003','M008',3,50,1),
('F003','M009',5,70,0),
('F004','M010',4,60,1),
('F004','M011',3,40,1),
('F005','M012',3,40,1),
('F005','M013',4,50,1),
('F005','M014',5,60,0),
('F006','M015',4,60,1),
('F006','M016',3,50,1),
('F007','M017',4,60,1),
('F007','M018',3,50,1),
('F008','M001',5,80,1),
('F008','M002',4,60,1),
('F008','M019',5,70,1),
('F008','M020',4,60,1),
('F009','M004',4,60,1),
('F009','M005',3,50,1),
('F009','M006',4,60,0),
('F010','M007',4,60,1),
('F010','M008',3,50,1),
('F010','M009',5,70,1),
('F010','M010',3,40,0);


-- =====================
-- Insertion dans Debouche_sur
-- =====================
INSERT INTO Debouche_sur (id_formation, id_metier) VALUES
('F001','MT001'),
('F001','MT002'),
('F001','MT015'),
('F002','MT009'),
('F002','MT014'),
('F003','MT003'),
('F003','MT015'),
('F004','MT004'),
('F005','MT005'),
('F005','MT010'),
('F006','MT006'),
('F006','MT012'),
('F007','MT007'),
('F007','MT013'),
('F008','MT008'),
('F008','MT002'),
('F009','MT009'),
('F009','MT011'),
('F010','MT003'),
('F010','MT012');


-- =====================
-- Insertion dans Appartenir
-- =====================
INSERT INTO Appartenir (id_etablissement, id_contact) VALUES
('E001', 1),
('E001', 2),
('E002', 3),
('E002', 4),
('E003', 5),
('E003', 6),
('E004', 7),
('E004', 8),
('E005', 9),
('E005', 10);
