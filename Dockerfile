FROM node:lts-slim

# set version label
LABEL github_repository="https://github.com/LBBO/netflix-migrate"
LABEL docker_github_repository="https://github.com/origamiofficial/docker-netflix-migrate"
LABEL maintainer="OrigamiOfficial"

# environment settings
ENV HOME="/Netflix"
ENV EMAIL mail@example.com
ENV PASSWORD qwerty123
ENV PROFILE_NAME John
ENV OPERATION export
ENV FILE_NAME NetflixData.json

# update & install
RUN npm install --location=global npm@latest
RUN npm install --location=global netflix-migrate

# volumes
CMD npx netflix-migrate --email $EMAIL --password $PASSWORD --profile $PROFILE_NAME --$OPERATION $FILE_NAME
