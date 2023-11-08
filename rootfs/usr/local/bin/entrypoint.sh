#!/bin/ash
  if [ ! -z "${1}" ]; then
    case "${1}" in
      "build")
        for DEVICE in "$@"; do
          if [ ! "${DEVICE}" = "${1}" ]; then
            echo "building firmware for [ ${DEVICE} ]"
            shelly \
              ${DEVICE} \
              esp8266 
            echo
            echo
          fi 
        done
      ;;
    esac
  else
    cd ${APP_ROOT}/lib
    /bin/ash
  fi