nginx: start test
	echo "-------- nginx"
	docker-compose exec client wrk -t20 -c1000 -d30s -H "Host: whoami.test" --latency  http://nginx:8080/bench

haproxy: start test
echo "-------- haproxy"
	docker-compose exec client wrk -t20 -c1000 -d30s -H "Host: whoami.test" --latency  http://haproxy:8080/bench

traefik: start test
	echo "traefik"
	docker-compose exec client wrk -t20 -c1000 -d30s -H "Host: whoami.test" --latency  http://traefik:8080/bench

envoy: start test
	echo "envoy"
	docker-compose exec client wrk -t20 -c1000 -d30s -H "Host: whoami.test" --latency  http://envoy:10000/bench

baseline: start test
	echo "baseline"
	docker-compose exec client wrk -t20 -c1000 -d30s -H "Host: whoami.test" --latency  http://whoami:80/bench

all: start baseline traefik haproxy nginx envoy

start: 
	docker-compose up -d

test:
	echo 'testing'