
CREATE TABLE public.election (
                id_election INTEGER NOT NULL,
                date DATE NOT NULL,
                mode_scrutin VARCHAR NOT NULL,
                partielle BOOLEAN NOT NULL,
                CONSTRAINT election_pk PRIMARY KEY (id_election)
);


CREATE TABLE public.integration (
                erreur VARCHAR NOT NULL,
                type_erreur VARCHAR NOT NULL,
                CONSTRAINT integration_pk PRIMARY KEY (erreur)
);


CREATE TABLE public.etiquette (
                id_etiquette INTEGER NOT NULL,
                etiquette VARCHAR NOT NULL,
                CONSTRAINT etiquette_pk PRIMARY KEY (id_etiquette)
);


CREATE TABLE public.candidat (
                id_candidat INTEGER NOT NULL,
                nom VARCHAR NOT NULL,
                prenom VARCHAR NOT NULL,
                sexe VARCHAR NOT NULL,
                CONSTRAINT candidat_pk PRIMARY KEY (id_candidat)
);


CREATE TABLE public.geo (
                id_geo INTEGER NOT NULL,
                date_scrutin DATE NOT NULL,
                ref_geo VARCHAR NOT NULL,
                dec_arr VARCHAR NOT NULL,
                CONSTRAINT geo_pk PRIMARY KEY (id_geo)
);
COMMENT ON COLUMN public.geo.ref_geo IS 'Type';
COMMENT ON COLUMN public.geo.dec_arr IS 'DŽcoupage arrondissement';


CREATE TABLE public.scrutin (
                id_scrutin INTEGER NOT NULL,
                id_election INTEGER NOT NULL,
                id_geo INTEGER NOT NULL,
                tour INTEGER NOT NULL,
                inscrits INTEGER NOT NULL,
                votants INTEGER NOT NULL,
                CONSTRAINT scrutin_pk PRIMARY KEY (id_scrutin, id_election, id_geo)
);


CREATE TABLE public.resultat (
                id_scrutin INTEGER NOT NULL,
                id_candidat INTEGER NOT NULL,
                id_etiquette INTEGER NOT NULL,
                nombre INTEGER NOT NULL,
                CONSTRAINT resultat_pk PRIMARY KEY (id_scrutin, id_candidat, id_etiquette)
);


ALTER TABLE public.scrutin ADD CONSTRAINT election_scrutin_fk
FOREIGN KEY (id_election)
REFERENCES public.election (id_election)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.resultat ADD CONSTRAINT etiquette_resultat_fk
FOREIGN KEY (id_etiquette)
REFERENCES public.etiquette (id_etiquette)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.resultat ADD CONSTRAINT candidat_resultat_fk
FOREIGN KEY (id_candidat)
REFERENCES public.candidat (id_candidat)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.scrutin ADD CONSTRAINT geo_scrutin_fk
FOREIGN KEY (id_geo)
REFERENCES public.geo (id_geo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.resultat ADD CONSTRAINT scrutin_resultat_fk
FOREIGN KEY (id_scrutin)
REFERENCES public.scrutin (id_scrutin)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
