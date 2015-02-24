# Datacamp 2015

## Objectifs 

Construire une base de données relationelle des résultats électoraux en France.
Le modèle est pensé pour être réutilisable avec peu de modification pour d'autres pays.
Il doit permettre l'ajout de résultats anciens à mesure qu'ils sont numérisés.
Il doit permetter l'ajout des futurs résultats électoraux.
Il s'appuie sur les nomenclatures officielles des différentes sources de données pour permettre les rapprochements, fusions et correspondances

## Outils

La base de donnée est construite en SQL, le dossier git en présente un design expérimental.
Les données sont stockées en CSV (,).
On souhaite parvenir à écrire une api puis une application permettant d'extraire "à la carte" des composantes de la base complète.

## Données

On utilise les résultats électoraux les plus fins disponibles.
On s'appuie sur les nomenclatures insee des communes en prenant compte de leur évolution dans le temps.
Les nuances d'origines des candidats sont prises en compte mais vérifiées et recodées lorsque c'est nécessaire.
Ce travail s'appuie sur l'historique des résultats électoraux déja stocké par différentes institutions.

## Avancement

Nous disposons d'un premier design de la structure de la base de données et des premiers éléments des fichiers sources.
