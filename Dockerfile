FROM ubuntu:bionic

ENV DEBIAN_FRONTEND=noninteractive

# Install common packages
RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
        apt-transport-https \
        build-essential \
        ca-certificates \
        curl \
        gnupg2 \
        locales \
        software-properties-common \
        tzdata \
        unzip \
        wget

# Set the locale and timezone
RUN locale-gen en_US.UTF-8 && \
    ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

## C
RUN apt-get install -yq --no-install-recommends \
        libpcre2-dev

## Crystal
RUN curl -sSL https://dist.crystal-lang.org/apt/setup.sh | bash && \
    apt-get install -yq --no-install-recommends \
        crystal

## C# Mono
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | tee /etc/apt/sources.list.d/mono-official-stable.list && \
    apt-get update && \
    apt-get install -yq --no-install-recommends \
        mono-devel

## C# .Net Core
RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get install -yq --no-install-recommends \
        dotnet-sdk-3.0

## DLang - DMD
RUN wget -q http://downloads.dlang.org/releases/2.x/2.089.0/dmd_2.089.0-0_amd64.deb -O dmd_2.089.0-0_amd64.deb && \
    dpkg -i --ignore-depends=libcurl3 dmd_2.089.0-0_amd64.deb

## DLang - LDC
RUN apt-get install -yq --no-install-recommends \
        ldc

## Go
RUN add-apt-repository ppa:longsleep/golang-backports && \
    apt-get update && \
    apt-get install -yq --no-install-recommends \
        golang-go

## Java - Open
RUN apt-get install -yq --no-install-recommends \
        openjdk-8-jre \
        openjdk-8-jdk

## Javascript - Node
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash - && \
    apt-get install -yq --no-install-recommends \
        nodejs

## Kotlin
RUN wget -q https://github.com/JetBrains/kotlin/releases/download/v1.3.50/kotlin-compiler-1.3.50.zip -O kotlin-compiler-1.3.50.zip && \
    unzip kotlin-compiler-1.3.50.zip -d /opt/ && \
    echo 'export PATH=$PATH:/opt/kotlinc/bin' >> ~/.bashrc && \
    ln -s /opt/kotlinc/bin/kotlin /usr/local/bin/kotlin && \
    ln -s /opt/kotlinc/bin/kotlinc /usr/local/bin/kotlinc

## PHP
RUN apt-get install -yq --no-install-recommends \
        php7.2-cli

## Python 2
RUN apt-get install -yq --no-install-recommends \
        python2.7

## Python 3
RUN apt-get install -yq --no-install-recommends \
        python3.6

## Pyhton2 - PyPy2
RUN wget -q https://bitbucket.org/pypy/pypy/downloads/pypy2.7-v7.2.0-linux64.tar.bz2 -O pypy2.7-v7.2.0-linux64.tar.bz2 && \
    tar -x -C /opt -f pypy2.7-v7.2.0-linux64.tar.bz2 && \
    mv /opt/pypy2.7-v7.2.0-linux64 /opt/pypy2 && \
    ln -s /opt/pypy2/bin/pypy /usr/local/bin/pypy2 && \
    rm pypy2.7-v7.2.0-linux64.tar.bz2

## Pyhton3 - PyPy3
RUN wget -q https://bitbucket.org/pypy/pypy/downloads/pypy3.6-v7.2.0-linux64.tar.bz2 -O pypy3.6-v7.2.0-linux64.tar.bz2 && \
    tar -x -C /opt -f pypy3.6-v7.2.0-linux64.tar.bz2 && \
    mv /opt/pypy3.6-v7.2.0-linux64 /opt/pypy3 && \
    ln -s /opt/pypy3/bin/pypy3 /usr/local/bin/pypy3 && \
    rm pypy3.6-v7.2.0-linux64.tar.bz2

## Ruby
RUN apt-get install -yq --no-install-recommends \
        ruby-full

## Rust
RUN wget -q https://sh.rustup.rs -O rustup-init.sh && \
    chmod +x rustup-init.sh && \
    ./rustup-init.sh -y && \
    rm rustup-init.sh && \
    echo 'export PATH=$HOME/.cargo/bin:$PATH' >> ~/.bashrc && \
    ln -s /root/.cargo/bin/cargo /usr/local/bin/cargo

## Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /var/regex

CMD ["/usr/bin/php", "/var/regex/run-benchmarks.php"]
