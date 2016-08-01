[![Build Status](https://drone.sysexit.com/api/badges/JohannWeging/traffic-limiter/status.svg)](https://drone.sysexit.com/JohannWeging/traffic-limiter)
[![Docker Repository on Quay](https://quay.io/repository/johannweging/traffic-limiter/status "Docker Repository on Quay")](https://quay.io/repository/johannweging/traffic-limiter)

# traffic-limiter
traffic-limiter is a small script to limit the out going traffic of a network interface.

## Usage
```
Usage: traffic-limiter INTERFACE RATE
  INTERFACE: the netowrk interface to limit
  RATE: in mbit/s
```

Setting the limit of eth0 to 100 mibt/s:
```shell
traffic-limiter eth0 100
```

### Limiting the Outgoing Traffic of a Docker Bridge
Create a new network called test, the brdge will be called test too:
```
docker network create -o com.docker.network.bridge.name=test test
```

Limiting the throughput to 10 mbit/s:
```
docker run --rm --privileged --net=host quay.io/johannweging/traffic-limiter test 10
```
The `--net=host` flag is required to gain access to the network interfaces on the host. The `--privileged` flag is required to allow the modifications on the interface.

Run a container on the network:
```
docker run -it --rm --net=test alpine:edge /bin/sh
```
