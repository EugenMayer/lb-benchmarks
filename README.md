# WAT

Benchmark different load balancers

# Usage

```
make all
```

## baseline

(direct access)

```bash
docker-compose exec client wrk -t20 -c1000 -d30s -H "Host: whoami.test" --latency  http://whoami:80/bench
```

## traefik

```bash
docker-compose exec client wrk -t20 -c1000 -d30s -H "Host: whoami.test" --latency  http://traefik:8080/bench
```

## nginx

```bash
docker-compose exec client wrk -t20 -c1000 -d30s -H "Host: whoami.test" --latency  http://nginx:8080/bench
```

## envoy

```bash
docker-compose exec client wrk -t20 -c1000 -d30s -H "Host: whoami.test" --latency  http://envoy:10000/bench
```

# Results

baseline/traefik/nginx/envoy `MB/s`

- E: 48/1/3/12
