#FROM continuumio/anaconda3
#version 1.0.0: 

FROM ubuntu:20.04
MAINTAINER Billy Law

ENV TZ=America/Canada
ENV DEBIAN_FRONTEND=noninteractive



RUN apt-get update \
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
&& apt-get install -y libcurl4-openssl-dev

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install -y tzdata 

RUN apt-get install -y apt-utils \
&&apt-get install -y curl \
&& apt-get install -y locales

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8     


RUN apt-get install -y r-base


RUN apt-get install -y libxml2-dev \
&& apt-get install -y libfontconfig1-dev \
&& apt-get install -y libharfbuzz-dev \
&& apt-get install -y libfribidi-dev \
&& apt-get install -y libfreetype6-dev \
&& apt-get install -y libpng-dev \
&& apt-get install -y libtiff5-dev \
&& apt-get install -y libjpeg-dev \
&& apt-get install -y libssl-dev

WORKDIR /R_packages
ADD https://cran.r-project.org/src/contrib/usethis_2.2.2.tar.gz /R_packages
ADD http://compsysbio.org/bacarena_deps/BacArena_1.8.2.tar.gz /R_packages
ADD http://compsysbio.org/bacarena_deps/ragg_1.2.6.tar.gz /R_packages

ADD https://cran.r-project.org/src/contrib/Archive/sybil/sybil_2.2.0.tar.gz /R_packages

ADD http://compsysbio.org/bacarena_deps/install_good_deps.R /R_packages


RUN apt-get install -y libudunits2-dev
RUN Rscript /R_packages/install_good_deps.R

ADD http://compsysbio.org/bacarena_deps/RcppArmadillo_0.12.6.4.0.tar.gz /R_packages
ADD http://compsysbio.org/bacarena_deps/RcppEigen_0.3.3.9.3.tar.gz /R_packages
ADD http://compsysbio.org/bacarena_deps/Rcpp_1.0.10.tar.gz /R_packages
ADD http://compsysbio.org/bacarena_deps/sf_1.0-13.tar.gz /R_packages

RUN apt-get install -y libgdal-dev

#ADD http://compsysbio.org/bacarena_deps/install_bacarena_deps.R /R_packages

#RUN Rscript /R_packages/install_bacarena_deps.R