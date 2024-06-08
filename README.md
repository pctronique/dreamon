# dreamon
Par [pctronique](https://pctronique.fr/) <br />
Version 1.1.0

<details>
  <summary>Table des matières</summary>
  <ol>
    <li><a href="#Présentation">Présentation</a></li>
    <li>
        <a href="#Installation">Installation</a>
        <ul>
            <li><a href="#Le-nom-du-projet">Le nom du projet</a></li>
            <li><a href="#Le-fichier-env">Le fichier .env</a></li>
            <li><a href="#Création-des-conteneurs">Création des conteneurs</a></li>
            <li><a href="#Où-placer-le-code">Où placer le code</a></li>
        </ul>
    </li>
    <li>
        <a href="#Config">Config</a>
        <ul>
            <li><a href="#Configurations-du-SGBD-du-site">Configurations SGBD du site</a></li>
        </ul>
    </li>
    <li>
        <a href="#Dossiers-de-configuration-par-défaut">Dossiers de configuration par défaut</a>
        <ul>
          <li><a href="#Config-dans-www">Config dans www</a></li>
          <li><a href="#Data-dans-www">Data dans www</a></li>
          <li><a href="#Sgbd-data">Sgbd dataw</a></li>
          <li><a href="#Email-data">Email data</a></li>
        </ul>
    </li>
    <li><a href="#Cron">Cron</a></li>
    <li>
        <a href="#Stockages">Stockages</a>
        <ul>
          <li><a href="#Les-données-de-la-base-de-données">Les données de la base de données</a></li>
          <li><a href="#Les-données-de-mailhog">Les données de mailhog</a></li>
        </ul>
    </li>
    <li>
        <a href="#Autres-informations">Autres informations</a>
        <ul>
            <li><a href="#Versions">Versions</a></li>
            <li><a href="#Installer-la-dernière-version">Installer la dernière version</a></li>
        </ul>
    </li>
  </ol>
</details>

## Présentation

Pour créer un projet react avec docker.

Pour Windows, Linux et Mac.

Les versions :
<ul>
  <li>react:18.3.1</li>
  <li>nodejs:22.1.0</li>
  <li>mongo:7.0.9</li>
  <li>mongo-express:1.0.2-20</li>
  <li>mailhog:v1.0.0</li>
</ul>

> [!NOTE]
> Ce code doit être mis dans votre projet git et devra être transmis sur le git (sans le fichier « README.md » pour pas écraser le vôtre).
>
> Il fera partie du projet. Et le faire pour chaque projet react.

## Installation

Vous devez avoir installé [docker-desktop](https://www.docker.com/products/docker-desktop/) sur votre système d'exploitation avant de pouvoir utiliser ce code.

### Le nom du projet

Modifier le nom du projet dans le fichier « .env.example » :
```
NAME_PROJECT=dreamon
```
Mettre le nom du projet.

> [!WARNING]
> Le faire avant de créer le fichier « .env ».

### Le fichier .env

Sur un terminal (pour créer le fichier « .env ») :
```
$ cp .env.example .env
```

Il est possible de modifier les ports dans le fichier « .env » (il est préférable de conserver les ports par défaut dans l’exemple).
```
VALUE_REACT_PORT=3000
VALUE_MONGOEXP_PORT=8080
VALUE_MAILHOG_PORT=8020
```

> [!NOTE]
> Exemple :
>
> Vous pouvez incrémenter les ports avec la technique suivante :
>
> => 0 pour le projet 0
>
> => 1 pour le projet 1
> ```
> VALUE_REACT_PORT=3001
> VALUE_MONGOEXP_PORT=8081
> VALUE_MAILHOG_PORT=8021
> ```
>
> => 2 pour le projet 2
> ```
> VALUE_REACT_PORT=3002
> VALUE_MONGOEXP_PORT=8082
> VALUE_MAILHOG_PORT=8022
> ```

### Création des conteneurs

```
$ docker compose up -d
```
> [!WARNING]
> Vous avez besoin du fichier « .env », sinon vous allez avoir des erreurs.

### Où placer le code

Le code devra être placé dans le dossier « www ».

## Config

### Configurations du SGBD du site
Modifier le nom de la base de données dans le fichier « .env.example » et faire la modification dans le fichier « .env » (si celui-ci existe).

```
SGBD_DATABASE=project
```

## Dossiers de configuration par défaut

### Config dans www

Vous pouvez déplacer le dossier « config » du dossier « www », mais il doit rester dans ce dossier.
Par exemple le placer dans « src/config » (« www/src/config »).

> [!NOTE]
> Ceci concerne seulement le dossier « config » qui se trouve dans le dossier « www ».

Remplacer la ligne dans le fichier « .env.example »:
```
FOLDER_CONFIG=config
```
Par le nouveau chemin :
```
FOLDER_CONFIG=src/config
```

Pas oublier de le modifier dans le fichier « .gitignore », pour ne pas transmettre les fichiers qui devront être seulement utilisé en local :
```
/www/config/.env
/www/config/connection_server.json
/www/config/connection_mongo.json
/www/config/config_email.json
```
Par le nouveau chemin :
```
/www/src/config/.env
/www/src/config/connection_server.json
/www/src/config/connection_mongo.json
/www/src/config/config_email.json
```

> [!WARNING]
> Le faire avant de créer le fichier « .env » et de construire les conteneurs. Sinon, supprimer les conteneurs et le fichier « .env » avant de modifier l'emplacement du dossier.

### Data dans www

Il va permettre de récupérer des fichiers par défaut lors de la création du conteneur.
Vous pouvez déplacer le dossier « data » du dossier « www », mais il doit rester dans ce dossier.
Par exemple le placer dans « src/data » (« www/src/data »).

> [!NOTE]
> Ceci concerne seulement le dossier « data » qui se trouve dans le dossier « www ».

Remplacer la ligne dans le fichier « .env.example »:
```
FOLDER_DATA=data
```
Par le nouveau chemin :
```
FOLDER_DATA=src/data
```

Pas oublier de le modifier dans le fichier « .gitignore », pour ne pas transmettre les fichiers qui devront être seulement utilisé en local :
```
/www/data
```
Par le nouveau chemin :
```
/www/src/data
```

> [!NOTE]
> Il va se construit dans votre dossier au moment de la création du conteneur et il va se remplir à partir du dossier « ./config/data/ ».

> [!WARNING]
> Le faire avant de créer le fichier « .env » et de construire les conteneurs. Sinon, supprimer les conteneurs et le fichier « .env » avant de modifier l'emplacement du dossier.

### Sgbd data

Il va permettre de récupérer les bases de données par défaut.
Vous devez placer les fichiers json dans le dossier « ./config/sgbd_data/ » pour récupérer une base de données par défaut.

### Email data

Il va permettre de récupérer les emails par défaut.
Vous devez placer les fichiers "@mailhog.example" dans le dossier « ./config/email_data/ » pour récupérer les emails par défaut.

## Cron

Vous pouvez facilement mettre en place des tâches planifiés.
Vous devez les placer dans le fichier « ./config/dockercron ».

Exemple (dans « ./config/dockercron ») :
```
*  *  *  *  * echo "hello" >> /var/log/docker/nodejs/testcron.log
*  *  *  *  * echo "hello projet" >> /home/project/www/testcron.log
```

> [!NOTE]
> Toutes modifications du fichier sera récupérée automatiquement par le conteneur.

> [!WARNING]
> Il est préférable d'utiliser le cron de nodejs au lieu de celui-ci.

## Stockages

### Les données de la base de données

Le dossier « .dockertmp/mongo_data/ » va contenir la base de données, ceci permet de ne pas perdre la base de données quand on supprime le conteneur (si on veut supprimer la base de données, il faut supprimer le conteneur de celui-ci et ce dossier).

> [!WARNING]
> Le dossier « .dockertmp » ne doit pas être mis sur le github, c’est un dossier temporaire.

Vous pouvez entrer une base de données par défaut du projet, il suffit d'exporter la base de données sous format json et le placer dans le dossier « config/sgbd_data ».

> [!NOTE]
> Il est préférable d'entrer une base de données par défaut, pour pouvoir avoir un site directement opérationnel après l'installation des conteneurs et pouvoir directement repartir sur le code sans devoir tout reconfigurer. Quand on revient des années après sur le projet, on doit juste installer les conteneurs et on a directement le site sans aucune autre modification à faire, on peut directement coder.

### Les données de mailhog

Le dossier « .dockertmp/mailhog/ » va contenir les emails, ceci permet de ne pas perdre les emails quand on supprime le conteneur, vous pouvez le faire à partir de mailhog.
Si vous voulez supprimer les emails après avoir supprimé le conteneur, il faudra supprimer ce dossier.

> [!WARNING]
> Le dossier « .dockertmp » ne doit pas être mis sur le github, c’est un dossier temporaire.

## Autres informations

### Versions

Pour que le projet soit toujours valide, il est préférable de mettre en place des versions fixes.

> [!WARNING]
> Le faire avant de créer le fichier « .env ».

Il est possible de modifier les versions des conteneurs dans le fichier « .env.example ».
```
VALUE_NODEJS_VERSION=22.1.0
VALUE_MONGO_VERSION=7.0.9
VALUE_MONGOEXP_VERSION=1.0.2-20
VALUE_MAILHOG_VERSION=v1.0.0
```

> [!NOTE]
> Prendre une version fpm pour php.

### Installer la dernière version
> [!WARNING]
> À utiliser une seule fois dans la création du projet et ensuite remettre la valeur des versions que vous aurez obtenue. Ne surtout pas conserver ce format dans un projet.

```
VALUE_NODEJS_VERSION=latest
VALUE_MONGO_VERSION=latest
VALUE_MONGOEXP_VERSION=latest
VALUE_MAILHOG_VERSION=latest
```
