nginx: start test
	echo "-------- nginx"
	docker-compose exec warp /warp put --host nginx:8080 --access-key minio --secret-key miniominiominio --autoterm

haproxy: start test
	echo "-------- haprox"
	docker-compose exec warp /warp put --host haproxy:8080 --access-key minio --secret-key miniominiominio --autoterm

traefik: start test
	echo "traefik"
	docker-compose exec warp /warp put --host traefik:8080 --access-key minio --secret-key miniominiominio --autoterm

envoy: start test
	echo "envoy"
	docker-compose exec warp /warp put --host envoy:10000 --access-key minio --secret-key miniominiominio --autoterm

baseline: start test
	echo "baseline"
	docker-compose exec warp /warp put --host minio1:9000 --access-key minio --secret-key miniominiominio --autoterm

all: start baseline traefik nginx envoy

start: 
	docker-compose up -d

test:
	echo 'testing'