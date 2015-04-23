# Docker image for OSRM

This project lets you prepare and run a docker container with OSRM and the map of your choice.

## Setup

First build the docker image:

```
make build
```

The image is tagged as `osrm`

## Prepare the map

For now the only hardcoded map available to use is Barcelona. Is not hard to change (check the Makefile), you just need the URL to a different `.osm.pfb` file.

```
make prepare-barcelona
```

## Run the app

Once the OSRM map is extracted and prepared, you are ready to run the server. Again, the current code just supports Barcelona, but it's very easy to change.

```
make run-barcelona
```
