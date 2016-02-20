# Time Series ARIMA Models in R

# install.packages("tseries")
library(tseries)

mydata<- read.csv("timeseries_ppi.csv")
str(mydata)
summary(mydata)
attach(mydata)

# Defining variables
Y <- ppi
d.Y <- diff(Y)
t <- yearqrt

# Descriptive statistics and plotting the data
summary(Y)
summary(d.Y)

plot(t,Y)
plot(d.Y)

#ggplot PLOTTING
library(ggplot2)
p<-ggplot(mydata, aes(t,Y ))+geom_point()+
scale_x_discrete(breaks = 1:5)
p 



# Dickey-Fuller test for variable
adf.test(Y, alternative="stationary", k=0)
adf.test(Y, alternative="explosive", k=0)

summary(lm(dppi ~ lppi, na.action=na.omit))
#summary(lm(dppi ~ lppi + trend, na.action=na.omit))

# Augmented Dickey-Fuller test
adf.test(Y, alternative="stationary")

# DF and ADF tests for differenced variable
adf.test(d.Y, k=0)
adf.test(d.Y)