### R code from vignette source 'GOexpress-UsersGuide.Rnw'

###################################################
### code chunk number 5: GOexpress-UsersGuide.Rnw:201-203
###################################################
library(GOexpress) # load the GOexpress package
set.seed(4543) # set random seed for reproducibility

dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")

input <- function(inputfile) {
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
    pfix = prefix()
  if (length(pfix) != 0) {
     pfix <<- paste(pfix, "/", sep="")
  }
}

run <- function() {}

output <- function(outputfile) {

AlvMac_results <- readRDS(paste(pfix, parameters["GOresults", 2], sep="/"))

###################################################
### code chunk number 16: GOexpress-UsersGuide.Rnw:423-438
###################################################
BP.5 <- subset_scores(
    result = AlvMac_results.pVal,
    namespace = "biological_process",
    total = parameters["numgenes", 2], # requires 5 or more associated genes
    p.val=parameters["pvalue", 2])
#MF.10 <- subset_scores(
#    result = AlvMac_results.pVal,
#    namespace = "molecular_function",
#    total = 10,
#    p.val=0.05)
#CC.15 <- subset_scores(
#    result = AlvMac_results.pVal,
#    namespace = "cellular_component",
#    total = 15,
#    p.val=0.05)

saveRDS(BP.5, paste(outputfile, "rds", sep="."))
write.csv(BP.5$GO, paste(outputfile, "csv", sep="."))
}
