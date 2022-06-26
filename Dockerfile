FROM node:lts-slim

# set version label
LABEL github_repository="https://github.com/LBBO/netflix-migrate"
LABEL docker_github_repository=""
LABEL maintainer="OrigamiOfficial"

# environment settings
WORKDIR /Data
ENV EMAIL mail@example.com
ENV PASSWORD qwerty123
ENV PROFILE_NAME John
ENV OPERATION export
ENV FILE_NAME NetflixData.json

# update & install
RUN npm install --location=global npm@latest
RUN npm install --location=global netflix-migrate

# target run
CMD npx netflix-migrate --email $EMAIL --password $PASSWORD --profile $PROFILE_NAME --$OPERATION $FILE_NAME

# volumes
VOLUME /Data
