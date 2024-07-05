#FROM continuumio/anaconda3
#version 1.0.0: 

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
RUN apt-get install -y r-base

RUN apt-get install -y libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
WORKDIR /R_packages
# Install base utilities
RUN apt-get update \
    && apt-get install -y build-essential \
    && apt-get install -y wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install miniconda
ENV CONDA_DIR /opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda

# Put conda in path so we can use conda activate
ENV PATH=$CONDA_DIR/bin:$PATH

WORKDIR /R_packages

ADD https://cran.r-project.org/src/contrib/Archive/sybilSBML/sybilSBML_3.0.1.tar.gz /R_packages

WORKDIR /R_packages

RUN wget https://compsysbio.org/bacarena_deps/libsbml-5.20.2.zip -O libsbml_sys.zip
RUN unzip libsbml_sys.zip
WORKDIR libsbml-5.20.2
RUN sh configure && make && make install
RUN ldconfig
WORKDIR /R_packages
RUN wget https://github.com/sbmlteam/libsbml/releases/download/v5.20.2/libSBML_5.20.2.tar.gz -O libsbml_R_bindings.tar.gz
RUN R CMD INSTALL libsbml_R_bindings.tar.gz
ADD http://compsysbio.org/bacarena_deps/sybil_2.2.0.tar.gz /R_packages
ADD https://compsysbio.org/bacarena_deps/conda_install_pkgs.py /R_packages
RUN conda create -n bacarena_env
ARG sybilSBML_string="--with-sbml-include=/opt/conda/bacarena_env/include --with-sbml-lib=/opt/conda/bacarena_env/lib"
RUN /bin/bash -c "source activate bacarena_env \ 
&& conda install -c conda-forge -y r-sybil \
&& conda install -c conda-forge -y r-glpkAPI \
&& conda install -c bioconda -y libsbml \
&& R CMD INSTALL --configure-args=${sybilSBML_string} sybilSBML_3.0.1.tar.gz"

ADD http://compsysbio.org/bacarena_deps/BacArena_1.8.2.tar.gz /R_packages
ADD http://compsysbio.org/bacarena_deps/ragg_1.2.6.tar.gz /R_packages

ADD http://compsysbio.org/bacarena_deps/RcppArmadillo_0.12.6.4.0.tar.gz /R_packages
ADD http://compsysbio.org/bacarena_deps/RcppEigen_0.3.3.9.3.tar.gz /R_packages
ADD http://compsysbio.org/bacarena_deps/Rcpp_1.0.10.tar.gz /R_packages
ADD http://compsysbio.org/bacarena_deps/sf_1.0-8.tar.gz /R_packages

ADD https://compsysbio.org/bacarena_deps/install_bacarena_deps.R /R_packages
ADD https://compsysbio.org/bacarena_deps/install_exp_deps.R /R_packages

RUN Rscript install_bacarena_deps.R
RUN Rscript install_exp_deps.R

ADD https://compsysbio.org/bacarena_deps/load_bacarena_libs.R /R_packages

WORKDIR /cplex
ADD http://compsysbio.org/bacarena_deps/installer.properties /cplex
ADD http://compsysbio.org/bacarena_deps/cplex_studio1210.linux-x86-64.bin /cplex
ADD http://compsysbio.org/bacarena_deps/cplexAPI_1.4.0.tar.gz /cplex

RUN sh cplex_studio1210.linux-x86-64.bin -i silent -f installer.properties
RUN R CMD INSTALL --configure-args="--with-cplex-dir='/cplex'" /cplex/cplexAPI_1.4.0.tar.gz


#CMD ["source activate bacarena_env"]

#RUN echo "conda activate bacarena_env"
#RUN echo "source activate bacarena_env"
#SHELL ["source", "activate", "bacarena_env"]
#SHELL ["conda", "install", "-c", "conda-forge", "-y", "r-sybil"]
#CMD ["bash"]
#RUN python3 conda_install_pkgs.py


#RUN conda env create -f bacarena_env.yml
#RUN conda create --name bacarena_env
#RUN echo "source activate bacarena_env"
#ENV PATH /opt/conda/envs/bacarena_env/bin:$PATH
#RUN echo "source activate bacarena_env" > ~/.bashrc
#RUN conda install -c conda-forge -y r-sybil
#RUN conda install -c bioconda -y libsbml
#RUN conda install -c conda-forge -y r-glpkAPI

#RUN R CMD INSTALL --configure-args="--with-sbml-include=/opt/conda/include --with-sbml-lib=/opt/conda/lib", sybilSBML_3.0.1.tar.gz
