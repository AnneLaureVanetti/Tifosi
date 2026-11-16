USE tifosi;

-- Requête 1 : afficher la liste des noms des focaccias
              -- par ordre alphabétique croissant

SELECT name_focaccia FROM focaccia 
ORDER BY name_focaccia ASC;

/* Résultat attendu :
   Les 8 focaccias du fichier focaccia.xlsx, triées de A à Z :
   Américaine, Emmentalaccia, Gorgonzollaccia, Hawaienne,
   Mozaccia, Paysanne, Raclaccia, Tradizione.

   Résultat obtenu :
   Américaine, Emmentalaccia, Gorgonzollaccia, Hawaienne,
   Mozaccia, Paysanne, Raclaccia, Tradizione.
   (8 lignes)

   Commentaire :
   Aucun écart, le résultat obtenu correspond au résultat attendu.
*/


-- Requête 2 : Afficher le nombre total d'ingrédients

SELECT COUNT(*) AS nb_ingredient FROM ingredient;

/* Résultat attendu : 
le nombre total des ingredients du fichier ingredient.xlsx : 25

Résultat obtenu : 25

Commentaire : Aucun écart, le résultat obtenu correspond au résultat attendu. */


/* Requête 3 : Afficher le prix moyen des focaccias*/

SELECT AVG(price_focaccia) FROM focaccia;

/* Résultat attendu : faire la somme des prix des 8 focaccia puis calculer la moyenne:
                      83/8= 10.375
  
Résultat obtenu : 10.375000

Commentaire : Aucun écart, le résultat obtenu correspond au résultat attendu.*/

/* Requête 4 : Afficher la liste des boissons avec leur marque, triée par nom de boisson*/

SELECT b.name_boisson, m.name_marque
FROM boisson b INNER JOIN marque m ON
(b.id_marque = m.id_marque)
ORDER BY name_boisson ASC;

/* Résultat attendu : la liste des 12 boissons rangées par ordre alphabétique et leur marque:

Capri-sun                           Coca-cola
Coca-cola original                  Coca-cola
Coca-cola zéro                      Coca-cola
Eau de source                       Cristalline
Fanta citron                        Coca-cola
Fanta orange                        Coca-cola
Lipton Peach                        Pepsico
Lipton zéro citron                  Pepsico
Monster energy ultra blue           Monster
Monster energy ultra gold           Monster
Pepsi                               Pepsico
Pepsi Max Zéro                      Pepsico

Résultat obtenu : identique au résultat attendu (12 lignes)

Commentaire : Aucun écart, le résultat obtenu correspond au résultat attendu.*/

/* Requête 5 : Afficher la liste des ingrédients pour une Raclaccia */

SELECT i.name_ingredient FROM focaccia f
INNER JOIN recette r ON (f.id_focaccia = r.id_focaccia)
INNER JOIN ingredient i ON (i.id_ingredient = r.id_ingredient)
WHERE name_focaccia = 'raclaccia' ;

/* Résultat attendu : la liste des ingredients pour réaliser la focaccia raclaccia :
Base tomate, raclette, cresson, ail, champignon, parmesan, poivre

Résultat obtenu : la liste des ingredients pour réaliser la focaccia raclaccia :
Ail, base tomate, champignon, cresson, parmesan, poivre, raclette

Commentaire :
   Les 7 ingrédients attendus sont bien présents, mais dans l'ordre
   alphabétique et non dans l'ordre de la recette.*/


/* Requête 6 : Afficher le nom et le nombre d'ingrédients pour chaque foccacia*/

SELECT f.name_focaccia,
COUNT(r.id_ingredient) AS nb_ingredient 
FROM focaccia f 
INNER JOIN recette r ON (f.id_focaccia = r.id_focaccia)
GROUP BY f.name_focaccia;

/* Résultat attendu : la liste des 8 focaccias et le nombre total d'ingrédients pour chaque focaccia
Mozaccia            10
Gorgonzollaccia     8
Raclaccia           7
Emmentalaccia       7
Tradizione          9
Hawaienne           9
Américaine          8
Paysanne            12

Résultat obtenu : identique au résultat attendu (8 lignes).

Commentaire : Aucun écart, le résultat obtenu correspond au résultat attendu.*/

-- Requête 7 : Afficher le nom de la focaccia qui a le plus d'ingrédients.

SELECT f.name_focaccia, COUNT(r.id_ingredient) AS nb_ingredient
FROM focaccia f
INNER JOIN recette r ON f.id_focaccia = r.id_focaccia
GROUP BY f.name_focaccia

HAVING COUNT(r.id_ingredient) >= ALL (
    SELECT COUNT(id_ingredient)
    FROM recette
    GROUP BY id_focaccia
);

/* Résultat attendu : le nom de la focaccia qui a le plus d'ingrédient :
paysanne 12 (une ligne)


Résultat obtenu :identique au résultat attendu (1 ligne).

Commentaire : Aucun écart, le résultat obtenu correspond au résultat attendu.*/

/* Requête 8: Afficher la liste des focaccia qui contiennent de l'ail */

SELECT f.name_focaccia FROM focaccia f 
INNER JOIN recette r ON (f.id_focaccia= r.id_focaccia)
WHERE id_ingredient= 1;

/* Résultat attendu : liste des focaccia qui contiennent de l'ail : 
Mozaccia, Gorgonzollaccia, Raclaccia, Paysanne.


Résultat obtenu :identique au résultat attendu (4 lignes).

Commentaire : Aucun écart, le résultat obtenu correspond au résultat attendu.*/

/* Requête 9 : Afficher la liste des ingrédients inutilisés */

SELECT i.name_ingredient FROM ingredient i 
LEFT JOIN recette r ON (i.id_ingredient = r.id_ingredient)
WHERE r.id_focaccia IS NULL ;

/* Résultat attendu : liste des ingrédients inutilisés : salami, tomate cerise 

Résultat obtenu :identique au résultat attendu (2 lignes).

Commentaire : Aucun écart, le résultat obtenu correspond au résultat attendu.*/

/* Requête 10 : Afficher la liste des focaccia qui n'ont pas de champignons*/

SELECT f.name_focaccia
FROM focaccia f
WHERE f.id_focaccia NOT IN (
    SELECT r.id_focaccia
    FROM recette r
    INNER JOIN ingredient i ON (r.id_ingredient= i.id_ingredient)
    WHERE i.name_ingredient='champignon'
);

/* Résultat attendu : liste des focaccia qui n'ont pas de champignons : Hawaienne, Américaine

Résultat obtenu :identique au résultat attendu (2 lignes).

Commentaire : Aucun écart, le résultat obtenu correspond au résultat attendu.*/