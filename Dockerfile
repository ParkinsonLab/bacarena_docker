#FROM continuumio/anaconda3
#version 1.0.0: 

FROM continuumio/miniconda3
#FROM ubuntu:22.04
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

RUN apt-get install -y libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
WORKDIR /R_packages
# Install base utilities
RUN apt-get update \
    && apt-get install -y build-essential \
    && apt-get install -y wget \
    && apt-get install -y curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install miniconda
ENV CONDA_DIR /opt/conda
RUN curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh" 
RUN bash Miniforge3-$(uname)-$(uname -m).sh -b

RUN conda install -y conda-forge::r-sybil

RUN  conda install -y bioconda::libsbml

RUN conda install --solver=classic conda-forge::conda-libmamba-solver conda-forge::libmamba conda-forge::libmambapy conda-forge::libarchive

 
WORKDIR /R_packages
RUN wget https://github.com/curl/curl/releases/download/curl-7_55_0/curl-7.55.0.tar.gz \
&& tar -xzvf curl-7.55.0.tar.gz \
&& cd curl-7.55.0 \
&& ./configure \
&& make \
&& make install

