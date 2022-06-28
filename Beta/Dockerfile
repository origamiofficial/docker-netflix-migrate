FROM node:lts-slim

# set version label
LABEL github_repository="https://github.com/LBBO/netflix-migrate"
LABEL docker_github_repository="https://github.com/origamiofficial/docker-netflix-migrate/tree/main/Beta"
LABEL maintainer="OrigamiOfficial"

# environment settings
WORKDIR /Data
ENV NETFLIX_ID "qwerty123"
ENV SECURE_NETFLIX_ID "abcde123"
ENV PROFILE_NAME John
ENV OPERATION export
ENV FILE_NAME NetflixData.json

# update & install
RUN npm install --location=global npm@latest
RUN npm install --location=global netflix-migrate@2.0.0-beta.2

# target run
CMD npx netflix-migrate --cookie "NetflixId=$NETFLIX_ID;SecureNetflixId=$SECURE_NETFLIX_ID" --profile $PROFILE_NAME --$OPERATION $FILE_NAME

# volumes
VOLUME /Data
