

-- drop des tables si elles existent --


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
  recette_text text,
  difficulte int(1),
  id_utilisateur int,
  id_periode int,
  id_commentaire int,
  id_difficulte int
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
  labelle char(35)
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
  ADD KEY `FK_utilisateur_id_role` (`id_role`);

ALTER TABLE recette
  ADD PRIMARY KEY (id),
  ADD KEY `FK_recette_id_utilisateur` (`id_utilisateur`),
  ADD KEY `FK_recette_id_periode` (`id_periode`),
  ADD KEY `FK_recette_id_commentaire` (`id_commentaire`),
  ADD KEY `FK_recette_id_type_difficulte` (`id_difficulte`);

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
