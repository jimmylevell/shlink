###############################################################################################
# levell traefik - BASE
###############################################################################################
FROM shlinkio/shlink:stable as levell-shlink-base

USER root

RUN mkdir -p /docker

###############################################################################################
# levell traefik - DEPLOY
###############################################################################################
FROM levell-shlink-base as levell-shlink-DEPLOY

COPY ./docker/custom_entrypoint.sh /docker/custom_entrypoint.sh
RUN chmod +x /docker/custom_entrypoint.sh
RUN dos2unix /docker/custom_entrypoint.sh

COPY ./docker/set_env_secrets.sh /docker/set_env_secrets.sh
RUN chmod +x /docker/set_env_secrets.sh
RUN dos2unix /docker/set_env_secrets.sh

USER mattermost

ENTRYPOINT [ "/docker/custom_entrypoint.sh" ]
