## R Open Lab - Nov 30th

# Create a vector filled with real values
# Initialization
data <- rep(NA,10)

for(i in 1:10) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  data[i] <- i^2
  data[i]
}

i

# Nested for loop
# Create a 10 x 10 matrix (of 30 rows and 30 columns)
mat <- matrix(nrow=10, ncol=10)

# For each row and for each column, assign values based on position: product of two indexes
for(i in 1:dim(mat)[1]) {
  for(j in 1:dim(mat)[2]) {
    mat[i,j] = i*j
  }
}

mat

# While loop - potentially infinite loop
a<-NULL
i=1
while (length(a)<10) {   
  a[i]<-i
  i=i+1  
}


# Break: jump out of the loops
mat <- matrix(NA,nrow=10, ncol=10)
for(i in 1:dim(mat)[1]) {
  if (i ==6) {break}
  for(j in 1:dim(mat)[2]) {
    mat[i,j] = i*j
  }
}

# next: skip the current loop and jump to the start of the next loop
for(i in 1:dim(mat)[1]) {
  if (i ==6) {next}
  for(j in 1:dim(mat)[2]) {
    mat[i,j] = i*j
  }
}

