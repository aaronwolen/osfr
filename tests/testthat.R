library(testthat)
library(osfr2)

Sys.setenv(OSF_USE_SERVER = "test")
test_check("osfr2")
