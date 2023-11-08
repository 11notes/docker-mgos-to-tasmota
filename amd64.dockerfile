# :: Header
  FROM 11notes/alpine:stable
  ENV APP_ROOT=/mgostt
  ENV APP_VERSION=v0.4.6

# :: Run
  USER root

  # :: update image
    RUN set -ex; \
      apk --no-cache add \
        git; \
      apk --no-cache upgrade;

  # :: prepare image
    RUN set -ex; \
      mkdir -p ${APP_ROOT}/var; \
      mkdir -p ${APP_ROOT}/lib;

  # :: install application
    RUN set -ex; \
      curl -fsSL https://mongoose-os.com/downloads/mos/install.sh | /bin/ash; \
      mv /root/.mos/bin/mos /usr/local/bin; \
      mv /root/.mos ${APP_ROOT}/lib; \
      git clone https://github.com/yaourdt/mgos-to-tasmota.git; \
      cd /mgos-to-tasmota; \
      git checkout ${APP_VERSION}; \
      wget https://github.com/yaourdt/mgos-to-tasmota/files/8550673/mgos-to-tasmota-shelly3em.patch.gz; \
      gzip -d ./mgos-to-tasmota-shelly3em.patch.gz; \
      git apply ./mgos-to-tasmota-shelly3em.patch; \
      mv /mgos-to-tasmota/* ${APP_ROOT}/lib;

  # :: copy root filesystem changes and add execution rights to init scripts
    COPY ./rootfs /
    RUN set -ex; \
      chmod +x -R /usr/local/bin;

  # :: change home path for existing user and set correct permission
    RUN set -ex; \
      usermod -d ${APP_ROOT} docker; \
      chown -R 1000:1000 \
        ${APP_ROOT};

# :: Volumes
  VOLUME ["${APP_ROOT}/var"]

# :: Start
  USER docker
  ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]