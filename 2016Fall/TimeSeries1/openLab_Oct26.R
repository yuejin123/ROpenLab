## R Open Lab Oct 26th

## Time Series Analysis using zoo package
# We use the full 
library(zoo)
data<-read.table("time_data.csv",header=T,sep=",")
attach(data)
colnames(data)
date<-as.Date(data$Date)
avg.weekly.sales<-aggregate(data$Weekly_Sales,by=list(factor(data$Date)),mean)
ts.sales<-zoo(avg.weekly.sales[,2],as.Date(avg.weekly.sales[,1]))
index(ts.sales)
coredata(ts.sales)

# Subset time series data
(window(ts.sales,start=as.Date("2011-11-01"),end=as.Date("2011-12-31"))
ts.sales[as.Date("2010-02-12")]

# Plot time series data
plot.ts(ts.sales,xlab="Date",ylab="Weekly Sales",main="Weekly Sales from 2010-2012",xaxt="n")
axis(1, index(ts.sales), format(index(ts.sales)), cex.axis = .8)


# Merge also works for time series data

# See if there is a seasonal trend
diff.sales<-zoo(diff(coredata(ts.sales)),index(ts.sales))
plot.ts(diff.sales,xlab="Date",ylab="Weekly Sales",main="Weekly Sales from 2010-2012",xaxt="n")
axis(1, index(ts.sales), format(index(ts.sales)), cex.axis = .8)

# Moving Average
acf(diff.sales,main='ACF Apple',ylim=c(- 0.5,1))

# Auto-regressive
pacf.appl=pacf(diff.sales,main='PACF Apple',ylim=c(-0.5,1))

# ARIMA
library(forecast)
auto.arima(diff.sales)

# Why ARIMA does not work
# What if I use the Dept information. Would the result change?
vignette("zoo")
vignette("xts")