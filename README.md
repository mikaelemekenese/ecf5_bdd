<h1>Evaluation - Base de données</h1>
<br>
Mise en place du package "Annonces" de la base de données annonces.nc.
<br><br>
<h2>Enoncé</h2>
<br>

* Une annonce est publiée par un vendeur qui dispose d’un compte utilisateur.
* Un vendeur peut publier autant d’annonces qu’il souhaite.
* Seules 15 annonces peuvent être actives à un instant t.
* Pour publier une annonce :
  * Le vendeur choisit la catégorie dans laquelle l’annonce sera classée.
  * Elle a obligatoirement un titre sur 50 caractères maximum + une description sur 600 caractères maximum + une 
localisation identifiée par la ville (Nouvelle-Calédonie seulement) où l’article en vente est disponible.
  * Le vendeur peut ajouter un prix en F.cfp s’il le souhaite.
  * L’annonce indique si la livraison est possible ou non.
  * En payant un supplément, le vendeur peut indiquer que l’annonce est urgente.
  * Il est possible d’ajouter jusqu’à 10 photos sur une annonce.
* Lors de la visualisation d’une annonce, on doit voir les info de l’annonce mais aussi la date à laquelle elle a été publiée 
ainsi que le pseudo du vendeur.
* Un utilisateur qui dispose d’un compte peut ajouter autant d’annonces qu’il souhaite dans ses favoris.
<br><br>

<h2>Consignes</h2>
<br>

1. Etablissez le MCD dans StarUML.
2. Etablissez le MPD dans StarUML.
3. Justifiez votre choix pour le stockage des photos.
4. Elaborez le script SQL de création de la base de données et des tables.
5. Elaborez un script d’insertion de jeu de données de test comprenant au minimum 5 utilisateurs, 5 catégories et 20 annonces.
<br>
Rédigez les requêtes SQL suivantes : 
7. Afficher les annonces actives triées par vendeur et date publication. Afficher toutes les infos des annonces, ainsi que le nom du fichier des photos et le pseudo du vendeur.
8. Afficher le titre, prix, localisation, pseudo du vendeur des annonces classées dans une catégorie de votre choix, triées par date de publication de la plus récente à la plus ancienne.
9. Afficher le titre, prix, localisation des annonces favorites d’un utilisateur, triées par catégorie et prix croissant
