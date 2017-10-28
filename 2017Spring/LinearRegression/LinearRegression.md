Simple Linear Regression using R
========================================================
author: Yue Jin
date: Feb 15 2017




What is Simple Linear Regression
========================================================

Simple linear regression is an approach for modeling the **relationship** between a response variable, denoted y and a predictor variable, denoted x.
- Continuous variable
- Only one predictor variable is used
- Examples: height and weight; sales and advertising dollars; GDP and Personal Expenditure

Relationship between Two Economic Accounts
========================================================
<br>
![plot of chunk unnamed-chunk-1](LinearRegression-figure/unnamed-chunk-1-1.png)


Basic Model
========================================================
<br><br>
True Model
- ${y_i}$ = ${\beta}_0$ + ${\beta}_1{x_i}$

Best fitting line
- $\hat{y_i}$ =  $\hat{\beta}_0$+ $\hat{\beta}_1{x_i}$
- ${y_i}$- $\hat{y_i}$ = ${\epsilon_i}$
- ${\beta}_0$ and ${\beta}_1$ are called coefficient, ${\epsilon_i}$ is called prediction/residual error

Finding the Best Fitting Line
========================================================
<br><br>
A line that fits the data best will be one for which the **overall** prediction errors are as small as possible. One way to achieve this goal is to through minimizing the sum of the squared prediction errors.
<br><br>
\[Q = \sum_{i=1}^n ({y_i}- \hat{y_i})^2\]


How to do it in R?
========================================================

```r
head(data,2)
```

```
  Year    GDP   Retail
1 1992 6539.3 21685.15
2 1993 6878.7 23446.16
```

```r
fit<-lm(data$Retail~data$GDP); fit
```

```

Call:
lm(formula = data$Retail ~ data$GDP)

Coefficients:
(Intercept)     data$GDP  
   3058.581        3.609  
```

Overview of our model
========================================================
<style>

/* slide titles */
.reveal h3 { 
  font-size: 70px;
}

/* heading for slides with two hashes ## */
.reveal .slides section .slideContent h2 {
   font-size: 40px;
   font-weight: bold;
}

/* ordered and unordered list styles */


.reveal pre code {
  overflow: visible;
  max-height: none;
  font-size: 1.1em;
}

</style>

```r
summary(fit)
```

```

Call:
lm(formula = data$Retail ~ data$GDP)

Residuals:
    Min      1Q  Median      3Q     Max 
-4977.0 -2011.8  -447.9  2430.9  4528.7 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) 3058.5810  2350.3683   1.301    0.207    
data$GDP       3.6095     0.1875  19.247 2.97e-15 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 3214 on 22 degrees of freedom
Multiple R-squared:  0.9439,	Adjusted R-squared:  0.9414 
F-statistic: 370.5 on 1 and 22 DF,  p-value: 2.966e-15
```


Assumptions of Simple Linear Regression
========================================================
<br>
- Linear relationship between response variable and predictor variable
- The errors, ${\epsilon_i}$, at each value of predictor, are independent
- ${\epsilon_i}$ are normally distributed.
- ${\epsilon_i}$ identically distributed, i.e. have equal variance

Linearity Diagnostics
========================================================

```r
plot(fit$residuals~fit$fitted,xlab="Fitted Values",ylab="Residuals")
```

![plot of chunk unnamed-chunk-4](LinearRegression-figure/unnamed-chunk-4-1.png)
- If the residual does not have pattern across predictors, the relationship between two variables is believed to be linear.

Error Independence Diagnostics
========================================================

```r
library(car)
durbinWatsonTest(fit$residuals)
```

```
[1] 0.2868387
```
The Durbin-Watson statistic tests autocorrelation. It is always between 0 and 4. A value of **2** means that there is no autocorrelation in the sample. Values approaching **0** indicate positive autocorrelation and values toward **4** indicate negative autocorrelation.


Error Normality Diagnostics
========================================================

A qq plot is a plot of the **quantiles** of the a data set against the quantiles of the other data set. 
If the plotted points fall closely onto the identity line, the data is believed to come from the normal distribution.


```r
qqnorm(fit$residuals, main="QQ Plot")
qqline(fit$residuals)
```

![plot of chunk unnamed-chunk-6](LinearRegression-figure/unnamed-chunk-6-1.png)

Error Equal Variance Dignostics
========================================================
If the spread-level plot displays a straight line. It means there's no heteroskedasticity.


```r
spreadLevelPlot(fit)
```

![plot of chunk unnamed-chunk-7](LinearRegression-figure/unnamed-chunk-7-1.png)

```

Suggested power transformation:  1.638284 
```

How Good is Our model?
========================================================

```r
plot(data$Retail~data$GDP,data,type="p",main="Relationship between GDP and Retail Sales ($B)",cex=1,cex.axis=1,family="sans",ylab="Retail",xlab="GDP")
abline(a=fit$coef[1],b=fit$coef[2])
```

![plot of chunk unnamed-chunk-8](LinearRegression-figure/unnamed-chunk-8-1.png)

A bit about Multivariate Linear Regression
========================================================

```r
plot(data$Retail~data$GDP,data,type="p",main="Relationship between GDP and Retail Sales ($B)",cex=1,cex.axis=1,family="sans",ylab="Retail",xlab="GDP")
x2<-(data$GDP)^2
fit2<-lm(data$Retail~data$GDP+x2)
lines(data$GDP,fit2$fitted,col=2)
```

![plot of chunk unnamed-chunk-9](LinearRegression-figure/unnamed-chunk-9-1.png)
