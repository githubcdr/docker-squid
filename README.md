# Minimal non caching proxy

Minimal squid installation based on Alpine Linux at 7mb.

* Caching limited to 128mb
* Absolute minimal config
* Logging disabled

## run

Example for a normal running config.

```
docker run --name squid -d -p 3128:3128 cdrocker/squid
```

## Test resolving and DNSSEC

```
# dig pir.org +dnssec +multi @{{dockerhost}}
```
