---
title: "Homework 1: Function Writing, Variation"
description: |
  Gelman Chapter 6
author:
  - name: Isha Akshita Mahajan
    affiliation: UMass Amherst
date: 2022-04-03
output:
  distill::distill_article:
    self_contained: false
    code_folding: hide
---

## Setup Code:

```{r}
#load packages tidyverse and rstanarm
library(tidyverse)
library(rstanarm)
library(kableExtra)
#load earnings dataset from desired file path
earnings <- read.csv("earnings.csv")
kable(head(earnings))
```

# 6.2 Programming Fake-Data Simulation: Write an R function to: 

(i) simulate n data point from the model, y= a+bx+error,with data points x uniformly sampled from the range(0,100) with errors drawn independently from the normal distribution with mean 0 and standard deviation σ*

(ii) fit a linear regression to the simulated data*

(iii) make a scatterplot of the data and fitted line

```{r, results='hide'}
set.seed(3)
#Create a function for a fake data simulation
fake_data <- function(a,b,sigma,n)#Think of this as variables
#The curly brackets are what inputs go into and what outputs they generate
{
#create object x and define it using runif() function
x <- runif(n,0,100)
#add in simple regression 
y <- a+b*x+sigma*rnorm(n)
random <- data.frame(x,y)
#Use Stan_glm function to fit the model
fitted_random <- stan_glm(y~x, data = random)
#use print to display results concisely 
print(fitted_random, digits=3)
plot(random$x,random$y,main = "Data generated and fitted regression line")
a_hat<- coef(fitted_random) [1]
b_hat <- coef(fitted_random)[2]
abline(a_hat, b_hat)
x_bar <-mean(random$x)
text(x_bar, a_hat + b_hat*x_bar,
paste("y =",round(a_hat,2),"+",round(b_hat, 2), "* x"), adj=0) 
}
```


```{r, results='hide'}
set.seed(3)
fake_data(0.4,0.2,0.5,100)
```

#6.3 Variation, uncertainty, and sample size: Repeat the example in Section 6.2, varying the number  of data points, n. What happens to the parameter estimates and uncertainties when you increase the number of observations? 

```{r,results='hide'}
set.seed(3)
fake_data(0.4,0.2,0.5,175)
```

```{r, results='hide'}
set.seed(3)
fake_data(0.4,0.2,0.5,215)
```

```{r, results='hide'}
set.seed(3)
fake_data(0.4,0.2,0.5,275)
```

*As I ran each code chunk by increasing the value of n in my sample, I observed that the MAD_SD values or the standard deviation started reducing. This suggests that a larger sample size leads to less error*

#6.5 Regression prediction and averages: The heights and earnings data in Section 6.3 are in the  folder Earnings. Download the data and compute the average height for men and women in the  sample. 

(b) Assuming 52% of adults are women, estimate the average earnings of adults in the population.
(c) Directly from the sample data compute the average earnings of men, women, and everyone. Compare these to the values calculated in parts (a) and (b)

```{r}
#look at the columns in the dataset
kable(head(earnings))
#base R rules dataframe$column
#Find the means 
men_mean <- mean(earnings$height[earnings$male==1]) 
women_mean <- mean(earnings$height[earnings$male==0])
```

**70.089 for men, 64.490 for women** 

Use these averages and fitted regression model displayed on page 84 to get a model-based estimate of the average earnings of men and of women in the population. 

```{r results='fold'}
set.seed(3)
#Use Stan_glm function to fit the model
fitted_regression <- stan_glm( earn ~ height + male, data= earnings)
#use print to display results concisely 
print(fitted_regression, digits=2)
```



