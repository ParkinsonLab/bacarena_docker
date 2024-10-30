wget https://downloads.sourceforge.net/project/sbml/libsbml/5.17.0/stable/libSBML-5.17.0-core-plus-packages-src.tar.gz
tar -xxvf libSBML-5.17.0-core-plus-packages-src.*
cd libSBML-5.17.0-Source
./configure --prefix=/usr/local/ \
            --enable-cpp-namespace \
            --enable-fbc \
            --enable-shared \
            --with-gnu-ld \
            --enable-layout \
            --enable-comp \
            --enable-qual \
            --enable-groups \
            --enable-compression \
            --enable-shared-version
make
make install
cd ..
# LINUX Only: sudo ldconfig
export DYLD_LIBRARY_PATH=/usr/local/lib
wget https://cran.r-project.org/src/contrib/Archive/sybilSBML/sybilSBML_3.0.1.tar.gz
R CMD INSTALL sybilSBML_3.0.1.tar.gz