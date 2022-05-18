push: build
	docker push marcpartensky/caddy
build:
	docker build . -t marcpartensky/caddy
