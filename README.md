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

- E: 48/1.5/3.5/12
  specs: AMD Ryzen 7 5800X / 64GB RAM / NvME (WD Black SN850)
