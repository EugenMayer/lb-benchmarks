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

Either go to `cd minio` or `cd whoami` depending on the test you want to do.
Minio runs the test agains minio using `warp`, `whoami` runs `wrk` tests agains `whoami`

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

For the whoami tests

- we use [wrk](https://github.com/wg/wrk) as a test client
- Invoked via `wrk -t20 -c1000 -d30s -H "Host: whoami.test" --latency` so with 20 Threads and 1000 Connections over a time period of 30 seconds

For minio we run

- we use `minio/warp` as the benchmark client
- Invoked via `warp put --host <> --access-key minio --secret-key miniominiominio --autoterm` so put tests only

# Results

## whoami

| Baseline | Traefik | Nginx   | Haproxy | Envoy  | (Specs)                                                                 |
| -------- | ------- | ------- | ------- | ------ | ----------------------------------------------------------------------- |
| 48MB/s   | 1.5MB/s | 3.5MB/s | 5MB/s   | 12MB/s | AMD Ryzen 7 5800X - 64GB RAM - NvME (WD Black SN850) - Linux 5.15 adm64 |
|          |         |         |         |        |                                                                         |

### minio

| Baseline | Traefik | Nginx   | Haproxy | Envoy   | (Specs)                                                                 |
| -------- | ------- | ------- | ------- | ------- | ----------------------------------------------------------------------- |
| tbaMB/s  | tbaMB/s | tbaMB/s | tbaMB/s | tbaMB/s | AMD Ryzen 7 5800X - 64GB RAM - NvME (WD Black SN850) - Linux 5.15 adm64 |
|          |         |         |         |         |                                                                         |
