# netflix-migrate 
[![Build Status](https://travis-ci.com/LBBO/netflix-migrate.svg?branch=master)](https://travis-ci.com/LBBO/netflix-migrate) ![Docker Pulls](https://img.shields.io/docker/pulls/rlabinc/netflix-migrate.svg?style=flat&label=pulls&logo=docker) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/rlabinc/netflix-migrate/latest.svg?style=flat&label=image&logo=docker) ![GitHub Repo stars](https://img.shields.io/github/stars/LBBO/netflix-migrate?style=social)

[netflix-migrate](https://github.com/LBBO/netflix-migrate) is a command line utility to export and import your ratings.

## ⚠️ This repository is no longer actively maintained due to a native implementation of its features
Netflix has implemented a migration feature natively, rendering this project basically useless. While netflix-migrate is able to export slightly more detailed data than you can get from Netflix's native export, the maintanance effort is quite high as they regularly change their API, thereby just breaking the project over night. Hence [@LBBO](https://github.com/LBBO) have decided to officially stop maintaining [this](https://github.com/LBBO/netflix-migrate) project (at least until the need for it resurfaces), so am I.

If you're looking to migrate your profile to another Netflix account, please refer to [the documentation of the official account transfer feature](https://help.netflix.com/en/node/124844). If you want to use this project despite the official feature, please refer to the [`Beta` branch](https://github.com/origamiofficial/docker-netflix-migrate/tree/main/Beta) which contains the latest version which hadn't been merged yet.

## Supported Architectures

We utilise the docker buildx for multi-platform awareness. More information is available from docker [here](https://docs.docker.com/buildx/working-with-buildx/).

Simply pulling `rlabinc/netflix-migrate:latest` should retrieve the correct image for your arch, but you can also pull specific arch images via tags.

The architectures supported by this image are:

| Architecture | Available | Tag |
| :----: | :----: | ---- |
| x86-64 | ✅ | amd64-\<version tag\> |
| arm64 | ✅ | arm64-\<version tag\> |
| armhf| ✅ | arm32v7-\<version tag\> |

## Usage
It's also worth noting that you can't have an open tab with Netflix while using netflix-migrate.
```bash
docker run -it --rm \
  --name=netflix-migrate \
  -e TZ=Europe/London `#optional` \
  -e EMAIL=mail@example.com \
  -e PASSWORD='qwerty123' `#better to use single quotes` \
  -e PROFILE_NAME=John \
  -e OPERATION=export `#import or export` \
  -e FILE_NAME=NetflixData.json \
  -v /path/to/Data:/Data \
  rlabinc/netflix-migrate:latest
```

Your exported data will also contain your viewing history. Currently, the import function is only able to import the rating history, but that will hopefully change soon. However, you now already have your data and once the functionality is added you will be able to import your old viewing history too, even if you don't have any access to the old account anymore.

## Parameters

Container images are configured using parameters passed at runtime (such as those above).

| Parameter | Function |
| :----: | --- |
| `-e TZ=Europe/London` | Specify a timezone to use EG Europe/London. |
| `-e EMAIL=mail@example.com` | Specify email to use. |
| `-e PASSWORD='qwerty123'` | Specify Netflix password. It is better to use single quotes. |
| `-e PROFILE=John` | Specify Netflix profile name. |
| `-e OPERATION=export` | Set to `export` to export Netflix data or set `import` to import data. |
| `-e FILE_NAME=NetflixData.json` | Specify the data file name. |
| `-v /Data` | Local path for netflix-migrate data file. |

## Github Repository
https://github.com/LBBO/netflix-migrate

## Docker Hub
https://hub.docker.com/r/rlabinc/netflix-migrate

## Acknowledgements
All credit goes to [@LBBO](https://github.com/LBBO).

## Warning

Use of this software may constitute a breach in the [Netflix Terms of Use](https://help.netflix.com/legal/termsofuse) and/or the [End User License Agreement](https://help.netflix.com/legal/eula). Use at your own risk.

[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https://github.com/origamiofficial/docker-netflix-migrate&icon=github.svg&icon_color=%23FFFFFF&title=hits&edge_flat=false)](https://github.com/origamiofficial/docker-netflix-migrate)
