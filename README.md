# WAT

Benchmark different load balancers.

We are comparing

 - baseline (no lb)
 - Treafik
 - Nginx
 - Envoy

We are using `https://github.com/wg/wrk` as a client to generate load and `https://hub.docker.com/r/containous/whoami`.
There are no particular reasons to not pick anything else, we just had the impression that this combination with the below parameter fit the usual 
"bandwith heavy" payloads like `docker pull/push` faily well.

Open a PR and add a different backend/client for comparison anytime, happy to see those compared.

Spoiler: It seems like Envoy beats everything - actually by a good margin.

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
