## Basic Functionality of stringr
# Character manipulation: allow you to manipulate the individual characters inside the strings inside character vectors.
# Pattern matching functions:  recognise pattern description

## Character manipulation
# install.packages("stringr")
library(stringr)
x <- c("abcdef", "ghifjk")
str_length(x)
str_sub(x, 3, 3)


## Pattern matching
strings <- c(
  "apple", 
  "219 733 8965", 
  "329-293-8753", 
  "Work: 579-499-7527; Home: 543.355.3679"
)
phone <- "([2-9][0-9]{2})[- .]([0-9]{3})[- .]([0-9]{4})"
# return T/F: detects the presence or absence of a pattern in the elements of list
str_detect(strings, phone)

# returns the elements of a character vector that match a regular expression
str_subset(strings, phone)

#######
# Two groups of functions ## and ##_all: return the first match/return all the matches
#######

# str_match() extracts capture groups formed by () from the first match. 
# It returns a character matrix with one column for the complete match and one column for each group.
str_match(strings, phone)
str_match_all(strings, phone)

# locates the first position of a pattern 
# returns a numeric matrix with columns start and end. 
str_locate(strings, phone)

# str_locate_all() locates all matches
# returning a list of numeric matrices. Similar to regexpr() and gregexpr().
str_locate_all(strings, phone)

str_extract(strings, phone)
str_extract_all(strings, phone, simplify = TRUE)

str_replace(strings, phone, "XXX-XXX-XXXX")
str_replace_all(strings, phone, "XXX-XXX-XXXX")

str_split("a-b-c", "-")



## Regular expression
vignette("regular-expressions")
## Cheatsheet
#  http://www.rexegg.com/regex-quickstart.html
