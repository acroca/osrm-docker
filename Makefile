run = \
	docker run -v $$(pwd)/data:/data --rm -p 5000:5000 osrm ./run.sh $1 $2

build:
	docker build -t osrm .

run-barcelona:
	$(call run,Barcelona,https://s3.amazonaws.com/metro-extracts.mapzen.com/barcelona_spain.osm.pbf)

run-london:
	$(call run,London,http://download.geofabrik.de/europe/great-britain/england/greater-london-latest.osm.pbf)

