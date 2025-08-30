# ubuntu-bitnami-mongodb

Non-official copy of the Bitnami MongoDB image but using Ubuntu instead of Debian.

- Base image: `ubuntu:24.04`
- Works like the Bitnami mongodb image
- Support for AMD64 and ARM64 architectures

> [!WARNING]
> The image is not well tested yet, but it should work as expected. Official binaries from MongoDB and Bitnami are used.

- Installed software in the image:
    - [yq](https://github.com/mikefarah/yq)
    - [wait-for-port](https://github.com/bitnami/wait-for-port)
    - [render-template](https://github.com/bitnami/render-template)
    - [MongoDB and MongoDB-Shell](https://www.mongodb.com/try/download/community)

## Why another image?

Official Bitnami image has some limitations:

    - Singe 28th August 2024, Bitnami no longer will provide new updates for the current Debian based images.
    - MongoDB in Debian is not available for ARM64 architecture.
    - The minideb package used by Bitnami seems complicated to me and it does not fit my own use cases.

## Credits

- This project was inspired by the official Bitnami MongoDB image.
- @dlavrenuek image at [dlavrenuek/bitnami-mongodb-arm](https://github.com/dlavrenuek/bitnami-mongodb-arm), which is also a non-official copy of the Bitnami MongoDB image for ARM64 architecture but using Debian.

## Usage

To test the image, you can run:

```
docker compose up
```

Or for Replica Set:

```
docker compose -f docker-compose-replicaset.yml up
```
