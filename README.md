# TKey device app builder image
This repository provides a OCI image (_dockerized_ environment) to simplify the build process of TKey device apps.

It is based on the [official image by Tillitis](ghcr.io/tillitis/tkey-builder), with the addition of `clang-tidy` for linting.

## Usage
To build a device app, you need the TKey device libraries, in a directory next to this one. The device libraries are available in:
```
https://github.com/tillitis/tkey-libs
```

Clone them next this repo and build them first. Then:
```
cd your-app
podman run --mount type=bind,source=.,target=/src --mount type=bind,source=../tkey-libs,target=/tkey-libs -w /src -it ghcr.io/nowitis/tkey-deviceapp-builder make -j app
```
