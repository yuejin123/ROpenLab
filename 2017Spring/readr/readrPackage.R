# Why do we use readr package?
# Faster and gives more convenient output: Base R vs Tibble family
# Use a better strategy for guessing column types.

# read_csv(): comma separated (CSV) files
data<-read_csv("ranking.csv",skip=1)

# Note that readr prints the column specification. 
# allows you to check that the columns have been read in as you expect
data<-read_csv("ranking.csv",skip=1,col_types=cols(
  Rank = col_integer(),
  Name = col_character(),
  State = col_character()
))



# read in file interactively
my_data <- read_csv(file.choose())

# choose your own delimiter
my_data2 <- read_delim("gmp.txt", delim = " \" ")
my_data2 <- read_delim("gmp.txt", delim = " \" ",skip=1)



# read_lines(): returns a character vector with one element for each line.
my_data3<-read_lines(readr_example("mtcars.csv"))


# read_tsv(): tab separated files
# read_fwf(): fixed width files
# read_table(): tabular files where colums are separated by white-space.


# fread(): even faster
library(data.table)
my_data4<-fread("NYCHousing.csv",select=2,col.names="Property Name")

willFail<-read_csv("MERGED2014_15_PP.csv")
willWork<-read_csv("MERGED2014_15_PP.csv",n_max=10)
muchBetter<-fread("MERGED2014_15_PP.csv",select=4,col.names="Name")
