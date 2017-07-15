## R Open Lab Oct. 19th

## Merge Datasets
play_store<-read.table("store.csv",header=T,sep=",")
play_info<-read.table("info.csv",header=T,sep=",")
colnames(play_info)
colnames(play_store)
lookup<-unique(play_store)
merged <-merge(play_store,play_info,by=c("Store","Date"))
new_data <- merged[,c("Store","Date","Weekly_Sales","Temperature")]
plot(Weekly_Sales~Temperature, data=new_data,main="Weekly sales at different temperatures")


#Filtering
z <- matrix(c(1:3, "R", "Open", "Lab", pi, sqrt(4),2^3), nrow = 3)
colnames(z) <- c("First", "Second", "Third")
z[, 1] != 1
z[(z[, 1] != 1), 3]
z[1:2,]
play_info[play_info$Store==1,]

# Categorical Data - store in info.csv
typeof(factor(play_info$Store,labels=c("a","b","c","d","e","f")))
store_list<-factor(play_info$Store,levels=unique(play_info$Store))
tapply(play_info$Temperature, store_list, mean)
lapply, sapply, apply

## Missing Values
# In R missing values are represented by the symble NA(not available)
# instead of ==, use is.na() to test
is.na(c(3,-7.5, NA, pi))
is.na(3/0)
3/0
is.infinite(3/0)

#NaN

a<-matrix(c(1:4),nrow=2)
a[2,2]<-NA
is.na(a)

# Deletion
b<-c(1:9,NA)
mean(b)
mean(b,na.rm=TRUE)
colSums(a,na.rm=TRUE)


?na.omit #see the difference between different ways of handling NA

df <- data.frame(x = c(1, 2, 3), y = c(0, 10, NA))
df
na.omit(df)

# Other approaches to missing data: rational approach, multiple imputation, pairwise deletion

## Practice

# 1)
set.seed(100)
Df1 <- iris[sample(1:nrow(iris), 10), c(1,2,3,5)]
Df2 <- iris[sample(1:nrow(iris), 10), c(1,2,4,5) ]


# Merge using Df1 & Df2 by variable as 'Species'

# 2)
# Remove missing value from c(1, 2, NA, 4)

# 3)
# Calculate the mean value of sample(1:100) where

# Further Explore R using swirl
install.packages("swirl")
library(swirl)
swirl()
# Once you do that, swirl will take over and start giving you instructions (and peppy feedback!)
# to take you though the basics of R. Have fun!
# Typing bye() causes swirl to exit