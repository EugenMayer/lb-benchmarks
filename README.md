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

To run all benchmarks at once do

```bash
make all
```

Or manually

```bash
make baseline
make traefik
make nginx
make envoy
```

# Results

baseline/traefik/nginx/envoy `MB/s`

- E: 48/1.5/3.5/12
  specs: AMD Ryzen 7 5800X / 64GB RAM / NvME (WD Black SN850)
