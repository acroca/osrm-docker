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
	$(call prepare,"http://download.bbbike.org/osm/bbbike/Barcelona/Barcelona.osm.pbf","Barcelona")

run-barcelona:
	$(call run,"Barcelona")

