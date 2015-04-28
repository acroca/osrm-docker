# Docker image for OSRM

This project lets you prepare and run a docker container with OSRM and the map of your choice.

## Run

First you'll need to prepare the url to your `.osm.pfb` source file.

Run your data container. The data container will keep your map files even if you restart your OSRM server.

```
docker run \
    -v /data \
    --name osrm-data \
    acroca/osrm-docker:latest \
    echo "running data container..."
```

Now you can run your osrm server with any map.

```
docker run \
    -d \
    --volumes-from osrm-data \
    -p 5000:5000 \
    acroca/osrm-docker:latest \
    ./run.sh \
        Barcelona \
        "https://s3.amazonaws.com/metro-extracts.mapzen.com/barcelona_spain.osm.pbf"
```

The first argument is the name you want to give to the map. It's used mostly as a file name in the data storage.
The second argument is the URL to your source map file.
