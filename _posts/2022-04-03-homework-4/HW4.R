---
title: "Homework 4: Logistic Regression"
description: |
  Logistic Regression, Gelman Chapter 13 , 14 
author:
  - name: Isha Akshita Mahajan
    url: https://example.com/norajones
date: 2022-04-03
output:
  distill::distill_article:
    self_contained: false
---


```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

*Worked with Ben, Nathaniel and Noah*

## Load required packages 
```{r, collapse = TRUE}
library(rstanarm)
library(foreign)
library(tidyverse)
library(bayesplot)
```

## Descriptive Questions 

> Question A. What is a logit function and what is its role in logistic regression?

*Answer A* The logit function maps the range (0,1) to (−∞, ∞) and is useful for modeling probabilities (RaOs). In logistic regression, this function is used to predict dependent variables that are binary instead of continuous. Rather than using log transformation, researchers use logistic regressions to keep information intact and predict in terms of probabilities as opposed to expected values which may go beyond 1 and below 0. 

> B. Why do researchers typically not just use ordinary least squares regression (rather than logistic regression) when modeling a binary (dichotomous) response variable?

*Answer B* A linear regression will usually go below zero and above one, giving us lines rather the the S shaped curve. In the case of binary response/dependent variables, we're mostly interested in the chance/ probability/ true or false/ 0 or 1 and the s shaped curve seems to be move intuitive because they don't go beyond 0 and 1. 

> C.What is the inverse logit function? How can it be used to interpret results from a logistic regression?

*Answer C* The inverse logit function logit−1(x) =  ex  1 + ex. transforms the log of odds that we usually get with a regression to the probability in terms of 0s and 1s i.e. the transformation from linear predictors to probabilities used in a logistic regression. (Ra OS)

> D.Explain equations 13.2 and 13.3 on RaOS page 219 and the relationship between them.

*Answer D* 

## 13.1 Fitting Logistic Regression

The folder NES contains the survey data of presidential preference and income for the 1992 election analyzed in Section 13.1, along with other variables  including sex, ethnicity, education, party identification, and political ideology. 

(a) Fit a logistic regression predicting support for Bush given all these inputs. Consider how to include these as regression predictors. (no interactions)

(b) Evaluate and compare the different models you have fit. 

(c) For your chosen model, discuss and compare the importance of each input variable in the  prediction. 


```{r}
#Load the data 
nes <- read.table("nes.txt")
head(nes)

#clean data (used from RaOs code)
ok<- nes$year==1992 & !is.na(nes$rvote) & !is.na(nes$dvote) & (nes$rvote==1 | nes$dvote==1)
nes92 <- nes[ok,]
head(nes92)
# for getting Log odds and probability of the logistic regression results  
logit <- qlogis
invlogit <- plogis
```

```{r}
fit <-  stan_glm(rvote~educ1+female+partyid7+ideo7+black,family=binomial(link="logit"), data=nes92,refresh=0)
print(fit, digits=2)
```

```{r}
fit_1 <-  stan_glm(rvote~educ1+female+partyid7,family=binomial(link="logit"), data=nes92,refresh=0)
print(fit_1, digits=2)

```

```{r}
fit_2 <-  stan_glm(rvote~female+partyid7,family=binomial(link="logit"), data=nes92,refresh=0)
print(fit_2, digits=2)
```


## 13.5 Interpreting logistic regression coefficients: 

Here is a fitted model from the Bangladesh analysis  predicting whether a person with high-arsenic drinking water will switch wells, given the  arsenic level in their existing well and the distance to the nearest safe well:  

stan_glm(formula = switch ~ dist100 + arsenic, family=binomial(link="logit"),  data=wells) 

Median MAD_SD  
(Intercept) 0.00 0.08  
dist100 -0.90 0.10  
arsenic 0.46 0.04 
 

Compare two people who live the same distance from the nearest well but whose arsenic levels differ, with one person having an arsenic level of 0.5 and the other person having a level of  1.0. You will estimate how much more likely this second person is to switch wells. Give an approximate estimate, standard error, 50% interval, and 95% interval, using two different  methods:  

(a) Use the divide-by-4 rule, based on the information from this regression output.  

(b) Use predictive simulation from the fitted model in R, under the assumption that these two  people each live 50 meters from the nearest safe well. 

*Answer (a)* The divide by 4 rule on this regression output will used on the coefficient value of arsenic which is 0.46. When we divide 0.46/4, we get 0.115 which means that 1 unit more in arsenic concentration corresponds to an 11.5% positive difference in the probability of switching wells. 

*Answer (b)*

```{r}
head(wells)
#the first thing I would do is rescale the dist predictor to 50-meter units

wells$dist50<- wells$dist/50


```



## 13.7 Graphing a fitted logistic regression:

We downloaded data with weight (in pounds) and age (in  years) from a random sample of American adults. We then defined a new variable:  heavy <- weight > 200 and fit a logistic regression, predicting heavy from height (in inches): 

stan_glm(formula = heavy ~ height, family=binomial(link="logit"), data=health)  

Median MAD_SD  
(Intercept)-21.51 1.60 
height 0.28 0.02 

(a) Graph the logistic regression curve (the probability that someone is heavy) over the  approximate range of the data. Be clear where the line goes through the 50% probability point. 

(b) Fill in the blank: near the 50% point, comparing two people who differ by one inch in height, you’ll expect a difference of *6.9% * in the probability of being heavy. 

```{r}
#Part A 
curve(invlogit(-21.51 + 0.28*x), ylim=c(0,1), xlim=c(40,110), ylab = "Probability of Heavy", xlab = "Height (in inches")

#Part B 
part_b<-(invlogit(-21.51 + 0.28*77) - invlogit(-21.51 + 0.28*76))
part_b
```

*6.9%*
*Code referenced from Nathan on Piazza*

## 14.3 Graphing logistic regressions: 

The well-switching data described in Section 13.7 are in the folder Arsenic. 

(a) Fit a logistic regression for the probability of switching using log (distance to nearest safe  well) as a predictor.  

(b) Make a graph similar to Figure 13.8b displaying Pr(switch) as a function of distance to  nearest safe well, along with the data. 

(c) Make a residual plot and binned residual plot as in Figure 14.8. 

```{r, collapse = TRUE}

```

## 14.5 Working with logistic regression: (Use fakegrades.csv)

First:

(i) Find sample mean and standard deviation of midterm grades; these are different than the numbers from the book.

(ii) Fit logistic regression using either glm( ) or stan_glm( ).

(iii) Use the results to say something about the estimated relationship between midterm grade and the probability of passing the class.

Then complete:
(a) Graph the fitted model. Also on this graph put a scatterplot of hypothetical data consistent with the information given.  

(b) Suppose the midterm scores were transformed to have a mean of 0 and standard deviation of  1, what would be the equation of the logistic regression using these transformed scores as a predictor?


```{r, collapse = TRUE}
grades<- read.csv("fakegrades.csv")
head(grades)

#part (i)
grades_mean<- mean(grades$midterm)
grades_sd<- sd(grades$midterm)
#part(ii)
fit_grades<- stan_glm(pass~midterm, family= binomial(link="logit"), data=grades, refresh=0)
print(fit_grades)

```

#part(3)
*The regression returns a coefficient for 0.3. Since it is a logistic regression, We would use the divide by 4 rule. dividing 0.3 by 4 which returns 0.075. This means that with every increase of 1 unit or 1 point on the midterm grade, there is a 7.5% increase in the probability of the student passing*

#part(a)

```{r, collapse = TRUE}
sims<- as.matrix(fit_grades)
n_sims<- nrow(sims)
  plot(grades$midterm,grades$pass, ylab = "pass", xlab="midterm")
  for(s in 1:50){
    curve (invlogit (sims[s,1]+ sims[s,2]*x), lwd=1, add=TRUE)}
 
```


