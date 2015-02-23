
CREATE TABLE election (
                id_election INTEGER NOT NULL,
                date DATE NOT NULL,
                mode_scrutin VARCHAR NOT NULL,
                CONSTRAINT election_pk PRIMARY KEY (id_election)
);


CREATE TABLE integration (
                erreur VARCHAR NOT NULL,
                type_erreur VARCHAR NOT NULL,
                CONSTRAINT integration_pk PRIMARY KEY (erreur)
);


CREATE TABLE etiquette (
                id_etiquette INTEGER NOT NULL,
                etiquette VARCHAR NOT NULL,
                CONSTRAINT etiquette_pk PRIMARY KEY (id_etiquette)
);


CREATE TABLE candidat (
                id_candidat VARCHAR NOT NULL,
                nom VARCHAR NOT NULL,
                prenom VARCHAR NOT NULL,
                sexe VARCHAR NOT NULL,
                CONSTRAINT candidat_pk PRIMARY KEY (id_candidat)
);


CREATE TABLE geo (
                id_geo INTEGER NOT NULL,
                date_scrutin DATE NOT NULL,
                ref_geo VARCHAR NOT NULL,
                dec_arr VARCHAR NOT NULL,
                CONSTRAINT geo_pk PRIMARY KEY (id_geo)
);
COMMENT ON COLUMN geo.dec_arr IS 'DŽcoupage arrondissement';


CREATE TABLE scrutin (
                id_scrutin VARCHAR NOT NULL,
                id_election INTEGER NOT NULL,
                partielle VARCHAR NOT NULL,
                tour INTEGER NOT NULL,
                CONSTRAINT scrutin_pk PRIMARY KEY (id_scrutin, id_election)
);


CREATE TABLE resultat (
                id_scrutin VARCHAR NOT NULL,
                id_geo INTEGER NOT NULL,
                id_candidat VARCHAR NOT NULL,
                id_etiquette INTEGER NOT NULL,
                nombre INTEGER NOT NULL,
                CONSTRAINT resultat_pk PRIMARY KEY (id_scrutin, id_geo, id_candidat, id_etiquette)
);


ALTER TABLE scrutin ADD CONSTRAINT election_scrutin_fk
FOREIGN KEY (id_election)
REFERENCES election (id_election)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE resultat ADD CONSTRAINT etiquette_resultat_fk
FOREIGN KEY (id_etiquette)
REFERENCES etiquette (id_etiquette)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE resultat ADD CONSTRAINT candidat_resultat_fk
FOREIGN KEY (id_candidat)
REFERENCES candidat (id_candidat)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE resultat ADD CONSTRAINT geo_resultat_fk
FOREIGN KEY (id_geo)
REFERENCES geo (id_geo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE resultat ADD CONSTRAINT scrutin_resultat_fk
FOREIGN KEY (id_scrutin)
REFERENCES scrutin (id_scrutin)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
