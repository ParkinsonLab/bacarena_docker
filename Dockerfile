#FROM continuumio/anaconda3
#version 1.0.0: 

#FROM continuumio/miniconda3
FROM ubuntu:24.04
MAINTAINER Billy Law

ENV TZ=America/Canada
ENV DEBIAN_FRONTEND=noninteractive



RUN apt-get update \
&& apt-get -y install apt-utils \
&& apt-get -y install wget \
&& apt-get -y install unzip \
&& apt-get -y install g++ \
&& apt-get -y install gcc \
&& apt-get -y install make \
&& apt-get -y install libz-dev \
&& apt-get -y install libbz2-dev \
&& apt-get -y install autoconf \
&& apt-get -y install build-essential \
&& apt-get -y install libboost-all-dev \
&& apt-get -y install flex \
&& apt-get -y install cmake \
&& apt-get -y install libncurses5-dev \
&& apt-get -y install liblzma-dev \
&& apt-get -y install perl \
&& apt-get install -y vim \
&& apt-get install -y less \
&& apt-get install -y mpich \ 
&& apt-get install -y valgrind \
&& apt-get install -y heaptrack \
&& apt-get install -y libglpk-dev \
&& apt-get install -y libcurl4-openssl-dev \
&& apt-get install -y libxml2-dev \
&& apt-get install -y libfontconfig1-dev \
&& apt-get install -y libharfbuzz-dev \
&& apt-get install -y libfribidi-dev \
&& apt-get install -y libfreetype6-dev \
&& apt-get install -y libpng-dev \
&& apt-get install -y libtiff5-dev \
&& apt-get install -y libjpeg-dev \
&& apt-get install -y libssl-dev \
&& apt-get install -y libgdal-dev \
&& apt-get install -y libudunits2-dev \
&& apt-get install -y libcups2-dev

RUN apt-get install -y lsb-release 
RUN apt-get install -y r-base --fix-missing

#RUN apt-get install -y libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
WORKDIR /R_packages
# Install base utilities
RUN apt-get update \
    && apt-get install -y build-essential \
    && apt-get install -y wget \
    && apt-get install -y curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

## Install miniconda
ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"

# Install wget to fetch Miniconda
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Miniconda on x86 or ARM platforms
RUN arch=$(uname -m) && \
    if [ "$arch" = "x86_64" ]; then \
    MINICONDA_URL="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"; \
    elif [ "$arch" = "aarch64" ]; then \
    MINICONDA_URL="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh"; \
    else \
    echo "Unsupported architecture: $arch"; \
    exit 1; \
    fi && \
    wget $MINICONDA_URL -O miniconda.sh && \
    mkdir -p /root/.conda && \
    bash miniconda.sh -b -p /root/miniconda3 && \
    rm -f miniconda.sh

RUN conda --version

WORKDIR /R_packages
RUN wget https://github.com/curl/curl/releases/download/curl-7_55_0/curl-7.55.0.tar.gz \
&& tar -xzvf curl-7.55.0.tar.gz \
&& cd curl-7.55.0 \
&& ./configure \
&& make \
&& make install


RUN apt-get install -y libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev
#RUN apt-get install -y libsbml5 libsbml5-dev

RUN wget https://sourceforge.net/projects/sbml/files/libsbml/5.18.0/stable/Linux/64-bit/libSBML-5.18.0-Linux-x64.deb
RUN wget https://sourceforge.net/projects/sbml/files/libsbml/5.18.0/stable/R%20interface/libSBML_5.18.0.tar.gz
RUN apt-get install ./libSBML-5.18.0-Linux-x64.deb
RUN R CMD INSTALL libSBML_5.18.0.tar.gz
RUN wget https://compsysbio.org/bacarena_deps/install_bacarena_deps.R
RUN wget https://compsysbio.org/bacarena_deps/load_bacarena_libs.R
RUN LD_LIBRARY_PATH=/usr/lib64 Rscript install_bacarena_deps.R
ENV LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib64"
