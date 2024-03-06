## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Create sample data
#  cls <- read.table(header = TRUE, text = '
#    Name   Sex Age Height Weight
#    Alfred   M  14   69.0  112.5
#    Alice    F  13   56.5   84.0
#    Barbara  F  13   65.3   98.0
#    Carol    F  14   62.8  102.5
#    Henry    M  14   63.5  102.5
#    James    M  12   57.3   83.0
#    Jane     F  12   59.8   84.5
#    Janet    F  15   62.5  112.5
#    Jeffrey  M  13   62.5   84.0
#    John     M  12   59.0   99.5
#    Joyce    F  11   51.3   50.5
#    Judy     F  14   64.3   90.0
#    Louise   F  12   56.3   77.0
#    Mary     F  15   66.5  112.0
#    Philip   M  16   72.0  150.0
#    Robert   M  12   64.8  128.0
#    Ronald   M  15   67.0  133.0
#    Thomas   M  11   57.5   85.0
#    William  M  15   66.5  112.0')
#  

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Turn off printing for CRAN checks
#  options("procs.print" = FALSE)
#  
#  # Basic operation
#  proc_reg(cls, Weight ~ Height)
#  

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Output dataset
#  res1 <- proc_reg(cls, Weight ~ Height)
#  
#  # View results
#  res1
#  #    MODEL  TYPE DEPVAR     RMSE Intercept  Height Weight
#  # 1 MODEL1 PARMS Weight 11.22625 -143.0269 3.89903     -1

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Output dataset using "outseb" option
#  res2 <- proc_reg(cls, Weight ~ Height, options = outseb)
#  
#  # View results
#  res2
#  #    MODEL  TYPE DEPVAR     RMSE  Intercept    Height Weight
#  # 1 MODEL1 PARMS Weight 11.22625 -143.02692 3.8990303     -1
#  # 2 MODEL1   SEB Weight 11.22625   32.27459 0.5160939     -1

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Output dataset using "press" and "edf" options
#  res3 <- proc_reg(cls, Weight ~ Height, options = v(press, edf))
#  
#  # View results
#  res3
#  #    MODEL  TYPE DEPVAR     RMSE    PRESS Intercept  Height Weight IN P EDF       RSQ
#  # 1 MODEL1 PARMS Weight 11.22625 2651.352 -143.0269 3.89903     -1  1 2  17 0.7705068

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Output dataset using "tableout" option
#  res3 <- proc_reg(cls, Weight ~ Height, options = tableout)
#  
#  # View results
#  res3
#  #    MODEL   TYPE DEPVAR     RMSE     Intercept       Height Weight
#  # 1 MODEL1  PARMS Weight 11.22625 -1.430269e+02 3.899030e+00     -1
#  # 2 MODEL1 STDERR Weight 11.22625  3.227459e+01 5.160939e-01     NA
#  # 3 MODEL1      T Weight 11.22625 -4.431564e+00 7.554885e+00     NA
#  # 4 MODEL1 PVALUE Weight 11.22625  3.655789e-04 7.886816e-07     NA
#  # 5 MODEL1   L95B Weight 11.22625 -2.111204e+02 2.810167e+00     NA
#  # 6 MODEL1   U95B Weight 11.22625 -7.493348e+01 4.987893e+00     NA

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Output dataset using "report" output
#  res4 <- proc_reg(cls, Weight ~ Height, output = "report")
#  
#  # View results
#  res4
#  # $Observations
#  #                          stub NOBS
#  # 1 Number of Observations Read   19
#  # 2 Number of Observations Used   19
#  #
#  # $ANOVA
#  #              stub DF    SUMSQ    MEANSQ     FVAL        PROBF
#  # 1           Model  1 7193.249 7193.2491 57.07628 7.886816e-07
#  # 2           Error 17 2142.488  126.0287       NA           NA
#  # 3 Corrected Total 18 9335.737        NA       NA           NA
#  #
#  # $Fitness
#  #       RMSE  DEPMEAN COEFVAR       RSQ    ADJRSQ
#  # 1 11.22625 100.0263 11.2233 0.7705068 0.7570072
#  #
#  # $Coefficients
#  #        stub DF        EST     STDERR         T        PROBT
#  # 1 Intercept  1 -143.02692 32.2745913 -4.431564 3.655789e-04
#  # 2    Height  1    3.89903  0.5160939  7.554885 7.886816e-07

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # View report using "clb" option
#  proc_reg(cls, Weight ~ Height, stats = clb)

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # View report using "hcc" option
#  proc_reg(cls, Weight ~ Height, stats = hcc)

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # View report using "p" option
#  proc_reg(cls, Weight ~ Height, stats = p)

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # By grouping
#  res5 <- proc_reg(cls, Weight ~ Height, by = Sex)
#  
#  # View results
#  res5
#  #   BY  MODEL  TYPE DEPVAR      RMSE Intercept   Height Weight
#  # 1  F MODEL1 PARMS Weight  9.586849 -117.3698 3.424405     -1
#  # 2  M MODEL1 PARMS Weight 12.695426 -141.1010 3.912549     -1

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Multiple Models
#  res6 <- proc_reg(cls, list(Weight ~ Height,
#                             Weight ~ Height + Age))
#  
#  # View results
#  res6
#  #    MODEL  TYPE DEPVAR     RMSE Intercept   Height Weight      Age
#  # 1 MODEL1 PARMS Weight 11.22625 -143.0269 3.899030     -1       NA
#  # 2 MODEL2 PARMS Weight 11.51114 -141.2238 3.597027     -1 1.278393

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Shape wide
#  res7 <- proc_reg(cls, Weight ~ Height,
#                   option = outseb, output = wide)
#  
#  # Wide results
#  res7
#  #    MODEL  TYPE DEPVAR     RMSE  Intercept    Height Weight
#  # 1 MODEL1 PARMS Weight 11.22625 -143.02692 3.8990303     -1
#  # 2 MODEL1   SEB Weight 11.22625   32.27459 0.5160939     -1
#  
#  # Shape long
#  res8 <- proc_reg(cls, Weight ~ Height,
#                   option = outseb, output = long)
#  
#  # Long results
#  res8
#  #    MODEL DEPVAR      STAT      PARMS        SEB
#  # 1 MODEL1 Weight      RMSE   11.22625 11.2262500
#  # 2 MODEL1 Weight Intercept -143.02692 32.2745913
#  # 3 MODEL1 Weight    Height    3.89903  0.5160939
#  # 4 MODEL1 Weight    Weight   -1.00000 -1.0000000
#  
#  # Shape stacked
#  res9 <- proc_reg(cls, Weight ~ Height,
#                   options = outseb, output = stacked)
#  
#  # Stacked results
#  res9
#  #    MODEL DEPVAR  TYPE      STAT       VALUES
#  # 1 MODEL1 Weight PARMS      RMSE   11.2262500
#  # 2 MODEL1 Weight PARMS Intercept -143.0269184
#  # 3 MODEL1 Weight PARMS    Height    3.8990303
#  # 4 MODEL1 Weight PARMS    Weight   -1.0000000
#  # 5 MODEL1 Weight   SEB      RMSE   11.2262500
#  # 6 MODEL1 Weight   SEB Intercept   32.2745913
#  # 7 MODEL1 Weight   SEB    Height    0.5160939
#  # 8 MODEL1 Weight   SEB    Weight   -1.0000000
#  

