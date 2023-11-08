# Alpine :: mgos to Tasmota
![size](https://img.shields.io/docker/image-size/11notes/mgos-to-tasmota/7.2.10?color=0eb305) ![version](https://img.shields.io/docker/v/11notes/mgos-to-tasmota?color=eb7a09) ![pulls](https://img.shields.io/docker/pulls/11notes/mgos-to-tasmota?color=2b75d6) ![activity](https://img.shields.io/github/commit-activity/m/11notes/docker-mgos-to-tasmota?color=c91cb8) ![commit-last](https://img.shields.io/github/last-commit/11notes/docker-mgos-to-tasmota?color=c91cb8)

Run mgos for Tasmota on Alpine Linux. Small, lightweight, secure and fast 🏔️

## Volumes
* **/mgostt/var** - Directory of your build output

## Run
```shell
docker run --name mgos-to-tasmota \
  -v ../var:/mgostt/var \
  -d 11notes/mgos-to-tasmota:[tag] \
    build \
      Shelly3EM \
      Shelly1 \
      Shelly2 \
      Shelly25
```

## Defaults
| Parameter | Value | Description |
| --- | --- | --- |
| `user` | docker | user docker |
| `uid` | 1000 | user id |
| `gid` | 1000 | group id |
| `home` | /mgostt | home directory of user docker |

## Parent image
* [11notes/alpine:stable](https://github.com/11notes/docker-alpine)

## Built with and thanks to
* [Mgos-to-tasmota](https://github.com/yaourdt/mgos-to-tasmota)
* [Alpine Linux](https://alpinelinux.org/)

## Tips
* Only use rootless container runtime (podman, rootless docker)
* Don't bind to ports < 1024 (requires root), use NAT/reverse proxy (haproxy, traefik, nginx)