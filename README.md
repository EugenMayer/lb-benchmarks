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

Spoiler: It seems like Envoy beats everything - actually by a good margin in the whoami benachmar. The minio based benchmark looks very different, seems like Traefik can win by a tiny margin, or it is envoy here (but very close).

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
- Hint: `nginx` is not tested because we could not get it running with warp. We did not yet invest too much time fiddling this out, if you can, tell us :)

# Results

## whoami

| Baseline | Traefik | Nginx   | Haproxy | Envoy  | (Specs)                                                                 |
| -------- | ------- | ------- | ------- | ------ | ----------------------------------------------------------------------- |
| 48MB/s   | 1.5MB/s | 3.5MB/s | 5MB/s   | 12MB/s | AMD Ryzen 7 5800X - 64GB RAM - NvME (WD Black SN850) - Linux 5.15 adm64 |
|          |         |         |         |        |                                                                         |

### minio

### PUT only mode

| Baseline | Traefik | Nginx   | Haproxy | Envoy   | (Specs)                                                                 |
| -------- | ------- | ------- | ------- | ------- | ----------------------------------------------------------------------- |
| 367MB/s  | 375MB/s | n/aMB/s | 259MB/s | 318MB/s | AMD Ryzen 7 5800X - 64GB RAM - NvME (WD Black SN850) - Linux 5.15 adm64 |
|          |         |         |         |         |                                                                         |

### MIXED mode

Cluster

| Baseline | Traefik | Nginx   | Haproxy | Envoy   | (Specs)                                                                 |
| -------- | ------- | ------- | ------- | ------- | ----------------------------------------------------------------------- |
| 1037MB/s | 929MB/s | n/aMB/s | 921MB/s | 927MB/s | AMD Ryzen 7 5800X - 64GB RAM - NvME (WD Black SN850) - Linux 5.15 adm64 |
|          |         |         |         |         |                                                                         |

GET throughput

| Baseline | Traefik | Nginx   | Haproxy | Envoy   | (Specs)                                                                 |
| -------- | ------- | ------- | ------- | ------- | ----------------------------------------------------------------------- |
| 778MB/s  | 698MB/s | n/aMB/s | 691MB/s | 695MB/s | AMD Ryzen 7 5800X - 64GB RAM - NvME (WD Black SN850) - Linux 5.15 adm64 |
|          |         |         |         |         |                                                                         |

PUT throughput

| Baseline | Traefik | Nginx   | Haproxy | Envoy   | (Specs)                                                                 |
| -------- | ------- | ------- | ------- | ------- | ----------------------------------------------------------------------- |
| 258MB/s  | 232MB/s | n/aMB/s | 230MB/s | 231MB/s | AMD Ryzen 7 5800X - 64GB RAM - NvME (WD Black SN850) - Linux 5.15 adm64 |
|          |         |         |         |         |                                                                         |
