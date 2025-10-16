
-- 1. Lister les formations d’informatique, triées par durée
SELECT nom_formation, niveau_formation, duree_formation, domaine_etudes
FROM Formation
WHERE domaine_etudes = 'Informatique'
ORDER BY duree_formation ASC;

-- 2. Lister les établissements publics avec 'Université' dans le nom
SELECT nom_etablissement, statut_etablissement, site_web
FROM Etablissement
WHERE statut_etablissement = 'Public'
AND nom_etablissement LIKE '%Université%';

-- 3. Filtrer les formations avec une durée entre 24 et 36 mois
SELECT nom_formation, duree_formation, type_formation
FROM Formation
WHERE duree_formation BETWEEN 12 AND 48;

-- 4. Lister les métiers liés à certaines formations clés
SELECT DISTINCT m.nom_metier
FROM Metier m
JOIN Debouche_sur d ON m.id_metier = d.id_metier
WHERE d.id_formation IN ('F002', 'F009');

-- 5. Afficher les contacts pour des établissements spécifiques
SELECT e.nom_etablissement, c.email, c.numero
FROM Contact c
JOIN Appartenir a ON c.id_contact = a.id_contact
JOIN Etablissement e ON a.id_etablissement = e.id_etablissement
WHERE e.id_etablissement IN ('E001','E002');

-- 6. Moyenne du nombre de places disponibles par formation
SELECT id_formation, AVG(nb_places_disponibles) AS moyenne_places
FROM Propose
GROUP BY id_formation;

-- 7. Nombre de formations par domaine d’études
SELECT domaine_etudes, COUNT(*) AS nb_formations
FROM Formation
GROUP BY domaine_etudes;

-- 8. Moyenne du taux de réussite par établissement, filtrée pour taux < 50%
SELECT id_etablissement, AVG(taux_reussite) AS moyenne_reussite
FROM Propose
GROUP BY id_etablissement
HAVING AVG(taux_reussite) < 85;

-- 9. Frais de scolarité moyens par type d’établissement
SELECT e.type_etablissement, AVG(p.frais_scolarite) AS moyenne_frais
FROM Etablissement e
JOIN Propose p ON e.id_etablissement = p.id_etablissement
GROUP BY e.type_etablissement;

-- 10. Nombre de matières obligatoires par formation
SELECT id_formation, COUNT(*) AS nb_matiere_obligatoire
FROM Enseigne
WHERE matiere_obligatoire = 1
GROUP BY id_formation;

-- 11. Lister les formations avec leurs établissements et leurs contacts
SELECT f.nom_formation, e.nom_etablissement, c.email, c.numero
FROM Formation f
JOIN Propose p ON f.id_formation = p.id_formation
JOIN Etablissement e ON p.id_etablissement = e.id_etablissement
LEFT JOIN Appartenir a ON e.id_etablissement = a.id_etablissement
LEFT JOIN Contact c ON a.id_contact = c.id_contact;

-- 12. Matières enseignées dans chaque formation avec le volume horaire
SELECT f.nom_formation, m.nom_matiere, e.volume_horaire, e.matiere_obligatoire
FROM Formation f
JOIN Enseigne e ON f.id_formation = e.id_formation
JOIN Matiere m ON e.id_matiere = m.id_matiere;

-- 13. Formations et débouchés associés
SELECT f.nom_formation, m.nom_metier
FROM Formation f
JOIN Debouche_sur d ON f.id_formation = d.id_formation
JOIN Metier m ON d.id_metier = m.id_metier;

-- 14. Toutes les formations et établissements même si aucune proposition n’existe
SELECT f.nom_formation, e.nom_etablissement, p.nb_places_disponibles
FROM Formation f
CROSS JOIN Etablissement e
LEFT JOIN Propose p ON f.id_formation = p.id_formation AND e.id_etablissement = p.id_etablissement;

-- 15. Formations avec matières et établissement en une seule requête
SELECT f.nom_formation, m.nom_matiere, e.nom_etablissement
FROM Formation f
JOIN Enseigne en ON f.id_formation = en.id_formation
JOIN Matiere m ON en.id_matiere = m.id_matiere
JOIN Propose p ON f.id_formation = p.id_formation
JOIN Etablissement e ON p.id_etablissement = e.id_etablissement;

-- 16. Formations avec plus de 50 places disponibles
SELECT f.nom_formation
FROM Propose p1
JOIN Formation f ON p1.id_formation = f.id_formation
WHERE p1.taux_insertion > ALL (
    SELECT p2.taux_insertion
    FROM Propose p2
    JOIN Formation f2 ON p2.id_formation = f2.id_formation
    WHERE f2.domaine_etudes = 'Droit'
);


-- 17. Établissements qui ne proposent aucune formation en Informatique
SELECT nom_etablissement
FROM Etablissement
WHERE id_etablissement NOT IN (
    SELECT DISTINCT id_etablissement
    FROM Propose p
    JOIN Formation f ON p.id_formation = f.id_formation
    WHERE f.domaine_etudes = 'Informatique'
);

-- 18. Matières enseignées dans toutes les formations d’un domaine donné
SELECT nom_matiere
FROM Matiere
WHERE id_matiere IN (
    SELECT id_matiere
    FROM Enseigne en
    WHERE id_formation IN (
        SELECT id_formation
        FROM Formation
        WHERE domaine_etudes = 'Informatique'
    )
);

-- 19. Formations dont le taux d’insertion est supérieur à toutes les formations d’un autre domaine
SELECT f.nom_formation
FROM Propose p1
JOIN Formation f ON p1.id_formation = f.id_formation
WHERE p1.taux_insertion > ALL (
    SELECT p2.taux_insertion
    FROM Propose p2
    JOIN Formation f2 ON p2.id_formation = f2.id_formation
    WHERE f2.domaine_etudes = 'Droit'
);


-- 20. Contacts associés uniquement aux établissements ayant un taux de réussite > 80%
SELECT c.email, c.numero
FROM Contact c
WHERE EXISTS (
    SELECT 1
    FROM Appartenir a
    JOIN Propose p ON a.id_etablissement = p.id_etablissement
    WHERE a.id_contact = c.id_contact AND p.taux_reussite > 80
);


