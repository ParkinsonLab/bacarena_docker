

#install.packages("remotes")
#remotes::install_github("SysBioChalmers/sybil", force = TRUE)
#remotes::install_github("SysBioChalmers/sybil-SBML", force = TRUE)
install.packages("Rcpp", "/R_packages", dependencies = TRUE, repos = "http://cran.us.r-project.org")
install.packages("RcppEigen", "/R_packages", dependencies = TRUE, repos = "http://cran.us.r-project.org")
install.packages("RcppArmadillo", "/R_packages", dependencies = TRUE, repos = "http://cran.us.r-project.org")
#install.packages("BacArena", "/R_packages", dependencies = TRUE, repos = "http://cran.us.r-project.org")
remotes::install_github("euba/BacArena", force = TRUE)
#install.packages("/R_packages/Rcpp_1.0.10.tar.gz", "/R_packages", repos = NULL, type = "source", dependencies = TRUE)
#install.packages("/R_packages/RcppEigen_0.3.3.9.3.tar.gz", "/R_packages", repos = NULL, type = "source", dependencies = TRUE)

#install.packages("/R_packages/RcppArmadillo_0.12.6.4.0.tar.gz", "/R_packages", dependencies = TRUE)

#install.packages("/R_packages/sybilSBML_3.1.2.tar.gz", "/R_packages", dependencies = TRUE)

#install.packages("/R_packages/BacArena_1.8.2.tar.gz", "/R_packages", repos = NULL, type = "source", dependencies = TRUE)

