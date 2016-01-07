library(ggplot2)
# 1. Plot the 30-day mortality rates for heart attack ---------------------

outcome <- read.csv("outcome-of-care-measures.csv",
                    colClasses = "character")
head(outcome)
dim(outcome) ## 4076 * 46
names(outcome)

outcome[,11] <- as.numeric(outcome[,11])
hist(outcome[,11])

