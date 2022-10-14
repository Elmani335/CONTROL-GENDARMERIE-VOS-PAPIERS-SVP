--1]--
--Sélectionnez tous les champs des films sortis après 1960.--
SELECT * FROM `film` WHERE `date_sortie` > '1960-01-01'
--Sélectionnez le titre des films sortis avant 1960.--
SELECT `titre` FROM `film` WHERE YEAR(`date_sortie`) < 1960


--2]
--Changez la description du film dont l'ID est 35--
UPDATE `film` SET `description` = 'Test changement description' WHERE `film`.`id` = 35;


--3]--
--Insérez un nouveau film - Qu'il soit rattaché à au moins trois catégories. Donnez les requêtes SQL utilisées.--
INSERT INTO `film` (`id`, `titre`, `slug`, `image`, `prix`, `description`, `date_sortie`) 
VALUES (45, 'Askip faut un titre', 'TheAskipNeedATitle', 'img.png', '109', 'Ceci est une description', '2069-01-01');


--4]--
--récupérez dans la même requête tous les commentaires du film dont l'ID est 43, tous les champs du film 43, et tous les champs des utilisateurs ayant mis ces commentaires--
SELECT * FROM `commentaire` WHERE `id_film` = 43


--5]--
--Supprimez le film dont le slug commence par "t"--
DELETE FROM `film` WHERE `film`.`slug` LIKE 't%'


--6]--
--Récupérez tous les champs des utilisateurs qui ont mis des commentaires. Il ne doit pas avoir de doublons un même utilisateur ne doit apparaître qu'une seule fois--
SELECT * FROM `user` WHERE `id` IN (SELECT `id_user` FROM `commentaire`)


--7]--
--Récupérez tous les films de la catégorie dont l'ID est 51--
SELECT * FROM `films_categs` WHERE `id_film` IN (SELECT `id_film` FROM `films_categs` WHERE `id_categorie` = 51);


--8]--
--faites la moyenne des notes des films du site--
SELECT AVG(note) FROM `commentaire`



--9]--
--Récupérez tous les films sortis au mois de juin--
SELECT * FROM `film` WHERE MONTH(`date_sortie`) = 6


--10]--
--Récupérez tous les utilisateurs dont le role est user et qui ont postés des commentaires--
SELECT * FROM `user` WHERE `role` = '1' AND `id` IN (SELECT `id_user` FROM `commentaire`)
 