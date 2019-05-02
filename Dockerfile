FROM alpine:3.9 AS base

LABEL maintainer="nolze <nolze@archlinux.us>"

ENV PKGVER="2.32" \
    PKGDIR="/pkg" \
    PREFIX="/usr/local" \
    PARALLEL_MAKE="-j4" \
    CONFIGURATION_OPTIONS="--disable-multilib --disable-nls"

FROM base AS build

RUN apk add --no-cache --virtual .deps \
    curl \
    file \
    gcc \
    make \
    musl-dev

WORKDIR /src
RUN curl -L -o binutils-$PKGVER.tar.bz2 http://ftpmirror.gnu.org/binutils/binutils-$PKGVER.tar.bz2 \
 && tar xf binutils-$PKGVER.tar.bz2

WORKDIR /build
RUN /src/binutils-$PKGVER/configure --silent --enable-targets=all --enable-64-bit-bfd $CONFIGURATION_OPTIONS \
 && make --silent $PARALLEL_MAKE \
 && make --silent DESTDIR="$PKGDIR" install

FROM base

COPY --from=build "$PKGDIR"/usr/local /usr/local

WORKDIR /tmp
CMD ["/bin/bash"]
