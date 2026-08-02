#This is my first file

mtcars
head(mtcars)
tail(mtcars)
dim(mtcars)
str(mtcars)
summary(mtcars)

library(dplyr)
mtcars %>% filter(mpg > 19) %>% select(mpg, gear, cyl) %>% head(10)
mtcars %>% filter(cyl > 4,mpg > 19) %>% select(mpg, gear, cyl)
mtcars %>% summarise(mean (mpg),mean(wt) )
colMeans(mtcars) 
rowMeans(mtcars)
mean(mtcars$mpg)
sd(mtcars$mpg)
cor(mtcars)
cor(mtcars$mpg, mtcars$wt)
cor(mtcars$mpg, mtcars$hp)
library(corrplot)
corrplot(
  cor(mtcars),
  method = "color",
  type = "upper"
)
