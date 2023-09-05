## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Create input data
#  dat <- read.table(header = TRUE, text = '
#                    Name    Subject   Semester1  Semester2
#                    Samma	  Maths	    96             94
#                    Sandy	  English	  76             51
#                    Devesh	German	  76             95
#                    Rakesh	Maths	    50             63
#                    Priya	  English	  62             80
#                    Kranti	Maths	    92             92
#                    William	German	  87             75')
#  
#  # View data
#  dat
#  #      Name Subject Semester1 Semester2
#  # 1   Samma   Maths        96        94
#  # 2   Sandy English        76        51
#  # 3  Devesh  German        76        95
#  # 4  Rakesh   Maths        50        63
#  # 5   Priya English        62        80
#  # 6  Kranti   Maths        92        92
#  # 7 William  German        87        75

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # No parameters
#  res <- proc_transpose(dat)
#  
#  # View result
#  res
#  #        NAME COL1 COL2 COL3 COL4 COL5 COL6 COL7
#  # 1 Semester1   96   76   76   50   62   92   87
#  # 2 Semester2   94   51   95   63   80   92   75
#  

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Var parameter
#  res <- proc_transpose(dat, var = "Semester1")
#  
#  # View result
#  res
#  #        NAME COL1 COL2 COL3 COL4 COL5 COL6 COL7
#  # 1 Semester1   96   76   76   50   62   92   87
#  

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # With prefix
#  res <- proc_transpose(dat, name = VarName, prefix = Student)
#  
#  # View result
#  res
#      VarName Student1 Student2 Student3 Student4 Student5 Student6 Student7
#  1 Semester1       96       76       76       50       62       92       87
#  2 Semester2       94       51       95       63       80       92       75

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # With suffix
#  res <- proc_transpose(dat, name = VarName, prefix = S, suffix = Score)
#  
#  # View result
#  res
#      VarName S1Score S2Score S3Score S4Score S5Score S6Score S7Score
#  1 Semester1      96      76      76      50      62      92      87
#  2 Semester2      94      51      95      63      80      92      75

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Assign column names from data
#  res <- proc_transpose(dat, name = VarName, id = Name)
#  
#  # View result
#  res
#      VarName Samma Sandy Devesh Rakesh Priya Kranti William
#  1 Semester1    96    76     76     50    62     92      87
#  2 Semester2    94    51     95     63    80     92      75

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Two id variables
#  res <- proc_transpose(dat, id = v(Name, Subject))
#  
#  res
#  #        NAME Samma.Maths Sandy.English Devesh.German Rakesh.Maths Priya.English Kranti.Maths William.German
#  # 1 Semester1          96            76            76           50            62           92             87
#  # 2 Semester2          94            51            95           63            80           92             75

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Underscore delimiter
#  res <- proc_transpose(dat, id = v(Name, Subject), delimiter = "_")
#  
#  res
#  #        NAME Samma_Maths Sandy_English Devesh_German Rakesh_Maths Priya_English Kranti_Maths William_German
#  # 1 Semester1          96            76            76           50            62           92             87
#  # 2 Semester2          94            51            95           63            80           92             75

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # By variable
#  res <- proc_transpose(dat, by = Name, id = Subject, name = Semester)
#  
#  # View result
#  res
#  #       Name  Semester German English Maths
#  # 1   Devesh Semester1     76      NA    NA
#  # 2   Devesh Semester2     95      NA    NA
#  # 3   Kranti Semester1     NA      NA    92
#  # 4   Kranti Semester2     NA      NA    92
#  # 5    Priya Semester1     NA      62    NA
#  # 6    Priya Semester2     NA      80    NA
#  # 7   Rakesh Semester1     NA      NA    50
#  # 8   Rakesh Semester2     NA      NA    63
#  # 9    Samma Semester1     NA      NA    96
#  # 10   Samma Semester2     NA      NA    94
#  # 11   Sandy Semester1     NA      76    NA
#  # 12   Sandy Semester2     NA      51    NA
#  # 13 William Semester1     87      NA    NA
#  # 14 William Semester2     75      NA    NA

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # By variable
#  res <- proc_transpose(dat, by = Subject, id = Name)
#  
#  #   Subject      NAME Sandy Priya Devesh William Samma Rakesh Kranti
#  # 1 English Semester1    76    62     NA      NA    NA     NA     NA
#  # 2 English Semester2    51    80     NA      NA    NA     NA     NA
#  # 3  German Semester1    NA    NA     76      87    NA     NA     NA
#  # 4  German Semester2    NA    NA     95      75    NA     NA     NA
#  # 5   Maths Semester1    NA    NA     NA      NA    96     50     92
#  # 6   Maths Semester2    NA    NA     NA      NA    94     63     92
#  

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Two by variables
#  res <- proc_transpose(dat, by = v(Name, Subject))
#  
#  # View results
#  res
#  #       Name Subject      NAME COL1
#  # 1    Priya English Semester1   62
#  # 2    Priya English Semester2   80
#  # 3    Sandy English Semester1   76
#  # 4    Sandy English Semester2   51
#  # 5   Devesh  German Semester1   76
#  # 6   Devesh  German Semester2   95
#  # 7  William  German Semester1   87
#  # 8  William  German Semester2   75
#  # 9   Kranti   Maths Semester1   92
#  # 10  Kranti   Maths Semester2   92
#  # 11  Rakesh   Maths Semester1   50
#  # 12  Rakesh   Maths Semester2   63
#  # 13   Samma   Maths Semester1   96
#  # 14   Samma   Maths Semester2   94
#  

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Restore original data shape
#  res2 <- proc_transpose(res, by = v(Name, Subject), id = NAME)
#  
#  # View results
#  res2[ , c("Name", "Subject", "Semester1", "Semester2")]
#  #      Name Subject Semester1 Semester2
#  # 1   Priya English        62        80
#  # 2   Sandy English        76        51
#  # 3  Devesh  German        76        95
#  # 4 William  German        87        75
#  # 5  Kranti   Maths        92        92
#  # 6  Rakesh   Maths        50        63
#  # 7   Samma   Maths        96        94
#  

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Create sample data
#  dat <- read.table(header = TRUE, text = '
#                      ID	Name	Score
#                      1	David	 74
#                      2	Sam	   45
#                      3	Bane	 87
#                      3	Mary	 92
#                      4	Dane	 23
#                      5	Jenny	 87
#                      6	Simran 63
#                      8	Priya	 72
#                      1	David	 45
#                      2	Ram	   54
#                      3	Bane	 87
#                      5	Ken	   87')
#  
#  # View data
#  dat
#  #    ID   Name Score
#  # 1   1  David    74
#  # 2   2    Sam    45
#  # 3   3   Bane    87
#  # 4   3   Mary    92
#  # 5   4   Dane    23
#  # 6   5  Jenny    87
#  # 7   6 Simran    63
#  # 8   8  Priya    72
#  # 9   1  David    45
#  # 10  2    Ram    54
#  # 11  3   Bane    87
#  # 12  5    Ken    87

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Default sort
#  res <- proc_sort(dat)
#  
#  # View results
#  res
#  #    ID   Name Score
#  # 9   1  David    45
#  # 1   1  David    74
#  # 10  2    Ram    54
#  # 2   2    Sam    45
#  # 3   3   Bane    87
#  # 11  3   Bane    87
#  # 4   3   Mary    92
#  # 5   4   Dane    23
#  # 6   5  Jenny    87
#  # 12  5    Ken    87
#  # 7   6 Simran    63
#  # 8   8  Priya    72
#  

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Sort By
#  res <- proc_sort(dat, by = Score)
#  
#  # View results
#  res
#  #    ID   Name Score
#  # 5   4   Dane    23
#  # 2   2    Sam    45
#  # 9   1  David    45
#  # 10  2    Ram    54
#  # 7   6 Simran    63
#  # 8   8  Priya    72
#  # 1   1  David    74
#  # 3   3   Bane    87
#  # 6   5  Jenny    87
#  # 11  3   Bane    87
#  # 12  5    Ken    87
#  # 4   3   Mary    92

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Sort By
#  res <- proc_sort(dat, by = v(Score, Name))
#  
#  # View results
#  res
#  #    ID   Name Score
#  # 5   4   Dane    23
#  # 9   1  David    45
#  # 2   2    Sam    45
#  # 10  2    Ram    54
#  # 7   6 Simran    63
#  # 8   8  Priya    72
#  # 1   1  David    74
#  # 3   3   Bane    87
#  # 11  3   Bane    87
#  # 6   5  Jenny    87
#  # 12  5    Ken    87
#  # 4   3   Mary    92

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Sort By
#  res <- proc_sort(dat, by = Score, order = descending)
#  
#  # View results
#  res
#  #    ID   Name Score
#  # 4   3   Mary    92
#  # 3   3   Bane    87
#  # 6   5  Jenny    87
#  # 11  3   Bane    87
#  # 12  5    Ken    87
#  # 1   1  David    74
#  # 8   8  Priya    72
#  # 7   6 Simran    63
#  # 10  2    Ram    54
#  # 2   2    Sam    45
#  # 9   1  David    45
#  # 5   4   Dane    23

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Sort By
#  res <- proc_sort(dat, by = v(Score, Name), order = v(d, a))
#  
#  # View results
#  res
#  #    ID   Name Score
#  # 4   3   Mary    92
#  # 3   3   Bane    87
#  # 11  3   Bane    87
#  # 6   5  Jenny    87
#  # 12  5    Ken    87
#  # 1   1  David    74
#  # 8   8  Priya    72
#  # 7   6 Simran    63
#  # 10  2    Ram    54
#  # 9   1  David    45
#  # 2   2    Sam    45
#  # 5   4   Dane    23

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Keep Name and Score only
#  res <- proc_sort(dat, by = Name, keep = v(Name, Score))
#  
#  # View results
#  res
#  #      Name Score
#  # 3    Bane    87
#  # 11   Bane    87
#  # 5    Dane    23
#  # 1   David    74
#  # 9   David    45
#  # 6   Jenny    87
#  # 12    Ken    87
#  # 4    Mary    92
#  # 8   Priya    72
#  # 10    Ram    54
#  # 2     Sam    45
#  # 7  Simran    63
#  

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Keep and Nodupkey
#  res <- proc_sort(dat, by = Name, keep = Name, options = nodupkey)
#  
#  # View results
#  res
#  #      Name
#  # 3    Bane
#  # 5    Dane
#  # 1   David
#  # 6   Jenny
#  # 12    Ken
#  # 4    Mary
#  # 8   Priya
#  # 10    Ram
#  # 2     Sam
#  # 7  Simran

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  # Keep and dupkey
#  res <- proc_sort(dat, by = Name, options = dupkey)
#  
#  # View results
#  res
#  #   ID  Name Score
#  # 1  3  Bane    87
#  # 2  3  Bane    87
#  # 3  1 David    74
#  # 4  1 David    45

