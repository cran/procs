## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Create sample data
#  cls <- read.table(header = TRUE, text = '
#      Name Sex Age Height Weight
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
#  # Turn off printing to pass CRAN checks
#  options("procs.print" = FALSE)
#  
#  # Single sample test
#  res1 <- proc_ttest(cls, var = Height, options = c(h0 = 65))
#  
#  # View results
#  res1
#  # $Statistics
#  #      VAR  N     MEAN      STD   STDERR  MIN MAX
#  # 1 Height 19 62.33684 5.127075 1.176232 51.3  72
#  #
#  # $ConfLimits
#  #      VAR     MEAN     LCLM     UCLM      STD  LCLMSTD  UCLMSTD
#  # 1 Height 62.33684 59.86567 64.80801 5.127075 3.874083 7.582045
#  #
#  # $TTests
#  #      VAR DF         T      PROBT
#  # 1 Height 18 -2.264144 0.03615222
#  

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Perform two-sample analysis
#  res2 <- proc_ttest(cls, var = Height, class = Sex)
#  
#  # View results
#  res2
#  # $Statistics
#  #      VAR      CLASS        METHOD  N      MEAN      STD   STDERR  MIN  MAX
#  # 1 Height          F          <NA>  9 60.588889 5.018328 1.672776 51.3 66.5
#  # 2 Height          M          <NA> 10 63.910000 4.937937 1.561513 57.3 72.0
#  # 3 Height Diff (1-2)        Pooled NA -3.321111       NA 2.286282   NA   NA
#  # 4 Height Diff (1-2) Satterthwaite NA -3.321111       NA 2.288340   NA   NA
#  #
#  # $ConfLimits
#  #      VAR      CLASS        METHOD      MEAN      LCLM      UCLM      STD  LCLMSTD  UCLMSTD
#  # 1 Height          F          <NA> 60.588889 56.731461 64.446317 5.018328 3.389665 9.613966
#  # 2 Height          M          <NA> 63.910000 60.377613 67.442387 4.937937 3.396487 9.014748
#  # 3 Height Diff (1-2)        Pooled -3.321111 -8.144744  1.502522       NA       NA       NA
#  # 4 Height Diff (1-2) Satterthwaite -3.321111 -8.155098  1.512875       NA       NA       NA
#  #
#  # $TTests
#  #      VAR        METHOD VARIANCES       DF         T     PROBT
#  # 1 Height        Pooled     Equal 17.00000 -1.452625 0.1645363
#  # 2 Height Satterthwaite   Unequal 16.72695 -1.451319 0.1651880
#  #
#  # $Equality
#  #      VAR   METHOD NDF DDF     FVAL     PROBF
#  # 1 Height Folded F   8   9 1.032825 0.9526904
#  

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Create sample data
#  paird <- read.table(header = TRUE, text = '
#  id before after
#  1 12 15
#  2 14 16
#  3 10 11
#  4 15 18
#  5 18 20
#  6 20 22
#  7 11 12
#  8 13 14
#  9 16 17
#  10 9 13')
#  

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Perform paired analysis
#  res3 <- proc_ttest(paird, paired = "before * after")
#  
#  # View results
#  res3
#  # $Statistics
#  #     VAR1  VAR2         DIFF  N MEAN      STD    STDERR MIN MAX
#  # 1 before after before-after 10   -2 1.054093 0.3333333  -4  -1
#  #
#  # $ConfLimits
#  #     VAR1  VAR2         DIFF MEAN      LCLM      UCLM      STD  LCLMSTD  UCLMSTD
#  # 1 before after before-after   -2 -2.754052 -1.245948 1.054093 0.725042 1.924362
#  #
#  # $TTests
#  #     VAR1  VAR2         DIFF DF  T        PROBT
#  # 1 before after before-after  9 -6 0.0002024993
#  

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # By grouping
#  res5 <- proc_ttest(cls, var = "Height",
#                     by = "Sex", options = c(h0 = 65))
#  
#  # View Results
#  res5
#  # $Statistics
#  #   BY    VAR  N     MEAN      STD   STDERR  MIN  MAX
#  # 1  F Height  9 60.58889 5.018328 1.672776 51.3 66.5
#  # 2  M Height 10 63.91000 4.937937 1.561513 57.3 72.0
#  #
#  # $ConfLimits
#  #   BY    VAR     MEAN     LCLM     UCLM      STD  LCLMSTD  UCLMSTD
#  # 1  F Height 60.58889 56.73146 64.44632 5.018328 3.389665 9.613966
#  # 2  M Height 63.91000 60.37761 67.44239 4.937937 3.396487 9.014748
#  #
#  # $TTests
#  #   BY    VAR DF         T      PROBT
#  # 1  F Height  8 -2.637001 0.02985198
#  # 2  M Height  9 -0.698041 0.50278618
#  

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Output dataset using "report" option
#  res4 <- proc_ttest(paird,
#                     paired = "before * after",
#                     output = "report")
#  
#  # View results
#  res4
#  # $`diff1:Statistics`
#  #    N MEAN      STD    STDERR MIN MAX
#  # 1 10   -2 1.054093 0.3333333  -4  -1
#  #
#  # $`diff1:ConfLimits`
#  #   MEAN      LCLM      UCLM      STD  LCLMSTD  UCLMSTD
#  # 1   -2 -2.754052 -1.245948 1.054093 0.725042 1.924362
#  #
#  # $`diff1:TTests`
#  #   DF  T        PROBT
#  # 1  9 -6 0.0002024993
#  

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Output option "wide"
#  res5 <- proc_ttest(cls, var = c("Height", "Weight"),
#                     options = c(h0 = 65),
#                     output = "wide")
#  
#  # View results
#  res5
#  # $Statistics
#  #      VAR  N      MEAN       STD   STDERR  MIN MAX
#  # 1 Height 19  62.33684  5.127075 1.176232 51.3  72
#  # 2 Weight 19 100.02632 22.773933 5.224699 50.5 150
#  #
#  # $ConfLimits
#  #      VAR      MEAN     LCLM      UCLM       STD   LCLMSTD   UCLMSTD
#  # 1 Height  62.33684 59.86567  64.80801  5.127075  3.874083  7.582045
#  # 2 Weight 100.02632 89.04963 111.00300 22.773933 17.208272 33.678652
#  #
#  # $TTests
#  #      VAR DF         T        PROBT
#  # 1 Height 18 -2.264144 3.615222e-02
#  # 2 Weight 18  6.703988 2.754086e-06
#  
#  # Output option "long"
#  res6 <- proc_ttest(cls, var = c("Height", "Weight"),
#                     options = c(h0 = 65),
#                     output = "long")
#  
#  # View results
#  res6
#  # $Statistics
#  #     STAT    Height     Weight
#  # 1      N 19.000000  19.000000
#  # 2   MEAN 62.336842 100.026316
#  # 3    STD  5.127075  22.773933
#  # 4 STDERR  1.176232   5.224699
#  # 5    MIN 51.300000  50.500000
#  # 6    MAX 72.000000 150.000000
#  #
#  # $ConfLimits
#  #      STAT    Height    Weight
#  # 1    MEAN 62.336842 100.02632
#  # 2    LCLM 59.865671  89.04963
#  # 3    UCLM 64.808013 111.00300
#  # 4     STD  5.127075  22.77393
#  # 5 LCLMSTD  3.874083  17.20827
#  # 6 UCLMSTD  7.582045  33.67865
#  #
#  # $TTests
#  #    STAT      Height       Weight
#  # 1    DF 18.00000000 1.800000e+01
#  # 2     T -2.26414390 6.703988e+00
#  # 3 PROBT  0.03615222 2.754086e-06
#  
#  # Output option "stacked"
#  res7 <- proc_ttest(cls, var = c("Height", "Weight"),
#                     options = c(h0 = 65),
#                     output = "stacked")
#  
#  # View results
#  res7
#  # $Statistics
#  #       VAR   STAT     VALUES
#  # 1  Height      N  19.000000
#  # 2  Height   MEAN  62.336842
#  # 3  Height    STD   5.127075
#  # 4  Height STDERR   1.176232
#  # 5  Height    MIN  51.300000
#  # 6  Height    MAX  72.000000
#  # 7  Weight      N  19.000000
#  # 8  Weight   MEAN 100.026316
#  # 9  Weight    STD  22.773933
#  # 10 Weight STDERR   5.224699
#  # 11 Weight    MIN  50.500000
#  # 12 Weight    MAX 150.000000
#  #
#  # $ConfLimits
#  #       VAR    STAT     VALUES
#  # 1  Height    MEAN  62.336842
#  # 2  Height    LCLM  59.865671
#  # 3  Height    UCLM  64.808013
#  # 4  Height     STD   5.127075
#  # 5  Height LCLMSTD   3.874083
#  # 6  Height UCLMSTD   7.582045
#  # 7  Weight    MEAN 100.026316
#  # 8  Weight    LCLM  89.049631
#  # 9  Weight    UCLM 111.003000
#  # 10 Weight     STD  22.773933
#  # 11 Weight LCLMSTD  17.208272
#  # 12 Weight UCLMSTD  33.678652
#  #
#  # $TTests
#  #      VAR  STAT        VALUES
#  # 1 Height    DF  1.800000e+01
#  # 2 Height     T -2.264144e+00
#  # 3 Height PROBT  3.615222e-02
#  # 4 Weight    DF  1.800000e+01
#  # 5 Weight     T  6.703988e+00
#  # 6 Weight PROBT  2.754086e-06
#  

