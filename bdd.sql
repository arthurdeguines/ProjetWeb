

-- drop des tables si elles existent --
SET NAMES UTF8;

SET FOREIGN_KEY_CHECKS=0; 
drop table if exists utilisateur;
drop table if exists recette;
drop table if exists periode;
drop table if exists categorie;
drop table if exists recette_commentaire;
drop table if exists role;
drop table if exists type;
drop table if exists commentaire;
drop table if exists quantite_ingredient;
drop table if exists ingredient;
drop table if exists quantifiant;
SET FOREIGN_KEY_CHECKS=1; 


-- debut création table --


CREATE TABLE utilisateur (
  id int(11) NOT NULL,
  login char(25),
  mdp char(25),
  email char(255),
  nom char(255),
  prenom char(255),
  id_role int
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE recette (
  id int(11) NOT NULL,
  url_img text,
  titre char(35),
  date_creation date,
  temps_cuisson int,
  status int,
  difficulte int(1),
  id_utilisateur int,
  id_categorie int,
  id_type int,
  recette_text text,
  tri decimal DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE role (
  id int(11) NOT NULL,
  libelle char(25)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE type (
  id int(11) NOT NULL,
  libelle char(35)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE recette_commentaire (
  id_recette int,
  id_commentaire int
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE commentaire (
  id int(11) NOT NULL,
  texte text,
  note int,
  id_utilisateur int
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE categorie (
  id int(11) NOT NULL,
  libelle char(35),
  img text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE quantite_ingredient (
  id_ingredient int,
  quantite int,
  id_quantifiant int
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE ingredient (
  id int(11) NOT NULL,
  labelle char(35)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE quantifiant (
  id int(11) NOT NULL,
  labelle char(35)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


 -- Ajout des clés primaires et étrangéres --

ALTER TABLE utilisateur 
  ADD PRIMARY KEY (id),
  MODIFY COLUMN id INT(11) auto_increment,
  ADD KEY `FK_utilisateur_id_role` (`id_role`);

ALTER TABLE recette
  ADD PRIMARY KEY (id),
    MODIFY COLUMN id INT(11) auto_increment,
  ADD KEY `FK_recette_id_utilisateur` (`id_utilisateur`),
  ADD KEY `FK_recette_id_categorie` (`id_categorie`),
   ADD KEY `FK_recette_id_type` (`id_type`);

ALTER TABLE recette_commentaire
  ADD KEY `FK_recette_commentaire_recette` (`id_recette`),
  ADD KEY `FK_recette_commentaire_commentaire` (`id_commentaire`);

ALTER TABLE role
  ADD PRIMARY KEY (id);

ALTER TABLE type
  ADD PRIMARY KEY (id);

ALTER TABLE commentaire
  ADD PRIMARY KEY (id),
  ADD KEY `FK_commentaire_utilisateur` (`id_utilisateur`);

ALTER TABLE categorie
  ADD PRIMARY KEY (id);

ALTER TABLE quantite_ingredient
  ADD KEY `FK_quantite_ingredient_ingredient` (`id_ingredient`),
  ADD KEY `FK_quantete_ingredient_quantifiant` (`id_quantifiant`);

ALTER TABLE ingredient
  ADD PRIMARY KEY (id);

ALTER TABLE quantifiant
  ADD PRIMARY KEY (id);



  INSERT INTO `role` ( id , libelle)  VALUES
(1,'Utilisateur'),
(2, 'Admin');

INSERT INTO `utilisateur` (id , login , mdp ,email ,nom ,prenom ,id_role ) VALUES
(null, 'arthur', 'deguines', 'deguinesarthur@gmail.com', 'Deguines','Arthur',1),
(null, 'julien', 'boireau', 'lolol@gmail.com', 'Boireau', 'Julien',1),
(null, 'kevin', 'salomon', 'keke@gmail.com', 'Salomon', 'Kevin',1);

  INSERT INTO `categorie` ( id , libelle,img)  VALUES
(1,'Noel','http://images.cuisineaz.com/externe/images/dossiers/noel-2016/7-Parties-Tradition_03Plats.jpg'),
(2, 'Epiphanie','http://static.750g.com/images/622-auto/62113d2daf49f921db058177e35394ec/epiphanie.png' ),
(3, 'La chandeleur','http://www.minceurmoinscher.com/ori-crepe-hyperproteinee-au-chocolat-91.jpg'),
(4, 'Estival','https://archzine.fr/wp-content/uploads/2016/03/plat-d%C3%A9t%C3%A9-idee-repas-soir-recette-facile-pour-le-soir-3.jpg'),
(5, 'etudiant','https://www.iae-france.fr/wp-content/uploads/2016/06/la-cuisine-de-clement-1-e1467384575489.png');

  INSERT INTO `type` ( id , libelle)  VALUES
(1,'Entree'),
(2, 'Plat'),
(3, 'Dessert');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'https://image.afcdn.com/recipe/20170213/63346_w420h344c1cx3000cy2000.jpg','Tarte citron','2017-11-11',55,0,3,1,1,3,'Etape 1
On commence par la pâte sablée : mettre le four à préchauffer à 180°C (thermostat 6).
On sépare les blancs des jaunes d\'oeufs.
Etape 2
Fouetter les jaunes d\'oeuf avec le sucre et 2 cuillères d\'eau pour faire mousser.
Etape 3
Mélanger au doigt la farine et le beurre coupé en petits cubes
Etape 4
pour obtenir une consistance sableuse et afin que tout le beurre soit absorbé (il faut faire vite pour que le mélange ne ramollisse pas trop).
Etape 5
Verser au milieu de ce "sable" le mélange liquide.
Etape 6
Incorporer rapidement au couteau les éléments sans leur donner de corps.
Etape 7
Former une boule avec les paumes
Etape 8
et l\'écraser 1 ou 2 fois pour rendre la boule plus homogène.
Etape 9
Foncer un moule de 25 cm de diamètre avec la pâte sablée
Etape 10
puis la recouvrir de papier sulfurisé et de haricots secs.
Etape 11
Cuire à blanc 20 à 25 minutes (NB après baisser le four à 120°C/150°C environ pour la meringue).
Etape 12
On poursuit avec la crème au citron : laver les citrons et en râper deux afin de récupérer le zeste.
Etape 13
Mettre les zestes très fins dans une casserole avec le jus des citrons, le sucre et la Maïzena.
Etape 14
Remuer et commencer à faire chauffer à feux doux.
Etape 15
Battre les oeufs dans un récipient séparé. 
Une fois les oeufs battus, incorporer tout en remuant le jus de citron, le sucre, la Maïzena et les zestes.
Etape 16
Mettre à feu vif et continuer à remuer à l\'aide d\'un fouet. 
Le mélange va commencer à s\'épaissir. 
Veiller à toujours remuer lorsque les oeufs sont ajoutés car la crème de citron pourrait brûler.
Etape 17
Ôter du feu et verser l\'appareil sur le fond de tarte cuit.
Etape 18
Laisser refroidir.
Etape 19
Terminons par la meringue : monter les blancs en neige avec une pincée de sel.
Etape 20
Quand ils commencent à être fermes, ajouter le sucre puis la levure. 
Fouetter jusqu\'à ce que la neige soit ferme.
Etape 21
Recouvrir la crème au citron de meringue
Etape 22
puis enfourner la tarte à 120°C/150°C jusqu’à ce que la meringue dore (environ 10 minutes).
Etape 23
Déguster
Etape 24
Une part ?');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,0,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'https://www.cuisine-etudiant.fr/image/recette/800500/bf85623bd603fa2079b5ccf90178114abf92be2f-tomates-courgettes-oeufs-rapide.jpg','Tomates courgettes oeufs rapide','2017-12-12',30,0,1,2,5,2,'- Laver les légumes 
- Éplucher la courgette partiellement (faire des "rayures")
- Couper la courgette en rondelles puis chaques rondelles en quarts
- Couper les tomates en tranches puis chaques tranches en deux

- Mettre un peu d\'huile dans la poêle 
- Faire revenir la courgette dans la poêle jusqu\'à ce qu\'elle soit dorée 
- Mettre les tomates dans la poêle avec les courgettes

- Une fois que les tomates se détachent de leur peaux ajouter les oeufs sur les courgettes et les tomates (comme pour des oeufs au plat)
- Saler et poivrer selon les préférences 
- Mettre le couvercle sur la poêle

- Servir une fois les oeufs cuits');



INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'https://www.cuisine-etudiant.fr/image/recette/800500/90912a99f9846421f28eaa19f698310fdc85d861-pates-knackis.jpg','Pâtes & Knackis.','2017-12-11',30,1,2,2,2,1,'1. Faire cuire les fusilli dans l\'eau bouillante salée préalablement.
2. Coupés les saucisses en morceaux et les faire cuire 3min dans la poële, en y ajoutant le sel, le poivres, le parika, le persil et le thym, les poivrons hâchés puis la sauce tomate. Laissez cuire quelques minutes ( 5 à 10 min environ ).

Vous pouvez ajouter du fromage si comme moi il vous est difficile de vous en séparer.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'https://www.cuisine-etudiant.fr/image/recette/800500/020652906e4d89e758ceffc82a3821e96e1f651d-gouter-saveur-snickers.jpg','Goûter saveur Snickers','2017-08-11',5,1,2,2,3,3,'Prendre une tranche de pain de mie
Couvrir une moitié de beurre de cacahuète (BIO parce que c\'est plus sain) et l\'autre de Nutella.
Plier pour superposer les deux pâtes.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'https://www.cuisine-etudiant.fr/image/recette/800500/6f0de50b25dd6cf301e4b8d233ca3824d6660d80-cookies-au-chocolat.jpg','Cookies au chocolat','2017-12-11',30,1,4,2,3,3,'1. Dans un bol, mettre le beurre, puis le ramollir au micro ondes pendant 30 secondes voire une minute selon la puissance de votre micro ondes.

2. Dans le saladier, mélanger le beurre fondu, le sucre, l\'oeuf (entier) et le sucre vanillé.

3. Dans un bol, mettre les 100g de chocolat et les faire fondre au micro ondes (entre 2 min et 5 min selon la puissance de votre micro ondes. Attention, si on le laisse trop longtemps, ca éclabousse, et c\'est dur à nettoyer !).

4. Ajouter le chocolat fondu dans le saladier, puis la farine, la levure et la pincée de sel.

5. Recouvrez votre grille de four de papier sulfurisé.

6. A l\'aide de deux petites cuillères, formez des boules de pâtes et disposez les sur la grille, en les espacant suffisamment.

7. Enfournez pour 10 minutes de cuisson, à 200°C, pas plus. A la sortie, les cookies seront très mous, mais c\'est normal, il faudra attendre une dizaine de minutes et ils seront délicieux une fois refroidis.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'https://www.cuisine-etudiant.fr/image/recette/800500/59cf686d1e58b2fa894936cd732ee8cd2ae0a9c3-gratin-de-pates-tres-facile.jpg','Gratin de Pâtes très facile','2017-12-11',30,1,4,2,3,2,'- Préchauffez votre four a 200°C

- Faire bouillir de l\'eau dans une casserole. Quand l\'eau bouillie rajouter un peu d\'huile d\'olive et les pâtes.

- Couper l\'oignon finement.

- En même temps, faire cuire dans une poêle les lardons avec une noix de beurre et l\'oignon.

- Une fois les lardons cuits, rajouter la crème fraiche, une cuillère a soupe de fond de veau, un peu de gruyère, de parmesan, l\'oignon émincé, salez et poivrez. Laissez mijoter.

- Quand vos pâtes sont prêtes, mettez les dans le plat à four. Rajoutez vos lardons. Mélanger le tout. Puis rajoutez par dessus du gruyère râpé et du parmesan.

- Enfournez le tout pendant 10 min.');



INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',30,1,4,2,3,2,'Laver les champignons à l\'eau citronnée puis, les couper en lamelles.
Faire fondre le beurre et dès qu\'il mousse, saisir les escalopes des 2 côtés sans les laisser colorer les sortir de la poêle et les réserver au chaud. Verser le cidre dans la poêle, faire bouillir, ajouter la moutarde. Dès qu\'elle est délayée, remettre les escalopes dans cette préparation à feu doux. Saler, Poivrer.A jouter les champignons et la crème fraîche. Puis laisser cuire 10 à 15 minutes; 
servez avec des pâtes, du riz, de la purée et régalez vous!');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'https://www.cuisine-etudiant.fr/image/recette/800500/59cf686d1e58b2fa894936cd732ee8cd2ae0a9c3-gratin-de-pates-tres-facile.jpg','Millefeuille de la mer','2017-12-11',30,1,4,2,3,2,'Laver les champignons à l\'eau citronnée puis, les couper en lamelles.
Faire fondre le beurre et dès qu\'il mousse, saisir les escalopes des 2 côtés sans les laisser colorer les sortir de la poêle et les réserver au chaud. Verser le cidre dans la poêle, faire bouillir, ajouter la moutarde. Dès qu\'elle est délayée, remettre les escalopes dans cette préparation à feu doux. Saler, Poivrer.A jouter les champignons et la crème fraîche. Puis laisser cuire 10 à 15 minutes; 
servez avec des pâtes, du riz, de la purée et régalez vous!');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'https://www.cuisine-etudiant.fr/image/recette/800500/287197000e20f63bed48bbdfbdcdc8e0bb60e198-courgettes-fromage-lardon.jpg','COURGETTES FROMAGE/LARDON','2017-12-11',20,0,4,2,3,1,'1. Couper les courgettes dans la longueur à moitié égales puis creuser les deux moitiés. Réserver la pulpe récupérée.

2. Faire revenir dans une poêle l\'ail, les lardons et la pulpe de courgettes récupérée précédemment.

3. Une fois le tout cuit, mettre à feu très doux et rajouter la crème fraîche et le parmesan à votre convenance(ou/et autres fromages, je rajoute du cantal parfois). Poivrez et laisser mijoter jusqu\'à ce que ça épaississe.

4. Remplir les courgettes creusées de la mixture, recouvrir légèrement de gruyère et mettre au four à 180°, 35min (jusqu\'à ce que la garniture soit dorée).

5. Savourez');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');