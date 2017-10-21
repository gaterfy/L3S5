SET search_path TO boutique;
CREATE SCHEMA boutique 
CREATE TABLE Articles(aid INTEGER NOT NULL,anom VARCHAR(255),acoul VARCHAR(64),PRIMARY KEY(aid))

CREATE TABLE Fournisseurs(fid INTEGER NOT NULL, fnom VARCHAR(255) NOT NULL, fad VARCHAR(255) NOT NULL , PRIMARY KEY(fid))

CREATE TABLE Catalogue(fid INTEGER NOT NULL, aid INTEGER NOT NULL,prix DECIMAL(9,2) CHECK(prix>0), PRIMARY KEY(fid,aid),FOREIGN KEY(fid) REFERENCES Fournisseurs(fid),FOREIGN KEY(aid) REFERENCES Articles(aid));

/*Q2*/
select * from information_schema.table_constraints;
/*rep : affiche les clés primaires et les valeurs des attributs de chaque table*/

/*Q1.3
Un champ de précision 9 et d'échelle 2 doit être arrondi à une valeur
absolue inférieure à 10^7.
*/


/*Q1.4*/

INSERT INTO Articles VALUES (16,'Gaterfy','jaune');
/*ERREUR:  la valeur d'une clé dupliquée rompt la contrainte unique « articles_pkey »
DETAIL:  La clé « (aid)=(16) » existe déjà.
*/

/*Q1.5*/

Q1.6). 
DELETE FROM articles WHERE articles.aid = 1;



/*exo 2*/
2.2
/*qecho "Quels fournisseurs offrent des articles entre 10 et 20 euros ? Proposez deux requetes avec differentes techniques, dont une operation ensembliste 2 Veillez a ce quechaque fid n'apparaisse qu'une seule fois.";
	\qecho "Requete classique :";*/
	SELECT DISTINCT f.fnom as fournisseur 
	FROM fournisseurs as f NATURAL JOIN catalogue c 
	WHERE  c.prix < 20 and c.prix > 10;


2.3
	/*qecho "Donner les noms d'articles rouges ou verts a moins de 20 euros.";*/
	SELECT a.anom as "Article"
	FROM articles a NATURAL JOIN catalogue c
	WHERE a.acoul = 'rouge' or a.acoul = 'vert' and c.prix < 20;

2.4

/*2.5*/
SELECT	DISTINC Catalogue.fID
	from Catalogue AS Catalogue1
	JOIN Catalogue on Catalogue.fid= Catalogue1.fid
	JOIN Articles ON Catalogue.aid = Articles.AID
	JOIN Articles AS Articles1 ON Catalogue1.aid = Articles1.aid
	WHERE Articles1.acoul = 'argente' AND Articles.acoul = 'magenta';
2.6

SELECT a.anom as "Article"
	FROM articles a NATURAL JOIN catalogue c
	WHERE a.acoul = 'rouge' or a.acoul = 'vert'

2.7
/*qecho "Trouver les noms des fournisseurs qui n'offrent ni des articles noirs, ni des articles argentees.";*/
	SELECT fnom
	FROM fournisseurs
	WHERE fid not in ( 
		SELECT f.fid 
		FROM fournisseurs f NATURAL JOIN Catalogue c NATURAL JOIN articles a 
		WHERE a.acoul = 'noir' or a.acoul = 'argente'
	);

2.8
SELECT f.fnom, f.fad 
	FROM fournisseurs f 
	WHERE f.fid NOT IN ( 
		SELECT c.fid 
		FROM catalogue c 
		WHERE c.prix < 1000
	);

/*exercice 3*/
3.1
SELECT DISTINCT c.fid 
	FROM catalogue c  NATURAL JOIN articles a
	WHERE a.acoul = 'rouge';

3.2


/*exercice 4*/
4.3
select fnom as fournisseur from fournisseurs where fad like '%Paris';

