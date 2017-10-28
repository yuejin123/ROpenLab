# loading and defining variables for the global environment

library(rsconnect)
library(shiny)
library(leaps)
library(glmnet)

Multiply=function(a,b){
  force(a)
  force(b)
  function(x){a(x)*b(x)}
}

DF_t <- function(t){(1-rr)*(t^(-2+l)*coef(lm2)[2]+coef(lm2)[1])}
