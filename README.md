# WAT

Benchmark different load balancers.

We are comparing

- baseline (no lb)
- Treafik
- Nginx
- Haproxy
- Envoy

We are using `https://github.com/wg/wrk` as a client to generate load and `https://hub.docker.com/r/containous/whoami`.
There are no particular reasons to not pick anything else, we just had the impression that this combination with the below parameter fit the usual
"bandwith heavy" payloads like `docker pull/push` faily well.

Open a PR and add a different backend/client for comparison anytime, happy to see those compared.

Spoiler: It seems like Envoy beats everything - actually by a good margin.

# Usage

To run all benchmarks at once do

```bash
make all
```

Or manually

```bash
make baseline
make traefik
make nginx
make haproxy
make envoy
```

# Test suite

- we use [wrk](https://github.com/wg/wrk) as a test client
- Invoked via `wrk -t20 -c1000 -d30s -H "Host: whoami.test" --latency` so with 20 Threads and 1000 Connections over a time period of 30 seconds

# Results

| Baseline | Traefik | Nginx   | Haproxy | Envoy  | (Specs)                                                                 |
| -------- | ------- | ------- | ------- | ------ | ----------------------------------------------------------------------- |
| 48MB/s   | 1.5MB/s | 3.5MB/s | 5MB/s   | 12MB/s | AMD Ryzen 7 5800X - 64GB RAM - NvME (WD Black SN850) - Linux 5.15 adm64 |
|          |         |         |         |        |                                                                         |
