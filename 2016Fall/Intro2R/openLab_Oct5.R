5 + 4
5 * 4

# Create a vector
x <- c(5, 29, 13, 87)
x <- 1:50
x <- c(2, pi, 1/2, 3^2)
u <- rep(1, 18)

# use <- instead of =

# Subsetting vectors
y <- c(1:10)
y[2]
y[3:5]
y[c(1, 4)]
y[-c(1, 4)]

# More on vectors
n=length(x)
summary(x)

# Create a string vector
string1 <- "R"
string2 <- "Open Lab"
string_vec<-c(string1, string2)
string_vec

# Building a matrix
mat <- matrix(1:9, nrow = 3, ncol = 3)
mat <- matrix(1:9, nrow = 3)
mat2 <- matrix(nrow = 2, ncol = 2)

mat2[1,1] <- sqrt(27)
mat2[1,2] <- 4
mat2[2,1] <- exp(1)
mat2[2,2] <- log(1)

## Operation about matrix

colnames(mat2)
colnames(mat2) <- c("Column1", "Column2")
mat2

# Dimension of mat2
dim(mat2)

# Get the internal structure of an object
str(mat2)

# Transpose
t(mat) 
mat3<-matrix(2:10)
dim(mat3)<-c(3,3)
mat + mat3
mat %*% mat3
mat^-1
det(mat3)

x <- matrix(1:4, ncol = 2)
det(x)

# Subsetting
mat[1:2, 2:3]


# Using rbind()
rbind(mat2, x)
vec1 <- rep(0, 4)
vec2 <- c("This", "is", "R", "Open Lab")

# Import data
play_store<-read.table("store.csv",header=TRUE,sep=",")
head(play_store)
tail(play_store)
summary(play_store[,1])

# Import data from excel(xlsx)
install.packages("XLConnect")
library(XLConnect)

play_store<-read.table("store.csv",header=TRUE,sep=",")
summary(play_store)

plot(play_store$Weekly_Sales, type="l", lty=5,col=2,xlab="Year", ylab="Weekly Sales",main="Weekly Sales - Walmart")

