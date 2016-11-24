# dockerized OpenTelekom Toolset (otc-tools)

The otc-tools is an bash script for useing the OpenTelekomCloud,
all tools are bundled in a well defined environment.
Encapsulate in a docker container.

## Build the container

### Build Command

As usual:

  docker build --rm --force-rm -t curx/otc-tools:latest .

## Usage and run the OTC Client

The OpenStack credential are needed, and should be located in
a file, e.g. .ostackrc or similar.

Run a container with the credetials exposed as a docker-volume:

  docker run -ti --rm --volume $path_to_cred$:/root/.ostackrc:ro curx/otc-tools otc-tools-cmd
