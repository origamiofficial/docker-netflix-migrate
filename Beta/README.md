# netflix-migrate [![Build Status](https://travis-ci.com/LBBO/netflix-migrate.svg?branch=master)](https://travis-ci.com/LBBO/netflix-migrate) ![Docker Pulls](https://img.shields.io/docker/pulls/rlabinc/netflix-migrate.svg?style=flat&label=pulls&logo=docker) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/rlabinc/netflix-migrate/beta.svg?style=flat&label=image&logo=docker) ![Docker Stars](https://img.shields.io/docker/stars/rlabinc/netflix-migrate.svg?style=flat&label=stars&logo=docker) ![GitHub Repo stars](https://img.shields.io/github/stars/LBBO/netflix-migrate?style=social)

[netflix-migrate](https://github.com/LBBO/netflix-migrate/tree/cookie-login) is a command line utility to export and import your ratings.

## Supported Architectures

We utilise the docker buildx for multi-platform awareness. More information is available from docker [here](https://docs.docker.com/buildx/working-with-buildx/).

Simply pulling `rlabinc/netflix-migrate:beta` should retrieve the correct image for your arch, but you can also pull specific arch images via tags.

The architectures supported by this image are:

| Architecture | Available | Tag |
| :----: | :----: | ---- |
| x86-64 | ✅ | amd64-\<version tag\> |
| arm64 | ✅ | arm64-\<version tag\> |
| armhf| ✅ | arm32v7-\<version tag\> |

## Usage
You will have to extract the cookie Netflix sets for you
and provide it to the CLI. But don't worry, I'll guide you through the entire process. It's also worth noting that you can't have an open tab with Netflix while using netflix-migrate.

## Extracting the cookie [Easy Method]
First install [EditThisCookie](https://chrome.google.com/webstore/detail/editthiscookie/fngmhnnpilhplaeedifhccceomclgfbg) browser extension or any other extension like this. Now open the Netflix website & login into your account if you haven't done so. Open EditThisCookie & copy both values of `NetflixId`,`SecureNetflixId` cookies.

## Extracting the cookie [Manual Method]
First, you'll need to login to Netflix and select your profile, just as usual. Now, please open your
browser's dev tools by pressing F12 or right-clicking on the website and choosing "Inspect". Please
select the "Network" tab on the top of the window that just popped up.

You should see a list of requests that Netflix is making. Scroll to the very top, where you should find
a request to `www.netflix.com`. If you don't see this request, just reload the page while the network tab
is open and look for it, again. Make sure you do not miss any characters.

Next, please click on this request. A new area should appear with a tab named "Headers". In that tab, please
scroll down to the area titled "Request Headers" and search for `cookie: [very long value]`. Please copy
both `NetflixId=` & `SecureNetflixId=` values manually selecting it with your mouse and pressing Ctrl + C (right-clicking and
choosing "Copy value" can lead to incorrect results in some browsers). Make sure you do not miss any
characters.

## Passing the cookie to the CLI
Now that you've got your cookie, you can execute the actual commands. Please replace the actual values
below with your own. Make sure both cookies are surrounded by single quotation marks! Sometimes at the end of the `NetflixId` cookie, there can be a full stop `.` You must have to include this too!
Here are the commands you'll need:

```bash
docker run -it --rm \
  --name=netflix-migrate \
  -e TZ=Europe/London `#optional` \
  -e NETFLIX_ID='qwerty123' \
  -e SECURE_NETFLIX_ID='abcde123' \
  -e PROFILE_NAME=John \
  -e OPERATION=export `#import or export` \
  -e FILE_NAME=NetflixData.json \
  -v /path/to/Data:/Data \
  rlabinc/netflix-migrate:beta
```

Your exported data will also contain your viewing history. Currently, the import function is only able to import the rating history, but that will hopefully change soon. However, you now already have your data and once the functionality is added you will be able to import your old viewing history too, even if you don't have any access to the old account anymore.

## Parameters

Container images are configured using parameters passed at runtime (such as those above).

| Parameter | Function |
| :----: | --- |
| `-e TZ=Europe/London` | Specify a timezone to use EG Europe/London. |
| `-e NETFLIX_ID='qwerty123'` | Specify NetflixId cookie to use. |
| `-e SECURE_NETFLIX_ID='abcde123'` | Specify SecureNetflixId cookie to use. |
| `-e PROFILE=John` | Specify Netflix profile name. |
| `-e OPERATION=export` | Set to `export` to export Netflix data or set `import` to import data. |
| `-e FILE_NAME=NetflixData.json` | Specify the data file name. |
| `-v /Data` | Local path for netflix-migrate data file. |

## Github Repository
https://github.com/LBBO/netflix-migrate/tree/cookie-login

## Docker Hub
https://hub.docker.com/r/rlabinc/netflix-migrate

## Acknowledgements
All credit goes to [@LBBO](https://github.com/LBBO). Special thanks to [@Flavien06](https://github.com/Flavien06) for figure [this](https://github.com/LBBO/netflix-migrate/issues/61#issuecomment-980552615) out.

## Warning

Use of this software may constitute a breach in the [Netflix Terms of Use](https://help.netflix.com/legal/termsofuse) and/or the [End User License Agreement](https://help.netflix.com/legal/eula). Use at your own risk.
