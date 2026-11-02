## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE, echo=TRUE----------------------------------------------------
# # Create sample data
# plants <- read.table(header = TRUE, text = '
#   Plot Fertilizer Water Yield Field
#   1    A          12    24    North
#   2    A          14    28    North
#   3    A          16    29    North
#   4    A          13    25    North
#   5    A          15    27    South
#   6    A          17    31    South
#   7    A          14    27    South
#   8    A          16    30    South
#   9    A          18    32    South
#   10   B          10    18    North
#   11   B          12    21    North
#   12   B          14    23    North
#   13   B          11    18    North
#   14   B          13    21    South
#   15   B          15    25    South
#   16   B          12    20    South
#   17   B          14    24    South
#   18   B          16    25    South')
# 

## ----eval=FALSE, echo=TRUE----------------------------------------------------
# # Turn off printing for CRAN checks
# options("procs.print" = FALSE)
# 
# # Basic operation
# proc_glm(plants, Yield ~ Fertilizer + Water, class = Fertilizer)
# 

## ----eval=FALSE, echo=TRUE----------------------------------------------------
# # Output dataset
# res1 <- proc_glm(plants, Yield ~ Fertilizer + Water, class = Fertilizer)
# 
# # View results
# res1
# #    MODEL DEPVAR     SOURCE TYPE DF        SS    MEANSQ     FVAL        PROBF
# # 1 MODEL1  Yield Fertilizer  SS1  1 186.88889 186.88889 371.8497 5.349832e-12
# # 2 MODEL1  Yield      Water  SS1  1 109.35000 109.35000 217.5718 2.459793e-10
# # 3 MODEL1  Yield Fertilizer  SS3  1  48.53376  48.53376  96.5668 6.284856e-08
# # 4 MODEL1  Yield      Water  SS3  1 109.35000 109.35000 217.5718 2.459793e-10

## ----eval=FALSE, echo=TRUE----------------------------------------------------
# # Output dataset using "ss3" keyword
# res2 <- proc_glm(plants, Yield ~ Fertilizer + Water, class = Fertilizer,
#                  stats = ss3)
# 
# # View results
# res2
# #    MODEL DEPVAR     SOURCE TYPE DF        SS    MEANSQ     FVAL        PROBF
# # 1 MODEL1  Yield Fertilizer  SS3  1  48.53376  48.53376  96.5668 6.284856e-08
# # 2 MODEL1  Yield      Water  SS3  1 109.35000 109.35000 217.5718 2.459793e-10

## ----eval=FALSE, echo=TRUE----------------------------------------------------
# # Output using "report" output
# res3 <- proc_glm(plants, Yield ~ Fertilizer + Water, class = Fertilizer,
#                  output = "report")
# 
# # View results
# res3
# # $ClassLevels
# #        CLASS LEVELS VALUES
# # 1 Fertilizer      2    A B
# #
# # $NObs
# #                         LABEL NOBS
# # 1 Number of Observations Read   18
# # 2 Number of Observations Used   18
# #
# # $ANOVA
# #            SOURCE DF      SUMSQ      MEANSQ     FVAL        PROBF
# # 1           Model  2 296.238889 148.1194444 294.7108 9.132695e-13
# # 2           Error 15   7.538889   0.5025926       NA           NA
# # 3 Corrected Total 17 303.777778          NA       NA           NA
# #
# # $FitStatistics
# #         RSQ COEFVAR      RMSE  DEPMEAN
# # 1 0.9751829 2.84841 0.7089377 24.88889
# #
# # $TypeI
# #       SOURCE DF    SUMSQ   MEANSQ     FVAL        PROBF
# # 1 Fertilizer  1 186.8889 186.8889 371.8497 5.349832e-12
# # 2      Water  1 109.3500 109.3500 217.5718 2.459793e-10
# #
# # $TypeIII
# #       SOURCE DF     SUMSQ    MEANSQ     FVAL        PROBF
# # 1 Fertilizer  1  48.53376  48.53376  96.5668 6.284856e-08
# # 2      Water  1 109.35000 109.35000 217.5718 2.459793e-10

## ----eval=FALSE, echo=TRUE----------------------------------------------------
# # View report using "solution" keyword
# proc_glm(plants, Yield ~ Fertilizer + Water, class = Fertilizer,
#          stats = solution)

## ----eval=FALSE, echo=TRUE----------------------------------------------------
# # View report using "p" keyword
# proc_glm(plants, Yield ~ Fertilizer + Water, class = Fertilizer,
#          stats = p)

## ----eval=FALSE, echo=TRUE----------------------------------------------------
# # View report using "lsmeans" parameter
# proc_glm(plants, Yield ~ Fertilizer + Water, class = Fertilizer,
#          lsmeans = Fertilizer)

## ----eval=FALSE, echo=TRUE----------------------------------------------------
# # By grouping
# res5 <- proc_glm(plants, Yield ~ Fertilizer + Water, class = Fertilizer,
#                  by = Field)
# 
# # View results
# res5
# #      BY  MODEL DEPVAR     SOURCE TYPE DF        SS    MEANSQ      FVAL        PROBF
# # 1 North MODEL1  Yield Fertilizer  SS1  1  84.50000  84.50000 122.71784 1.044349e-04
# # 2 North MODEL1  Yield      Water  SS1  1  31.55714  31.55714  45.82988 1.068828e-03
# # 3 North MODEL1  Yield Fertilizer  SS3  1  19.96891  19.96891  29.00049 2.977727e-03
# # 4 North MODEL1  Yield      Water  SS3  1  31.55714  31.55714  45.82988 1.068828e-03
# # 5 South MODEL1  Yield Fertilizer  SS1  1 102.40000 102.40000 179.20000 3.042972e-06
# # 6 South MODEL1  Yield      Water  SS1  1  39.20000  39.20000  68.60000 7.298423e-05
# # 7 South MODEL1  Yield Fertilizer  SS3  1  21.60000  21.60000  37.80000 4.683778e-04
# # 8 South MODEL1  Yield      Water  SS3  1  39.20000  39.20000  68.60000 7.298423e-05

## ----eval=FALSE, echo=TRUE----------------------------------------------------
# # Multiple Models
# res6 <- proc_glm(plants, list(Yield ~ Fertilizer,
#                               Yield ~ Fertilizer + Water),
#                  class = Fertilizer, stats = ss3)
# 
# # View results
# res6
# #    MODEL DEPVAR     SOURCE TYPE DF        SS    MEANSQ      FVAL        PROBF
# # 1 MODEL1  Yield Fertilizer  SS3  1 186.88889 186.88889  25.58175 1.164801e-04
# # 2 MODEL2  Yield Fertilizer  SS3  1  48.53376  48.53376  96.56680 6.284856e-08
# # 3 MODEL2  Yield      Water  SS3  1 109.35000 109.35000 217.57185 2.459793e-10

## ----eval=FALSE, echo=TRUE----------------------------------------------------
# # Shape wide
# res7 <- proc_glm(plants, Yield ~ Fertilizer + Water, class = Fertilizer,
#                  stats = ss3, output = wide)
# 
# # Wide results
# res7
# #    MODEL DEPVAR     SOURCE TYPE DF        SS    MEANSQ     FVAL        PROBF
# # 1 MODEL1  Yield Fertilizer  SS3  1  48.53376  48.53376  96.5668 6.284856e-08
# # 2 MODEL1  Yield      Water  SS3  1 109.35000 109.35000 217.5718 2.459793e-10
# 
# # Shape long
# res8 <- proc_glm(plants, Yield ~ Fertilizer + Water, class = Fertilizer,
#                  stats = ss3, output = long)
# 
# # Long results
# res8
# #     MODEL DEPVAR     SOURCE TYPE   STAT         COL1
# # 1  MODEL1  Yield Fertilizer  SS3     DF 1.000000e+00
# # 2  MODEL1  Yield Fertilizer  SS3     SS 4.853376e+01
# # 3  MODEL1  Yield Fertilizer  SS3 MEANSQ 4.853376e+01
# # 4  MODEL1  Yield Fertilizer  SS3   FVAL 9.656680e+01
# # 5  MODEL1  Yield Fertilizer  SS3  PROBF 6.284856e-08
# # 6  MODEL1  Yield      Water  SS3     DF 1.000000e+00
# # 7  MODEL1  Yield      Water  SS3     SS 1.093500e+02
# # 8  MODEL1  Yield      Water  SS3 MEANSQ 1.093500e+02
# # 9  MODEL1  Yield      Water  SS3   FVAL 2.175718e+02
# # 10 MODEL1  Yield      Water  SS3  PROBF 2.459793e-10
# 
# # Shape stacked
# res9 <- proc_glm(plants, Yield ~ Fertilizer + Water, class = Fertilizer,
#                  stats = ss3, output = stacked)
# 
# # Stacked results
# res9
# #     MODEL DEPVAR     SOURCE TYPE   STAT       VALUES
# # 1  MODEL1  Yield Fertilizer  SS3     DF 1.000000e+00
# # 2  MODEL1  Yield Fertilizer  SS3     SS 4.853376e+01
# # 3  MODEL1  Yield Fertilizer  SS3 MEANSQ 4.853376e+01
# # 4  MODEL1  Yield Fertilizer  SS3   FVAL 9.656680e+01
# # 5  MODEL1  Yield Fertilizer  SS3  PROBF 6.284856e-08
# # 6  MODEL1  Yield      Water  SS3     DF 1.000000e+00
# # 7  MODEL1  Yield      Water  SS3     SS 1.093500e+02
# # 8  MODEL1  Yield      Water  SS3 MEANSQ 1.093500e+02
# # 9  MODEL1  Yield      Water  SS3   FVAL 2.175718e+02
# # 10 MODEL1  Yield      Water  SS3  PROBF 2.459793e-10
# 

