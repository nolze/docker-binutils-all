# docker-binutils-all

[![Docker Automated build](https://img.shields.io/docker/automated/nolze/binutils-all.svg)](https://hub.docker.com/r/nolze/binutils-all/)
[![Docker Image Size](https://images.microbadger.com/badges/image/nolze/binutils-all.svg)](https://microbadger.com/images/nolze/binutils-all "Get your own image badge on microbadger.com")

> All-in-one binutils toolchain. (with minimal footprint)

## Usage

### Pull & Run

```bash
docker pull nolze/binutils-all
docker run --rm -it -v $PWD:/tmp nolze/binutils-all
```

## Development

### Build

```bash
docker build -t nolze/binutils-all .
```

## References

* <http://7shi.hateblo.jp/entry/2013/07/30/011348>
* <https://qiita.com/7shi/items/2d44e040bae930d11088>
* <http://inaz2.hatenablog.com/entry/2015/12/01/204201>
