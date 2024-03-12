
#FROM continuumio/miniconda3
FROM ubuntu:22.04
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
#RUN conda install -c conda-forge -y r-sybil
#RUN conda install -c conda-forge -y r-glpkAPI
#RUN conda install -c bioconda -y libsbml

RUN apt-get install -y r-base

WORKDIR /R_packages

RUN wget https://github.com/sbmlteam/libsbml/releases/download/v5.20.2/libSBML_5.20.2.tar.gz -O libSBML_R_bindings.tar.gz
RUN wget https://github.com/sbmlteam/libsbml/archive/refs/tags/v5.20.2.zip -O libSBML_sys.zip
RUN unzip libSBML_sys.zip
WORKDIR libsbml-5.20.2
RUN sh configure
RUN make
RUN make install
RUN ldconfig
RUN export LD_LIBRARY_PATH=/usr/local/lib
WORKDIR /R_packages
RUN R CMD INSTALL libSBML_R_bindings.tar.gz
#ADD https://github.com/sbmlteam/libsbml/releases/download/v5.20.2/libSBML_5.20.2.tar.gz /R_packages
#ADD http://compsysbio.org/bacarena_deps/sybil_2.2.0.tar.gz /R_packages
#ADD https://compsysbio.org/bacarena_deps/sybilSBML_3.1.2.tar.gz /R_packages/

#RUN R CMD INSTALL libSBML_5.20.2.tar.gz
#RUN R CMD INSTALL sybil_2.2.0.tar.gz
#ADD https://repo.anaconda.com/archive/Anaconda3-2024.02-1-Linux-x86_64.sh /R_packages
#RUN chmod 777 Anaconda3-2024.02-1-Linux-x86_64.sh
#RUN sh Anaconda3-2024.02-1-Linux-x86_64.sh -b
#RUN R CMD INSTALL sybilSBML_3.1.2.tar.gz
#ADD http://compsysbio.org/bacarena_deps/libSBML_5.18.0.tar.gz /R_packages
#WORKDIR /R_packages/libsbml-5.20.2



#RUN sh configure --prefix=/R_packages/libsbml_install \
#    --enable-cpp-namespace \
#    --enable-fbc \
#    --enable-shared \
#    --with-gnu-ld \
#    --enable-layout \
#    --enable-comp \
#    --enable-qual \
#    --enable-groups \
#    --enable-compression \
#    --enable-shared-version
