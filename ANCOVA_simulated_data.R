#Install packages
install.packages("MASS")
install.packages("moments")

#Create two continuous correlated variables
library(MASS)
data = mvrnorm(n=1000, mu=c(0, 0), Sigma=matrix(c(1, 0.5, 0.5, 1), nrow=2), empirical=TRUE)
X = data[, 1]
Y = data[, 2]
fix(data)

#Proof of normal distribution
library(moments)
moments::skewness(data)
moments::kurtosis(data)

#Base a categorical variable on the first continuous variable
n <- 1000
nez <- character(n)
nez[X<=-1] <- "1"
nez[X>-1 & X<=1] <- "2"
nez[X>1] <- "3"
prop.table(summary(as.factor(nez)))

#Equalizing the levels of the independent variable
u <- runif(n)
nez[nez=2 & u<=0.3] = "1"
nez[nez=2 & u>=0.8] = "3"

#Creating a single matrix
write.csv(matrica, "C:/Users/Win10/Desktop/matrica.csv")
matrica = cbind(nez, data)