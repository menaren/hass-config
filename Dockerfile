ARG HA_VERSION=2021.10

FROM alpine/git as build

ARG REPO_URL

RUN git clone --progress --depth 1 --no-tags ${REPO_URL} temp \
    && rm -rf temp/.git

FROM homeassistant/home-assistant:${HA_VERSION}


COPY --from=build /git/temp /config