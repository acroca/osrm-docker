build:
	docker build -t osrm .

prepare-barcelona:
	curl "http://download.bbbike.org/osm/bbbike/Barcelona/Barcelona.osm.pbf" > data/Barcelona.osm.pbf &&
	docker run -v $$(pwd)/data:/data --rm osrm ./osrm-extract /data/Barcelona.osm.pbf &&
	docker run -v $$(pwd)/data:/data --rm osrm ./osrm-prepare /data/Barcelona.osrm

run-barcelona:
	docker run -v $$(pwd)/data:/data --rm -p 5000:5000 osrm ./osrm-routed /data/Barcelona.osrm

