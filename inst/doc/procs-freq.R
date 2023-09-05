## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Create sample data
#  dat <- read.table(header = TRUE,
#                    text = 'x y z
#                            6 A 60
#                            6 A 70
#                            2 A 100
#                            2 B 10
#                            3 B 67
#                            2 C 81
#                            3 C 63
#                            5 C 55')
#  
#  # View sample data
#  dat
#  #   x y   z
#  # 1 6 A  60
#  # 2 6 A  70
#  # 3 2 A 100
#  # 4 2 B  10
#  # 5 3 B  67
#  # 6 2 C  81
#  # 7 3 C  63
#  # 8 5 C  55
#  

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Turn off printing for CRAN
#  options("procs.print" = FALSE)
#  
#  # Get frequencies
#  proc_freq(dat, tables = y)
#  

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Turn off cumulative columns
#  proc_freq(dat, tables = y, options = nocum)
#  

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  proc_freq(dat, tables = y, options = v(nocum, nonobs, nopercent))

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Create crosstab
#  proc_freq(dat, tables = y * x)
#  

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Two-way frequency in list form
#  proc_freq(dat, tables = y * x, options = v(list, nosparse))

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # View frequencies only
#  proc_freq(dat, tables = y * x,
#            options = v(norow, nocol, nopercent))

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Request two crosstabs
#  proc_freq(dat, tables = v(y * x, y * z),
#            options = v(norow, nocol, nopercent))

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Turn on nlevels option
#  proc_freq(dat, tables = y, options = nlevels)

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Add weight variable
#  proc_freq(dat, tables = y, weight = z)

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Request Chi-Square and Output datasets
#  res <- proc_freq(dat, tables = y * x, options = chisq)

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # View results
#  res
#  # $`y * x`
#  #    VAR1 VAR2 CAT1 CAT2 N CNT  PCT
#  # 1     y    x    A    2 8   1 12.5
#  # 2     y    x    A    3 8   0  0.0
#  # 3     y    x    A    5 8   0  0.0
#  # 4     y    x    A    6 8   2 25.0
#  # 5     y    x    B    2 8   1 12.5
#  # 6     y    x    B    3 8   1 12.5
#  # 7     y    x    B    5 8   0  0.0
#  # 8     y    x    B    6 8   0  0.0
#  # 9     y    x    C    2 8   1 12.5
#  # 10    y    x    C    3 8   1 12.5
#  # 11    y    x    C    5 8   1 12.5
#  # 12    y    x    C    6 8   0  0.0
#  #
#  # $`chisq:y * x`
#  #      CHISQ CHISQ.DF   CHISQ.P
#  # 1 6.444444        6 0.3752853
#  

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Request output data
#  res <- proc_freq(dat, tables = v(x, y, MyCross = y * x),
#                   output = out)
#  
#  # View results
#  res
#  $x
#    VAR CAT N CNT  PCT
#  1   x   2 8   3 37.5
#  2   x   3 8   2 25.0
#  3   x   5 8   1 12.5
#  4   x   6 8   2 25.0
#  
#  $y
#    VAR CAT N CNT  PCT
#  1   y   A 8   3 37.5
#  2   y   B 8   2 25.0
#  3   y   C 8   3 37.5
#  
#  $MyCross
#     VAR1 VAR2 CAT1 CAT2 N CNT  PCT
#  1     y    x    A    2 8   1 12.5
#  2     y    x    A    3 8   0  0.0
#  3     y    x    A    5 8   0  0.0
#  4     y    x    A    6 8   2 25.0
#  5     y    x    B    2 8   1 12.5
#  6     y    x    B    3 8   1 12.5
#  7     y    x    B    5 8   0  0.0
#  8     y    x    B    6 8   0  0.0
#  9     y    x    C    2 8   1 12.5
#  10    y    x    C    3 8   1 12.5
#  11    y    x    C    5 8   1 12.5
#  12    y    x    C    6 8   0  0.0
#  

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Shape wide
#  res1 <- proc_freq(dat, tables = y,
#                    output = wide)
#  
#  # Wide results
#  res1
#  #   VAR CAT N CNT  PCT
#  # 1   y   A 8   3 37.5
#  # 2   y   B 8   2 25.0
#  # 3   y   C 8   3 37.5
#  
#  # Shape long
#  res2 <- proc_freq(dat, tables = y,
#                    output = long)
#  
#  # Long results
#  res2
#  #   VAR STAT    A  B    C
#  # 1   y    N  8.0  8  8.0
#  # 2   y  CNT  3.0  2  3.0
#  # 3   y  PCT 37.5 25 37.5
#  
#  # Shape stacked
#  res3 <- proc_freq(dat, tables = y,
#                    output = stacked)
#  
#  # Stacked results
#  res3
#  #   VAR CAT STAT VALUES
#  # 1   y   A    N    8.0
#  # 2   y   A  CNT    3.0
#  # 3   y   A  PCT   37.5
#  # 4   y   B    N    8.0
#  # 5   y   B  CNT    2.0
#  # 6   y   B  PCT   25.0
#  # 7   y   C    N    8.0
#  # 8   y   C  CNT    3.0
#  # 9   y   C  PCT   37.5
#  

