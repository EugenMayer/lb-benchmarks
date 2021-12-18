nginx: test
	echo "-------- nginx"
	docker-compose exec client wrk -t20 -c1000 -d30s -H "Host: whoami.test" --latency  http://nginx:8080/bench

haproxy: test
	echo "-------- haprox"
	docker-compose exec client wrk -t20 -c1000 -d30s -H "Host: whoami.test" --latency  http://haproxy:8080/bench

traefik: test
	echo "traefik"
	docker-compose exec client wrk -t20 -c1000 -d30s -H "Host: whoami.test" --latency  http://traefik:8080/bench

envoy: test
	echo "envoy"
	docker-compose exec client wrk -t20 -c1000 -d30s -H "Host: whoami.test" --latency  http://envoy:10000/bench

baseline: test
	echo "baseline"
	docker-compose exec client wrk -t20 -c1000 -d30s -H "Host: whoami.test" --latency  http://whoami:80/bench

all: baseline traefik nginx envoy

test:
	echo 'testing'