FROM node:lts-slim

# set version label
LABEL github_repository="https://github.com/LBBO/netflix-migrate"
LABEL docker_github_repository="https://github.com/origamiofficial/docker-netflix-migrate/tree/main/Beta"
LABEL maintainer="OrigamiOfficial"

# environment settings
WORKDIR /Data
ENV COOKIE "qwerty123"
ENV PROFILE_NAME John
ENV OPERATION export
ENV FILE_NAME NetflixData.json

# update & install
RUN npm install --location=global npm@latest
RUN npm install --location=global netflix-migrate@2.0.0-beta.2

# target run
CMD npx netflix-migrate --cookie $COOKIE --profile $PROFILE_NAME --$OPERATION $FILE_NAME

# volumes
VOLUME /Data
