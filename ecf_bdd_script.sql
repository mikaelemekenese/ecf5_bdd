/*
*********************************************************************
Evaluation sur la compétence de base de données

Name: MySQL Sample Database annoncesnc
*********************************************************************
*/

	-- Les photos seront stockés dans un répertoire du serveur pour éviter d'alourdir la base de données, ce qui entraînerait un ralentissement du chargement des données lors de l'affichage. Seuls les noms de fichiers images seront stockés dans la base de données.

/*
*********************************************************************
					CREATION DE LA BASE DE DONNEES
*********************************************************************
*/

	DROP DATABASE annoncesnc;

	CREATE DATABASE IF NOT EXISTS annoncesnc
	CHARACTER SET 'utf8mb4';

	USE annoncesnc;
    
/*
*********************************************************************
						CREATION DES TABLES
*********************************************************************
*/


-- Table "Utilisateur"

	DROP TABLE IF EXISTS utilisateur;
    
    CREATE TABLE utilisateur
    (	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
		pseudo VARCHAR(50) NOT NULL,
        date_creation DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
		date_modification DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL	);
        
        
-- Table "Catégorie"

	DROP TABLE IF EXISTS categorie;
    
    CREATE TABLE categorie
    (	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
		nom VARCHAR(50) NOT NULL,
        date_creation DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
		date_modification DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL	);
        
        
-- Table "Localisation"

	DROP TABLE IF EXISTS localisation;
    
    CREATE TABLE localisation
    (	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
		commune VARCHAR(50) NOT NULL,
        date_creation DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
		date_modification DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL	);
        

-- Table "Annonce"

	DROP TABLE IF EXISTS annonce;

	CREATE TABLE annonce
	(	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
		titre VARCHAR(50) NOT NULL,
        description VARCHAR(600) NOT NULL,
        prix INT,
        livraison BOOL NOT NULL,
        active BOOL NOT NULL,
        urgent BOOL,
        id_utilisateur INT NOT NULL,
        INDEX id_utilisateur_index (id_utilisateur),
		CONSTRAINT annonce_fk1 FOREIGN KEY (id_utilisateur) REFERENCES utilisateur (id),
        id_categorie INT NOT NULL,
        INDEX id_categorie_index (id_categorie),
		CONSTRAINT annonce_fk2 FOREIGN KEY (id_categorie) REFERENCES categorie (id),
        id_localisation INT NOT NULL,
        INDEX id_localisation_index (id_localisation),
		CONSTRAINT annonce_fk3 FOREIGN KEY (id_localisation) REFERENCES localisation (id),
		date_creation DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
		date_modification DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL	);
        
        
-- Table "Image"

	DROP TABLE IF EXISTS image;
    
    CREATE TABLE image
    (	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
		nom_fichier VARCHAR(50) NOT NULL,
        id_annonce INT NOT NULL,
        INDEX id_annonce_index (id_annonce),
		CONSTRAINT image_fk FOREIGN KEY (id_annonce) REFERENCES annonce (id),
        date_creation DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
		date_modification DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL	);
        
        
-- Table "Favori"

	DROP TABLE IF EXISTS favori;
    
    CREATE TABLE favori
    (	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        id_annonce INT NOT NULL,
        INDEX id_annonce_index (id_annonce),
		CONSTRAINT favori_fk1 FOREIGN KEY (id_annonce) REFERENCES annonce (id),
        id_utilisateur INT NOT NULL,
        INDEX id_utilisateur_index (id_utilisateur),
		CONSTRAINT favori_fk2 FOREIGN KEY (id_utilisateur) REFERENCES utilisateur (id),
        date_creation DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
		date_modification DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL	);
        

/*
*********************************************************************
						INSERTION DE DONNEES
*********************************************************************
*/

-- Insertion dans la table "Utilisateur"

	INSERT INTO utilisateur (pseudo)
    VALUES ('Mika123'),
    ('MecDePaita'),
    ('PetitPoucet'),
    ('LionelMoulin'),
    ('Utilisateur332741');
    
    SELECT * FROM utilisateur;
   
   
-- Insertion dans la table "Catégorie"

	INSERT INTO categorie (nom)
    VALUES ('Téléphonie'),
    ('Electroménager'),
    ('Vêtements'),
    ('Jouets'),
    ('Jeux/Consoles');
    
    SELECT * FROM categorie;
    
    
-- Insertion dans la table "Localisation"

	INSERT INTO localisation (commune)
    VALUES ('Nouméa'),
    ('Païta'),
    ('Mont-Dore'),
    ('Koumac'),
    ('Lifou');
    
    SELECT * FROM localisation;
    

-- Insertion dans la table "Annonce"

	INSERT INTO annonce (titre, description, prix, livraison, active, urgent, id_utilisateur, id_categorie, id_localisation)
    VALUES ('Samsung S9 Plus', 'Vends Samsung S9 Plus, 64GO avec coque rigide de protection, chargeur, et verre trempé', 55000, 0, 1, 0, 1, 1, 2),
    ('iPhone 7 Plus', 'Bonjour, je vends un iPhone 7 Plus, 128GO, gris, avec chargeur. Bon état.', 40000, 1, 1, 1, 5, 1, 1),
    ('iPhone 12 Mini 256GB Black', 'Vends iPhone 12 Mini 256GB Black. En parfait état. Acheté en Avril 2021.', 100000, 1, 1, 1, 4, 1, 3), 
    ('Google Pixel 5', 'Vends Google Pixel 5. Excellent état (3 mois). 128GO. 8GO RAM.', 80000, 0, 1, 0, 2, 1, 4),
    ('Frigo pas cher A+', 'Bonjour, je vends un frigo. Bon état. Economique.', 20000, 1, 1, 0, 3, 2, 5),
    ('Armoire frigorifique pro', 'Armoire frigorifique de restaurant. 6 compartiments/portes. Dimensions : 192x204x76cm.', 80000, 1, 1, 1, 2, 2, 1),
    ('Crêpière', 'Crêpière + mini woks. Idéal pour pancakes, bacon, œufs au plat, raclette.', 5000, 0, 1, 0, 4, 2, 3),
    ('Lave-vaisselle Bosch', 'Vends lave-vaisselle Bosch. Peu utilisé. Séparation car double emploi et déménagement.', 30000, 1, 1, 0, 3, 2, 4),
    ('Lot de jeans', 'Je vends un lot de 6 jeans en parfait état. Taille : 28/30.', 30000, 0, 0, 0, 5, 3, 2),
    ('Chaussures neuves garçon', 'Vends chaussures neuves garçon jamais portées', 1000, 0, 0, 0, 1, 3, 3),
    ('Robe', 'Vends robe. Taille S/36. A récupérer à Robinson', 500, 0, 0, 0, 4, 3, 3),
    ('Veste de moto', 'AV veste de moto jamais portée. Paiement en espèces uniquement. Disponible sur Magenta.', 15000, 0, 1, 0, 2, 3, 1),
    ('Figurine Buzz l\'Eclair', 'Figurine Buzz l\'Eclair neuve. 31cm de haut. Piles fournies.', 4000, 1, 1, 0, 5, 4, 4),
    ('Lot jeux de plage', 'Vends un lot de jeux de plage. Visible sur Païta.', 2500, 0, 0, 0, 2, 4, 2),
    ('Lot petites voitures', 'Je vends un lot de 57 petites voitures et son garage.', 4000, 0, 1, 0, 3, 4, 5),
    ('Jeu de société Cluedo', 'Vends jeu de société Cluedo. Bon état.', 1000, 0, 0, 0, 4, 4, 3),
    ('XBOX 360 Star Wars', ' Vends XBox 360 avec sa Kinet / 2 manettes / 2 jeux. Bon état.', 25000, 1, 1, 0, 1, 5, 1),
    ('Jeux PS5', 'AV 3 jeux PS5. Etat neuf. Espèces uniquement.', 22500, 0, 1, 1, 5, 5, 2),
    ('Nintendo Switch Collector', 'Vends Nintendo Switch Collector: Mario Anniversaire', 55000, 1, 1, 1, 4, 5, 3),
    ('Console Wii', 'AV Console Wii + 2 manettes + 1 nunchuk + 2 volants + 4 jeux', 20000, 0, 1, 0, 3, 5, 4);
    
    SELECT * FROM annonce;
    

-- Insertion dans la table "Image"

	INSERT INTO image (nom_fichier, id_annonce)
    VALUES ('samsung-s9-plus.jpg', 1), 
    ('iph7-1.png', 2),
    ('iph7-2.png', 2),
    ('photo15212.jpg', 3),
    ('photo15213.jpg', 3),
    ('mecdepaita-1.png', 4),
    ('mecdepaita-3.png', 4),
    ('frigo.jpg', 5),
    ('photo2.jpg', 6),
    ('photo3.jpg', 6),
    ('photo4.jpg', 6),
    ('crepi_re.jpg', 7),
    ('bosch.png', 8),
    ('bosch1.png', 8),
    ('jeans.jpg', 9),
    ('chaussures.jpg', 10),
    ('chaussuress.jpg', 10),
    ('image.jpg', 11),
    ('vestemoto.png', 12),
    ('buzz.jpg', 13),
    ('jeux-plage.png', 14),
    ('petitesvoitures.jpg', 15),
    ('cluedo01.jpg', 16),
    ('xbox360.png', 17),
    ('ps5jeux.jpg', 18),
    ('nsc.jpg', 19),
    ('wii-console.png', 20);
    
    SELECT * FROM image;
    

-- Insertion dans la table "Favori"

	INSERT INTO favori (id_annonce, id_utilisateur)
    VALUES (1, 2), (1, 5),
    (2, 1), (2, 3), (2, 4),
    (3, 2), (3, 3), (3, 5),
    (4, 3), (4, 4),
    (7, 1),
    (8, 2), (8, 4),
    (12, 3),
    (17, 5),
    (18, 1), (18, 2), (18, 3),
    (19, 4),
    (20, 1);
    
    SELECT * FROM favori;

/*
*********************************************************************
					   AFFICHAGE DE DONNEES
*********************************************************************
*/
    
-- Afficher les annonces actives triées par vendeur et date publication. Afficher toutes les info des annonces, ainsi que le nom du fichier des photos et le pseudo du vendeur.

	SELECT a.titre, a.description, a.prix, i.nom_fichier AS 'nom de fichier image', c.nom AS 'catégorie', l.commune AS 'localisation', u.pseudo, a.livraison, a.active, a.urgent, a.date_creation AS 'date de publication' 
    FROM annonce AS a
    LEFT JOIN utilisateur AS u ON a.id_utilisateur = u.id
    LEFT JOIN image AS i ON i.id_annonce = a.id
    LEFT JOIN localisation AS l ON l.id = a.id_localisation
    LEFT JOIN categorie AS c ON c.id = a.id_categorie
    WHERE active = 1;
    

-- Afficher le titre, prix, localisation, pseudo du vendeur des annonces classées dans une catégorie de votre choix, triées par date de publication de la plus récente à la plus ancienne.

	SELECT a.titre AS 'Titre', a.prix AS 'Prix', l.commune AS 'Localisation', u.pseudo AS 'Pseudo vendeur' 
    FROM annonce AS a
    LEFT JOIN utilisateur AS u ON a.id_utilisateur = u.id
    LEFT JOIN localisation AS l ON l.id = a.id_localisation
    LEFT JOIN categorie AS c ON c.id = a.id_categorie
    WHERE c.nom = 'Téléphonie';

-- Afficher le titre, prix, localisation des annonces favorites d’un utilisateur, triées par catégorie et prix croissant.

	SELECT a.titre AS 'Titre', a.prix AS 'Prix', l.commune AS 'Localisation', u.pseudo AS 'Pseudo Utilisateur' FROM annonce AS a
    LEFT JOIN favori AS f ON f.id_annonce = a.id
    LEFT JOIN utilisateur AS u ON u.id = f.id_utilisateur
    LEFT JOIN localisation AS l ON l.id = a.id_localisation
    LEFT JOIN categorie AS c ON c.id = a.id_categorie
    WHERE u.pseudo = 'Mika123'
    ORDER BY c.nom, a.prix ASC;