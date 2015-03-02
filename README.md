# Projet Base électorale 2015

## Objectifs 

Construire une base de données relationelle des résultats électoraux en France.
Le modèle est pensé pour être réutilisable avec peu de modifications avec les données d'autres pays.
Il doit permettre l'ajout de résultats anciens à mesure qu'ils sont numérisés.
Il doit permettre l'ajout des futurs résultats électoraux à différentes échelles.
Il s'appuie sur les nomenclatures officielles des différentes sources de données pour permettre les rapprochements, fusions et correspondances

## Outils

La base de donnée est construite en Django http://www.django-fr.org/, le dossier git en présente un design expérimental.
Les données sont stockées en CSV (séparateur virgule).
On souhaite parvenir à écrire une API puis une application permettant d'extraire "à la carte" des composantes de la base complète.

## Données

On utilise les résultats électoraux les plus fins disponibles. (Communes/Bureau de vote lorsqu'ils sont disponibles).
On s'appuie sur les nomenclatures INSEE des communes en prenant compte de leur évolution dans le temps.
Les nuances d'origines des candidats sont prises en compte mais vérifiées et recodées lorsque c'est nécessaire.
Ce travail repose sur l'historique des résultats électoraux déja stocké par différentes institutions.

## Avancement

Nous disposons d'un premier design de la structure de la base de données et des premiers éléments des fichiers sources.

## En cours 

- Reconstitution complète de la géographie des communes, chaque année, avec leur code INSEE.
- Structuration des différentes tables de la base de données.
- Mise en forme des fichiers de résultats électoraux.
- Constitution d'une clef de jonction avec les résultats harmonisés du recensement INSEE de 1968 à 2011.

