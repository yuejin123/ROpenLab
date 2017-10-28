## apply a function to rows or columns of a matrix or data frame

# apply(X, MARGIN, FUN, ARGs); X is an array, including a matrix.
result1<-apply(iris[,1:3], 1, mean)
head(result1)
test<-function(x){
  if(sum(x)<4){
    return(x-1)
  }
  else{
    return(1)
  }
}
x<-matrix(1:9,nrow=3)
apply(x,2,test)
## -----------------------------------------------------------------
## apply a function to levels of a factor vector

# What is factor values?
factor(1:3)
factor(1:3, levels=1:5)
data<-rep(c("A","B","C"),c(1,3,2))
myfactor<-factor(data,levels=unique(data),labels=c(1,2,3))
myfactor

## tapply is designed to work on a single vector with results returned as a matrix or array
# tapply(vector, factor, FUN)
tapply(1:6,myfactor,mean)

data(mtcars)
result2<-tapply(mtcars$mpg, factor(mtcars$cyl), mean)
result2
## aggregate is designed to work on multiple columns with one function and return a dataframe 
# aggreagate(data, list, FUN)
result3<-aggregate(mtcars[,c(1,3,5)], list(mtcars$cyl), mean)
result3


## -----------------------------------------------------------------
## apply a function to elements of a list or vector
# lapply(X, FUN), returns a list

# sapply(X, FUN), attempts to return the simplest data object,
mylist <- as.list(mtcars[1:3,1:3])
lapply(mylist, sum)
sapply(mylist, sum)

