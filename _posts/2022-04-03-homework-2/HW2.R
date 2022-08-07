---
title: "Homework 2: Exploratory Data Analysis"
description: |
 Exploratory Data Analysis on Voter Turnout and Ethnic Data and Gelman Chapter 10 
author:
  - name: Isha Akshita Mahajan
    affiliation: UMass Amherst
date: 2022-04-03
output:
  distill::distill_article:
    self_contained: false
    code_folding: hide
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```


### Load Required Packages 

```{r}
library(tidyverse)
library(rstanarm)
library(ggplot2)
library(bayesplot)
library(gghighlight)
```

## Question 1

Fraga analyzes turnout data for four different racial and ethnic groups, but for this analysis we will focus on the data for black voters. Load  `blackturnout.csv`. Which years are included in the dataset?  How many different states are included in the dataset?  

```{r}
voter_data<-read_csv("blackturnout.csv")
head(voter_data)

years<- voter_data %>% 
 select(year) %>% 
 count(year)

states<- voter_data %>% 
  select(state) %>% 
  count(state)
```

*This dataset includes data from years 2006,2008 and 2010 and includes information on voter turnout from 42 states*

## Question 2: 

Create a boxplot that compares turnout in elections with and without a co-ethnic candidate.Be sure to use informative labels.Interpret the resulting graph.

```{r}
library(ggplot2)
library(ggthemes)

boxplot<- voter_data %>% 
  group_by(candidate) %>% 
  select(candidate,turnout)%>% 
  mutate(candidate = recode(candidate, `1` = "Black Candidate", `0` = "No Black Candidate")) %>% 
  
  ggplot(aes(x=candidate,y=turnout,group=candidate, fill=candidate))+
  geom_boxplot(show.legend = TRUE)+
  labs(x="Ethnicity", y= "Black Voter Turnout", title = "Elections With & Without Black Candidates", subtitle= "Boxplot for elections with and without the presence of black candidates", caption="Graphic: Isha Akshita Mahajan/ Student,UMass Amherst\nSource: YouGov")+
  theme_minimal()+
  theme(legend.position = "top", legend.box = "horizontal")+
  theme(text=element_text (size = 12),
  plot.title =element_text(size=rel(1.5)))
  boxplot
```

*This boxplot shows the difference between the turnout for elections with and without co-ethnic candidates. The median for black voter turnout is lower for non co ethnic candidates whereas there is a higher turnout in elections where there is presence of co ethnic candidates. This can be considered as a step towards correlation however,this boxplot can not represent causality on it's own.*

## Question 3: 

Run a linear regression with black turnout as your outcome variable and candidate co-ethnicity as your predictor. Report the coefficient on your predictor and the intercept. Interpret these coefficients. Do not merely comment on the direction of the association (i.e.,whether the slope is positive or negative). Explain what the value of the coefficients mean in terms of the units in which each variable is measured.  Based on these coefficients, what would you conclude about blacks voter turnout and co-ethnic candidates?

```{r}
set.seed(007)
regression_3 <- lm(turnout~candidate, data = voter_data)
summary(regression_3)

#plot(turnout~candidate, data = voter_data)
#abline(regression_3)
```
 
*This model summarizes the difference in average black voter turnout between elections that have black candidates (1) and elections that don't (0). The intercept, 0.39, is the average or predicted proportion of black voting age population in a district that votes in a general election when the election does not include a co-ethnic/black candidate. To average the proportion of black voting age population when the election does include a co-ethnic/black candidate, we would add 0.06 i.e. 0.39+0.06 to get 0.45 which is the predicted turnout of elections with co-ethnic candidates. This tells us that the turnout for election with black candidate is on average, 0.06 units higher than the one without a co-ethnic candidates. This regression has a positive slope and can be interpreted as a summary of the difference in average voter turnout for elections with and without black candidates.*

## Question 4: 

You decide to investigate the results of the previous question a bit more carefully because the elections with co-ethnic candidates may differ from the elections without co-ethnic candidates in other ways.  Create a scatter plot where the x-axis is the proportion of co-ethnic voting-age population and the y-axis is black voter turnout. Color your points according to candidate co-ethnicity. That is, make the points for elections featuring co-ethnic candidates one color, and make the points for elections featuring no co-ethnic candidates a different color. Interpret the graph.

```{r}
scatterplot<- voter_data %>% 
  group_by(candidate) %>% 
  select(candidate,turnout,CVAP)%>%
 mutate(candidate = recode(candidate, `1` = "Black Candidate", `0` = "No Black Candidate")) %>%  
  
  ggplot(aes(x=CVAP,y=turnout, colour=candidate,fill=candidate))+
  geom_point()+
 labs(x= "Proportion of Eligible Voters Who Are Black", y= "Black Voter Turnout", title = "Elections With and Without Black Candidates ", subtitle = "When there no black candidates running for elections, the proportion of eligible voters who show up\n to vote is relatively lower to when there is an election that includes a co-ethnic candidate",caption="Graphic: Isha Akshita Mahajan/ Student,UMass Amherst\nSource: YouGov")+
  theme(legend.position="bottom")+
  theme_minimal()+
 theme(text=element_text (size = 12,hjust = 0.5),
       plot.subtitle = element_text(size = 10))
scatterplot
```

*This scatterplot shows that when there no black candidates running for elections, the proportion of eligible voters who show up to vote is relatively lower to when there is an election that includes a co-ethnic candidate.This can be considered as an additional step towards analyzing black voter turnout, however, we can not make strong causal claims.* 

_I would like to expand on Clustering around low CVAP and low turnout but I'm still a little confused on that part_

## Question 5: 

Run a linear regression with black turnout as your outcome variable and with candidate co-ethnicity and co-ethnic voting-age population as your predictors.Report the coefficients, including the intercept.  Interpret the coefficients on the two predictors, ignoring the intercept for now (you will interpret the intercept in the next question). Explain what each coefficient represents in terms of the units of the relevant variables.

```{r}
set.seed(007)
regression_5 <- lm(turnout~candidate + CVAP, data = voter_data, refresh=0)
summary(regression_5)

#plot(voter_data$candidate, voter_data$CVAP)
```

*For every one unit of increase in the proportion of district's voting age population that is black, the black voter turnout increases by 0.21 units, on average, given there are no co-ethnic candidates.In the regression results above, we see that the coefficient for candidate is negative and insignificant (no stars), therefore the value does not hold much relevance in the model. In the earlier regression with only one predictor-turnout, there was an average increase in black voter turnout by 0.06 units, however, with the addition of another predictor,the value of that seemed to have diminished.* 

## Question 6: 

Now interpret the intercept from the regression model with two predictors. Is this intercept a substantively important or interesting quantity?  Why or why not?  

*The intercept in an interesting quantity for two reasons:First, the regression results show that it is a significant value therefore it shall be an integral part of the model. Secondly, On average, the intercept is 0.37 which in comparison to the model with one predictor is only 0.02 units lower. This comparison shows that the intercept is in alignment with the fit regardless of the turnout predictor* 


## Question 7: 

Relationship between co-ethnic candidates and black voter turnout. Based on regression model with two predictors, what do you conclude about the relationship between co-ethnic candidates and black voter turnout. Ignore issues of statistical significance.  

*Keeping aside the significance, the coefficient value of candidate is -0.007 which is very minuscule and therefore does not have a significant impact on the intercept and the model itself. I thought this to be in alignment with null hypothesis and might contribute towards making an argument for that stronger?*

## Questions From RaOS 


## 10.2 Regression with Interactions 

(a) Write the equation of the estimated regression line of y on x for the treatment group and the  control group, and the equation of the estimated regression line of y on x for the control  group.  

(b) Graph with pen on paper the two regression lines, assuming the values of x fall in the range  (0, 10). On this graph also include a scatterplot of data (using open circles for treated units  and dots for controls) that are consistent with the fitted model. 


> Part A 

x=1.6 (Pre Treatment Predictor)
z= 2.7 (Treatment Indicator)
x:z = 0.7
sigma = 0.5

When z=0, 
then y= a+bx+cz+d(x:z)
      = 1.2+1.6x+2.7(0)+0.7(x)(0)
      = *1.2+1.6x*
      
When z=1,
then y= 1.6x+1.2+2.7(1)+0.7(x)(1)
      = *3.9+2.3x*
      
**In Treatment, for every one unit increase in x, y increases by an average of 0.7 units in control group.**

      
> PART B 

```{r}
x<- runif(100,0,10)
z<-c(0,1)
sigma<- rnorm(100)
y<- 1.2+1.6*x+2.7*z+0.7*x:z+sigma

fakedata<- data.frame(x,y,z) 

plot_data <- fakedata %>% 
  mutate(z = recode(z, `1` = "Treatment", `0` = "Control")) %>% 
  
  ggplot(aes(x,y,factor(z)))+
  geom_point(aes(colour=z,fill=z))+
  geom_abline(slope = 2.3, intercept=3.9)+
  geom_abline(slope = 1.6, intercept=1.2)+
  xlim(0,10)+
  ylim(0,20)+
  labs(x= "X", y= "Y", title = " Regression with Interactions",subtitle= "For every one unit of increase in x in treatment, y increase by 0.7 units in contol group on average", caption= "Graphic: Isha Akshita Mahajan/ Student,UMass Amherst\nSource: Fake Data")+
  theme_minimal()+
  theme(legend.position="bottom")+
  theme(text=element_text (size = 10),
  plot.title = element_text(size=rel(1.5)))

  plot_data
```

## Question 10.3


```{r}
var1 <- rnorm(1000, 0, 1)  
var2 <- rnorm(1000, 0, 1)  
fake <- data.frame(var1, var2)  
fit_lm <- lm(var2 ~ var1, data=fake)
summary(fit_lm,)
```


```{r}
var3 <- rnorm(1000, 0, 1)  
var4 <- rnorm(1000, 0, 1)  
fake_1 <- data.frame(var3, var4)  
fit_lm_1 <- lm(var4 ~ var3, data=fake_1)
summary(fit_lm_1)
```


```{r}
var5 <- rnorm(1000, 0, 1)  
var6 <- rnorm(1000, 0, 1)  
fake_2 <- data.frame(var3, var4)  
fit_lm_2 <- lm(var6 ~ var5, data=fake_2)
summary(fit_lm_2)
```


## Question 10.6 

Regression models with interactions: The folder Beauty contains data (use file beauty.csv)  Beauty and  teaching  evaluations  from Hamermesh and Parker (2005) on student evaluations of instructors’ beauty and teaching  quality for several courses at the University of Texas. The teaching evaluations were conducted  at the end of the semester, and the beauty judgments were made later, by six students who had  not attended the classes and were not aware of the course evaluations. 

> PART A 

(a) Run a regression using beauty (the variable beauty) to predict course evaluations (eval),  adjusting for various other predictors. Graph the data and fitted model, and explain the meaning of each of the coefficients along with the residual standard deviation. Plot the residuals versus fitted values.   


```{r}
beauty<- read.csv("beauty.csv")
fit_beauty<- lm(eval~beauty, data= beauty)
summary(fit_beauty)
plot(fit_beauty)
```

*The regression above shows that for every one unit increase in beauty, the evaluations increase by 0.13 units, on average. Both the intercept and the beauty variable hold statistical significance in the model.* 

> PART B 

(b) Fit some other models, including beauty and also other predictors. Consider at least one  model with interactions. For each model, explain the meaning of each of its estimated  coefficients.

```{r}
beauty<- read.csv("beauty.csv")
fit_1<- lm(eval~beauty+female, data= beauty)
summary(fit_1)
```

*When beauty=0, i.e. male, the female coefficient is -0.20 which shows a decrease of 0.20 units in evaluations on average* 

```{r}
fit_2<- lm(beauty~eval+female+age+female:age,data=beauty)
summary(fit_2)
```

