## rbind() cbind()
m <- cbind(1, 1:7)
m
n <- rbind(1, 1:7)
n

## Merge Datasets
play_store<-read.table("store.csv",header=T,sep=",")
play_info<-read.table("info.csv",header=T,sep=",")
colnames(play_info)
colnames(play_store)
View(play_store)
View(head(play_info))

# The rows in the two data frames that match on the specified columns are extracted, and joined together. 
merged <-merge(play_store,play_info,by=c("Store","Date"))
new_data <- merged[,c("Store","Date","Weekly_Sales","Temperature")]
plot(Weekly_Sales~Temperature, data=new_data,main="Weekly sales at different temperatures")


# Using dplyr
library(dplyr)
merged2<-left_join(play_store, play_info, by = c("Store"="Store","Date"="Date"))
dim(merged2)
new_data2 <- merged2[,c("Store","Date","Weekly_Sales","Temperature")]
identical(new_data2,new_data)
# The order of row is not maintained when using merge()
# In merge(): The rows are by default lexicographically sorted on the common columns, 
# but for ‘sort = FALSE’ are in an unspecified order.


# Filtering
good<-new_data2[new_data2$Weekly_Sales>20000,]
plot(good[,4],good[,3],ylab="Sales",xlab="Temp")
store1<-play_info[play_info$Store==1,]


## Missing Values
# In R missing values are represented by the symble NA(not available)
# instead of ==, use is.na() to test
is.na(c(3,-7.5, NA, pi))
is.na(3/0)
3/0
is.infinite(3/0)

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