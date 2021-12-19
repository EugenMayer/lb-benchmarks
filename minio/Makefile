nginx: start test
	echo "-------- nginx"
	docker-compose exec warp /warp mixed --host nginx:8080 --access-key minio --secret-key miniominiominio --autoterm

haproxy: start test
		echo "-------- haprox"
	docker-compose exec warp /warp mixed --host haproxy:8080 --access-key minio --secret-key miniominiominio --autoterm

traefik: start test
	echo "traefik"
	docker-compose exec warp /warp mixed --host traefik:8080 --access-key minio --secret-key miniominiominio --autoterm

envoy: start test
	echo "envoy"
	docker-compose exec warp /warp mixed --host envoy:10000 --access-key minio --secret-key miniominiominio --autoterm

baseline: start test
	echo "baseline"
	docker-compose exec warp /warp mixed --host minio1:9000 --access-key minio --secret-key miniominiominio --autoterm

all: start baseline traefik haproxy nginx envoy

start: 
	docker-compose up -d

test:
	echo 'testing'