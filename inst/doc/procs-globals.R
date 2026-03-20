## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)


## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  library(procs)
#  
#  # Turn printing off
#  options("procs.print" = FALSE)
#  

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Turn printing on
#  options("procs.print" = TRUE)
#  
#  # Delete printing option
#  options("procs.print" = NULL)
#  

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Sort NAs first
#  options("procs.na.sort" = "first")
#  
#  # Sort NAs last
#  options("procs.print" = "last")
#  
#  # Sort to match SAS
#  options("procs.print" = "sas")
#  

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Delete global setting
#  options("procs.na.sort" = NULL)
#  

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Prevent automatic log printing
#  options("logr.output" = FALSE)
#  
#  # Allow automatic log printing
#  options("logr.output" = TRUE)
#  
#  # Delete logging option
#  options("logr.output" = NULL)
#  

