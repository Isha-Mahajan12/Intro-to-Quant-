---
title: "Homework 5: Model Interpretations"
description: |
   Types of Models: What is the Best Way to Analyze Less Frequent Forms of Violence? The Case of Sexual Aggression.
author:
  - name: Isha Akshita Mahajan
    url: https://example.com/norajones
date: 2022-04-03
output:
  distill::distill_article:
    self_contained: false
---


```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = FALSE)
getwd()
```



*REFERENCES: Swartout, Kevin M et al. “What is the Best Way to Analyze Less Frequent Forms of Violence? The Case of Sexual Aggression.” Psychology of violence vol. 5,3 (2015): 305-313. doi:10.1037/a0038316*

## Question 1:

*What advantages do the authors claim count regressions—Poisson, negative binomial, and zero-inflated versions of each—have over OLS and simple transformations of variables?*


*Answer 1*

The OLS regressions in the case of the SA data did not seem conclusive because the data is skewed. Using the square root transformation did not help much and only 4 out of 9 predictors came out to be statistically significant. Since the outcome of SA is in counts, the use of OLS isn’t much helpful here and the authors suggest the use of other count- models to perform such analysis. 

In the case of Poisson, 7/9 covariates significantly predict SA frequency however, the results were in a low range. This is because the model did not account for the dispersion in the data and the values that would be zero i.e men who do not perpetrate SA and instead took into account overdispersed values of 1 and 2s. 

In the case of the  negative binomial, there were fewer significant predictors than the poisson however it highlighted the significant overdispersion, thus giving results that aligned more with the data. 

In the case of the zero-inflated versions, the models allowed the researchers to take into account more accurately the men who did not perpetrate SA, i.e zero values. Given the skewed data and context to the situation, these models enable the researchers to take into account the zero values and predict frequencies keeping this group of people in mind. 

## Question 2: 

*What reason do they give for why a negative binomial regression may be superior to simple Poisson regression and what is the relationship between the two models?*

*Answers 2:* The models in this paper were compared based on three criteria- 

Overall Fit- the AIC index and the Vueng test, 
Persimony- the number of estimated parameters taken into account and 
Interpretability- how coherent and easy was the model to interpret. 

Based on these, the negative binomial model outperformed the poisson model. The negative binomial model took into account the dispersion which showed to be significant in the results. The p values were reasonably low in the poisson regression and values that were artificially inflated. The negative binomial model on the other hand took into account the dispersion and broke the assumption of equidispersion made in the Poisson regression. The negative binomial was less parsimonious than the poisson model -- given that it had an extra predictor of dispersion, the overall results  showed a better fit for the data as it estimated the frequency of SA while relatively maintaining a high degree of parsimony i.e one additional predictor. 


## Question 3:  

*How do "zero-inflated" versions of these models characterize individual respondents in a slightly different manner? Why might this be a useful approach?*

*Answer 3:* The zero-inflated models allow the researchers to assume two distinct values- in this case a young male who does or does not perpetrate SA.  In a dataset like this where certain men might be perpetrating higher SA while certain men might not at all, this model enables us to take into account a “true zero group”. Given that this article is highlighting characteristics of various models , this approach seems useful in datasets where the data is overdispersed. As presented by the authors, these models estimated the frequency distribution the closest, they used twice the amount of parameters than the standard negative binomial model, therefore proving to be highly parsimonious and maybe more impractical. However, keeping in mind the dispersion of the data, this might prove as a useful count based approach regardless, depending on the context in which it is being used. 


## Question 4: 

*Interpret coefficients (and standard errors). After reading over the descriptions of all variables and examining descriptive statistics in Table 1, do the following.*

(i) For the OLS model, interpret the coefficients for Charm, Sanctions, Impulsivity, and Often drunk and refer to the provided standard errors (SE) to provide added context.
(ii) Repeat for the Poisson model.
(iii) Repeat for the negative binomial model.


*(i) OLS model*

Charm: For unit increase in charm,there is an expected increase in SA by 0.05 units, on average
Sanctions: For unit increase in sanctions, there is an expected decrease in SA by 0.039 units, on average
Impulsivity: For unit increase in impulsivity, there is an expected increase in SA by 0.44 units, on average. 
Often Drunk :For unit increase in Often Drunk, there is an expected increase in SA by 0,75 units.

*(ii) Poisson model *
Charm: For one unit increase in charm, given that other variables are held constant, the difference in logs of expected counts of SA is expected to increase by 0.21 units. 
Sanctions: For one unit increase in sanctions, given that other variables are held constant, the difference in logs of expected counts of SA is expected to increase by 0.28 units
Impulsivity:  For one unit increase in Impulsivity, given that other variables are held constant, the difference in logs of expected counts of SA is expected to increase by 0.33 units
Often Drunk: For one unit increase in Often Drunk, given that other variables are held at constant, the difference in logs of expected counts of SA is expected to increase by 0.28 units. 


*(iii)  Negative Binomial Model*
Charm: For one unit increase in charm, given that other variables are held constant, the difference in logs of expected counts of SA is expected to increase by 0.23 units. 
Sanctions: For one unit increase in Sanctions,  given that all variables are held constant, the difference in logs of expected counts of SA is expected to decrease by 0.20 units. 
Impulsivity: For one unit increase in Impulsivity, given that all  variables are held constant, the difference in logs of expected counts of SA  is expected to increase by 0.37 units.
Often Drunk: For one unit increase in Often Drunk, given that all other variables are held constant, the difference in logs of expected counts of SA is expected to increase by 0.48 units.
 
## Question 5:  

*Of the OLS, Poisson, and negative binomial regression models, which has the best fit and which has the worst fit (based on AIC scores)? What measure of model fit appeared in your analysis for homework 4 that plays a similar role as AIC?*

The AIC Scores for all models were as follows:

OLS - 1830
Poisson - 2824
Negative Binomial - 1129
Zero Inflated Poisson (ZIP) - 1484
Zero Inflated Negative Binomial (ZINB) -1108

Based on the above results, the ZINB model has the best fit and the Poisson model has the worst fit. However, because the ZINB uses almost twice the amount of predictors the Negative Binomial Model does, the authors credit the Negative Binomial model to have the best fit. Going back to our homework four,  we used the Leave Out One Cross Validation measure which played a similar role as the AIC. In order to check whether these interpretations are relevant to a different sample of the same population, these measures are used to validate the models. 

## Question 6

*Of the four predictors you considered above, which seems to have the most consistent predictive difference across all three models (ignoring the zero-inflated versions)?*

*Answer 6:* Out of the four predictors that we have considered above, Sanctions seems to have the most consistent predictive effects across all three models. 







