### Vector--------------------------------------- 
# Create a vector
x <- c(5, 29, 13, 87)
x <- 1:50
x <- c(2, pi, 1/2, 3^2)
u <- rep(1, 18)

# Subsetting vectors
y <- c(1:10)
y[2]
y[3:5]
y[c(1, 4)]
y[-c(1, 4)]

# More on vectors
n=length(x)
summary(x)

###  matrix---------------------------------------
# Building a matrix
mat <- matrix(1:9, nrow = 3, ncol = 3)
mat
colnames(mat)
colnames(mat2) <- c("Column1", "Column2","Column3")
mat
# Dimension of mat2
dim(mat2)
# Subsetting
mat[1:2, 2:3]


###  dataframe---------------------------------------
# Building a datafrme
pts <- data.frame(x = cars[1:10,1], y = cars[1:10,2])


### Importing data---------------------------------------
play_store<-read.table("store.csv",header=TRUE,sep=",")
head(play_store)
tail(play_store)
summary(play_store[,1])

### Filtering---------------------------------------
z <- matrix(c(1:3, "R", "Open", "Lab", pi, sqrt(4),2^3), nrow = 3)
colnames(z) <- c("First", "Second", "Third")
z[, 1] != 1
z[(z[, 1] != 1), 3]

w <- c(-3, 20, 9, 2)
w[w > 3]


## Simple plotting---------------------------------------
one <- c(1:50)
four <- (1:50)*0.8+0.3
plot(four~one)
plot(four~one, xlim=c(1,50), ylim=range(four), pch=10)
plot(four~one, xlim=range(one), ylim=range(four), pch=16,col=3,main="random plot")
title('Random Plot')
abline(a=0,b=1,col=1)
?abline
filename = 'R OpenLab Oct 12'
dev.copy(device=png, file=filename, height=600, width=800)
dev.off()



