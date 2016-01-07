
# 1 -----------------------------------------------------------------------

library(dplyr)
library(datasets)
data(iris)

iris %>% 
  filter(Species == 'virginica') %>% 
  summarise(mean(Sepal.Length, na.rm = TRUE))


# 2 -----------------------------------------------------------------------

apply(iris[,1:4], 2, mean)


# 3 -----------------------------------------------------------------------

data(mtcars)
names(mtcars)
tapply(mtcars$mpg, mtcars$cyl, mean)
sapply(split(mtcars$mpg,mtcars$cyl), mean)
with(mtcars, tapply(mpg, cyl, mean))


# 4 -----------------------------------------------------------------------

hps <- tapply(mtcars$hp, mtcars$cyl, mean)
hps[3]-hps[1]

