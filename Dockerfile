###############################################################################################
# levell shlink - BASE
###############################################################################################
FROM shlinkio/shlink:3.5.4 as levell-shlink-base

USER root

RUN apk update
RUN apk add dos2unix

RUN mkdir -p /docker

###############################################################################################
# levell shlink - DEPLOY
###############################################################################################
FROM levell-shlink-base as levell-shlink-deploy

COPY ./docker/custom_entrypoint.sh /docker/custom_entrypoint.sh
RUN chmod +x /docker/custom_entrypoint.sh
RUN dos2unix /docker/custom_entrypoint.sh

COPY ./docker/set_env_secrets.sh /docker/set_env_secrets.sh
RUN chmod +x /docker/set_env_secrets.sh
RUN dos2unix /docker/set_env_secrets.sh

EXPOSE 8080
ENTRYPOINT [ "/docker/custom_entrypoint.sh" ]
