#FROM continuumio/anaconda3
#version 1.0.0: 

FROM continuumio/miniconda3
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
&& apt-get install -y libudunits2-dev

RUN apt-get install -y lsb-release
RUN conda install -c conda-forge -y r-sybil
RUN conda install -c conda-forge -y r-glpkAPI
RUN conda install -c bioconda -y libsbml

RUN apt-get install -y r-base
WORKDIR /R_packages
ADD https://cran.r-project.org/src/contrib/Archive/sybilSBML/sybilSBML_3.0.1.tar.gz /R_packages

ADD http://compsysbio.org/bacarena_deps/BacArena_1.8.2.tar.gz /R_packages
ADD http://compsysbio.org/bacarena_deps/ragg_1.2.6.tar.gz /R_packages
ADD http://compsysbio.org/bacarena_deps/sybil_2.2.0.tar.gz /R_packages
ADD http://compsysbio.org/bacarena_deps/RcppArmadillo_0.12.6.4.0.tar.gz /R_packages
ADD http://compsysbio.org/bacarena_deps/RcppEigen_0.3.3.9.3.tar.gz /R_packages
ADD http://compsysbio.org/bacarena_deps/Rcpp_1.0.10.tar.gz /R_packages
ADD http://compsysbio.org/bacarena_deps/sf_1.0-8.tar.gz /R_packages
ADD https://compsysbio.org/bacarena_deps/install_bacarena_deps.R /R_packages

ADD https://compsysbio.org/bacarena_deps/load_bacarena_libs.R /R_packages
ADD https://compsysbio.org/bacarena_deps/sybilSBML_3.1.2.tar.gz /R_packages/

#ADD https://sourceforge.net/projects/sbml/files/libsbml/5.18.0/stable/Linux/64-bit/libSBML-5.18.0-Linux-x64.deb /R_packages
ADD http://compsysbio.org/bacarena_deps/libSBML-5.18.0-Linux-x64.deb /R_packages
#RUN dpkg -i libSBML-5.18.0-Linux-x64.deb

ADD http://compsysbio.org/bacarena_deps/libSBML_5.18.0.tar.gz /R_packages
#RUN R CMD INSTALL libSBML_5.18.0.tar.gz






CMD ["bash"]
