FROM ghcr.io/tillitis/tkey-builder:2 as base

RUN apt-get -qq update -y && \
	DEBIAN_FRONTEND=noninteractive \
	apt-get install -y --no-install-recommends wget && \
	wget -qO- https://apt.llvm.org/llvm-snapshot.gpg.key | tee /etc/apt/trusted.gpg.d/apt.llvm.org.asc && \
	echo "deb http://apt.llvm.org/kinetic/ llvm-toolchain-kinetic-15 main" >> /etc/apt/sources.list && \
	echo "deb-src http://apt.llvm.org/kinetic/ llvm-toolchain-kinetic-15 main" >> /etc/apt/sources.list && \
	apt-get -qq update -y && \
	DEBIAN_FRONTEND=noninteractive \
	apt-get install -y --no-install-recommends \
		clang-tidy \
	&& rm -rf /var/lib/apt/lists/*

FROM base
LABEL org.opencontainers.image.description="Toolchain for a TKey app build process"