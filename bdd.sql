

-- drop des tables si elles existent --
SET NAMES UTF8;

SET FOREIGN_KEY_CHECKS=0; 
drop table if exists utilisateur;
drop table if exists recette;
drop table if exists periode;
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
  id_periode int,
  id_type int,
  recette_text text,
  tri decimal DEFAULT 0
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
CREATE TABLE periode (
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
  ADD KEY `FK_recette_id_periode` (`id_periode`),
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

ALTER TABLE periode
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

  INSERT INTO `periode` ( id , libelle,img)  VALUES
(1,'Noel','http://images.cuisineaz.com/externe/images/dossiers/noel-2016/7-Parties-Tradition_03Plats.jpg'),
(2, 'Epiphanie','http://static.750g.com/images/622-auto/62113d2daf49f921db058177e35394ec/epiphanie.png' ),
(3, 'La chandeleur','http://www.minceurmoinscher.com/ori-crepe-hyperproteinee-au-chocolat-91.jpg'),
(4, 'Estival','https://archzine.fr/wp-content/uploads/2016/03/plat-d%C3%A9t%C3%A9-idee-repas-soir-recette-facile-pour-le-soir-3.jpg');

  INSERT INTO `type` ( id , libelle)  VALUES
(1,'Entree'),
(2, 'Plat'),
(3, 'Dessert');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_periode,id_type,recette_text)  VALUES
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

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_periode,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_periode,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_periode,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_periode,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_periode,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_periode,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_periode,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_periode,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_periode,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_periode,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_periode,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_periode,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_periode,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_periode,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_periode,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_periode,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_periode,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_periode,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_periode,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_periode,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,1,4,2,3,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');