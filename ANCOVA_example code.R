
matrica <- read.csv(file.choose())
fix(matrica)
colnames(matrica)
as.factor(matrica$N)
prop.table(summary(matrica$N))

#analyze
anova <- aov(Z ~ N, matrica)
summary(anova)
ancova <- aov(Z ~ K + N, matrica)
summary(ancova)

#Mean
aggregate(matrica$Z, by=list(matrica$N), FUN=mean)
aggregate(matrica$K, by=list(matrica$N), FUN=mean)

#Interpret regression
summary.lm(ancova) # b coef.

library(lm.beta)
lm.beta(ancova) # beta coef.

#draw the model:
install.packages("HH")
library(HH)
matrica$N = factor(matrica$N)
HH::ancova(Z ~ K + N, matrica)

#post hoc 
fN = factor(matrica$N)
anova.bez <- aov(Z ~ fN, matrica)
summary(anova.bez)
TukeyHSD(anova.bez)

#post hoc covariance
anova.NV <- aov(K ~ fN, matrica)
summary(anova.NV)
TukeyHSD(anova.NV)
