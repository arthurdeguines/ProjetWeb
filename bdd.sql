

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
  titre char(255),
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
  id int(11),
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
(null, 'arthur', 'deguines', 'deguinesarthur@gmail.com', 'Deguines','Arthur',2),
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
(null,'https://image.afcdn.com/recipe/20170213/63346_w420h344c1cx3000cy2000.jpg','Tarte citron','2017-11-11',55,1,3,1,1,3,'Etape 1
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
(null,'http://img-3.journaldesfemmes.com/J7MsBk2LVp_DXvP7sqqd3675XJk=/750x/smart/c67552ec0d884064b2592460687d386c/recipe-jdf/316071.jpg','Millefeuille de la mer','2017-12-11',20,0,4,2,null,1,'1
Egouttez le crabe. Ouvrez une boîte vide des deux côtés afin de disposer d\'un cercle de 8 cm de diamètre. A l\'aide de ce cercle, découpez deux ronds dans chaque tranche de saumon.
2
Récupérez les chutes et hachez-les. Pelez et hachez finement les échalotes. Ciselez les fines herbes.
3
Effilochez la chair de crabe en éliminant les cartilages. Incorporez-lui le saumon haché, les échalotes, les fines herbes et l\'huile. Poivrez.
Pour finir
Pour monter les millefeuilles, déposez un rond de saumon au centre des assiettes, posez la boîte évidée dessus, garnissez de crabe puis d\'un autre rond de saumon. Recommencez deux fois. Retirez délicatement la boîte. Gardez au réfrigérateur et servez frais.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'https://www.cuisine-etudiant.fr/image/recette/800500/bf85623bd603fa2079b5ccf90178114abf92be2f-tomates-courgettes-oeufs-rapide.jpg','Tomates courgettes oeufs rapide','2017-12-12',30,0,1,1,5,2,'- Laver les légumes 
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
(null,'https://www.cuisine-etudiant.fr/image/recette/800500/90912a99f9846421f28eaa19f698310fdc85d861-pates-knackis.jpg','Pâtes & Knackis.','2017-12-11',30,1,2,5,5,2,'1. Faire cuire les fusilli dans l\'eau bouillante salée préalablement.
2. Coupés les saucisses en morceaux et les faire cuire 3min dans la poële, en y ajoutant le sel, le poivres, le parika, le persil et le thym, les poivrons hâchés puis la sauce tomate. Laissez cuire quelques minutes ( 5 à 10 min environ ).

Vous pouvez ajouter du fromage si comme moi il vous est difficile de vous en séparer.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'https://www.cuisine-etudiant.fr/image/recette/800500/020652906e4d89e758ceffc82a3821e96e1f651d-gouter-saveur-snickers.jpg','Goûter saveur Snickers','2017-08-11',5,1,2,5,5,3,'Prendre une tranche de pain de mie
Couvrir une moitié de beurre de cacahuète (BIO parce que c\'est plus sain) et l\'autre de Nutella.
Plier pour superposer les deux pâtes.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'https://www.cuisine-etudiant.fr/image/recette/800500/6f0de50b25dd6cf301e4b8d233ca3824d6660d80-cookies-au-chocolat.jpg','Cookies au chocolat','2017-12-11',30,1,4,2,null,3,'1. Dans un bol, mettre le beurre, puis le ramollir au micro ondes pendant 30 secondes voire une minute selon la puissance de votre micro ondes.

2. Dans le saladier, mélanger le beurre fondu, le sucre, l\'oeuf (entier) et le sucre vanillé.

3. Dans un bol, mettre les 100g de chocolat et les faire fondre au micro ondes (entre 2 min et 5 min selon la puissance de votre micro ondes. Attention, si on le laisse trop longtemps, ca éclabousse, et c\'est dur à nettoyer !).

4. Ajouter le chocolat fondu dans le saladier, puis la farine, la levure et la pincée de sel.

5. Recouvrez votre grille de four de papier sulfurisé.

6. A l\'aide de deux petites cuillères, formez des boules de pâtes et disposez les sur la grille, en les espacant suffisamment.

7. Enfournez pour 10 minutes de cuisson, à 200°C, pas plus. A la sortie, les cookies seront très mous, mais c\'est normal, il faudra attendre une dizaine de minutes et ils seront délicieux une fois refroidis.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'https://www.cuisine-etudiant.fr/image/recette/800500/59cf686d1e58b2fa894936cd732ee8cd2ae0a9c3-gratin-de-pates-tres-facile.jpg','Gratin de Pâtes très facile','2017-12-11',30,1,4,5,null,2,'- Préchauffez votre four a 200°C

- Faire bouillir de l\'eau dans une casserole. Quand l\'eau bouillie rajouter un peu d\'huile d\'olive et les pâtes.

- Couper l\'oignon finement.

- En même temps, faire cuire dans une poêle les lardons avec une noix de beurre et l\'oignon.

- Une fois les lardons cuits, rajouter la crème fraiche, une cuillère a soupe de fond de veau, un peu de gruyère, de parmesan, l\'oignon émincé, salez et poivrez. Laissez mijoter.

- Quand vos pâtes sont prêtes, mettez les dans le plat à four. Rajoutez vos lardons. Mélanger le tout. Puis rajoutez par dessus du gruyère râpé et du parmesan.

- Enfournez le tout pendant 10 min.');




INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/XipfR2GoURyA1DJGklHtNvB7XHc=/750x/smart/a336a8a207c1462da37ee29bea595380/recipe-jdf/402549.jpg','Torsades aux champignons','2017-12-11',30,0,4,null,null,2,'Cuire les pâtes selon les recommandations. 
  Émincer les champignons et les faire revenir à feu doux dans du beurre. Ajouter le jambon en dés et faire dorer pendant 5 minutes. 
  Mettre la crème fraîche et laisser frémir quelques minutes. Égoutter les pâtes puis ajouter la préparation (champignons/jambon/crème) le persil et l\'emmental. Bien mélanger.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'https://www.cuisine-etudiant.fr/image/recette/800500/287197000e20f63bed48bbdfbdcdc8e0bb60e198-courgettes-fromage-lardon.jpg','COURGETTES FROMAGE/LARDON','2017-12-11',20,0,4,1,4,2,'1. Couper les courgettes dans la longueur à moitié égales puis creuser les deux moitiés. Réserver la pulpe récupérée.

2. Faire revenir dans une poêle l\'ail, les lardons et la pulpe de courgettes récupérée précédemment.

3. Une fois le tout cuit, mettre à feu très doux et rajouter la crème fraîche et le parmesan à votre convenance(ou/et autres fromages, je rajoute du cantal parfois). Poivrez et laisser mijoter jusqu\'à ce que ça épaississe.

4. Remplir les courgettes creusées de la mixture, recouvrir légèrement de gruyère et mettre au four à 180°, 35min (jusqu\'à ce que la garniture soit dorée).

5. Savourez');


INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/mK2UVz67ff-_c2rxHeuPWlw7IH8=/750x/smart/779dc43fe22a424fab48124e0fb30f1e/recipe-jdf/352923.jpg','Hamburgers de polenta panée','2017-12-11',20,0,4,5,3,2,'1
Faire bouillir ensemble lait et eau salés et poivrés. Verser la polenta en pluie, mélanger et faire cuire sur feu doux pendant 15 minutes pour la faire épaissir. Verser sur une ou deux plaques (pour moi une et demi) anti-adhésives (pas besoin de les beurrer). Laisser refroidir, la polenta faire prendre et former une masse compacte.
2
Lorsqu\'elle est bien froide, retourner sur une grande planche et découper des formes avec un emporte pièce rond ou avec un verre. Pas besoin comme moi de choisir un emporte-pièce cannelé car les dentelures ne seront plus visibles après panure et cuisson.
3
Dans une assiette creuse, battre les œufs avec un peu de lait. Saler, poivrer. Faire chauffer une grande poêle avec un peu d\'huile. Dans une autre assiette, verser chapelure et sésame. 
Passer chaque rond de polenta dans l\'œuf battu (rapidement, il ne faut pas trop l\'humidifier pour ne pas qu\'elle fonde ou se casse) puis dans la chapelure. Déposer dans la poêle chaude et faire dorer sur chaque face. Déposer ensuite sur du papier absorbant.
Pour finir
Allumer le four à 180°C (thermostat 6). Sur une plaque allant au four, placer des tranches de polenta panée. Disposer dessus une tranche de tomate, une tranche de bacon pliée en deux, une tranche fine de fromage, et recouvrir avec un rond de polenta panée. Enfourner ces hamburgers de polenta pour 15 minutes. Servir chaud ou froid.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/sZO-AjQGWodPt2dbojBOgIkORwg=/750x/smart/72cad49ac83b410a8ea689af5fe93a97/recipe-jdf/316718.jpg','Fajitas au poulet','2017-12-11',20,0,4,null,3,2,'1
Épluchez et découpez en petits morceaux l\'oignon, les tomates, la carotte et l\'aubergine.
2
Versez le tout dans une poêle chaude et arrosez de 2 cuillères d\'huile d\'olive et de 25 cl d\'eau. Faites revenir les légumes jusqu\'à ce qu\'ils soient dorés et cuits, c\'est à dire pendant environ 15 minutes.
3
Pendant ce temps, découpez les escalopes de poulet en petits morceaux et faites-les cuire à la poêle 5 à 8 minutes.
4
Lorsque les légumes sont cuits, incorporez le coulis de tomate et épicez la préparation à votre goût.
5
Laissez mijoter quelques minutes de plus puis retirez du feu. Incorporez les morceaux de poulet à la sauce.
Pour finir
Garnissez les tortillas et repliez-les délicatement.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/AEYL-UBhCFIgJUIBwrS3-BKYsMM=/750x/smart/74026ed2f7134a95b04ec618850753d2/recipe-jdf/372604.jpg','Croque-monsieur au chèvre et magrets séchés','2017-12-11',20,1,4,null,3,2,'1
Préchauffer le four à 200°c.
2
Étaler la crème fraîche sur les tranches de pain de mie. Saupoudrer légèrement de piment d\'Espelette. 
Sur quatre tranches, répartir les magrets séchés sans la peau, puis disposer sur le dessus de chaque tranche 4 rondelles de bûche de chèvre. Refermer les croque-monsieur avec les quatre autres tranches de pain de mie.
Pour finir
Placer sur une plaque et enfourner pour une vingtaine de minutes. Servir chaud.');



INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/dt7GqiEzOYu0edVhHR-lP2tdWCQ=/750x/smart/c0b7fa8adc0f495e982a3a65d03da8df/recipe-jdf/1003511.jpg','Pita au boeuf mexicain','2017-12-11',20,1,4,5,3,2,'1
Peler et hacher l\'oignon et l\'ail. Rincer et couper en fines lamelles le poivron rouge et jaune. Hacher la ciboulette et rincer la salade. Couper la salade en lamelles et disposer dans une assiette avec l\'emmental. À réserver pour la fin.
2
Dans un wok ou une grande casserole, faire revenir l\'oignon et l\'ail. Faire suer et ajouter par la suite la viande. Au bout de 5-7 minutes ajouter le poivron jaune puis le rouge. Mélanger et ajouter une poignée de ciboulette hachée.
3
Ajouter la boîte de tomate en dés avec le jus et laisser mijoter à peine 5 minutes. C\'est le moment d\'assaisonner : ajouter le piment en poudre, le chili en poudre, l\'origan, le thym, le sucre brun, le vinaigre de vin, le cumin et la cuillère à soupe de fécule de maïs. Mélanger et laisser mijoter pendant 20 minutes.
Pour finir
Au moment de servir, chauffer rapidement le pain pita, placer l\'assiette de salade-emmental sur la table et un petit pot de crème fraîche. Faire une petite ouverture sur le dessus, remplir d\'un peu de bœuf épicé mexicain, salade, viande, crème fraîche et emmental. C\'est prêt, bon appétit !');


INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'http://img-3.journaldesfemmes.com/rCHr7TQT_5Dw9jgVp85UAX67iFQ=/750x/smart/12e00cdde08e4daa9b145ab7728f7e26/recipe-jdf/10026004.jpg','Hot-dog aux choux de Bruxelles, lardons et fromage de Herve','2017-12-11',20,1,4,null,3,2,'1
Pelez et émincez l\'oignon. Nettoyez les choux de Bruxelles et coupez-les en 2 ou en 4 s\'ils sont gros. Faites griller les lardons dans une poêle sans matière grasse. Réservez.
2
Dans le même poêle, faites fondre l\'oignon émincé quelques minutes avec un peu de beurre et 1 cuillère à soupe de vinaigre balsamique. Réservez.
3
Toujours dans la même poêle, faites cuire la saucisse avec un peu de beurre ou faites-la griller. Réservez.
4
Et enfin, toujours dans la même poêle en gardant le jus de cuisson de la saucisse (ajoutez du beurre si nécessaire), faites cuire les choux de Bruxelles, 10 minutes à couvert, à feu moyen. Ils doivent être tendres. Salez et poivrez.
Pour finir
Coupez le pain en 2, tartinez de moutarde à l\'ancienne, ajoutez la saucisse, les oignons, lardons et choux de Bruxelles. Terminez avec quelques tranches de Herve et passez sous le grill le temps que le fromage fonde et que le tout soit bien chaud.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'https://cac.img.pmdstatic.net/fit/http.3A.2F.2Fwww.2Ecuisineactuelle.2Efr.2Fvar.2Fcui.2Fstorage.2Fimages.2Frecettes-de-cuisine.2Fentree.2Ftartes-salees.2Ftarte-a-la-tomate-et-a-la-moutarde-198531.2F1104931-2-fre-FR.2Ftarte-a-la-tomate-et-a-la-moutarde.2Ejpg/748x372/quality/80/crop-from/center/tarte-a-la-tomate-et-a-la-moutarde.jpeg','Tarte à la tomate et à la moutarde','2017-12-11',20,1,4,null,3,2,'
  Préchauffez le four à 200 °C. Étalez la pâte feuilletée dans un moule à tarte et piquez le fond avec une fourchette. 
  Placez le fond de tarte dans le four et laissez cuire durant 10 à 15 minutes.
Pendant ce temps, lavez les tomates et coupez-les en tranches.
Sortez le fond de tarte du four et baissez la température du four à 180°C. Étalez la moutarde à l’ancienne sur la pâte précuite.
Disposez harmonieusement les tomates sur la moutarde. Ajoutez l’huile d’olive, du sel et du poivre.
Enfournez durant 30 minutes environ.');

INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
(null,'http://static.750g.com/images/622-auto/cf0a93e1171e1b3ab36003619dc24efe/pate-a-crepes.jpg','Pate à crepes','2017-12-11',20,1,4,3,3,3,'ÉTAPE 1 :
Mettez la farine dans un récipient puis faites un puits.
ÉTAPE 2 :
Incorporez les oeufs un à un à la farine, petit à petit, en versant le lait au fur et à mesure que le mélange épaissit. Versez lentement et fouettez énergiquement pour éviter les grumeaux.
ÉTAPE 3 :
Ajouter le sel, l\'huile puis l\'eau.
ÉTAPE 4 :
Filmez et laissez reposer la pâte au réfrigérateur au moins 2 heures.');