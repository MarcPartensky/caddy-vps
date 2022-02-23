push: build
	docker push marcpartensky/caddy-vps
build:
	docker build . -t marcpartensky/caddy-vps
