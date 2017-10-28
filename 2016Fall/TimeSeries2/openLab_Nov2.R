## R Open Lab Nov 2th

## Time Series Analysis using zoo package
## 

library(zoo)

data<-read.table("time_data.csv",header=T,sep=",")
date<-as.Date(data$Date)
avg.weekly.sales<-aggregate(data$Weekly_Sales,by=list(factor(data$Date)),mean)
ts.sales<-zoo(avg.weekly.sales[,2],as.Date(avg.weekly.sales[,1]))

diff.sales<-zoo(diff(coredata(ts.sales)),index(ts.sales))

# Moving Average
acf(diff.sales,main='ACF Apple',ylim=c(- 0.5,1))

# Auto-regressive
pacf(diff.sales,main='PACF Apple',ylim=c(-0.5,1))
stl(ts.sales,s.window="periodic")

# ARIMA
library(forecast)
# The parameters of ARIMA consist of three components: 
# p (autoregressive parameter), d (number of differencing), and q (moving average parameters).

# If ACF (autocorrelation graph) cut off after lag n, PACF dies down: ARIMA(0, d, n).identify MA(q)
# If ACF dies down, PACF cut off after lag n: ARIMA(n, d, 0)èidentify AR(p)
# If ACF and PACF die down: mixed ARIMA model, need differencing
fit<-auto.arima(diff.sales)
arima(data,c(p,d,q))
accuracy(fit)

## Let's play with some larger dataset

econ<-read.table("gdp.csv",sep=",",header=TRUE,as.is=TRUE)
colnames(econ)<-c("Date","Comfort","Economy","Expect","Unempl","P.I")
econ.ts<-zoo(econ[,2],as.Date(econ$Date,format="%m/%d/%Y"))

plot(econ.ts,xlab="Year",ylab=colnames(econ)[2])


library(urca)
summary(ur.df(econ.ts))
summary(ur.df(econ.ts,type="drift"))

# Seasonal Trend Decomposition in R
acf(econ.ts,na.action=na.pass,lag.max=120)
 pacf(econ.ts,na.action=na.pass,lag.max=120)

par(mfrow=c(2,2))

stl(econ.ts,s.window="periodic")
fit2<-stl(ts(coredata(econ.ts), frequency=52), s.window="periodic", robust=TRUE)
plot(fit2)
plot(x=index(econ.ts),y=fit2$time.series[,"trend"],cex=0.2,xlab="Year",
     ylab=colnames(econ)[2])
lm(index(econ.ts)~fit2$time.series[,"trend"])

na.approx(data)

summary(fit2)
plot(fit2)


ts.expect<-zoo(econ[,4],as.Date(econ$Date,format="%m/%d/%Y"))
ts.expect<-na.approx(ts.expect)
fit3<-stl(ts(coredata(ts.expect), frequency=52), s.window="periodic", robust=TRUE)
plot(fit3)
plot(x=index(ts.expect),y=fit3$time.series[,"trend"],cex=0.2,xlab="Year",
     ylab=colnames(econ)[4])


ts.pi<-zoo(econ[,6],as.Date(econ$Date,format="%m/%d/%Y"))
ts.pi<-na.approx(ts.pi)
fit4<-stl(ts(coredata(ts.pi), frequency=52), s.window="periodic", robust=TRUE)
plot(fit4)
plot(x=index(ts.pi),y=fit4$time.series[,"trend"],cex=0.2,xlab="Year",
     ylab=colnames(econ)[6])


