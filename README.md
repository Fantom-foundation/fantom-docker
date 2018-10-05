fantom-docker
=============
Docker & related scripts for automated repeatable deployments.

## Dependencies

  - [Docker](https://www.docker.com/get-started)
  - Bash (for shell scripts)

## glider
Glider is our Go development base image.

Build with:

    cd glider
    docker build --compress --force-rm --tag "${PWD##*/}" .

## lachesis

See [README.md in subdirectory](/lachesis).

## evm

See [README.md in subdirectory](/evm).
