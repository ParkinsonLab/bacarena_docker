
install.packages("remotes")
install.packages("/R_packages/libSBML_5.18.tar.gz", "/R_packages", dependencies = TRUE, repos = "http://cran.us.r-project.org")
remotes::install_github("SysBioChalmers/sybil", force = TRUE)
remotes::install_github("SysBioChalmers/sybil-SBML", force = TRUE)

install.packages("curl", "/R_packages", dependencies = TRUE, repos = "http://cran.us.r-project.org")
install.packages("systemfonts", "/R_packages", dependencies = TRUE, repos = "http://cran.us.r-project.org")

install.packages("textshaping", "/R_packages", dependencies = TRUE, repos = "http://cran.us.r-project.org")
install.packages("ragg", "/R_packages", dependencies = TRUE, repos = "http://cran.us.r-project.org")

install.packages("pkgdown", "/R_packages", dependencies = TRUE, repos = "http://cran.us.r-project.org")
install.packages("devtools", "/R_packages", dependencies = TRUE, repos = "http://cran.us.r-project.org")
install.packages("plyr", "/R_packages", dependencies = TRUE, repos = "http://cran.us.r-project.org")
install.packages("sf", "/R_packages", dependencies = TRUE, repos = "http://cran.us.r-project.org")
install.packages("deSolve", "/R_packages", dependencies = TRUE, repos = "http://cran.us.r-project.org")
install.packages("Hmisc", "/R_packages", dependencies = TRUE, repos = "http://cran.us.r-project.org")
install.packages("ggplot2", "/R_packages", dependencies = TRUE, repos = "http://cran.us.r-project.org")


install.packages("ReacTran", "/R_packages", dependencies = TRUE, repos = "http://cran.us.r-project.org")
install.packages("reshape2", "/R_packages", dependencies = TRUE, repos = "http://cran.us.r-project.org")
install.packages("glpkAPI", "/R_packages", dependencies = TRUE, repos = "http://cran.us.r-project.org")
install.packages("igraph", "/R_packages", dependencies = TRUE, repos = "http://cran.us.r-project.org")
install.packages("R.matlab", "/R_packages", dependencies = TRUE, repos = "http://cran.us.r-project.org")

install.packages("Rcpp", "/R_packages", dependencies = TRUE, repos = "http://cran.us.r-project.org")
install.packages("RcppEigen", "/R_packages", dependencies = TRUE, repos = "http://cran.us.r-project.org")
install.packages("RcppArmadillo", "/R_packages", dependencies = TRUE, repos = "http://cran.us.r-project.org")

remotes::install_github("euba/BacArena", force = TRUE)
install.packages("optparse")
