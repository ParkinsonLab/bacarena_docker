
# Load BacArena libraries and dependencies
library("sybil")
library("rootSolve")
library("deSolve")
library("shape")
library("ReacTran")
library("BacArena")
library("optparse")
library("cplexAPI")
library("sybilSBML")
# Set to CPLEX solver
SYBIL_SETTINGS("SOLVER", "cplexAPI")
# Load BacArena model included in its installation
data(sihumi_test)
SIHUMI <- sihumi_test
Anaerostipes <- Bac(SIHUMI@models[[1]])
Anaerostipes@predator <- ""
# Try to export to xml file with sybilSBML
writeSBML(morg = Anaerostipes,
             filename = "test_model.xml")
 
 
