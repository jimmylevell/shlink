FROM mattermost/mattermost-enterprise-edition:7.5.1

USER root

RUN mkdir -p /docker

COPY ./docker/custom_entrypoint.sh /docker/custom_entrypoint.sh
RUN chmod +x /docker/custom_entrypoint.sh
RUN dos2unix /docker/custom_entrypoint.sh

COPY ./docker/set_env_secrets.sh /docker/set_env_secrets.sh
RUN chmod +x /docker/set_env_secrets.sh
RUN dos2unix /docker/set_env_secrets.sh

USER mattermost

ENTRYPOINT [ "/docker/custom_entrypoint.sh" ]
