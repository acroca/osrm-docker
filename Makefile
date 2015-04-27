prepare = \
  mkdir -p data && \
	curl $(1) > data/$2.osm.pbf && \
	docker run -v $$(pwd)/data:/data --rm osrm ./osrm-extract /data/$(2).osm.pbf && \
	docker run -v $$(pwd)/data:/data --rm osrm ./osrm-prepare /data/$(2).osrm

run = \
	docker run -v $$(pwd)/data:/data --rm -p 5000:5000 osrm ./osrm-routed /data/$1.osrm

build:
	docker build -t osrm .

prepare-barcelona:
	$(call prepare,"https://s3.amazonaws.com/metro-extracts.mapzen.com/barcelona_spain.osm.pbf","Barcelona")

run-barcelona:
	$(call run,"Barcelona")

prepare-london:
	$(call prepare,"http://download.geofabrik.de/europe/great-britain/england/greater-london-latest.osm.pbf","London")

run-london:
	$(call run,"London")

