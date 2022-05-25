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

<div class="layout-chunk" data-layout="l-body">
<details>
<summary>hide</summary>
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='co'>#load packages tidyverse and rstanarm</span>
<span class='kw'><a href='https://rdrr.io/r/base/library.html'>library</a></span><span class='op'>(</span><span class='va'><a href='https://tidyverse.tidyverse.org'>tidyverse</a></span><span class='op'>)</span>
<span class='kw'><a href='https://rdrr.io/r/base/library.html'>library</a></span><span class='op'>(</span><span class='va'><a href='https://mc-stan.org/rstanarm/'>rstanarm</a></span><span class='op'>)</span>
<span class='kw'><a href='https://rdrr.io/r/base/library.html'>library</a></span><span class='op'>(</span><span class='va'><a href='http://haozhu233.github.io/kableExtra/'>kableExtra</a></span><span class='op'>)</span>
<span class='co'>#load earnings dataset from desired file path</span>
<span class='va'>earnings</span> <span class='op'>&lt;-</span> <span class='fu'><a href='https://rdrr.io/r/utils/read.table.html'>read.csv</a></span><span class='op'>(</span><span class='st'>"earnings.csv"</span><span class='op'>)</span>
<span class='fu'><a href='https://rdrr.io/pkg/knitr/man/kable.html'>kable</a></span><span class='op'>(</span><span class='fu'><a href='https://rdrr.io/r/utils/head.html'>head</a></span><span class='op'>(</span><span class='va'>earnings</span><span class='op'>)</span><span class='op'>)</span>
</code></pre></div>

</details><table>
 <thead>
  <tr>
   <th style="text-align:right;"> height </th>
   <th style="text-align:right;"> weight </th>
   <th style="text-align:right;"> male </th>
   <th style="text-align:right;"> earn </th>
   <th style="text-align:right;"> earnk </th>
   <th style="text-align:left;"> ethnicity </th>
   <th style="text-align:right;"> education </th>
   <th style="text-align:right;"> mother_education </th>
   <th style="text-align:right;"> father_education </th>
   <th style="text-align:right;"> walk </th>
   <th style="text-align:right;"> exercise </th>
   <th style="text-align:right;"> smokenow </th>
   <th style="text-align:right;"> tense </th>
   <th style="text-align:right;"> angry </th>
   <th style="text-align:right;"> age </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 74 </td>
   <td style="text-align:right;"> 210 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 50000 </td>
   <td style="text-align:right;"> 50 </td>
   <td style="text-align:left;"> White </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 66 </td>
   <td style="text-align:right;"> 125 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 60000 </td>
   <td style="text-align:right;"> 60 </td>
   <td style="text-align:left;"> White </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 64 </td>
   <td style="text-align:right;"> 126 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 30000 </td>
   <td style="text-align:right;"> 30 </td>
   <td style="text-align:left;"> White </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 65 </td>
   <td style="text-align:right;"> 200 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 25000 </td>
   <td style="text-align:right;"> 25 </td>
   <td style="text-align:left;"> White </td>
   <td style="text-align:right;"> 17 </td>
   <td style="text-align:right;"> 17 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 63 </td>
   <td style="text-align:right;"> 110 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 50000 </td>
   <td style="text-align:right;"> 50 </td>
   <td style="text-align:left;"> Other </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 68 </td>
   <td style="text-align:right;"> 165 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 62000 </td>
   <td style="text-align:right;"> 62 </td>
   <td style="text-align:left;"> Black </td>
   <td style="text-align:right;"> 18 </td>
   <td style="text-align:right;"> 18 </td>
   <td style="text-align:right;"> 18 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 54 </td>
  </tr>
</tbody>
</table>

</div>


# 6.2 Programming Fake-Data Simulation: Write an R function to: 

(i) simulate n data point from the model, y= a+bx+error,with data points x uniformly sampled from the range(0,100) with errors drawn independently from the normal distribution with mean 0 and standard deviation σ*

(ii) fit a linear regression to the simulated data*

(iii) make a scatterplot of the data and fitted line

<div class="layout-chunk" data-layout="l-body">
<details>
<summary>hide</summary>
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='fu'><a href='https://rdrr.io/r/base/Random.html'>set.seed</a></span><span class='op'>(</span><span class='fl'>3</span><span class='op'>)</span>
<span class='co'>#Create a function for a fake data simulation</span>
<span class='va'>fake_data</span> <span class='op'>&lt;-</span> <span class='kw'>function</span><span class='op'>(</span><span class='va'>a</span>,<span class='va'>b</span>,<span class='va'>sigma</span>,<span class='va'>n</span><span class='op'>)</span><span class='co'>#Think of this as variables</span>
<span class='co'>#The curly brackets are what inputs go into and what outputs they generate</span>
<span class='op'>{</span>
<span class='co'>#create object x and define it using runif() function</span>
<span class='va'>x</span> <span class='op'>&lt;-</span> <span class='fu'><a href='https://rdrr.io/r/stats/Uniform.html'>runif</a></span><span class='op'>(</span><span class='va'>n</span>,<span class='fl'>0</span>,<span class='fl'>100</span><span class='op'>)</span>
<span class='co'>#add in simple regression </span>
<span class='va'>y</span> <span class='op'>&lt;-</span> <span class='va'>a</span><span class='op'>+</span><span class='va'>b</span><span class='op'>*</span><span class='va'>x</span><span class='op'>+</span><span class='va'>sigma</span><span class='op'>*</span><span class='fu'><a href='https://rdrr.io/r/stats/Normal.html'>rnorm</a></span><span class='op'>(</span><span class='va'>n</span><span class='op'>)</span>
<span class='va'>random</span> <span class='op'>&lt;-</span> <span class='fu'><a href='https://rdrr.io/r/base/data.frame.html'>data.frame</a></span><span class='op'>(</span><span class='va'>x</span>,<span class='va'>y</span><span class='op'>)</span>
<span class='co'>#Use Stan_glm function to fit the model</span>
<span class='va'>fitted_random</span> <span class='op'>&lt;-</span> <span class='fu'><a href='https://mc-stan.org/rstanarm/reference/stan_glm.html'>stan_glm</a></span><span class='op'>(</span><span class='va'>y</span><span class='op'>~</span><span class='va'>x</span>, data <span class='op'>=</span> <span class='va'>random</span><span class='op'>)</span>
<span class='co'>#use print to display results concisely </span>
<span class='fu'><a href='https://rdrr.io/r/base/print.html'>print</a></span><span class='op'>(</span><span class='va'>fitted_random</span>, digits<span class='op'>=</span><span class='fl'>3</span><span class='op'>)</span>
<span class='fu'><a href='https://rdrr.io/r/graphics/plot.default.html'>plot</a></span><span class='op'>(</span><span class='va'>random</span><span class='op'>$</span><span class='va'>x</span>,<span class='va'>random</span><span class='op'>$</span><span class='va'>y</span>,main <span class='op'>=</span> <span class='st'>"Data generated and fitted regression line"</span><span class='op'>)</span>
<span class='va'>a_hat</span><span class='op'>&lt;-</span> <span class='fu'><a href='https://rdrr.io/r/stats/coef.html'>coef</a></span><span class='op'>(</span><span class='va'>fitted_random</span><span class='op'>)</span> <span class='op'>[</span><span class='fl'>1</span><span class='op'>]</span>
<span class='va'>b_hat</span> <span class='op'>&lt;-</span> <span class='fu'><a href='https://rdrr.io/r/stats/coef.html'>coef</a></span><span class='op'>(</span><span class='va'>fitted_random</span><span class='op'>)</span><span class='op'>[</span><span class='fl'>2</span><span class='op'>]</span>
<span class='fu'><a href='https://rdrr.io/r/graphics/abline.html'>abline</a></span><span class='op'>(</span><span class='va'>a_hat</span>, <span class='va'>b_hat</span><span class='op'>)</span>
<span class='va'>x_bar</span> <span class='op'>&lt;-</span><span class='fu'><a href='https://rdrr.io/r/base/mean.html'>mean</a></span><span class='op'>(</span><span class='va'>random</span><span class='op'>$</span><span class='va'>x</span><span class='op'>)</span>
<span class='fu'><a href='https://rdrr.io/r/graphics/text.html'>text</a></span><span class='op'>(</span><span class='va'>x_bar</span>, <span class='va'>a_hat</span> <span class='op'>+</span> <span class='va'>b_hat</span><span class='op'>*</span><span class='va'>x_bar</span>,
<span class='fu'><a href='https://rdrr.io/r/base/paste.html'>paste</a></span><span class='op'>(</span><span class='st'>"y ="</span>,<span class='fu'><a href='https://rdrr.io/r/base/Round.html'>round</a></span><span class='op'>(</span><span class='va'>a_hat</span>,<span class='fl'>2</span><span class='op'>)</span>,<span class='st'>"+"</span>,<span class='fu'><a href='https://rdrr.io/r/base/Round.html'>round</a></span><span class='op'>(</span><span class='va'>b_hat</span>, <span class='fl'>2</span><span class='op'>)</span>, <span class='st'>"* x"</span><span class='op'>)</span>, adj<span class='op'>=</span><span class='fl'>0</span><span class='op'>)</span> 
<span class='op'>}</span>
</code></pre></div>

</details>

</div>



<div class="layout-chunk" data-layout="l-body">
<details>
<summary>hide</summary>
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='fu'><a href='https://rdrr.io/r/base/Random.html'>set.seed</a></span><span class='op'>(</span><span class='fl'>3</span><span class='op'>)</span>
<span class='fu'>fake_data</span><span class='op'>(</span><span class='fl'>0.4</span>,<span class='fl'>0.2</span>,<span class='fl'>0.5</span>,<span class='fl'>100</span><span class='op'>)</span>
</code></pre></div>

</details><img src="HW1_files/figure-html5/unnamed-chunk-3-1.png" width="624" />

</div>


#6.3 Variation, uncertainty, and sample size: Repeat the example in Section 6.2, varying the number  of data points, n. What happens to the parameter estimates and uncertainties when you increase the number of observations? 

<div class="layout-chunk" data-layout="l-body">
<details>
<summary>hide</summary>
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='fu'><a href='https://rdrr.io/r/base/Random.html'>set.seed</a></span><span class='op'>(</span><span class='fl'>3</span><span class='op'>)</span>
<span class='fu'>fake_data</span><span class='op'>(</span><span class='fl'>0.4</span>,<span class='fl'>0.2</span>,<span class='fl'>0.5</span>,<span class='fl'>175</span><span class='op'>)</span>
</code></pre></div>

</details><img src="HW1_files/figure-html5/unnamed-chunk-4-1.png" width="624" />

</div>


<div class="layout-chunk" data-layout="l-body">
<details>
<summary>hide</summary>
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='fu'><a href='https://rdrr.io/r/base/Random.html'>set.seed</a></span><span class='op'>(</span><span class='fl'>3</span><span class='op'>)</span>
<span class='fu'>fake_data</span><span class='op'>(</span><span class='fl'>0.4</span>,<span class='fl'>0.2</span>,<span class='fl'>0.5</span>,<span class='fl'>215</span><span class='op'>)</span>
</code></pre></div>

</details><img src="HW1_files/figure-html5/unnamed-chunk-5-1.png" width="624" />

</div>


<div class="layout-chunk" data-layout="l-body">
<details>
<summary>hide</summary>
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='fu'><a href='https://rdrr.io/r/base/Random.html'>set.seed</a></span><span class='op'>(</span><span class='fl'>3</span><span class='op'>)</span>
<span class='fu'>fake_data</span><span class='op'>(</span><span class='fl'>0.4</span>,<span class='fl'>0.2</span>,<span class='fl'>0.5</span>,<span class='fl'>275</span><span class='op'>)</span>
</code></pre></div>

</details><img src="HW1_files/figure-html5/unnamed-chunk-6-1.png" width="624" />

</div>


*As I ran each code chunk by increasing the value of n in my sample, I observed that the MAD_SD values or the standard deviation started reducing. This suggests that a larger sample size leads to less error*

#6.5 Regression prediction and averages: The heights and earnings data in Section 6.3 are in the  folder Earnings. Download the data and compute the average height for men and women in the  sample. 

(b) Assuming 52% of adults are women, estimate the average earnings of adults in the population.
(c) Directly from the sample data compute the average earnings of men, women, and everyone. Compare these to the values calculated in parts (a) and (b)

<div class="layout-chunk" data-layout="l-body">
<details>
<summary>hide</summary>
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='co'>#look at the columns in the dataset</span>
<span class='fu'><a href='https://rdrr.io/pkg/knitr/man/kable.html'>kable</a></span><span class='op'>(</span><span class='fu'><a href='https://rdrr.io/r/utils/head.html'>head</a></span><span class='op'>(</span><span class='va'>earnings</span><span class='op'>)</span><span class='op'>)</span>
</code></pre></div>

</details><table>
 <thead>
  <tr>
   <th style="text-align:right;"> height </th>
   <th style="text-align:right;"> weight </th>
   <th style="text-align:right;"> male </th>
   <th style="text-align:right;"> earn </th>
   <th style="text-align:right;"> earnk </th>
   <th style="text-align:left;"> ethnicity </th>
   <th style="text-align:right;"> education </th>
   <th style="text-align:right;"> mother_education </th>
   <th style="text-align:right;"> father_education </th>
   <th style="text-align:right;"> walk </th>
   <th style="text-align:right;"> exercise </th>
   <th style="text-align:right;"> smokenow </th>
   <th style="text-align:right;"> tense </th>
   <th style="text-align:right;"> angry </th>
   <th style="text-align:right;"> age </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 74 </td>
   <td style="text-align:right;"> 210 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 50000 </td>
   <td style="text-align:right;"> 50 </td>
   <td style="text-align:left;"> White </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 66 </td>
   <td style="text-align:right;"> 125 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 60000 </td>
   <td style="text-align:right;"> 60 </td>
   <td style="text-align:left;"> White </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 64 </td>
   <td style="text-align:right;"> 126 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 30000 </td>
   <td style="text-align:right;"> 30 </td>
   <td style="text-align:left;"> White </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 65 </td>
   <td style="text-align:right;"> 200 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 25000 </td>
   <td style="text-align:right;"> 25 </td>
   <td style="text-align:left;"> White </td>
   <td style="text-align:right;"> 17 </td>
   <td style="text-align:right;"> 17 </td>
   <td style="text-align:right;"> NA </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 63 </td>
   <td style="text-align:right;"> 110 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 50000 </td>
   <td style="text-align:right;"> 50 </td>
   <td style="text-align:left;"> Other </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 16 </td>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 68 </td>
   <td style="text-align:right;"> 165 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 62000 </td>
   <td style="text-align:right;"> 62 </td>
   <td style="text-align:left;"> Black </td>
   <td style="text-align:right;"> 18 </td>
   <td style="text-align:right;"> 18 </td>
   <td style="text-align:right;"> 18 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 54 </td>
  </tr>
</tbody>
</table>

<details>
<summary>hide</summary>
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='co'>#base R rules dataframe$column</span>
<span class='co'>#Find the means </span>
<span class='va'>men_mean</span> <span class='op'>&lt;-</span> <span class='fu'><a href='https://rdrr.io/r/base/mean.html'>mean</a></span><span class='op'>(</span><span class='va'>earnings</span><span class='op'>$</span><span class='va'>height</span><span class='op'>[</span><span class='va'>earnings</span><span class='op'>$</span><span class='va'>male</span><span class='op'>==</span><span class='fl'>1</span><span class='op'>]</span><span class='op'>)</span> 
<span class='va'>women_mean</span> <span class='op'>&lt;-</span> <span class='fu'><a href='https://rdrr.io/r/base/mean.html'>mean</a></span><span class='op'>(</span><span class='va'>earnings</span><span class='op'>$</span><span class='va'>height</span><span class='op'>[</span><span class='va'>earnings</span><span class='op'>$</span><span class='va'>male</span><span class='op'>==</span><span class='fl'>0</span><span class='op'>]</span><span class='op'>)</span>
</code></pre></div>

</details>

</div>


**70.089 for men, 64.490 for women** 

Use these averages and fitted regression model displayed on page 84 to get a model-based estimate of the average earnings of men and of women in the population. 

<div class="layout-chunk" data-layout="l-body">
<details>
<summary>hide</summary>
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='fu'><a href='https://rdrr.io/r/base/Random.html'>set.seed</a></span><span class='op'>(</span><span class='fl'>3</span><span class='op'>)</span>
<span class='co'>#Use Stan_glm function to fit the model</span>
<span class='va'>fitted_regression</span> <span class='op'>&lt;-</span> <span class='fu'><a href='https://mc-stan.org/rstanarm/reference/stan_glm.html'>stan_glm</a></span><span class='op'>(</span> <span class='va'>earn</span> <span class='op'>~</span> <span class='va'>height</span> <span class='op'>+</span> <span class='va'>male</span>, data<span class='op'>=</span> <span class='va'>earnings</span><span class='op'>)</span>
</code></pre></div>

</details>

```

SAMPLING FOR MODEL 'continuous' NOW (CHAIN 1).
Chain 1: 
Chain 1: Gradient evaluation took 1.7e-05 seconds
Chain 1: 1000 transitions using 10 leapfrog steps per transition would take 0.17 seconds.
Chain 1: Adjust your expectations accordingly!
Chain 1: 
Chain 1: 
Chain 1: Iteration:    1 / 2000 [  0%]  (Warmup)
Chain 1: Iteration:  200 / 2000 [ 10%]  (Warmup)
Chain 1: Iteration:  400 / 2000 [ 20%]  (Warmup)
Chain 1: Iteration:  600 / 2000 [ 30%]  (Warmup)
Chain 1: Iteration:  800 / 2000 [ 40%]  (Warmup)
Chain 1: Iteration: 1000 / 2000 [ 50%]  (Warmup)
Chain 1: Iteration: 1001 / 2000 [ 50%]  (Sampling)
Chain 1: Iteration: 1200 / 2000 [ 60%]  (Sampling)
Chain 1: Iteration: 1400 / 2000 [ 70%]  (Sampling)
Chain 1: Iteration: 1600 / 2000 [ 80%]  (Sampling)
Chain 1: Iteration: 1800 / 2000 [ 90%]  (Sampling)
Chain 1: Iteration: 2000 / 2000 [100%]  (Sampling)
Chain 1: 
Chain 1:  Elapsed Time: 0.95974 seconds (Warm-up)
Chain 1:                0.183261 seconds (Sampling)
Chain 1:                1.143 seconds (Total)
Chain 1: 

SAMPLING FOR MODEL 'continuous' NOW (CHAIN 2).
Chain 2: 
Chain 2: Gradient evaluation took 1.2e-05 seconds
Chain 2: 1000 transitions using 10 leapfrog steps per transition would take 0.12 seconds.
Chain 2: Adjust your expectations accordingly!
Chain 2: 
Chain 2: 
Chain 2: Iteration:    1 / 2000 [  0%]  (Warmup)
Chain 2: Iteration:  200 / 2000 [ 10%]  (Warmup)
Chain 2: Iteration:  400 / 2000 [ 20%]  (Warmup)
Chain 2: Iteration:  600 / 2000 [ 30%]  (Warmup)
Chain 2: Iteration:  800 / 2000 [ 40%]  (Warmup)
Chain 2: Iteration: 1000 / 2000 [ 50%]  (Warmup)
Chain 2: Iteration: 1001 / 2000 [ 50%]  (Sampling)
Chain 2: Iteration: 1200 / 2000 [ 60%]  (Sampling)
Chain 2: Iteration: 1400 / 2000 [ 70%]  (Sampling)
Chain 2: Iteration: 1600 / 2000 [ 80%]  (Sampling)
Chain 2: Iteration: 1800 / 2000 [ 90%]  (Sampling)
Chain 2: Iteration: 2000 / 2000 [100%]  (Sampling)
Chain 2: 
Chain 2:  Elapsed Time: 0.622763 seconds (Warm-up)
Chain 2:                0.169904 seconds (Sampling)
Chain 2:                0.792667 seconds (Total)
Chain 2: 

SAMPLING FOR MODEL 'continuous' NOW (CHAIN 3).
Chain 3: 
Chain 3: Gradient evaluation took 1.4e-05 seconds
Chain 3: 1000 transitions using 10 leapfrog steps per transition would take 0.14 seconds.
Chain 3: Adjust your expectations accordingly!
Chain 3: 
Chain 3: 
Chain 3: Iteration:    1 / 2000 [  0%]  (Warmup)
Chain 3: Iteration:  200 / 2000 [ 10%]  (Warmup)
Chain 3: Iteration:  400 / 2000 [ 20%]  (Warmup)
Chain 3: Iteration:  600 / 2000 [ 30%]  (Warmup)
Chain 3: Iteration:  800 / 2000 [ 40%]  (Warmup)
Chain 3: Iteration: 1000 / 2000 [ 50%]  (Warmup)
Chain 3: Iteration: 1001 / 2000 [ 50%]  (Sampling)
Chain 3: Iteration: 1200 / 2000 [ 60%]  (Sampling)
Chain 3: Iteration: 1400 / 2000 [ 70%]  (Sampling)
Chain 3: Iteration: 1600 / 2000 [ 80%]  (Sampling)
Chain 3: Iteration: 1800 / 2000 [ 90%]  (Sampling)
Chain 3: Iteration: 2000 / 2000 [100%]  (Sampling)
Chain 3: 
Chain 3:  Elapsed Time: 0.7959 seconds (Warm-up)
Chain 3:                0.17258 seconds (Sampling)
Chain 3:                0.96848 seconds (Total)
Chain 3: 

SAMPLING FOR MODEL 'continuous' NOW (CHAIN 4).
Chain 4: 
Chain 4: Gradient evaluation took 1.1e-05 seconds
Chain 4: 1000 transitions using 10 leapfrog steps per transition would take 0.11 seconds.
Chain 4: Adjust your expectations accordingly!
Chain 4: 
Chain 4: 
Chain 4: Iteration:    1 / 2000 [  0%]  (Warmup)
Chain 4: Iteration:  200 / 2000 [ 10%]  (Warmup)
Chain 4: Iteration:  400 / 2000 [ 20%]  (Warmup)
Chain 4: Iteration:  600 / 2000 [ 30%]  (Warmup)
Chain 4: Iteration:  800 / 2000 [ 40%]  (Warmup)
Chain 4: Iteration: 1000 / 2000 [ 50%]  (Warmup)
Chain 4: Iteration: 1001 / 2000 [ 50%]  (Sampling)
Chain 4: Iteration: 1200 / 2000 [ 60%]  (Sampling)
Chain 4: Iteration: 1400 / 2000 [ 70%]  (Sampling)
Chain 4: Iteration: 1600 / 2000 [ 80%]  (Sampling)
Chain 4: Iteration: 1800 / 2000 [ 90%]  (Sampling)
Chain 4: Iteration: 2000 / 2000 [100%]  (Sampling)
Chain 4: 
Chain 4:  Elapsed Time: 0.277896 seconds (Warm-up)
Chain 4:                0.175573 seconds (Sampling)
Chain 4:                0.453469 seconds (Total)
Chain 4: 
```

<details>
<summary>hide</summary>
<div class="sourceCode"><pre class="sourceCode r"><code class="sourceCode r"><span class='co'>#use print to display results concisely </span>
<span class='fu'><a href='https://rdrr.io/pkg/knitr/man/kable.html'>kable</a></span><span class='op'>(</span><span class='fu'><a href='https://rdrr.io/r/base/print.html'>print</a></span><span class='op'>(</span><span class='va'>fitted_regression</span>, digits<span class='op'>=</span><span class='fl'>2</span><span class='op'>)</span><span class='op'>)</span>
</code></pre></div>

</details>

```
stan_glm
 family:       gaussian [identity]
 formula:      earn ~ height + male
 observations: 1816
 predictors:   3
------
            Median    MAD_SD   
(Intercept) -25748.75  11944.66
height         646.07    186.17
male         10606.51   1471.54

Auxiliary parameter(s):
      Median   MAD_SD  
sigma 21406.93   358.07

------
* For help interpreting the printed output see ?print.stanreg
* For info on the priors used see ?prior_summary.stanreg
```

<table>
 <thead>
  <tr>
   <th style="text-align:right;"> (Intercept) </th>
   <th style="text-align:right;"> height </th>
   <th style="text-align:right;"> male </th>
   <th style="text-align:right;"> sigma </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> -6939.29476 </td>
   <td style="text-align:right;"> 336.545936 </td>
   <td style="text-align:right;"> 12408.870 </td>
   <td style="text-align:right;"> 21441.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39964.14244 </td>
   <td style="text-align:right;"> 867.670434 </td>
   <td style="text-align:right;"> 8729.081 </td>
   <td style="text-align:right;"> 21177.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20088.10397 </td>
   <td style="text-align:right;"> 549.958265 </td>
   <td style="text-align:right;"> 11228.025 </td>
   <td style="text-align:right;"> 21463.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33250.49056 </td>
   <td style="text-align:right;"> 746.230727 </td>
   <td style="text-align:right;"> 10526.078 </td>
   <td style="text-align:right;"> 21108.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26165.78303 </td>
   <td style="text-align:right;"> 668.107939 </td>
   <td style="text-align:right;"> 9395.656 </td>
   <td style="text-align:right;"> 21134.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3234.95654 </td>
   <td style="text-align:right;"> 191.098748 </td>
   <td style="text-align:right;"> 13708.887 </td>
   <td style="text-align:right;"> 21413.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34503.19101 </td>
   <td style="text-align:right;"> 772.707243 </td>
   <td style="text-align:right;"> 10197.228 </td>
   <td style="text-align:right;"> 21607.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14105.23627 </td>
   <td style="text-align:right;"> 464.980607 </td>
   <td style="text-align:right;"> 11489.516 </td>
   <td style="text-align:right;"> 21731.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22747.60734 </td>
   <td style="text-align:right;"> 579.600554 </td>
   <td style="text-align:right;"> 11763.370 </td>
   <td style="text-align:right;"> 21176.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12670.49280 </td>
   <td style="text-align:right;"> 446.096387 </td>
   <td style="text-align:right;"> 11974.256 </td>
   <td style="text-align:right;"> 21696.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33758.02667 </td>
   <td style="text-align:right;"> 776.265803 </td>
   <td style="text-align:right;"> 9954.761 </td>
   <td style="text-align:right;"> 21391.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27001.47536 </td>
   <td style="text-align:right;"> 658.065472 </td>
   <td style="text-align:right;"> 11100.356 </td>
   <td style="text-align:right;"> 21496.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21906.57535 </td>
   <td style="text-align:right;"> 597.070330 </td>
   <td style="text-align:right;"> 9728.808 </td>
   <td style="text-align:right;"> 21365.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23783.60955 </td>
   <td style="text-align:right;"> 616.083974 </td>
   <td style="text-align:right;"> 11152.652 </td>
   <td style="text-align:right;"> 21463.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32497.28372 </td>
   <td style="text-align:right;"> 754.360850 </td>
   <td style="text-align:right;"> 10166.959 </td>
   <td style="text-align:right;"> 21293.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13231.72804 </td>
   <td style="text-align:right;"> 424.568175 </td>
   <td style="text-align:right;"> 12913.194 </td>
   <td style="text-align:right;"> 20966.43 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14369.22657 </td>
   <td style="text-align:right;"> 484.365046 </td>
   <td style="text-align:right;"> 11429.886 </td>
   <td style="text-align:right;"> 21888.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17891.88707 </td>
   <td style="text-align:right;"> 537.312893 </td>
   <td style="text-align:right;"> 11065.649 </td>
   <td style="text-align:right;"> 21729.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37558.48580 </td>
   <td style="text-align:right;"> 819.559476 </td>
   <td style="text-align:right;"> 10243.991 </td>
   <td style="text-align:right;"> 20867.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10818.75614 </td>
   <td style="text-align:right;"> 419.096971 </td>
   <td style="text-align:right;"> 11939.586 </td>
   <td style="text-align:right;"> 20720.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36292.50482 </td>
   <td style="text-align:right;"> 799.536382 </td>
   <td style="text-align:right;"> 9954.160 </td>
   <td style="text-align:right;"> 20986.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8881.31133 </td>
   <td style="text-align:right;"> 381.058091 </td>
   <td style="text-align:right;"> 12172.822 </td>
   <td style="text-align:right;"> 21565.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36802.19953 </td>
   <td style="text-align:right;"> 811.695151 </td>
   <td style="text-align:right;"> 9910.172 </td>
   <td style="text-align:right;"> 20773.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28404.13106 </td>
   <td style="text-align:right;"> 695.237168 </td>
   <td style="text-align:right;"> 9065.392 </td>
   <td style="text-align:right;"> 20686.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23782.83573 </td>
   <td style="text-align:right;"> 612.959927 </td>
   <td style="text-align:right;"> 10832.628 </td>
   <td style="text-align:right;"> 22127.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27049.20915 </td>
   <td style="text-align:right;"> 651.724361 </td>
   <td style="text-align:right;"> 11293.723 </td>
   <td style="text-align:right;"> 21812.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36277.74636 </td>
   <td style="text-align:right;"> 816.149436 </td>
   <td style="text-align:right;"> 9930.326 </td>
   <td style="text-align:right;"> 20979.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14608.51883 </td>
   <td style="text-align:right;"> 471.610530 </td>
   <td style="text-align:right;"> 11450.464 </td>
   <td style="text-align:right;"> 21690.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37590.51924 </td>
   <td style="text-align:right;"> 835.811210 </td>
   <td style="text-align:right;"> 9283.568 </td>
   <td style="text-align:right;"> 20938.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18966.99912 </td>
   <td style="text-align:right;"> 532.831898 </td>
   <td style="text-align:right;"> 11605.592 </td>
   <td style="text-align:right;"> 21850.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22350.77507 </td>
   <td style="text-align:right;"> 587.599946 </td>
   <td style="text-align:right;"> 10416.325 </td>
   <td style="text-align:right;"> 20876.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -45335.46651 </td>
   <td style="text-align:right;"> 943.296668 </td>
   <td style="text-align:right;"> 7815.612 </td>
   <td style="text-align:right;"> 21940.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10337.45894 </td>
   <td style="text-align:right;"> 418.428967 </td>
   <td style="text-align:right;"> 11804.843 </td>
   <td style="text-align:right;"> 20741.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37699.58838 </td>
   <td style="text-align:right;"> 828.180920 </td>
   <td style="text-align:right;"> 8667.871 </td>
   <td style="text-align:right;"> 22082.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28555.44418 </td>
   <td style="text-align:right;"> 680.099767 </td>
   <td style="text-align:right;"> 10784.260 </td>
   <td style="text-align:right;"> 21638.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30774.92235 </td>
   <td style="text-align:right;"> 728.421178 </td>
   <td style="text-align:right;"> 9540.335 </td>
   <td style="text-align:right;"> 21672.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21935.55179 </td>
   <td style="text-align:right;"> 580.944845 </td>
   <td style="text-align:right;"> 11327.908 </td>
   <td style="text-align:right;"> 20965.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29646.95770 </td>
   <td style="text-align:right;"> 703.870717 </td>
   <td style="text-align:right;"> 9847.591 </td>
   <td style="text-align:right;"> 21214.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20510.47386 </td>
   <td style="text-align:right;"> 562.919823 </td>
   <td style="text-align:right;"> 11745.132 </td>
   <td style="text-align:right;"> 20842.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43410.68510 </td>
   <td style="text-align:right;"> 900.487520 </td>
   <td style="text-align:right;"> 11073.027 </td>
   <td style="text-align:right;"> 21379.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32347.38571 </td>
   <td style="text-align:right;"> 757.339139 </td>
   <td style="text-align:right;"> 8958.512 </td>
   <td style="text-align:right;"> 21432.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -45605.86768 </td>
   <td style="text-align:right;"> 953.258031 </td>
   <td style="text-align:right;"> 8639.041 </td>
   <td style="text-align:right;"> 21638.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12894.83782 </td>
   <td style="text-align:right;"> 447.677207 </td>
   <td style="text-align:right;"> 11789.523 </td>
   <td style="text-align:right;"> 21670.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20491.21084 </td>
   <td style="text-align:right;"> 546.199074 </td>
   <td style="text-align:right;"> 12854.757 </td>
   <td style="text-align:right;"> 21748.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4045.76034 </td>
   <td style="text-align:right;"> 196.052801 </td>
   <td style="text-align:right;"> 12765.267 </td>
   <td style="text-align:right;"> 22007.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9557.99158 </td>
   <td style="text-align:right;"> 390.011349 </td>
   <td style="text-align:right;"> 14186.560 </td>
   <td style="text-align:right;"> 21980.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -779.56539 </td>
   <td style="text-align:right;"> 259.839495 </td>
   <td style="text-align:right;"> 11844.203 </td>
   <td style="text-align:right;"> 21758.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44256.59502 </td>
   <td style="text-align:right;"> 943.089638 </td>
   <td style="text-align:right;"> 9679.895 </td>
   <td style="text-align:right;"> 21578.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27476.95214 </td>
   <td style="text-align:right;"> 689.436910 </td>
   <td style="text-align:right;"> 8022.031 </td>
   <td style="text-align:right;"> 21263.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14093.64963 </td>
   <td style="text-align:right;"> 468.430310 </td>
   <td style="text-align:right;"> 10199.312 </td>
   <td style="text-align:right;"> 21363.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26884.38745 </td>
   <td style="text-align:right;"> 654.109926 </td>
   <td style="text-align:right;"> 11745.351 </td>
   <td style="text-align:right;"> 21430.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25006.50406 </td>
   <td style="text-align:right;"> 633.173147 </td>
   <td style="text-align:right;"> 9564.699 </td>
   <td style="text-align:right;"> 21745.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13924.95593 </td>
   <td style="text-align:right;"> 450.516612 </td>
   <td style="text-align:right;"> 11679.920 </td>
   <td style="text-align:right;"> 21041.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33301.25875 </td>
   <td style="text-align:right;"> 748.797926 </td>
   <td style="text-align:right;"> 11076.929 </td>
   <td style="text-align:right;"> 21145.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28510.58207 </td>
   <td style="text-align:right;"> 686.140698 </td>
   <td style="text-align:right;"> 9585.666 </td>
   <td style="text-align:right;"> 21083.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46762.65989 </td>
   <td style="text-align:right;"> 976.185511 </td>
   <td style="text-align:right;"> 7700.189 </td>
   <td style="text-align:right;"> 21264.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33102.13742 </td>
   <td style="text-align:right;"> 770.901284 </td>
   <td style="text-align:right;"> 7558.291 </td>
   <td style="text-align:right;"> 21167.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41238.55447 </td>
   <td style="text-align:right;"> 881.530402 </td>
   <td style="text-align:right;"> 8711.530 </td>
   <td style="text-align:right;"> 21195.43 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25719.72314 </td>
   <td style="text-align:right;"> 643.937594 </td>
   <td style="text-align:right;"> 10700.179 </td>
   <td style="text-align:right;"> 21441.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20018.26761 </td>
   <td style="text-align:right;"> 562.699731 </td>
   <td style="text-align:right;"> 9423.376 </td>
   <td style="text-align:right;"> 21685.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39687.46868 </td>
   <td style="text-align:right;"> 865.829209 </td>
   <td style="text-align:right;"> 9586.679 </td>
   <td style="text-align:right;"> 21188.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28890.78721 </td>
   <td style="text-align:right;"> 701.970281 </td>
   <td style="text-align:right;"> 9380.345 </td>
   <td style="text-align:right;"> 21246.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24121.71462 </td>
   <td style="text-align:right;"> 623.842835 </td>
   <td style="text-align:right;"> 9484.285 </td>
   <td style="text-align:right;"> 21353.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21350.55726 </td>
   <td style="text-align:right;"> 580.806397 </td>
   <td style="text-align:right;"> 10667.808 </td>
   <td style="text-align:right;"> 21411.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26336.29479 </td>
   <td style="text-align:right;"> 652.095724 </td>
   <td style="text-align:right;"> 9497.340 </td>
   <td style="text-align:right;"> 21454.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15788.82664 </td>
   <td style="text-align:right;"> 494.256363 </td>
   <td style="text-align:right;"> 10446.448 </td>
   <td style="text-align:right;"> 21453.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23502.71400 </td>
   <td style="text-align:right;"> 621.068800 </td>
   <td style="text-align:right;"> 9280.722 </td>
   <td style="text-align:right;"> 21222.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26695.73538 </td>
   <td style="text-align:right;"> 653.319456 </td>
   <td style="text-align:right;"> 12156.134 </td>
   <td style="text-align:right;"> 20892.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15290.26068 </td>
   <td style="text-align:right;"> 496.972106 </td>
   <td style="text-align:right;"> 10230.519 </td>
   <td style="text-align:right;"> 22073.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24833.66211 </td>
   <td style="text-align:right;"> 626.559846 </td>
   <td style="text-align:right;"> 9982.983 </td>
   <td style="text-align:right;"> 20837.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26453.17735 </td>
   <td style="text-align:right;"> 649.145894 </td>
   <td style="text-align:right;"> 12699.024 </td>
   <td style="text-align:right;"> 21749.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -1926.22591 </td>
   <td style="text-align:right;"> 272.568448 </td>
   <td style="text-align:right;"> 12279.133 </td>
   <td style="text-align:right;"> 21334.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5122.49798 </td>
   <td style="text-align:right;"> 323.126298 </td>
   <td style="text-align:right;"> 13064.381 </td>
   <td style="text-align:right;"> 21340.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42762.39367 </td>
   <td style="text-align:right;"> 910.641544 </td>
   <td style="text-align:right;"> 8455.286 </td>
   <td style="text-align:right;"> 21646.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21536.07216 </td>
   <td style="text-align:right;"> 584.353792 </td>
   <td style="text-align:right;"> 10074.083 </td>
   <td style="text-align:right;"> 21206.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25268.41314 </td>
   <td style="text-align:right;"> 638.922401 </td>
   <td style="text-align:right;"> 10154.336 </td>
   <td style="text-align:right;"> 21525.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29106.90950 </td>
   <td style="text-align:right;"> 693.540029 </td>
   <td style="text-align:right;"> 10180.630 </td>
   <td style="text-align:right;"> 21734.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -48658.26627 </td>
   <td style="text-align:right;"> 997.593670 </td>
   <td style="text-align:right;"> 9589.474 </td>
   <td style="text-align:right;"> 21098.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7182.65818 </td>
   <td style="text-align:right;"> 365.851015 </td>
   <td style="text-align:right;"> 11078.371 </td>
   <td style="text-align:right;"> 21031.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34596.72669 </td>
   <td style="text-align:right;"> 756.789504 </td>
   <td style="text-align:right;"> 11460.227 </td>
   <td style="text-align:right;"> 21245.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -4249.46824 </td>
   <td style="text-align:right;"> 328.324490 </td>
   <td style="text-align:right;"> 10475.853 </td>
   <td style="text-align:right;"> 21751.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18054.35415 </td>
   <td style="text-align:right;"> 523.663347 </td>
   <td style="text-align:right;"> 10283.879 </td>
   <td style="text-align:right;"> 21286.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27852.39988 </td>
   <td style="text-align:right;"> 685.618875 </td>
   <td style="text-align:right;"> 10413.635 </td>
   <td style="text-align:right;"> 21826.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8860.06234 </td>
   <td style="text-align:right;"> 381.785419 </td>
   <td style="text-align:right;"> 12643.023 </td>
   <td style="text-align:right;"> 20981.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18496.37824 </td>
   <td style="text-align:right;"> 535.478426 </td>
   <td style="text-align:right;"> 10362.357 </td>
   <td style="text-align:right;"> 21660.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24304.91010 </td>
   <td style="text-align:right;"> 617.713089 </td>
   <td style="text-align:right;"> 12411.103 </td>
   <td style="text-align:right;"> 21341.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41380.85297 </td>
   <td style="text-align:right;"> 881.904386 </td>
   <td style="text-align:right;"> 9701.273 </td>
   <td style="text-align:right;"> 20930.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32330.08634 </td>
   <td style="text-align:right;"> 741.131148 </td>
   <td style="text-align:right;"> 9992.297 </td>
   <td style="text-align:right;"> 21265.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26182.16044 </td>
   <td style="text-align:right;"> 637.156267 </td>
   <td style="text-align:right;"> 10553.999 </td>
   <td style="text-align:right;"> 21566.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13932.79355 </td>
   <td style="text-align:right;"> 483.697960 </td>
   <td style="text-align:right;"> 10789.828 </td>
   <td style="text-align:right;"> 21255.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23573.98415 </td>
   <td style="text-align:right;"> 612.249527 </td>
   <td style="text-align:right;"> 11562.985 </td>
   <td style="text-align:right;"> 21573.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -4708.49671 </td>
   <td style="text-align:right;"> 324.976384 </td>
   <td style="text-align:right;"> 11584.644 </td>
   <td style="text-align:right;"> 21503.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28909.71256 </td>
   <td style="text-align:right;"> 687.816595 </td>
   <td style="text-align:right;"> 11925.710 </td>
   <td style="text-align:right;"> 21713.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30792.11803 </td>
   <td style="text-align:right;"> 740.893961 </td>
   <td style="text-align:right;"> 8265.639 </td>
   <td style="text-align:right;"> 21237.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37699.69140 </td>
   <td style="text-align:right;"> 820.198851 </td>
   <td style="text-align:right;"> 10895.679 </td>
   <td style="text-align:right;"> 21543.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8542.25820 </td>
   <td style="text-align:right;"> 385.762336 </td>
   <td style="text-align:right;"> 10919.601 </td>
   <td style="text-align:right;"> 21382.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37551.44189 </td>
   <td style="text-align:right;"> 824.877408 </td>
   <td style="text-align:right;"> 10988.180 </td>
   <td style="text-align:right;"> 21233.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26668.98039 </td>
   <td style="text-align:right;"> 647.818520 </td>
   <td style="text-align:right;"> 10616.497 </td>
   <td style="text-align:right;"> 20899.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24181.51683 </td>
   <td style="text-align:right;"> 623.324786 </td>
   <td style="text-align:right;"> 9912.810 </td>
   <td style="text-align:right;"> 20866.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21972.76833 </td>
   <td style="text-align:right;"> 592.685145 </td>
   <td style="text-align:right;"> 10417.927 </td>
   <td style="text-align:right;"> 21857.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27031.71176 </td>
   <td style="text-align:right;"> 663.283424 </td>
   <td style="text-align:right;"> 11185.217 </td>
   <td style="text-align:right;"> 21767.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -53377.59900 </td>
   <td style="text-align:right;"> 1083.946581 </td>
   <td style="text-align:right;"> 7862.514 </td>
   <td style="text-align:right;"> 21578.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20027.03598 </td>
   <td style="text-align:right;"> 549.712278 </td>
   <td style="text-align:right;"> 10520.727 </td>
   <td style="text-align:right;"> 21139.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18932.70921 </td>
   <td style="text-align:right;"> 538.974230 </td>
   <td style="text-align:right;"> 8788.336 </td>
   <td style="text-align:right;"> 21289.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30927.02879 </td>
   <td style="text-align:right;"> 703.752261 </td>
   <td style="text-align:right;"> 11151.910 </td>
   <td style="text-align:right;"> 21274.36 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19668.31763 </td>
   <td style="text-align:right;"> 551.524486 </td>
   <td style="text-align:right;"> 11590.315 </td>
   <td style="text-align:right;"> 21168.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20173.47205 </td>
   <td style="text-align:right;"> 544.102314 </td>
   <td style="text-align:right;"> 11277.384 </td>
   <td style="text-align:right;"> 21213.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21755.81815 </td>
   <td style="text-align:right;"> 598.014130 </td>
   <td style="text-align:right;"> 10800.435 </td>
   <td style="text-align:right;"> 21454.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31610.33961 </td>
   <td style="text-align:right;"> 743.591295 </td>
   <td style="text-align:right;"> 10071.682 </td>
   <td style="text-align:right;"> 21409.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34879.89424 </td>
   <td style="text-align:right;"> 778.231279 </td>
   <td style="text-align:right;"> 10066.596 </td>
   <td style="text-align:right;"> 21263.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31716.25159 </td>
   <td style="text-align:right;"> 722.984147 </td>
   <td style="text-align:right;"> 11214.968 </td>
   <td style="text-align:right;"> 21109.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22691.58415 </td>
   <td style="text-align:right;"> 592.147804 </td>
   <td style="text-align:right;"> 10190.994 </td>
   <td style="text-align:right;"> 21600.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16696.97050 </td>
   <td style="text-align:right;"> 516.633583 </td>
   <td style="text-align:right;"> 10898.505 </td>
   <td style="text-align:right;"> 21124.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18635.60382 </td>
   <td style="text-align:right;"> 536.491724 </td>
   <td style="text-align:right;"> 10978.047 </td>
   <td style="text-align:right;"> 21079.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21580.42934 </td>
   <td style="text-align:right;"> 578.511342 </td>
   <td style="text-align:right;"> 11309.574 </td>
   <td style="text-align:right;"> 21014.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31209.57477 </td>
   <td style="text-align:right;"> 751.010893 </td>
   <td style="text-align:right;"> 9508.576 </td>
   <td style="text-align:right;"> 20808.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31951.26733 </td>
   <td style="text-align:right;"> 763.367188 </td>
   <td style="text-align:right;"> 8617.012 </td>
   <td style="text-align:right;"> 21117.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26081.82761 </td>
   <td style="text-align:right;"> 648.809377 </td>
   <td style="text-align:right;"> 12138.620 </td>
   <td style="text-align:right;"> 21566.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22329.28703 </td>
   <td style="text-align:right;"> 586.376800 </td>
   <td style="text-align:right;"> 11114.736 </td>
   <td style="text-align:right;"> 21615.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24705.13351 </td>
   <td style="text-align:right;"> 614.198153 </td>
   <td style="text-align:right;"> 11024.594 </td>
   <td style="text-align:right;"> 21314.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29822.85491 </td>
   <td style="text-align:right;"> 695.230831 </td>
   <td style="text-align:right;"> 12373.633 </td>
   <td style="text-align:right;"> 21197.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32267.89496 </td>
   <td style="text-align:right;"> 732.875070 </td>
   <td style="text-align:right;"> 12434.780 </td>
   <td style="text-align:right;"> 21210.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15797.58491 </td>
   <td style="text-align:right;"> 502.196096 </td>
   <td style="text-align:right;"> 9346.236 </td>
   <td style="text-align:right;"> 21407.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12613.87228 </td>
   <td style="text-align:right;"> 428.585275 </td>
   <td style="text-align:right;"> 13645.439 </td>
   <td style="text-align:right;"> 21862.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12242.44648 </td>
   <td style="text-align:right;"> 431.928985 </td>
   <td style="text-align:right;"> 11090.658 </td>
   <td style="text-align:right;"> 21565.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17626.32627 </td>
   <td style="text-align:right;"> 504.724618 </td>
   <td style="text-align:right;"> 13022.878 </td>
   <td style="text-align:right;"> 21538.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11236.38965 </td>
   <td style="text-align:right;"> 416.907801 </td>
   <td style="text-align:right;"> 12569.377 </td>
   <td style="text-align:right;"> 21756.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31509.82888 </td>
   <td style="text-align:right;"> 748.635927 </td>
   <td style="text-align:right;"> 9721.316 </td>
   <td style="text-align:right;"> 21454.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29298.53851 </td>
   <td style="text-align:right;"> 685.321111 </td>
   <td style="text-align:right;"> 10490.273 </td>
   <td style="text-align:right;"> 21389.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15096.34170 </td>
   <td style="text-align:right;"> 489.237915 </td>
   <td style="text-align:right;"> 10369.049 </td>
   <td style="text-align:right;"> 21074.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35517.96912 </td>
   <td style="text-align:right;"> 793.228381 </td>
   <td style="text-align:right;"> 10989.266 </td>
   <td style="text-align:right;"> 21135.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18450.65616 </td>
   <td style="text-align:right;"> 534.621901 </td>
   <td style="text-align:right;"> 12070.668 </td>
   <td style="text-align:right;"> 20879.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31652.30023 </td>
   <td style="text-align:right;"> 746.675307 </td>
   <td style="text-align:right;"> 9535.176 </td>
   <td style="text-align:right;"> 21416.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22930.66364 </td>
   <td style="text-align:right;"> 605.514588 </td>
   <td style="text-align:right;"> 10501.892 </td>
   <td style="text-align:right;"> 21557.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30258.36333 </td>
   <td style="text-align:right;"> 719.599785 </td>
   <td style="text-align:right;"> 9689.463 </td>
   <td style="text-align:right;"> 21048.73 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34777.16205 </td>
   <td style="text-align:right;"> 774.604675 </td>
   <td style="text-align:right;"> 10632.657 </td>
   <td style="text-align:right;"> 21066.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25778.90141 </td>
   <td style="text-align:right;"> 663.766841 </td>
   <td style="text-align:right;"> 8720.177 </td>
   <td style="text-align:right;"> 20903.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11653.62510 </td>
   <td style="text-align:right;"> 423.901659 </td>
   <td style="text-align:right;"> 10926.872 </td>
   <td style="text-align:right;"> 21597.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34985.38824 </td>
   <td style="text-align:right;"> 769.771980 </td>
   <td style="text-align:right;"> 11124.719 </td>
   <td style="text-align:right;"> 21418.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19952.17953 </td>
   <td style="text-align:right;"> 569.446984 </td>
   <td style="text-align:right;"> 10840.914 </td>
   <td style="text-align:right;"> 21682.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43362.68733 </td>
   <td style="text-align:right;"> 916.645340 </td>
   <td style="text-align:right;"> 8650.953 </td>
   <td style="text-align:right;"> 21605.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29890.17600 </td>
   <td style="text-align:right;"> 712.663747 </td>
   <td style="text-align:right;"> 9678.712 </td>
   <td style="text-align:right;"> 21118.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24928.88769 </td>
   <td style="text-align:right;"> 620.120137 </td>
   <td style="text-align:right;"> 12679.898 </td>
   <td style="text-align:right;"> 21690.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27434.62727 </td>
   <td style="text-align:right;"> 656.650400 </td>
   <td style="text-align:right;"> 12656.507 </td>
   <td style="text-align:right;"> 21956.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35251.60329 </td>
   <td style="text-align:right;"> 785.384882 </td>
   <td style="text-align:right;"> 11611.818 </td>
   <td style="text-align:right;"> 20855.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24157.47689 </td>
   <td style="text-align:right;"> 623.853761 </td>
   <td style="text-align:right;"> 8947.401 </td>
   <td style="text-align:right;"> 20520.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 370.20330 </td>
   <td style="text-align:right;"> 251.998661 </td>
   <td style="text-align:right;"> 11758.129 </td>
   <td style="text-align:right;"> 21640.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43639.85189 </td>
   <td style="text-align:right;"> 917.913868 </td>
   <td style="text-align:right;"> 10267.263 </td>
   <td style="text-align:right;"> 21244.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44400.84124 </td>
   <td style="text-align:right;"> 928.784945 </td>
   <td style="text-align:right;"> 9719.038 </td>
   <td style="text-align:right;"> 21126.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38571.76849 </td>
   <td style="text-align:right;"> 857.117792 </td>
   <td style="text-align:right;"> 7601.412 </td>
   <td style="text-align:right;"> 22131.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12614.60201 </td>
   <td style="text-align:right;"> 445.250713 </td>
   <td style="text-align:right;"> 11403.739 </td>
   <td style="text-align:right;"> 21561.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19289.59267 </td>
   <td style="text-align:right;"> 525.549899 </td>
   <td style="text-align:right;"> 13291.150 </td>
   <td style="text-align:right;"> 21310.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9049.75879 </td>
   <td style="text-align:right;"> 362.790572 </td>
   <td style="text-align:right;"> 13450.243 </td>
   <td style="text-align:right;"> 21448.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44115.98782 </td>
   <td style="text-align:right;"> 946.020382 </td>
   <td style="text-align:right;"> 8873.595 </td>
   <td style="text-align:right;"> 21632.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27226.44268 </td>
   <td style="text-align:right;"> 646.713850 </td>
   <td style="text-align:right;"> 11364.448 </td>
   <td style="text-align:right;"> 21796.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21425.11396 </td>
   <td style="text-align:right;"> 594.715858 </td>
   <td style="text-align:right;"> 10825.797 </td>
   <td style="text-align:right;"> 21023.94 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27243.16039 </td>
   <td style="text-align:right;"> 662.679487 </td>
   <td style="text-align:right;"> 11047.666 </td>
   <td style="text-align:right;"> 22134.05 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19405.77398 </td>
   <td style="text-align:right;"> 544.065965 </td>
   <td style="text-align:right;"> 10778.902 </td>
   <td style="text-align:right;"> 21771.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21358.50638 </td>
   <td style="text-align:right;"> 565.274607 </td>
   <td style="text-align:right;"> 12499.716 </td>
   <td style="text-align:right;"> 21502.43 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18937.42859 </td>
   <td style="text-align:right;"> 547.790745 </td>
   <td style="text-align:right;"> 10227.154 </td>
   <td style="text-align:right;"> 21759.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17008.71287 </td>
   <td style="text-align:right;"> 524.170350 </td>
   <td style="text-align:right;"> 9611.431 </td>
   <td style="text-align:right;"> 21810.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32043.06572 </td>
   <td style="text-align:right;"> 755.889935 </td>
   <td style="text-align:right;"> 9911.752 </td>
   <td style="text-align:right;"> 21740.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36370.14080 </td>
   <td style="text-align:right;"> 816.531360 </td>
   <td style="text-align:right;"> 9742.982 </td>
   <td style="text-align:right;"> 21982.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21570.71784 </td>
   <td style="text-align:right;"> 586.148961 </td>
   <td style="text-align:right;"> 10580.259 </td>
   <td style="text-align:right;"> 21745.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16392.70714 </td>
   <td style="text-align:right;"> 489.473818 </td>
   <td style="text-align:right;"> 12441.136 </td>
   <td style="text-align:right;"> 21758.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27805.93402 </td>
   <td style="text-align:right;"> 677.754868 </td>
   <td style="text-align:right;"> 10192.626 </td>
   <td style="text-align:right;"> 20921.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18520.47069 </td>
   <td style="text-align:right;"> 546.884712 </td>
   <td style="text-align:right;"> 10409.068 </td>
   <td style="text-align:right;"> 21754.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18530.62683 </td>
   <td style="text-align:right;"> 539.550069 </td>
   <td style="text-align:right;"> 10083.459 </td>
   <td style="text-align:right;"> 21251.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9626.10217 </td>
   <td style="text-align:right;"> 406.362200 </td>
   <td style="text-align:right;"> 10850.764 </td>
   <td style="text-align:right;"> 21669.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46170.02233 </td>
   <td style="text-align:right;"> 948.848504 </td>
   <td style="text-align:right;"> 10162.040 </td>
   <td style="text-align:right;"> 21195.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -48973.71581 </td>
   <td style="text-align:right;"> 986.475720 </td>
   <td style="text-align:right;"> 10624.163 </td>
   <td style="text-align:right;"> 21178.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17179.01189 </td>
   <td style="text-align:right;"> 503.721072 </td>
   <td style="text-align:right;"> 14471.818 </td>
   <td style="text-align:right;"> 21405.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16766.33397 </td>
   <td style="text-align:right;"> 501.833995 </td>
   <td style="text-align:right;"> 13453.162 </td>
   <td style="text-align:right;"> 21353.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41351.76526 </td>
   <td style="text-align:right;"> 884.015747 </td>
   <td style="text-align:right;"> 8927.445 </td>
   <td style="text-align:right;"> 21655.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -47974.67100 </td>
   <td style="text-align:right;"> 992.842794 </td>
   <td style="text-align:right;"> 8318.243 </td>
   <td style="text-align:right;"> 22034.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11516.82052 </td>
   <td style="text-align:right;"> 420.481092 </td>
   <td style="text-align:right;"> 12288.045 </td>
   <td style="text-align:right;"> 21135.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36542.04980 </td>
   <td style="text-align:right;"> 820.590343 </td>
   <td style="text-align:right;"> 9645.459 </td>
   <td style="text-align:right;"> 21738.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25289.88611 </td>
   <td style="text-align:right;"> 646.101913 </td>
   <td style="text-align:right;"> 8974.828 </td>
   <td style="text-align:right;"> 21506.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25605.56901 </td>
   <td style="text-align:right;"> 642.571576 </td>
   <td style="text-align:right;"> 9829.031 </td>
   <td style="text-align:right;"> 21670.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30115.27999 </td>
   <td style="text-align:right;"> 715.344730 </td>
   <td style="text-align:right;"> 10926.509 </td>
   <td style="text-align:right;"> 21342.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7272.69715 </td>
   <td style="text-align:right;"> 372.705177 </td>
   <td style="text-align:right;"> 11910.708 </td>
   <td style="text-align:right;"> 21070.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7480.94881 </td>
   <td style="text-align:right;"> 374.527450 </td>
   <td style="text-align:right;"> 11978.205 </td>
   <td style="text-align:right;"> 21112.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12002.65036 </td>
   <td style="text-align:right;"> 441.522364 </td>
   <td style="text-align:right;"> 12881.379 </td>
   <td style="text-align:right;"> 21410.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21108.02454 </td>
   <td style="text-align:right;"> 577.881346 </td>
   <td style="text-align:right;"> 11164.616 </td>
   <td style="text-align:right;"> 21395.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23026.26962 </td>
   <td style="text-align:right;"> 603.736276 </td>
   <td style="text-align:right;"> 10747.135 </td>
   <td style="text-align:right;"> 21440.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29034.47688 </td>
   <td style="text-align:right;"> 708.534447 </td>
   <td style="text-align:right;"> 9551.992 </td>
   <td style="text-align:right;"> 21295.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32652.43325 </td>
   <td style="text-align:right;"> 742.509901 </td>
   <td style="text-align:right;"> 11215.875 </td>
   <td style="text-align:right;"> 21705.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19349.28819 </td>
   <td style="text-align:right;"> 546.999561 </td>
   <td style="text-align:right;"> 11853.988 </td>
   <td style="text-align:right;"> 21720.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -3471.29731 </td>
   <td style="text-align:right;"> 307.489942 </td>
   <td style="text-align:right;"> 12812.825 </td>
   <td style="text-align:right;"> 21438.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6868.80474 </td>
   <td style="text-align:right;"> 364.075365 </td>
   <td style="text-align:right;"> 12768.968 </td>
   <td style="text-align:right;"> 21216.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16407.47081 </td>
   <td style="text-align:right;"> 512.813956 </td>
   <td style="text-align:right;"> 11037.270 </td>
   <td style="text-align:right;"> 21313.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19648.36215 </td>
   <td style="text-align:right;"> 546.178850 </td>
   <td style="text-align:right;"> 12091.265 </td>
   <td style="text-align:right;"> 21638.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15189.57306 </td>
   <td style="text-align:right;"> 473.255903 </td>
   <td style="text-align:right;"> 11452.732 </td>
   <td style="text-align:right;"> 21616.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -54594.77950 </td>
   <td style="text-align:right;"> 1091.046343 </td>
   <td style="text-align:right;"> 8065.986 </td>
   <td style="text-align:right;"> 21675.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -52631.69515 </td>
   <td style="text-align:right;"> 1069.098077 </td>
   <td style="text-align:right;"> 6389.284 </td>
   <td style="text-align:right;"> 21861.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -47423.25098 </td>
   <td style="text-align:right;"> 989.350646 </td>
   <td style="text-align:right;"> 6708.532 </td>
   <td style="text-align:right;"> 21840.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -48296.11663 </td>
   <td style="text-align:right;"> 997.330491 </td>
   <td style="text-align:right;"> 9453.084 </td>
   <td style="text-align:right;"> 21598.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24447.09408 </td>
   <td style="text-align:right;"> 649.001306 </td>
   <td style="text-align:right;"> 8657.191 </td>
   <td style="text-align:right;"> 21228.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44933.78771 </td>
   <td style="text-align:right;"> 929.572698 </td>
   <td style="text-align:right;"> 10400.746 </td>
   <td style="text-align:right;"> 21286.43 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20896.64947 </td>
   <td style="text-align:right;"> 568.335181 </td>
   <td style="text-align:right;"> 9247.086 </td>
   <td style="text-align:right;"> 21439.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20956.68308 </td>
   <td style="text-align:right;"> 584.117824 </td>
   <td style="text-align:right;"> 10912.765 </td>
   <td style="text-align:right;"> 21373.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36868.14413 </td>
   <td style="text-align:right;"> 802.194794 </td>
   <td style="text-align:right;"> 11027.893 </td>
   <td style="text-align:right;"> 21427.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36431.70195 </td>
   <td style="text-align:right;"> 796.537950 </td>
   <td style="text-align:right;"> 11503.595 </td>
   <td style="text-align:right;"> 21385.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11106.36117 </td>
   <td style="text-align:right;"> 426.413806 </td>
   <td style="text-align:right;"> 10263.696 </td>
   <td style="text-align:right;"> 21580.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -47094.34857 </td>
   <td style="text-align:right;"> 972.112830 </td>
   <td style="text-align:right;"> 7577.440 </td>
   <td style="text-align:right;"> 20705.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -1087.84850 </td>
   <td style="text-align:right;"> 276.407599 </td>
   <td style="text-align:right;"> 12417.242 </td>
   <td style="text-align:right;"> 21559.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11489.67077 </td>
   <td style="text-align:right;"> 425.471793 </td>
   <td style="text-align:right;"> 13046.272 </td>
   <td style="text-align:right;"> 21671.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37701.68891 </td>
   <td style="text-align:right;"> 811.835260 </td>
   <td style="text-align:right;"> 11932.660 </td>
   <td style="text-align:right;"> 21462.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27755.02096 </td>
   <td style="text-align:right;"> 667.189103 </td>
   <td style="text-align:right;"> 10062.193 </td>
   <td style="text-align:right;"> 21690.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35905.95676 </td>
   <td style="text-align:right;"> 801.184840 </td>
   <td style="text-align:right;"> 9300.176 </td>
   <td style="text-align:right;"> 21654.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22548.14193 </td>
   <td style="text-align:right;"> 583.014190 </td>
   <td style="text-align:right;"> 11237.795 </td>
   <td style="text-align:right;"> 21421.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32793.57421 </td>
   <td style="text-align:right;"> 760.707880 </td>
   <td style="text-align:right;"> 8893.430 </td>
   <td style="text-align:right;"> 21519.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29102.35778 </td>
   <td style="text-align:right;"> 682.259655 </td>
   <td style="text-align:right;"> 11735.710 </td>
   <td style="text-align:right;"> 21197.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31906.39310 </td>
   <td style="text-align:right;"> 722.077058 </td>
   <td style="text-align:right;"> 12204.722 </td>
   <td style="text-align:right;"> 21005.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35593.03685 </td>
   <td style="text-align:right;"> 799.600416 </td>
   <td style="text-align:right;"> 9487.052 </td>
   <td style="text-align:right;"> 21100.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17354.30140 </td>
   <td style="text-align:right;"> 515.937619 </td>
   <td style="text-align:right;"> 11963.741 </td>
   <td style="text-align:right;"> 21473.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20053.44429 </td>
   <td style="text-align:right;"> 576.221690 </td>
   <td style="text-align:right;"> 9795.186 </td>
   <td style="text-align:right;"> 21361.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40929.68323 </td>
   <td style="text-align:right;"> 876.044822 </td>
   <td style="text-align:right;"> 9528.698 </td>
   <td style="text-align:right;"> 21644.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37773.50252 </td>
   <td style="text-align:right;"> 829.056981 </td>
   <td style="text-align:right;"> 9654.192 </td>
   <td style="text-align:right;"> 21612.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32943.30348 </td>
   <td style="text-align:right;"> 747.186948 </td>
   <td style="text-align:right;"> 9096.200 </td>
   <td style="text-align:right;"> 21362.43 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -4629.56422 </td>
   <td style="text-align:right;"> 323.775244 </td>
   <td style="text-align:right;"> 12734.997 </td>
   <td style="text-align:right;"> 21371.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18545.09631 </td>
   <td style="text-align:right;"> 535.467312 </td>
   <td style="text-align:right;"> 11177.930 </td>
   <td style="text-align:right;"> 21029.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18620.87221 </td>
   <td style="text-align:right;"> 529.365745 </td>
   <td style="text-align:right;"> 10648.278 </td>
   <td style="text-align:right;"> 21292.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21201.43666 </td>
   <td style="text-align:right;"> 570.652769 </td>
   <td style="text-align:right;"> 10342.057 </td>
   <td style="text-align:right;"> 21372.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19436.76807 </td>
   <td style="text-align:right;"> 544.866638 </td>
   <td style="text-align:right;"> 10147.121 </td>
   <td style="text-align:right;"> 21377.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35052.48533 </td>
   <td style="text-align:right;"> 780.372641 </td>
   <td style="text-align:right;"> 9520.945 </td>
   <td style="text-align:right;"> 21172.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19659.90163 </td>
   <td style="text-align:right;"> 558.866854 </td>
   <td style="text-align:right;"> 12133.847 </td>
   <td style="text-align:right;"> 21434.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12504.70731 </td>
   <td style="text-align:right;"> 438.241955 </td>
   <td style="text-align:right;"> 12690.455 </td>
   <td style="text-align:right;"> 20761.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19539.80420 </td>
   <td style="text-align:right;"> 556.947221 </td>
   <td style="text-align:right;"> 10778.292 </td>
   <td style="text-align:right;"> 21291.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25289.65354 </td>
   <td style="text-align:right;"> 641.556122 </td>
   <td style="text-align:right;"> 10190.561 </td>
   <td style="text-align:right;"> 21363.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13563.07346 </td>
   <td style="text-align:right;"> 464.529626 </td>
   <td style="text-align:right;"> 10150.099 </td>
   <td style="text-align:right;"> 20976.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30994.69574 </td>
   <td style="text-align:right;"> 720.320921 </td>
   <td style="text-align:right;"> 12101.063 </td>
   <td style="text-align:right;"> 20976.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29488.09127 </td>
   <td style="text-align:right;"> 706.143785 </td>
   <td style="text-align:right;"> 11539.722 </td>
   <td style="text-align:right;"> 21056.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30287.86052 </td>
   <td style="text-align:right;"> 715.980860 </td>
   <td style="text-align:right;"> 11362.977 </td>
   <td style="text-align:right;"> 20883.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27556.20743 </td>
   <td style="text-align:right;"> 662.958085 </td>
   <td style="text-align:right;"> 10932.660 </td>
   <td style="text-align:right;"> 21873.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25731.21074 </td>
   <td style="text-align:right;"> 654.201287 </td>
   <td style="text-align:right;"> 10802.910 </td>
   <td style="text-align:right;"> 20920.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25097.21301 </td>
   <td style="text-align:right;"> 649.074346 </td>
   <td style="text-align:right;"> 10356.269 </td>
   <td style="text-align:right;"> 21793.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17891.21619 </td>
   <td style="text-align:right;"> 506.030586 </td>
   <td style="text-align:right;"> 12616.792 </td>
   <td style="text-align:right;"> 20854.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31857.71426 </td>
   <td style="text-align:right;"> 725.663800 </td>
   <td style="text-align:right;"> 10585.376 </td>
   <td style="text-align:right;"> 21427.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14192.47514 </td>
   <td style="text-align:right;"> 469.263139 </td>
   <td style="text-align:right;"> 13151.594 </td>
   <td style="text-align:right;"> 20845.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40223.56288 </td>
   <td style="text-align:right;"> 877.061105 </td>
   <td style="text-align:right;"> 6845.787 </td>
   <td style="text-align:right;"> 21349.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -48192.93643 </td>
   <td style="text-align:right;"> 976.431056 </td>
   <td style="text-align:right;"> 9948.775 </td>
   <td style="text-align:right;"> 21459.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18098.21814 </td>
   <td style="text-align:right;"> 542.467543 </td>
   <td style="text-align:right;"> 9593.186 </td>
   <td style="text-align:right;"> 21587.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14470.93068 </td>
   <td style="text-align:right;"> 473.681114 </td>
   <td style="text-align:right;"> 10741.272 </td>
   <td style="text-align:right;"> 21267.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37136.36752 </td>
   <td style="text-align:right;"> 819.603901 </td>
   <td style="text-align:right;"> 10566.351 </td>
   <td style="text-align:right;"> 21540.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14614.32897 </td>
   <td style="text-align:right;"> 459.114596 </td>
   <td style="text-align:right;"> 13442.493 </td>
   <td style="text-align:right;"> 21385.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34078.55152 </td>
   <td style="text-align:right;"> 772.313013 </td>
   <td style="text-align:right;"> 9672.011 </td>
   <td style="text-align:right;"> 21981.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24905.08999 </td>
   <td style="text-align:right;"> 631.240111 </td>
   <td style="text-align:right;"> 10111.496 </td>
   <td style="text-align:right;"> 21848.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27662.44904 </td>
   <td style="text-align:right;"> 672.884320 </td>
   <td style="text-align:right;"> 10437.868 </td>
   <td style="text-align:right;"> 21587.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31936.61533 </td>
   <td style="text-align:right;"> 725.064171 </td>
   <td style="text-align:right;"> 9991.076 </td>
   <td style="text-align:right;"> 21532.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -4996.41972 </td>
   <td style="text-align:right;"> 316.066435 </td>
   <td style="text-align:right;"> 13319.589 </td>
   <td style="text-align:right;"> 21937.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6814.35389 </td>
   <td style="text-align:right;"> 130.725184 </td>
   <td style="text-align:right;"> 13627.563 </td>
   <td style="text-align:right;"> 21924.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24359.67122 </td>
   <td style="text-align:right;"> 629.895311 </td>
   <td style="text-align:right;"> 11926.318 </td>
   <td style="text-align:right;"> 22040.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12965.87626 </td>
   <td style="text-align:right;"> 454.226186 </td>
   <td style="text-align:right;"> 11762.436 </td>
   <td style="text-align:right;"> 21868.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18004.33957 </td>
   <td style="text-align:right;"> 520.786105 </td>
   <td style="text-align:right;"> 12026.707 </td>
   <td style="text-align:right;"> 21538.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20054.91861 </td>
   <td style="text-align:right;"> 563.368022 </td>
   <td style="text-align:right;"> 10613.361 </td>
   <td style="text-align:right;"> 21524.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20252.63753 </td>
   <td style="text-align:right;"> 551.912895 </td>
   <td style="text-align:right;"> 11661.234 </td>
   <td style="text-align:right;"> 21074.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25442.96970 </td>
   <td style="text-align:right;"> 631.821392 </td>
   <td style="text-align:right;"> 11840.869 </td>
   <td style="text-align:right;"> 21381.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17212.60207 </td>
   <td style="text-align:right;"> 514.974789 </td>
   <td style="text-align:right;"> 10350.105 </td>
   <td style="text-align:right;"> 21192.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32165.90505 </td>
   <td style="text-align:right;"> 738.495632 </td>
   <td style="text-align:right;"> 11324.183 </td>
   <td style="text-align:right;"> 21159.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25231.76911 </td>
   <td style="text-align:right;"> 641.549198 </td>
   <td style="text-align:right;"> 11189.006 </td>
   <td style="text-align:right;"> 21753.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17765.79597 </td>
   <td style="text-align:right;"> 532.067185 </td>
   <td style="text-align:right;"> 10675.100 </td>
   <td style="text-align:right;"> 20980.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36061.34439 </td>
   <td style="text-align:right;"> 802.036018 </td>
   <td style="text-align:right;"> 10136.772 </td>
   <td style="text-align:right;"> 20845.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37174.08628 </td>
   <td style="text-align:right;"> 823.904185 </td>
   <td style="text-align:right;"> 8840.230 </td>
   <td style="text-align:right;"> 20762.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -53084.35755 </td>
   <td style="text-align:right;"> 1059.927613 </td>
   <td style="text-align:right;"> 9370.267 </td>
   <td style="text-align:right;"> 20798.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17408.41009 </td>
   <td style="text-align:right;"> 533.088498 </td>
   <td style="text-align:right;"> 9429.540 </td>
   <td style="text-align:right;"> 21216.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40922.61266 </td>
   <td style="text-align:right;"> 873.682389 </td>
   <td style="text-align:right;"> 9988.517 </td>
   <td style="text-align:right;"> 21387.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5134.41239 </td>
   <td style="text-align:right;"> 338.070649 </td>
   <td style="text-align:right;"> 12154.812 </td>
   <td style="text-align:right;"> 20940.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16054.30177 </td>
   <td style="text-align:right;"> 494.905823 </td>
   <td style="text-align:right;"> 13433.038 </td>
   <td style="text-align:right;"> 21016.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15228.22663 </td>
   <td style="text-align:right;"> 479.547366 </td>
   <td style="text-align:right;"> 10379.610 </td>
   <td style="text-align:right;"> 21238.36 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18498.81466 </td>
   <td style="text-align:right;"> 536.592777 </td>
   <td style="text-align:right;"> 12744.232 </td>
   <td style="text-align:right;"> 21932.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12385.27163 </td>
   <td style="text-align:right;"> 447.756733 </td>
   <td style="text-align:right;"> 11016.078 </td>
   <td style="text-align:right;"> 21042.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25288.72870 </td>
   <td style="text-align:right;"> 632.602002 </td>
   <td style="text-align:right;"> 12026.625 </td>
   <td style="text-align:right;"> 21867.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -3992.51020 </td>
   <td style="text-align:right;"> 311.611338 </td>
   <td style="text-align:right;"> 11995.699 </td>
   <td style="text-align:right;"> 21716.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9092.03920 </td>
   <td style="text-align:right;"> 379.283922 </td>
   <td style="text-align:right;"> 13881.219 </td>
   <td style="text-align:right;"> 21748.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -45686.09867 </td>
   <td style="text-align:right;"> 962.064968 </td>
   <td style="text-align:right;"> 7555.713 </td>
   <td style="text-align:right;"> 21052.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31099.72310 </td>
   <td style="text-align:right;"> 713.123329 </td>
   <td style="text-align:right;"> 11090.093 </td>
   <td style="text-align:right;"> 21751.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36955.37076 </td>
   <td style="text-align:right;"> 818.350800 </td>
   <td style="text-align:right;"> 10625.227 </td>
   <td style="text-align:right;"> 21171.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26758.97173 </td>
   <td style="text-align:right;"> 667.763469 </td>
   <td style="text-align:right;"> 9305.208 </td>
   <td style="text-align:right;"> 21946.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42659.57302 </td>
   <td style="text-align:right;"> 900.924968 </td>
   <td style="text-align:right;"> 10485.358 </td>
   <td style="text-align:right;"> 21804.84 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31264.75135 </td>
   <td style="text-align:right;"> 734.890150 </td>
   <td style="text-align:right;"> 8057.658 </td>
   <td style="text-align:right;"> 21327.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32160.60690 </td>
   <td style="text-align:right;"> 752.818476 </td>
   <td style="text-align:right;"> 10309.101 </td>
   <td style="text-align:right;"> 21022.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5022.80310 </td>
   <td style="text-align:right;"> 335.469338 </td>
   <td style="text-align:right;"> 11250.000 </td>
   <td style="text-align:right;"> 21209.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20171.84152 </td>
   <td style="text-align:right;"> 553.813559 </td>
   <td style="text-align:right;"> 12593.475 </td>
   <td style="text-align:right;"> 20988.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33806.61670 </td>
   <td style="text-align:right;"> 760.201783 </td>
   <td style="text-align:right;"> 10982.289 </td>
   <td style="text-align:right;"> 21889.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6736.47311 </td>
   <td style="text-align:right;"> 345.450893 </td>
   <td style="text-align:right;"> 12932.465 </td>
   <td style="text-align:right;"> 21501.84 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15652.12545 </td>
   <td style="text-align:right;"> 474.892817 </td>
   <td style="text-align:right;"> 12892.099 </td>
   <td style="text-align:right;"> 21232.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11362.24295 </td>
   <td style="text-align:right;"> 427.403147 </td>
   <td style="text-align:right;"> 11613.678 </td>
   <td style="text-align:right;"> 21321.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26572.84649 </td>
   <td style="text-align:right;"> 663.698509 </td>
   <td style="text-align:right;"> 11220.558 </td>
   <td style="text-align:right;"> 21003.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31975.18076 </td>
   <td style="text-align:right;"> 747.771188 </td>
   <td style="text-align:right;"> 9191.821 </td>
   <td style="text-align:right;"> 21516.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27214.87821 </td>
   <td style="text-align:right;"> 670.950614 </td>
   <td style="text-align:right;"> 11488.166 </td>
   <td style="text-align:right;"> 21904.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19228.03584 </td>
   <td style="text-align:right;"> 553.276349 </td>
   <td style="text-align:right;"> 10124.823 </td>
   <td style="text-align:right;"> 21996.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28016.76204 </td>
   <td style="text-align:right;"> 685.050067 </td>
   <td style="text-align:right;"> 9688.701 </td>
   <td style="text-align:right;"> 21038.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18461.03981 </td>
   <td style="text-align:right;"> 532.495433 </td>
   <td style="text-align:right;"> 10977.705 </td>
   <td style="text-align:right;"> 21743.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27013.04745 </td>
   <td style="text-align:right;"> 664.579344 </td>
   <td style="text-align:right;"> 10272.514 </td>
   <td style="text-align:right;"> 21046.73 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25356.25169 </td>
   <td style="text-align:right;"> 626.901587 </td>
   <td style="text-align:right;"> 12031.983 </td>
   <td style="text-align:right;"> 20938.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22935.66922 </td>
   <td style="text-align:right;"> 606.786956 </td>
   <td style="text-align:right;"> 9682.495 </td>
   <td style="text-align:right;"> 21548.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27885.42426 </td>
   <td style="text-align:right;"> 688.943271 </td>
   <td style="text-align:right;"> 8808.657 </td>
   <td style="text-align:right;"> 21048.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -53954.43773 </td>
   <td style="text-align:right;"> 1073.596522 </td>
   <td style="text-align:right;"> 8607.069 </td>
   <td style="text-align:right;"> 20685.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16102.02928 </td>
   <td style="text-align:right;"> 503.667883 </td>
   <td style="text-align:right;"> 10221.320 </td>
   <td style="text-align:right;"> 21344.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22261.57074 </td>
   <td style="text-align:right;"> 589.922964 </td>
   <td style="text-align:right;"> 10771.658 </td>
   <td style="text-align:right;"> 21460.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40015.52268 </td>
   <td style="text-align:right;"> 863.793434 </td>
   <td style="text-align:right;"> 9677.145 </td>
   <td style="text-align:right;"> 21123.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21010.48862 </td>
   <td style="text-align:right;"> 572.434656 </td>
   <td style="text-align:right;"> 11684.446 </td>
   <td style="text-align:right;"> 21564.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19485.12435 </td>
   <td style="text-align:right;"> 547.412216 </td>
   <td style="text-align:right;"> 12147.204 </td>
   <td style="text-align:right;"> 21640.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30510.84317 </td>
   <td style="text-align:right;"> 715.258858 </td>
   <td style="text-align:right;"> 9335.490 </td>
   <td style="text-align:right;"> 21176.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9958.40061 </td>
   <td style="text-align:right;"> 418.104359 </td>
   <td style="text-align:right;"> 10653.342 </td>
   <td style="text-align:right;"> 21604.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5507.53252 </td>
   <td style="text-align:right;"> 352.596815 </td>
   <td style="text-align:right;"> 10857.955 </td>
   <td style="text-align:right;"> 21634.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35124.70143 </td>
   <td style="text-align:right;"> 791.784840 </td>
   <td style="text-align:right;"> 8109.890 </td>
   <td style="text-align:right;"> 21432.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -49276.68508 </td>
   <td style="text-align:right;"> 1005.734484 </td>
   <td style="text-align:right;"> 8303.167 </td>
   <td style="text-align:right;"> 21843.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8320.11056 </td>
   <td style="text-align:right;"> 380.703735 </td>
   <td style="text-align:right;"> 12414.491 </td>
   <td style="text-align:right;"> 20657.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23150.34603 </td>
   <td style="text-align:right;"> 607.537483 </td>
   <td style="text-align:right;"> 11239.752 </td>
   <td style="text-align:right;"> 21645.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31300.75556 </td>
   <td style="text-align:right;"> 736.605072 </td>
   <td style="text-align:right;"> 9439.684 </td>
   <td style="text-align:right;"> 21403.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20118.65610 </td>
   <td style="text-align:right;"> 552.098934 </td>
   <td style="text-align:right;"> 11802.600 </td>
   <td style="text-align:right;"> 21263.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42463.67805 </td>
   <td style="text-align:right;"> 896.675044 </td>
   <td style="text-align:right;"> 8250.510 </td>
   <td style="text-align:right;"> 21198.24 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15769.53952 </td>
   <td style="text-align:right;"> 491.659626 </td>
   <td style="text-align:right;"> 12881.700 </td>
   <td style="text-align:right;"> 21388.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12149.69551 </td>
   <td style="text-align:right;"> 434.092922 </td>
   <td style="text-align:right;"> 13409.877 </td>
   <td style="text-align:right;"> 21594.84 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4196.12517 </td>
   <td style="text-align:right;"> 179.655086 </td>
   <td style="text-align:right;"> 13316.159 </td>
   <td style="text-align:right;"> 22052.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9278.96002 </td>
   <td style="text-align:right;"> 100.691035 </td>
   <td style="text-align:right;"> 14119.731 </td>
   <td style="text-align:right;"> 21979.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37345.05503 </td>
   <td style="text-align:right;"> 828.582485 </td>
   <td style="text-align:right;"> 9088.763 </td>
   <td style="text-align:right;"> 21927.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34249.06303 </td>
   <td style="text-align:right;"> 769.711070 </td>
   <td style="text-align:right;"> 10377.045 </td>
   <td style="text-align:right;"> 21903.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32988.84412 </td>
   <td style="text-align:right;"> 761.833622 </td>
   <td style="text-align:right;"> 8979.498 </td>
   <td style="text-align:right;"> 21981.84 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9073.56162 </td>
   <td style="text-align:right;"> 380.689109 </td>
   <td style="text-align:right;"> 12700.599 </td>
   <td style="text-align:right;"> 21017.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11877.22764 </td>
   <td style="text-align:right;"> 427.176873 </td>
   <td style="text-align:right;"> 11987.166 </td>
   <td style="text-align:right;"> 20777.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31781.89814 </td>
   <td style="text-align:right;"> 735.406354 </td>
   <td style="text-align:right;"> 10058.388 </td>
   <td style="text-align:right;"> 21577.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12988.33996 </td>
   <td style="text-align:right;"> 454.599673 </td>
   <td style="text-align:right;"> 10777.958 </td>
   <td style="text-align:right;"> 21256.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41530.23560 </td>
   <td style="text-align:right;"> 895.863808 </td>
   <td style="text-align:right;"> 10087.557 </td>
   <td style="text-align:right;"> 21577.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24872.57086 </td>
   <td style="text-align:right;"> 641.534424 </td>
   <td style="text-align:right;"> 9991.791 </td>
   <td style="text-align:right;"> 21587.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21324.73905 </td>
   <td style="text-align:right;"> 577.422160 </td>
   <td style="text-align:right;"> 11069.236 </td>
   <td style="text-align:right;"> 21458.94 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31590.50808 </td>
   <td style="text-align:right;"> 732.522975 </td>
   <td style="text-align:right;"> 10065.634 </td>
   <td style="text-align:right;"> 21216.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21635.94544 </td>
   <td style="text-align:right;"> 575.257243 </td>
   <td style="text-align:right;"> 11948.851 </td>
   <td style="text-align:right;"> 21362.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28136.38300 </td>
   <td style="text-align:right;"> 692.574611 </td>
   <td style="text-align:right;"> 8958.058 </td>
   <td style="text-align:right;"> 21139.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14243.39557 </td>
   <td style="text-align:right;"> 448.251675 </td>
   <td style="text-align:right;"> 13013.250 </td>
   <td style="text-align:right;"> 21352.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37646.38706 </td>
   <td style="text-align:right;"> 852.819511 </td>
   <td style="text-align:right;"> 8315.837 </td>
   <td style="text-align:right;"> 21547.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5009.60443 </td>
   <td style="text-align:right;"> 316.509667 </td>
   <td style="text-align:right;"> 13625.218 </td>
   <td style="text-align:right;"> 20915.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -2583.50421 </td>
   <td style="text-align:right;"> 279.093025 </td>
   <td style="text-align:right;"> 13924.367 </td>
   <td style="text-align:right;"> 20825.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36087.16674 </td>
   <td style="text-align:right;"> 794.329415 </td>
   <td style="text-align:right;"> 10534.534 </td>
   <td style="text-align:right;"> 21899.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39881.30556 </td>
   <td style="text-align:right;"> 843.019454 </td>
   <td style="text-align:right;"> 10583.715 </td>
   <td style="text-align:right;"> 21896.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29784.06632 </td>
   <td style="text-align:right;"> 701.499885 </td>
   <td style="text-align:right;"> 8151.524 </td>
   <td style="text-align:right;"> 21837.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39045.20775 </td>
   <td style="text-align:right;"> 833.399108 </td>
   <td style="text-align:right;"> 9598.565 </td>
   <td style="text-align:right;"> 21800.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26670.65170 </td>
   <td style="text-align:right;"> 646.203970 </td>
   <td style="text-align:right;"> 10008.123 </td>
   <td style="text-align:right;"> 22159.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12599.69302 </td>
   <td style="text-align:right;"> 435.670925 </td>
   <td style="text-align:right;"> 10865.453 </td>
   <td style="text-align:right;"> 21624.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33422.93247 </td>
   <td style="text-align:right;"> 748.644570 </td>
   <td style="text-align:right;"> 11383.299 </td>
   <td style="text-align:right;"> 22198.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18975.08082 </td>
   <td style="text-align:right;"> 531.735171 </td>
   <td style="text-align:right;"> 10389.103 </td>
   <td style="text-align:right;"> 22161.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36898.35679 </td>
   <td style="text-align:right;"> 839.182584 </td>
   <td style="text-align:right;"> 7931.958 </td>
   <td style="text-align:right;"> 20730.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35193.51261 </td>
   <td style="text-align:right;"> 794.517416 </td>
   <td style="text-align:right;"> 10506.579 </td>
   <td style="text-align:right;"> 20783.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26764.80010 </td>
   <td style="text-align:right;"> 671.266672 </td>
   <td style="text-align:right;"> 9293.146 </td>
   <td style="text-align:right;"> 20803.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11689.30354 </td>
   <td style="text-align:right;"> 427.327739 </td>
   <td style="text-align:right;"> 11210.576 </td>
   <td style="text-align:right;"> 21781.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15911.30986 </td>
   <td style="text-align:right;"> 486.918572 </td>
   <td style="text-align:right;"> 11761.199 </td>
   <td style="text-align:right;"> 21775.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29136.69441 </td>
   <td style="text-align:right;"> 696.597967 </td>
   <td style="text-align:right;"> 10269.733 </td>
   <td style="text-align:right;"> 22111.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23916.26107 </td>
   <td style="text-align:right;"> 624.001336 </td>
   <td style="text-align:right;"> 9592.529 </td>
   <td style="text-align:right;"> 22299.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42489.69565 </td>
   <td style="text-align:right;"> 901.087250 </td>
   <td style="text-align:right;"> 9418.176 </td>
   <td style="text-align:right;"> 22467.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40371.53902 </td>
   <td style="text-align:right;"> 869.964876 </td>
   <td style="text-align:right;"> 9248.444 </td>
   <td style="text-align:right;"> 22460.84 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36363.73419 </td>
   <td style="text-align:right;"> 807.646224 </td>
   <td style="text-align:right;"> 10789.412 </td>
   <td style="text-align:right;"> 21935.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18528.81222 </td>
   <td style="text-align:right;"> 525.746210 </td>
   <td style="text-align:right;"> 10255.391 </td>
   <td style="text-align:right;"> 21689.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20803.79565 </td>
   <td style="text-align:right;"> 561.602656 </td>
   <td style="text-align:right;"> 10087.428 </td>
   <td style="text-align:right;"> 21581.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33087.36856 </td>
   <td style="text-align:right;"> 780.462240 </td>
   <td style="text-align:right;"> 8648.368 </td>
   <td style="text-align:right;"> 21231.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46311.06665 </td>
   <td style="text-align:right;"> 946.038312 </td>
   <td style="text-align:right;"> 9126.705 </td>
   <td style="text-align:right;"> 20905.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28443.77881 </td>
   <td style="text-align:right;"> 693.758749 </td>
   <td style="text-align:right;"> 10997.446 </td>
   <td style="text-align:right;"> 21138.24 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27581.76450 </td>
   <td style="text-align:right;"> 670.983805 </td>
   <td style="text-align:right;"> 10197.195 </td>
   <td style="text-align:right;"> 21348.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12898.08783 </td>
   <td style="text-align:right;"> 444.059176 </td>
   <td style="text-align:right;"> 10997.629 </td>
   <td style="text-align:right;"> 21324.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23381.37138 </td>
   <td style="text-align:right;"> 594.475543 </td>
   <td style="text-align:right;"> 12576.669 </td>
   <td style="text-align:right;"> 21306.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3652.09840 </td>
   <td style="text-align:right;"> 196.931946 </td>
   <td style="text-align:right;"> 12744.097 </td>
   <td style="text-align:right;"> 21522.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34959.28444 </td>
   <td style="text-align:right;"> 795.318382 </td>
   <td style="text-align:right;"> 11004.425 </td>
   <td style="text-align:right;"> 21956.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19243.67645 </td>
   <td style="text-align:right;"> 549.741062 </td>
   <td style="text-align:right;"> 10850.284 </td>
   <td style="text-align:right;"> 21426.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12343.15160 </td>
   <td style="text-align:right;"> 442.606131 </td>
   <td style="text-align:right;"> 12230.399 </td>
   <td style="text-align:right;"> 21512.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38972.54203 </td>
   <td style="text-align:right;"> 846.500621 </td>
   <td style="text-align:right;"> 8964.882 </td>
   <td style="text-align:right;"> 21687.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -49617.15973 </td>
   <td style="text-align:right;"> 1011.036016 </td>
   <td style="text-align:right;"> 7833.288 </td>
   <td style="text-align:right;"> 20999.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -53740.05565 </td>
   <td style="text-align:right;"> 1075.738765 </td>
   <td style="text-align:right;"> 8443.268 </td>
   <td style="text-align:right;"> 21149.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32302.34401 </td>
   <td style="text-align:right;"> 764.792179 </td>
   <td style="text-align:right;"> 8629.213 </td>
   <td style="text-align:right;"> 20990.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33954.22249 </td>
   <td style="text-align:right;"> 782.823808 </td>
   <td style="text-align:right;"> 9204.500 </td>
   <td style="text-align:right;"> 20930.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36881.73352 </td>
   <td style="text-align:right;"> 822.685437 </td>
   <td style="text-align:right;"> 10015.970 </td>
   <td style="text-align:right;"> 21235.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39291.41084 </td>
   <td style="text-align:right;"> 855.924250 </td>
   <td style="text-align:right;"> 10559.368 </td>
   <td style="text-align:right;"> 21373.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8347.90402 </td>
   <td style="text-align:right;"> 392.396080 </td>
   <td style="text-align:right;"> 10751.232 </td>
   <td style="text-align:right;"> 21136.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16043.95323 </td>
   <td style="text-align:right;"> 516.208888 </td>
   <td style="text-align:right;"> 10266.137 </td>
   <td style="text-align:right;"> 20898.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16346.75993 </td>
   <td style="text-align:right;"> 511.644915 </td>
   <td style="text-align:right;"> 10451.011 </td>
   <td style="text-align:right;"> 20912.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30858.19559 </td>
   <td style="text-align:right;"> 729.353220 </td>
   <td style="text-align:right;"> 7974.557 </td>
   <td style="text-align:right;"> 21760.05 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32937.75646 </td>
   <td style="text-align:right;"> 756.520747 </td>
   <td style="text-align:right;"> 10398.271 </td>
   <td style="text-align:right;"> 21613.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32937.75646 </td>
   <td style="text-align:right;"> 756.520747 </td>
   <td style="text-align:right;"> 10398.271 </td>
   <td style="text-align:right;"> 21613.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34418.48411 </td>
   <td style="text-align:right;"> 786.172007 </td>
   <td style="text-align:right;"> 9982.576 </td>
   <td style="text-align:right;"> 21593.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26530.66732 </td>
   <td style="text-align:right;"> 642.192708 </td>
   <td style="text-align:right;"> 12106.027 </td>
   <td style="text-align:right;"> 21188.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25956.92921 </td>
   <td style="text-align:right;"> 639.023573 </td>
   <td style="text-align:right;"> 9253.262 </td>
   <td style="text-align:right;"> 22208.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17650.85859 </td>
   <td style="text-align:right;"> 529.069307 </td>
   <td style="text-align:right;"> 11510.960 </td>
   <td style="text-align:right;"> 20640.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32003.89212 </td>
   <td style="text-align:right;"> 735.748232 </td>
   <td style="text-align:right;"> 12074.770 </td>
   <td style="text-align:right;"> 20922.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29654.07606 </td>
   <td style="text-align:right;"> 708.690018 </td>
   <td style="text-align:right;"> 10002.575 </td>
   <td style="text-align:right;"> 20832.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14478.54808 </td>
   <td style="text-align:right;"> 469.992710 </td>
   <td style="text-align:right;"> 10887.126 </td>
   <td style="text-align:right;"> 20483.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28354.48991 </td>
   <td style="text-align:right;"> 687.832646 </td>
   <td style="text-align:right;"> 9495.975 </td>
   <td style="text-align:right;"> 21922.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22203.26115 </td>
   <td style="text-align:right;"> 602.309609 </td>
   <td style="text-align:right;"> 11057.312 </td>
   <td style="text-align:right;"> 21292.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27389.38333 </td>
   <td style="text-align:right;"> 669.844723 </td>
   <td style="text-align:right;"> 10898.803 </td>
   <td style="text-align:right;"> 20994.43 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32221.46124 </td>
   <td style="text-align:right;"> 730.061161 </td>
   <td style="text-align:right;"> 11152.654 </td>
   <td style="text-align:right;"> 21575.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -1234.20715 </td>
   <td style="text-align:right;"> 268.109785 </td>
   <td style="text-align:right;"> 10887.607 </td>
   <td style="text-align:right;"> 21985.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7891.73237 </td>
   <td style="text-align:right;"> 368.586014 </td>
   <td style="text-align:right;"> 10904.756 </td>
   <td style="text-align:right;"> 21810.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16198.31918 </td>
   <td style="text-align:right;"> 474.235279 </td>
   <td style="text-align:right;"> 14048.659 </td>
   <td style="text-align:right;"> 21385.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29794.29382 </td>
   <td style="text-align:right;"> 726.353646 </td>
   <td style="text-align:right;"> 8107.079 </td>
   <td style="text-align:right;"> 20434.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -50736.04301 </td>
   <td style="text-align:right;"> 1024.868130 </td>
   <td style="text-align:right;"> 9315.425 </td>
   <td style="text-align:right;"> 21849.84 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27291.63631 </td>
   <td style="text-align:right;"> 668.877918 </td>
   <td style="text-align:right;"> 8766.094 </td>
   <td style="text-align:right;"> 21598.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30758.21471 </td>
   <td style="text-align:right;"> 715.705378 </td>
   <td style="text-align:right;"> 9711.186 </td>
   <td style="text-align:right;"> 21443.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24589.30751 </td>
   <td style="text-align:right;"> 628.546556 </td>
   <td style="text-align:right;"> 8695.228 </td>
   <td style="text-align:right;"> 21519.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17054.49312 </td>
   <td style="text-align:right;"> 512.383179 </td>
   <td style="text-align:right;"> 11231.838 </td>
   <td style="text-align:right;"> 21242.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30154.82180 </td>
   <td style="text-align:right;"> 700.528321 </td>
   <td style="text-align:right;"> 11351.300 </td>
   <td style="text-align:right;"> 21357.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22450.58513 </td>
   <td style="text-align:right;"> 598.723524 </td>
   <td style="text-align:right;"> 11488.642 </td>
   <td style="text-align:right;"> 21386.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24951.32293 </td>
   <td style="text-align:right;"> 626.431848 </td>
   <td style="text-align:right;"> 11621.236 </td>
   <td style="text-align:right;"> 21948.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46720.20983 </td>
   <td style="text-align:right;"> 967.485777 </td>
   <td style="text-align:right;"> 9183.354 </td>
   <td style="text-align:right;"> 21515.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26740.98347 </td>
   <td style="text-align:right;"> 659.762859 </td>
   <td style="text-align:right;"> 9405.183 </td>
   <td style="text-align:right;"> 21387.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19207.41673 </td>
   <td style="text-align:right;"> 547.161964 </td>
   <td style="text-align:right;"> 12274.088 </td>
   <td style="text-align:right;"> 21075.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20080.16970 </td>
   <td style="text-align:right;"> 579.275109 </td>
   <td style="text-align:right;"> 10927.671 </td>
   <td style="text-align:right;"> 21206.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14777.17825 </td>
   <td style="text-align:right;"> 475.646577 </td>
   <td style="text-align:right;"> 11647.011 </td>
   <td style="text-align:right;"> 21485.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32981.07258 </td>
   <td style="text-align:right;"> 744.623157 </td>
   <td style="text-align:right;"> 12040.134 </td>
   <td style="text-align:right;"> 21365.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41055.71666 </td>
   <td style="text-align:right;"> 882.788844 </td>
   <td style="text-align:right;"> 9086.850 </td>
   <td style="text-align:right;"> 21192.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5266.31490 </td>
   <td style="text-align:right;"> 329.543013 </td>
   <td style="text-align:right;"> 11314.687 </td>
   <td style="text-align:right;"> 21630.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20942.09859 </td>
   <td style="text-align:right;"> 583.247767 </td>
   <td style="text-align:right;"> 9540.093 </td>
   <td style="text-align:right;"> 20992.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24735.55108 </td>
   <td style="text-align:right;"> 637.679719 </td>
   <td style="text-align:right;"> 9518.007 </td>
   <td style="text-align:right;"> 21318.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27527.25125 </td>
   <td style="text-align:right;"> 677.374254 </td>
   <td style="text-align:right;"> 8826.654 </td>
   <td style="text-align:right;"> 21787.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11226.52661 </td>
   <td style="text-align:right;"> 426.335436 </td>
   <td style="text-align:right;"> 11011.040 </td>
   <td style="text-align:right;"> 20998.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29572.89022 </td>
   <td style="text-align:right;"> 709.562349 </td>
   <td style="text-align:right;"> 10271.349 </td>
   <td style="text-align:right;"> 21726.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35390.03732 </td>
   <td style="text-align:right;"> 794.615519 </td>
   <td style="text-align:right;"> 9557.112 </td>
   <td style="text-align:right;"> 21226.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32952.85176 </td>
   <td style="text-align:right;"> 741.662223 </td>
   <td style="text-align:right;"> 10060.258 </td>
   <td style="text-align:right;"> 21600.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23749.69743 </td>
   <td style="text-align:right;"> 629.135915 </td>
   <td style="text-align:right;"> 9793.526 </td>
   <td style="text-align:right;"> 21158.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17725.65186 </td>
   <td style="text-align:right;"> 541.194498 </td>
   <td style="text-align:right;"> 9449.856 </td>
   <td style="text-align:right;"> 21392.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26504.87565 </td>
   <td style="text-align:right;"> 650.144339 </td>
   <td style="text-align:right;"> 12106.266 </td>
   <td style="text-align:right;"> 20937.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17490.76543 </td>
   <td style="text-align:right;"> 514.291825 </td>
   <td style="text-align:right;"> 10200.874 </td>
   <td style="text-align:right;"> 20901.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30457.68974 </td>
   <td style="text-align:right;"> 707.750547 </td>
   <td style="text-align:right;"> 10383.229 </td>
   <td style="text-align:right;"> 21153.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18840.35519 </td>
   <td style="text-align:right;"> 521.702735 </td>
   <td style="text-align:right;"> 11279.175 </td>
   <td style="text-align:right;"> 20797.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40735.37855 </td>
   <td style="text-align:right;"> 888.259204 </td>
   <td style="text-align:right;"> 9735.023 </td>
   <td style="text-align:right;"> 21897.94 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16442.23906 </td>
   <td style="text-align:right;"> 492.788336 </td>
   <td style="text-align:right;"> 10853.864 </td>
   <td style="text-align:right;"> 20950.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26145.65539 </td>
   <td style="text-align:right;"> 630.643293 </td>
   <td style="text-align:right;"> 12491.138 </td>
   <td style="text-align:right;"> 21255.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2092.04187 </td>
   <td style="text-align:right;"> 221.315580 </td>
   <td style="text-align:right;"> 12457.873 </td>
   <td style="text-align:right;"> 21798.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29710.11947 </td>
   <td style="text-align:right;"> 698.525671 </td>
   <td style="text-align:right;"> 11742.450 </td>
   <td style="text-align:right;"> 22132.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20549.97274 </td>
   <td style="text-align:right;"> 563.070324 </td>
   <td style="text-align:right;"> 10821.728 </td>
   <td style="text-align:right;"> 21406.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23475.18902 </td>
   <td style="text-align:right;"> 605.549160 </td>
   <td style="text-align:right;"> 11483.727 </td>
   <td style="text-align:right;"> 21441.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42410.89229 </td>
   <td style="text-align:right;"> 910.038300 </td>
   <td style="text-align:right;"> 9350.040 </td>
   <td style="text-align:right;"> 21961.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5990.96917 </td>
   <td style="text-align:right;"> 342.499313 </td>
   <td style="text-align:right;"> 11171.857 </td>
   <td style="text-align:right;"> 21140.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23290.76562 </td>
   <td style="text-align:right;"> 586.318414 </td>
   <td style="text-align:right;"> 13050.871 </td>
   <td style="text-align:right;"> 21973.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20243.80010 </td>
   <td style="text-align:right;"> 562.130406 </td>
   <td style="text-align:right;"> 9436.339 </td>
   <td style="text-align:right;"> 21860.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -53798.06048 </td>
   <td style="text-align:right;"> 1075.582694 </td>
   <td style="text-align:right;"> 9032.725 </td>
   <td style="text-align:right;"> 21638.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -57921.76362 </td>
   <td style="text-align:right;"> 1132.105491 </td>
   <td style="text-align:right;"> 9570.362 </td>
   <td style="text-align:right;"> 21664.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21498.20530 </td>
   <td style="text-align:right;"> 561.958608 </td>
   <td style="text-align:right;"> 13649.070 </td>
   <td style="text-align:right;"> 21030.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46610.25804 </td>
   <td style="text-align:right;"> 961.093766 </td>
   <td style="text-align:right;"> 10625.640 </td>
   <td style="text-align:right;"> 21550.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27480.95695 </td>
   <td style="text-align:right;"> 693.894093 </td>
   <td style="text-align:right;"> 7743.589 </td>
   <td style="text-align:right;"> 21426.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20564.03144 </td>
   <td style="text-align:right;"> 577.201403 </td>
   <td style="text-align:right;"> 11583.014 </td>
   <td style="text-align:right;"> 21452.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27980.73563 </td>
   <td style="text-align:right;"> 666.478169 </td>
   <td style="text-align:right;"> 9930.518 </td>
   <td style="text-align:right;"> 21309.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43835.70625 </td>
   <td style="text-align:right;"> 940.977186 </td>
   <td style="text-align:right;"> 9335.451 </td>
   <td style="text-align:right;"> 21426.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26061.77881 </td>
   <td style="text-align:right;"> 665.423086 </td>
   <td style="text-align:right;"> 9469.990 </td>
   <td style="text-align:right;"> 21636.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30847.73863 </td>
   <td style="text-align:right;"> 711.380935 </td>
   <td style="text-align:right;"> 10519.145 </td>
   <td style="text-align:right;"> 21096.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19150.43622 </td>
   <td style="text-align:right;"> 556.169166 </td>
   <td style="text-align:right;"> 11370.243 </td>
   <td style="text-align:right;"> 21800.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34564.31969 </td>
   <td style="text-align:right;"> 785.056614 </td>
   <td style="text-align:right;"> 9494.037 </td>
   <td style="text-align:right;"> 21518.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22587.25247 </td>
   <td style="text-align:right;"> 599.477951 </td>
   <td style="text-align:right;"> 9559.584 </td>
   <td style="text-align:right;"> 21386.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24163.28739 </td>
   <td style="text-align:right;"> 621.441328 </td>
   <td style="text-align:right;"> 9841.046 </td>
   <td style="text-align:right;"> 21678.43 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30500.27642 </td>
   <td style="text-align:right;"> 724.915274 </td>
   <td style="text-align:right;"> 9993.364 </td>
   <td style="text-align:right;"> 21245.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38564.33385 </td>
   <td style="text-align:right;"> 846.994035 </td>
   <td style="text-align:right;"> 9070.569 </td>
   <td style="text-align:right;"> 20962.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20303.08023 </td>
   <td style="text-align:right;"> 544.815995 </td>
   <td style="text-align:right;"> 11304.076 </td>
   <td style="text-align:right;"> 21766.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24225.29854 </td>
   <td style="text-align:right;"> 606.452691 </td>
   <td style="text-align:right;"> 10520.850 </td>
   <td style="text-align:right;"> 21383.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18088.99791 </td>
   <td style="text-align:right;"> 514.078596 </td>
   <td style="text-align:right;"> 10397.736 </td>
   <td style="text-align:right;"> 21306.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14533.10766 </td>
   <td style="text-align:right;"> 484.498541 </td>
   <td style="text-align:right;"> 11561.882 </td>
   <td style="text-align:right;"> 21462.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13593.76492 </td>
   <td style="text-align:right;"> 467.677076 </td>
   <td style="text-align:right;"> 11902.320 </td>
   <td style="text-align:right;"> 21467.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46306.39882 </td>
   <td style="text-align:right;"> 943.084810 </td>
   <td style="text-align:right;"> 9733.092 </td>
   <td style="text-align:right;"> 21640.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -45340.52144 </td>
   <td style="text-align:right;"> 931.495354 </td>
   <td style="text-align:right;"> 9319.750 </td>
   <td style="text-align:right;"> 21590.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -4431.09049 </td>
   <td style="text-align:right;"> 326.144875 </td>
   <td style="text-align:right;"> 11201.285 </td>
   <td style="text-align:right;"> 21242.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11328.92673 </td>
   <td style="text-align:right;"> 430.715297 </td>
   <td style="text-align:right;"> 11214.832 </td>
   <td style="text-align:right;"> 21083.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12028.93812 </td>
   <td style="text-align:right;"> 420.442925 </td>
   <td style="text-align:right;"> 13681.275 </td>
   <td style="text-align:right;"> 21704.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -47693.09495 </td>
   <td style="text-align:right;"> 989.549974 </td>
   <td style="text-align:right;"> 8590.471 </td>
   <td style="text-align:right;"> 20891.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15416.43826 </td>
   <td style="text-align:right;"> 473.329349 </td>
   <td style="text-align:right;"> 11793.208 </td>
   <td style="text-align:right;"> 21340.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32780.49598 </td>
   <td style="text-align:right;"> 760.666573 </td>
   <td style="text-align:right;"> 10086.980 </td>
   <td style="text-align:right;"> 21836.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22288.01737 </td>
   <td style="text-align:right;"> 590.401037 </td>
   <td style="text-align:right;"> 10721.553 </td>
   <td style="text-align:right;"> 21515.24 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21448.20904 </td>
   <td style="text-align:right;"> 567.722556 </td>
   <td style="text-align:right;"> 11567.905 </td>
   <td style="text-align:right;"> 21704.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 704.30975 </td>
   <td style="text-align:right;"> 225.939318 </td>
   <td style="text-align:right;"> 13724.395 </td>
   <td style="text-align:right;"> 21841.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5404.66152 </td>
   <td style="text-align:right;"> 329.822760 </td>
   <td style="text-align:right;"> 13451.106 </td>
   <td style="text-align:right;"> 21458.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4349.78511 </td>
   <td style="text-align:right;"> 178.201000 </td>
   <td style="text-align:right;"> 12738.367 </td>
   <td style="text-align:right;"> 21918.73 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -1458.86843 </td>
   <td style="text-align:right;"> 267.557225 </td>
   <td style="text-align:right;"> 12173.063 </td>
   <td style="text-align:right;"> 21860.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25340.74724 </td>
   <td style="text-align:right;"> 656.429443 </td>
   <td style="text-align:right;"> 9359.238 </td>
   <td style="text-align:right;"> 20727.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13944.13859 </td>
   <td style="text-align:right;"> 465.601443 </td>
   <td style="text-align:right;"> 12436.405 </td>
   <td style="text-align:right;"> 21091.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29241.03265 </td>
   <td style="text-align:right;"> 705.558832 </td>
   <td style="text-align:right;"> 10415.652 </td>
   <td style="text-align:right;"> 20912.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38266.03939 </td>
   <td style="text-align:right;"> 826.635097 </td>
   <td style="text-align:right;"> 9139.037 </td>
   <td style="text-align:right;"> 21178.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19644.01432 </td>
   <td style="text-align:right;"> 551.440239 </td>
   <td style="text-align:right;"> 11406.879 </td>
   <td style="text-align:right;"> 21138.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30166.60008 </td>
   <td style="text-align:right;"> 720.833448 </td>
   <td style="text-align:right;"> 9985.198 </td>
   <td style="text-align:right;"> 21178.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14184.96173 </td>
   <td style="text-align:right;"> 475.594381 </td>
   <td style="text-align:right;"> 11284.293 </td>
   <td style="text-align:right;"> 21117.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36063.02964 </td>
   <td style="text-align:right;"> 811.348282 </td>
   <td style="text-align:right;"> 9397.088 </td>
   <td style="text-align:right;"> 21579.05 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23911.81350 </td>
   <td style="text-align:right;"> 630.468913 </td>
   <td style="text-align:right;"> 9396.865 </td>
   <td style="text-align:right;"> 21658.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10062.36644 </td>
   <td style="text-align:right;"> 398.880204 </td>
   <td style="text-align:right;"> 11813.796 </td>
   <td style="text-align:right;"> 20917.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9864.99674 </td>
   <td style="text-align:right;"> 404.038159 </td>
   <td style="text-align:right;"> 12679.320 </td>
   <td style="text-align:right;"> 21275.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7412.25544 </td>
   <td style="text-align:right;"> 358.588757 </td>
   <td style="text-align:right;"> 13136.491 </td>
   <td style="text-align:right;"> 21450.43 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10266.69568 </td>
   <td style="text-align:right;"> 396.262928 </td>
   <td style="text-align:right;"> 12517.688 </td>
   <td style="text-align:right;"> 21004.84 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23347.01959 </td>
   <td style="text-align:right;"> 604.776801 </td>
   <td style="text-align:right;"> 11127.838 </td>
   <td style="text-align:right;"> 20772.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25885.97300 </td>
   <td style="text-align:right;"> 649.785234 </td>
   <td style="text-align:right;"> 9458.478 </td>
   <td style="text-align:right;"> 21643.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23831.84665 </td>
   <td style="text-align:right;"> 630.464807 </td>
   <td style="text-align:right;"> 9654.122 </td>
   <td style="text-align:right;"> 21674.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36347.15526 </td>
   <td style="text-align:right;"> 803.244113 </td>
   <td style="text-align:right;"> 10634.372 </td>
   <td style="text-align:right;"> 22309.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33256.22591 </td>
   <td style="text-align:right;"> 766.387593 </td>
   <td style="text-align:right;"> 10722.247 </td>
   <td style="text-align:right;"> 22290.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18942.23044 </td>
   <td style="text-align:right;"> 545.549870 </td>
   <td style="text-align:right;"> 10444.604 </td>
   <td style="text-align:right;"> 21274.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19386.77179 </td>
   <td style="text-align:right;"> 546.242412 </td>
   <td style="text-align:right;"> 11337.506 </td>
   <td style="text-align:right;"> 21227.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11212.84404 </td>
   <td style="text-align:right;"> 414.938933 </td>
   <td style="text-align:right;"> 12651.439 </td>
   <td style="text-align:right;"> 21095.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25460.36449 </td>
   <td style="text-align:right;"> 652.017799 </td>
   <td style="text-align:right;"> 9679.168 </td>
   <td style="text-align:right;"> 20194.94 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36123.86738 </td>
   <td style="text-align:right;"> 789.416707 </td>
   <td style="text-align:right;"> 11263.971 </td>
   <td style="text-align:right;"> 21565.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8472.38530 </td>
   <td style="text-align:right;"> 377.621088 </td>
   <td style="text-align:right;"> 11683.741 </td>
   <td style="text-align:right;"> 21567.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9313.27085 </td>
   <td style="text-align:right;"> 382.314272 </td>
   <td style="text-align:right;"> 13328.096 </td>
   <td style="text-align:right;"> 21341.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21680.98066 </td>
   <td style="text-align:right;"> 585.605805 </td>
   <td style="text-align:right;"> 10068.882 </td>
   <td style="text-align:right;"> 21731.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30320.09402 </td>
   <td style="text-align:right;"> 691.101913 </td>
   <td style="text-align:right;"> 11270.242 </td>
   <td style="text-align:right;"> 22005.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36327.04460 </td>
   <td style="text-align:right;"> 781.146191 </td>
   <td style="text-align:right;"> 11267.281 </td>
   <td style="text-align:right;"> 22057.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38107.78300 </td>
   <td style="text-align:right;"> 807.652180 </td>
   <td style="text-align:right;"> 11198.612 </td>
   <td style="text-align:right;"> 22074.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42173.02633 </td>
   <td style="text-align:right;"> 912.730906 </td>
   <td style="text-align:right;"> 9193.225 </td>
   <td style="text-align:right;"> 20860.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6336.70972 </td>
   <td style="text-align:right;"> 348.435773 </td>
   <td style="text-align:right;"> 12535.739 </td>
   <td style="text-align:right;"> 20927.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35343.83774 </td>
   <td style="text-align:right;"> 788.730967 </td>
   <td style="text-align:right;"> 9724.290 </td>
   <td style="text-align:right;"> 21472.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29508.02076 </td>
   <td style="text-align:right;"> 720.351608 </td>
   <td style="text-align:right;"> 9826.206 </td>
   <td style="text-align:right;"> 21538.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38678.09898 </td>
   <td style="text-align:right;"> 869.026131 </td>
   <td style="text-align:right;"> 9068.011 </td>
   <td style="text-align:right;"> 21827.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -47506.12388 </td>
   <td style="text-align:right;"> 996.559823 </td>
   <td style="text-align:right;"> 6433.956 </td>
   <td style="text-align:right;"> 21571.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38117.75918 </td>
   <td style="text-align:right;"> 818.495868 </td>
   <td style="text-align:right;"> 10654.428 </td>
   <td style="text-align:right;"> 21816.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28483.89935 </td>
   <td style="text-align:right;"> 694.657428 </td>
   <td style="text-align:right;"> 8906.249 </td>
   <td style="text-align:right;"> 22010.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38260.29749 </td>
   <td style="text-align:right;"> 848.599225 </td>
   <td style="text-align:right;"> 7879.444 </td>
   <td style="text-align:right;"> 22155.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42162.75060 </td>
   <td style="text-align:right;"> 893.530510 </td>
   <td style="text-align:right;"> 9845.131 </td>
   <td style="text-align:right;"> 21311.05 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10738.57177 </td>
   <td style="text-align:right;"> 412.725861 </td>
   <td style="text-align:right;"> 11473.324 </td>
   <td style="text-align:right;"> 21640.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10738.65882 </td>
   <td style="text-align:right;"> 404.562863 </td>
   <td style="text-align:right;"> 13579.740 </td>
   <td style="text-align:right;"> 21388.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16012.45912 </td>
   <td style="text-align:right;"> 505.221765 </td>
   <td style="text-align:right;"> 12582.851 </td>
   <td style="text-align:right;"> 21269.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32083.82305 </td>
   <td style="text-align:right;"> 739.109971 </td>
   <td style="text-align:right;"> 9041.492 </td>
   <td style="text-align:right;"> 20843.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33070.49558 </td>
   <td style="text-align:right;"> 777.530003 </td>
   <td style="text-align:right;"> 9834.125 </td>
   <td style="text-align:right;"> 20444.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23456.78506 </td>
   <td style="text-align:right;"> 611.307297 </td>
   <td style="text-align:right;"> 9648.460 </td>
   <td style="text-align:right;"> 21697.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -62834.54176 </td>
   <td style="text-align:right;"> 1224.435611 </td>
   <td style="text-align:right;"> 7276.296 </td>
   <td style="text-align:right;"> 21263.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23313.22457 </td>
   <td style="text-align:right;"> 626.245009 </td>
   <td style="text-align:right;"> 8985.276 </td>
   <td style="text-align:right;"> 21749.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16547.24421 </td>
   <td style="text-align:right;"> 495.744847 </td>
   <td style="text-align:right;"> 10808.661 </td>
   <td style="text-align:right;"> 21060.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14224.64837 </td>
   <td style="text-align:right;"> 484.663294 </td>
   <td style="text-align:right;"> 11870.250 </td>
   <td style="text-align:right;"> 21704.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37729.95946 </td>
   <td style="text-align:right;"> 814.095235 </td>
   <td style="text-align:right;"> 9257.996 </td>
   <td style="text-align:right;"> 21153.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24635.52545 </td>
   <td style="text-align:right;"> 635.583313 </td>
   <td style="text-align:right;"> 9784.128 </td>
   <td style="text-align:right;"> 21449.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20533.79058 </td>
   <td style="text-align:right;"> 575.783633 </td>
   <td style="text-align:right;"> 9213.905 </td>
   <td style="text-align:right;"> 21092.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24073.26370 </td>
   <td style="text-align:right;"> 623.027428 </td>
   <td style="text-align:right;"> 10771.905 </td>
   <td style="text-align:right;"> 22314.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32102.22693 </td>
   <td style="text-align:right;"> 740.563359 </td>
   <td style="text-align:right;"> 10702.177 </td>
   <td style="text-align:right;"> 20893.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19360.19867 </td>
   <td style="text-align:right;"> 544.952700 </td>
   <td style="text-align:right;"> 11108.021 </td>
   <td style="text-align:right;"> 21337.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17895.10213 </td>
   <td style="text-align:right;"> 523.538084 </td>
   <td style="text-align:right;"> 11171.097 </td>
   <td style="text-align:right;"> 21081.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24619.26222 </td>
   <td style="text-align:right;"> 614.280617 </td>
   <td style="text-align:right;"> 11371.676 </td>
   <td style="text-align:right;"> 21108.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28252.16667 </td>
   <td style="text-align:right;"> 688.417971 </td>
   <td style="text-align:right;"> 10093.506 </td>
   <td style="text-align:right;"> 21855.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19202.24598 </td>
   <td style="text-align:right;"> 539.408582 </td>
   <td style="text-align:right;"> 11595.419 </td>
   <td style="text-align:right;"> 20850.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16011.82925 </td>
   <td style="text-align:right;"> 506.263099 </td>
   <td style="text-align:right;"> 10832.355 </td>
   <td style="text-align:right;"> 21007.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37032.66556 </td>
   <td style="text-align:right;"> 815.271757 </td>
   <td style="text-align:right;"> 10181.664 </td>
   <td style="text-align:right;"> 20738.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34289.32899 </td>
   <td style="text-align:right;"> 782.201433 </td>
   <td style="text-align:right;"> 9064.401 </td>
   <td style="text-align:right;"> 21391.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40234.50958 </td>
   <td style="text-align:right;"> 879.566069 </td>
   <td style="text-align:right;"> 8994.410 </td>
   <td style="text-align:right;"> 21689.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22318.32472 </td>
   <td style="text-align:right;"> 602.176850 </td>
   <td style="text-align:right;"> 8329.606 </td>
   <td style="text-align:right;"> 22109.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -61938.61715 </td>
   <td style="text-align:right;"> 1188.354479 </td>
   <td style="text-align:right;"> 9297.851 </td>
   <td style="text-align:right;"> 21854.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -52157.57429 </td>
   <td style="text-align:right;"> 1047.137215 </td>
   <td style="text-align:right;"> 8353.335 </td>
   <td style="text-align:right;"> 21774.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25540.97908 </td>
   <td style="text-align:right;"> 653.200567 </td>
   <td style="text-align:right;"> 9666.533 </td>
   <td style="text-align:right;"> 21375.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37886.90324 </td>
   <td style="text-align:right;"> 842.242883 </td>
   <td style="text-align:right;"> 8888.016 </td>
   <td style="text-align:right;"> 21125.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41444.80098 </td>
   <td style="text-align:right;"> 878.712017 </td>
   <td style="text-align:right;"> 9032.438 </td>
   <td style="text-align:right;"> 21435.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29246.20361 </td>
   <td style="text-align:right;"> 699.794149 </td>
   <td style="text-align:right;"> 11148.226 </td>
   <td style="text-align:right;"> 21083.73 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28933.21856 </td>
   <td style="text-align:right;"> 690.723049 </td>
   <td style="text-align:right;"> 10818.337 </td>
   <td style="text-align:right;"> 21385.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34897.56335 </td>
   <td style="text-align:right;"> 781.594176 </td>
   <td style="text-align:right;"> 10663.839 </td>
   <td style="text-align:right;"> 21538.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38834.07813 </td>
   <td style="text-align:right;"> 836.463051 </td>
   <td style="text-align:right;"> 11203.203 </td>
   <td style="text-align:right;"> 21300.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31777.04453 </td>
   <td style="text-align:right;"> 737.673440 </td>
   <td style="text-align:right;"> 10674.837 </td>
   <td style="text-align:right;"> 21547.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29877.77707 </td>
   <td style="text-align:right;"> 710.971455 </td>
   <td style="text-align:right;"> 9028.546 </td>
   <td style="text-align:right;"> 21578.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33273.09642 </td>
   <td style="text-align:right;"> 747.339367 </td>
   <td style="text-align:right;"> 10928.735 </td>
   <td style="text-align:right;"> 21309.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29020.06548 </td>
   <td style="text-align:right;"> 701.591012 </td>
   <td style="text-align:right;"> 9020.667 </td>
   <td style="text-align:right;"> 21595.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19398.47538 </td>
   <td style="text-align:right;"> 546.907822 </td>
   <td style="text-align:right;"> 9714.338 </td>
   <td style="text-align:right;"> 21531.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30730.49038 </td>
   <td style="text-align:right;"> 721.235268 </td>
   <td style="text-align:right;"> 10374.484 </td>
   <td style="text-align:right;"> 21730.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29781.47937 </td>
   <td style="text-align:right;"> 712.927923 </td>
   <td style="text-align:right;"> 9784.705 </td>
   <td style="text-align:right;"> 21721.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23923.08526 </td>
   <td style="text-align:right;"> 622.358609 </td>
   <td style="text-align:right;"> 10897.572 </td>
   <td style="text-align:right;"> 21094.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21511.35410 </td>
   <td style="text-align:right;"> 570.804913 </td>
   <td style="text-align:right;"> 11404.862 </td>
   <td style="text-align:right;"> 21717.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22479.61165 </td>
   <td style="text-align:right;"> 614.642557 </td>
   <td style="text-align:right;"> 10376.107 </td>
   <td style="text-align:right;"> 21399.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30044.59290 </td>
   <td style="text-align:right;"> 718.335956 </td>
   <td style="text-align:right;"> 11387.539 </td>
   <td style="text-align:right;"> 21631.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20676.77706 </td>
   <td style="text-align:right;"> 591.870557 </td>
   <td style="text-align:right;"> 9230.226 </td>
   <td style="text-align:right;"> 21364.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36695.33936 </td>
   <td style="text-align:right;"> 815.504477 </td>
   <td style="text-align:right;"> 10683.497 </td>
   <td style="text-align:right;"> 21485.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25849.10337 </td>
   <td style="text-align:right;"> 642.599644 </td>
   <td style="text-align:right;"> 11845.144 </td>
   <td style="text-align:right;"> 21356.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19901.99209 </td>
   <td style="text-align:right;"> 542.154925 </td>
   <td style="text-align:right;"> 11570.829 </td>
   <td style="text-align:right;"> 21563.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31367.61560 </td>
   <td style="text-align:right;"> 719.366727 </td>
   <td style="text-align:right;"> 10363.164 </td>
   <td style="text-align:right;"> 21149.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10598.40970 </td>
   <td style="text-align:right;"> 415.982076 </td>
   <td style="text-align:right;"> 10566.406 </td>
   <td style="text-align:right;"> 21423.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29415.90796 </td>
   <td style="text-align:right;"> 698.170903 </td>
   <td style="text-align:right;"> 12168.040 </td>
   <td style="text-align:right;"> 21927.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15893.15425 </td>
   <td style="text-align:right;"> 509.358732 </td>
   <td style="text-align:right;"> 10024.547 </td>
   <td style="text-align:right;"> 21072.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29626.52725 </td>
   <td style="text-align:right;"> 692.566006 </td>
   <td style="text-align:right;"> 12005.655 </td>
   <td style="text-align:right;"> 21317.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26846.36125 </td>
   <td style="text-align:right;"> 650.144033 </td>
   <td style="text-align:right;"> 12194.568 </td>
   <td style="text-align:right;"> 21526.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -51580.16294 </td>
   <td style="text-align:right;"> 1034.100694 </td>
   <td style="text-align:right;"> 10162.233 </td>
   <td style="text-align:right;"> 21368.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -53528.25474 </td>
   <td style="text-align:right;"> 1061.555424 </td>
   <td style="text-align:right;"> 9764.125 </td>
   <td style="text-align:right;"> 21427.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31075.43335 </td>
   <td style="text-align:right;"> 729.565562 </td>
   <td style="text-align:right;"> 8534.370 </td>
   <td style="text-align:right;"> 21831.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -52381.19846 </td>
   <td style="text-align:right;"> 1055.934618 </td>
   <td style="text-align:right;"> 8817.565 </td>
   <td style="text-align:right;"> 21799.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39951.79823 </td>
   <td style="text-align:right;"> 865.345649 </td>
   <td style="text-align:right;"> 10143.732 </td>
   <td style="text-align:right;"> 21842.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15876.91810 </td>
   <td style="text-align:right;"> 505.450417 </td>
   <td style="text-align:right;"> 10782.384 </td>
   <td style="text-align:right;"> 21376.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17189.96640 </td>
   <td style="text-align:right;"> 502.028963 </td>
   <td style="text-align:right;"> 11769.556 </td>
   <td style="text-align:right;"> 21303.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37872.83477 </td>
   <td style="text-align:right;"> 828.643913 </td>
   <td style="text-align:right;"> 10664.722 </td>
   <td style="text-align:right;"> 21394.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40782.92459 </td>
   <td style="text-align:right;"> 890.115283 </td>
   <td style="text-align:right;"> 8642.931 </td>
   <td style="text-align:right;"> 21502.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43490.78007 </td>
   <td style="text-align:right;"> 933.711465 </td>
   <td style="text-align:right;"> 9025.770 </td>
   <td style="text-align:right;"> 21565.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -52072.31346 </td>
   <td style="text-align:right;"> 1068.791765 </td>
   <td style="text-align:right;"> 6549.781 </td>
   <td style="text-align:right;"> 21313.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6640.75861 </td>
   <td style="text-align:right;"> 136.199883 </td>
   <td style="text-align:right;"> 14030.510 </td>
   <td style="text-align:right;"> 21225.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31179.99033 </td>
   <td style="text-align:right;"> 732.001277 </td>
   <td style="text-align:right;"> 10666.756 </td>
   <td style="text-align:right;"> 21265.43 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13603.14303 </td>
   <td style="text-align:right;"> 450.410007 </td>
   <td style="text-align:right;"> 12760.087 </td>
   <td style="text-align:right;"> 21547.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25352.96429 </td>
   <td style="text-align:right;"> 632.790139 </td>
   <td style="text-align:right;"> 9809.276 </td>
   <td style="text-align:right;"> 20896.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26270.37625 </td>
   <td style="text-align:right;"> 637.747185 </td>
   <td style="text-align:right;"> 11283.874 </td>
   <td style="text-align:right;"> 21348.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25606.59172 </td>
   <td style="text-align:right;"> 639.611503 </td>
   <td style="text-align:right;"> 10013.730 </td>
   <td style="text-align:right;"> 21335.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37080.14029 </td>
   <td style="text-align:right;"> 812.590999 </td>
   <td style="text-align:right;"> 10036.428 </td>
   <td style="text-align:right;"> 21202.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -51772.33177 </td>
   <td style="text-align:right;"> 1049.847506 </td>
   <td style="text-align:right;"> 9235.350 </td>
   <td style="text-align:right;"> 21552.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -51622.71575 </td>
   <td style="text-align:right;"> 1055.240371 </td>
   <td style="text-align:right;"> 8307.167 </td>
   <td style="text-align:right;"> 21821.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -48429.71528 </td>
   <td style="text-align:right;"> 998.093365 </td>
   <td style="text-align:right;"> 9436.155 </td>
   <td style="text-align:right;"> 21729.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16060.06705 </td>
   <td style="text-align:right;"> 491.672980 </td>
   <td style="text-align:right;"> 10544.383 </td>
   <td style="text-align:right;"> 21588.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19553.28909 </td>
   <td style="text-align:right;"> 566.100892 </td>
   <td style="text-align:right;"> 10053.017 </td>
   <td style="text-align:right;"> 20957.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29819.90909 </td>
   <td style="text-align:right;"> 725.622621 </td>
   <td style="text-align:right;"> 9255.970 </td>
   <td style="text-align:right;"> 21504.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20649.16917 </td>
   <td style="text-align:right;"> 552.203510 </td>
   <td style="text-align:right;"> 11594.206 </td>
   <td style="text-align:right;"> 21279.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28934.66844 </td>
   <td style="text-align:right;"> 712.900014 </td>
   <td style="text-align:right;"> 9083.789 </td>
   <td style="text-align:right;"> 21519.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -45550.35722 </td>
   <td style="text-align:right;"> 949.299327 </td>
   <td style="text-align:right;"> 10319.118 </td>
   <td style="text-align:right;"> 21818.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22966.98886 </td>
   <td style="text-align:right;"> 617.309655 </td>
   <td style="text-align:right;"> 10145.845 </td>
   <td style="text-align:right;"> 21803.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24459.28529 </td>
   <td style="text-align:right;"> 627.996071 </td>
   <td style="text-align:right;"> 11521.790 </td>
   <td style="text-align:right;"> 21740.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15625.22416 </td>
   <td style="text-align:right;"> 481.050558 </td>
   <td style="text-align:right;"> 12089.317 </td>
   <td style="text-align:right;"> 21675.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32980.42221 </td>
   <td style="text-align:right;"> 757.311509 </td>
   <td style="text-align:right;"> 10196.432 </td>
   <td style="text-align:right;"> 21365.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23079.71840 </td>
   <td style="text-align:right;"> 600.669916 </td>
   <td style="text-align:right;"> 11706.893 </td>
   <td style="text-align:right;"> 21377.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8491.56227 </td>
   <td style="text-align:right;"> 398.853240 </td>
   <td style="text-align:right;"> 10226.862 </td>
   <td style="text-align:right;"> 20959.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37838.46711 </td>
   <td style="text-align:right;"> 837.762342 </td>
   <td style="text-align:right;"> 9792.268 </td>
   <td style="text-align:right;"> 21133.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31310.71950 </td>
   <td style="text-align:right;"> 734.384313 </td>
   <td style="text-align:right;"> 10583.637 </td>
   <td style="text-align:right;"> 21181.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25632.31694 </td>
   <td style="text-align:right;"> 646.094368 </td>
   <td style="text-align:right;"> 10627.331 </td>
   <td style="text-align:right;"> 21121.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22962.88884 </td>
   <td style="text-align:right;"> 604.911541 </td>
   <td style="text-align:right;"> 10485.497 </td>
   <td style="text-align:right;"> 21052.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16191.26698 </td>
   <td style="text-align:right;"> 494.511232 </td>
   <td style="text-align:right;"> 12518.159 </td>
   <td style="text-align:right;"> 20905.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34313.98926 </td>
   <td style="text-align:right;"> 782.819609 </td>
   <td style="text-align:right;"> 9575.773 </td>
   <td style="text-align:right;"> 22387.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37888.26538 </td>
   <td style="text-align:right;"> 833.060854 </td>
   <td style="text-align:right;"> 9972.429 </td>
   <td style="text-align:right;"> 22457.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30885.47720 </td>
   <td style="text-align:right;"> 719.305855 </td>
   <td style="text-align:right;"> 10852.707 </td>
   <td style="text-align:right;"> 20505.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35025.72724 </td>
   <td style="text-align:right;"> 784.150301 </td>
   <td style="text-align:right;"> 11106.665 </td>
   <td style="text-align:right;"> 20829.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20550.59019 </td>
   <td style="text-align:right;"> 582.792975 </td>
   <td style="text-align:right;"> 9693.327 </td>
   <td style="text-align:right;"> 21278.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33715.57895 </td>
   <td style="text-align:right;"> 773.532140 </td>
   <td style="text-align:right;"> 9273.130 </td>
   <td style="text-align:right;"> 21129.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37484.29386 </td>
   <td style="text-align:right;"> 822.200096 </td>
   <td style="text-align:right;"> 10570.494 </td>
   <td style="text-align:right;"> 20829.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30629.15719 </td>
   <td style="text-align:right;"> 726.886854 </td>
   <td style="text-align:right;"> 8698.149 </td>
   <td style="text-align:right;"> 20753.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -45315.87005 </td>
   <td style="text-align:right;"> 964.433032 </td>
   <td style="text-align:right;"> 7197.079 </td>
   <td style="text-align:right;"> 20856.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35977.11931 </td>
   <td style="text-align:right;"> 804.224987 </td>
   <td style="text-align:right;"> 10330.074 </td>
   <td style="text-align:right;"> 21833.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35135.89679 </td>
   <td style="text-align:right;"> 796.567806 </td>
   <td style="text-align:right;"> 8486.992 </td>
   <td style="text-align:right;"> 21221.36 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33055.33898 </td>
   <td style="text-align:right;"> 772.670093 </td>
   <td style="text-align:right;"> 8263.051 </td>
   <td style="text-align:right;"> 21028.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24707.16230 </td>
   <td style="text-align:right;"> 618.961471 </td>
   <td style="text-align:right;"> 11169.663 </td>
   <td style="text-align:right;"> 21274.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -45334.44146 </td>
   <td style="text-align:right;"> 941.989607 </td>
   <td style="text-align:right;"> 8878.876 </td>
   <td style="text-align:right;"> 21834.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -48440.54964 </td>
   <td style="text-align:right;"> 984.373778 </td>
   <td style="text-align:right;"> 10088.011 </td>
   <td style="text-align:right;"> 21641.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31615.07371 </td>
   <td style="text-align:right;"> 737.253394 </td>
   <td style="text-align:right;"> 9117.145 </td>
   <td style="text-align:right;"> 21579.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21559.35544 </td>
   <td style="text-align:right;"> 563.812520 </td>
   <td style="text-align:right;"> 12078.827 </td>
   <td style="text-align:right;"> 21679.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16943.43275 </td>
   <td style="text-align:right;"> 496.002094 </td>
   <td style="text-align:right;"> 12222.146 </td>
   <td style="text-align:right;"> 21361.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18146.21893 </td>
   <td style="text-align:right;"> 515.586305 </td>
   <td style="text-align:right;"> 12318.907 </td>
   <td style="text-align:right;"> 21491.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29960.42597 </td>
   <td style="text-align:right;"> 707.514619 </td>
   <td style="text-align:right;"> 11012.489 </td>
   <td style="text-align:right;"> 21733.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13522.49640 </td>
   <td style="text-align:right;"> 462.736924 </td>
   <td style="text-align:right;"> 11272.431 </td>
   <td style="text-align:right;"> 20913.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8273.74322 </td>
   <td style="text-align:right;"> 388.468347 </td>
   <td style="text-align:right;"> 11280.725 </td>
   <td style="text-align:right;"> 20990.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17844.22597 </td>
   <td style="text-align:right;"> 509.622369 </td>
   <td style="text-align:right;"> 12628.151 </td>
   <td style="text-align:right;"> 21188.24 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32023.15743 </td>
   <td style="text-align:right;"> 756.438888 </td>
   <td style="text-align:right;"> 8808.871 </td>
   <td style="text-align:right;"> 21772.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38345.44836 </td>
   <td style="text-align:right;"> 824.984292 </td>
   <td style="text-align:right;"> 10434.236 </td>
   <td style="text-align:right;"> 21107.05 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31917.49958 </td>
   <td style="text-align:right;"> 727.814108 </td>
   <td style="text-align:right;"> 9718.215 </td>
   <td style="text-align:right;"> 21281.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2817.65366 </td>
   <td style="text-align:right;"> 208.722531 </td>
   <td style="text-align:right;"> 12324.149 </td>
   <td style="text-align:right;"> 21136.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -45536.35831 </td>
   <td style="text-align:right;"> 942.245696 </td>
   <td style="text-align:right;"> 10063.735 </td>
   <td style="text-align:right;"> 20982.24 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23746.70647 </td>
   <td style="text-align:right;"> 604.858703 </td>
   <td style="text-align:right;"> 12812.280 </td>
   <td style="text-align:right;"> 21812.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -89.54048 </td>
   <td style="text-align:right;"> 267.784383 </td>
   <td style="text-align:right;"> 11273.587 </td>
   <td style="text-align:right;"> 21920.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12265.93767 </td>
   <td style="text-align:right;"> 452.442973 </td>
   <td style="text-align:right;"> 11436.851 </td>
   <td style="text-align:right;"> 21859.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9445.67180 </td>
   <td style="text-align:right;"> 380.862644 </td>
   <td style="text-align:right;"> 13486.829 </td>
   <td style="text-align:right;"> 21477.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34889.41570 </td>
   <td style="text-align:right;"> 780.776271 </td>
   <td style="text-align:right;"> 10779.396 </td>
   <td style="text-align:right;"> 21342.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43796.62628 </td>
   <td style="text-align:right;"> 925.210058 </td>
   <td style="text-align:right;"> 9047.898 </td>
   <td style="text-align:right;"> 21395.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38462.53955 </td>
   <td style="text-align:right;"> 843.702478 </td>
   <td style="text-align:right;"> 8930.382 </td>
   <td style="text-align:right;"> 21301.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40879.62830 </td>
   <td style="text-align:right;"> 884.850645 </td>
   <td style="text-align:right;"> 8857.329 </td>
   <td style="text-align:right;"> 21613.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27184.75925 </td>
   <td style="text-align:right;"> 666.949651 </td>
   <td style="text-align:right;"> 8649.385 </td>
   <td style="text-align:right;"> 21970.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30892.67062 </td>
   <td style="text-align:right;"> 726.913201 </td>
   <td style="text-align:right;"> 11230.286 </td>
   <td style="text-align:right;"> 21621.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40415.61873 </td>
   <td style="text-align:right;"> 881.753939 </td>
   <td style="text-align:right;"> 7484.955 </td>
   <td style="text-align:right;"> 20730.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22556.32396 </td>
   <td style="text-align:right;"> 600.683878 </td>
   <td style="text-align:right;"> 11427.652 </td>
   <td style="text-align:right;"> 21420.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29353.18650 </td>
   <td style="text-align:right;"> 690.904950 </td>
   <td style="text-align:right;"> 10655.419 </td>
   <td style="text-align:right;"> 21351.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21245.58503 </td>
   <td style="text-align:right;"> 571.809856 </td>
   <td style="text-align:right;"> 10537.951 </td>
   <td style="text-align:right;"> 21631.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33719.28397 </td>
   <td style="text-align:right;"> 778.109863 </td>
   <td style="text-align:right;"> 9491.648 </td>
   <td style="text-align:right;"> 21812.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31996.52144 </td>
   <td style="text-align:right;"> 733.105047 </td>
   <td style="text-align:right;"> 10873.062 </td>
   <td style="text-align:right;"> 21139.05 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44339.08902 </td>
   <td style="text-align:right;"> 943.580934 </td>
   <td style="text-align:right;"> 8510.313 </td>
   <td style="text-align:right;"> 21468.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22769.09044 </td>
   <td style="text-align:right;"> 587.743289 </td>
   <td style="text-align:right;"> 11640.586 </td>
   <td style="text-align:right;"> 21939.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31807.41272 </td>
   <td style="text-align:right;"> 738.477615 </td>
   <td style="text-align:right;"> 9372.010 </td>
   <td style="text-align:right;"> 21141.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20712.25743 </td>
   <td style="text-align:right;"> 573.955669 </td>
   <td style="text-align:right;"> 10667.236 </td>
   <td style="text-align:right;"> 21726.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33186.72305 </td>
   <td style="text-align:right;"> 765.413786 </td>
   <td style="text-align:right;"> 10223.613 </td>
   <td style="text-align:right;"> 21471.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29698.46776 </td>
   <td style="text-align:right;"> 701.123877 </td>
   <td style="text-align:right;"> 9581.551 </td>
   <td style="text-align:right;"> 21096.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37048.33523 </td>
   <td style="text-align:right;"> 820.548632 </td>
   <td style="text-align:right;"> 9533.048 </td>
   <td style="text-align:right;"> 21521.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10207.62609 </td>
   <td style="text-align:right;"> 402.723534 </td>
   <td style="text-align:right;"> 11324.428 </td>
   <td style="text-align:right;"> 21292.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12172.71057 </td>
   <td style="text-align:right;"> 423.962110 </td>
   <td style="text-align:right;"> 13220.163 </td>
   <td style="text-align:right;"> 21458.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40893.66517 </td>
   <td style="text-align:right;"> 887.539148 </td>
   <td style="text-align:right;"> 7992.041 </td>
   <td style="text-align:right;"> 21514.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43891.18666 </td>
   <td style="text-align:right;"> 935.484312 </td>
   <td style="text-align:right;"> 9045.519 </td>
   <td style="text-align:right;"> 21666.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -50272.35499 </td>
   <td style="text-align:right;"> 1029.977645 </td>
   <td style="text-align:right;"> 7544.669 </td>
   <td style="text-align:right;"> 21670.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27094.24434 </td>
   <td style="text-align:right;"> 665.550820 </td>
   <td style="text-align:right;"> 10502.946 </td>
   <td style="text-align:right;"> 21417.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32700.81477 </td>
   <td style="text-align:right;"> 761.281470 </td>
   <td style="text-align:right;"> 9652.315 </td>
   <td style="text-align:right;"> 21050.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28345.89322 </td>
   <td style="text-align:right;"> 703.907491 </td>
   <td style="text-align:right;"> 8419.829 </td>
   <td style="text-align:right;"> 20798.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34050.37013 </td>
   <td style="text-align:right;"> 775.520537 </td>
   <td style="text-align:right;"> 11260.203 </td>
   <td style="text-align:right;"> 21298.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30333.53596 </td>
   <td style="text-align:right;"> 735.061253 </td>
   <td style="text-align:right;"> 9671.345 </td>
   <td style="text-align:right;"> 21628.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26005.17433 </td>
   <td style="text-align:right;"> 668.395982 </td>
   <td style="text-align:right;"> 9877.698 </td>
   <td style="text-align:right;"> 21694.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36305.61770 </td>
   <td style="text-align:right;"> 814.754620 </td>
   <td style="text-align:right;"> 9809.554 </td>
   <td style="text-align:right;"> 21366.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30098.40478 </td>
   <td style="text-align:right;"> 718.517023 </td>
   <td style="text-align:right;"> 10324.193 </td>
   <td style="text-align:right;"> 21230.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18019.77729 </td>
   <td style="text-align:right;"> 518.790721 </td>
   <td style="text-align:right;"> 11437.606 </td>
   <td style="text-align:right;"> 21774.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21922.76147 </td>
   <td style="text-align:right;"> 580.163687 </td>
   <td style="text-align:right;"> 13155.802 </td>
   <td style="text-align:right;"> 21900.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9559.83282 </td>
   <td style="text-align:right;"> 409.454693 </td>
   <td style="text-align:right;"> 10572.796 </td>
   <td style="text-align:right;"> 21553.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32907.40521 </td>
   <td style="text-align:right;"> 755.044173 </td>
   <td style="text-align:right;"> 11727.766 </td>
   <td style="text-align:right;"> 21191.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23272.35328 </td>
   <td style="text-align:right;"> 603.289721 </td>
   <td style="text-align:right;"> 11418.923 </td>
   <td style="text-align:right;"> 21658.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20843.95985 </td>
   <td style="text-align:right;"> 574.113440 </td>
   <td style="text-align:right;"> 10418.519 </td>
   <td style="text-align:right;"> 21466.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15237.79459 </td>
   <td style="text-align:right;"> 482.638367 </td>
   <td style="text-align:right;"> 11176.886 </td>
   <td style="text-align:right;"> 21379.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42135.11264 </td>
   <td style="text-align:right;"> 886.633704 </td>
   <td style="text-align:right;"> 10238.292 </td>
   <td style="text-align:right;"> 20831.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32628.59416 </td>
   <td style="text-align:right;"> 762.470197 </td>
   <td style="text-align:right;"> 9304.035 </td>
   <td style="text-align:right;"> 20948.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41059.37332 </td>
   <td style="text-align:right;"> 882.766413 </td>
   <td style="text-align:right;"> 10216.318 </td>
   <td style="text-align:right;"> 21390.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20079.71328 </td>
   <td style="text-align:right;"> 571.953333 </td>
   <td style="text-align:right;"> 9901.530 </td>
   <td style="text-align:right;"> 21121.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26757.51166 </td>
   <td style="text-align:right;"> 663.408401 </td>
   <td style="text-align:right;"> 9118.109 </td>
   <td style="text-align:right;"> 21887.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -47858.09195 </td>
   <td style="text-align:right;"> 979.621920 </td>
   <td style="text-align:right;"> 10312.349 </td>
   <td style="text-align:right;"> 21602.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20940.36566 </td>
   <td style="text-align:right;"> 578.836327 </td>
   <td style="text-align:right;"> 9764.140 </td>
   <td style="text-align:right;"> 21315.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26507.96373 </td>
   <td style="text-align:right;"> 661.413790 </td>
   <td style="text-align:right;"> 10056.124 </td>
   <td style="text-align:right;"> 21208.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29968.68523 </td>
   <td style="text-align:right;"> 701.107333 </td>
   <td style="text-align:right;"> 10864.991 </td>
   <td style="text-align:right;"> 20974.43 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23460.31421 </td>
   <td style="text-align:right;"> 616.449116 </td>
   <td style="text-align:right;"> 10196.474 </td>
   <td style="text-align:right;"> 21966.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29885.98228 </td>
   <td style="text-align:right;"> 704.444832 </td>
   <td style="text-align:right;"> 10443.647 </td>
   <td style="text-align:right;"> 21219.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13063.15794 </td>
   <td style="text-align:right;"> 458.293446 </td>
   <td style="text-align:right;"> 10493.978 </td>
   <td style="text-align:right;"> 21279.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21702.61046 </td>
   <td style="text-align:right;"> 573.349197 </td>
   <td style="text-align:right;"> 10353.416 </td>
   <td style="text-align:right;"> 21273.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20235.18575 </td>
   <td style="text-align:right;"> 550.278663 </td>
   <td style="text-align:right;"> 12083.286 </td>
   <td style="text-align:right;"> 21767.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23919.69983 </td>
   <td style="text-align:right;"> 631.443422 </td>
   <td style="text-align:right;"> 9591.318 </td>
   <td style="text-align:right;"> 21307.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39181.78209 </td>
   <td style="text-align:right;"> 841.835754 </td>
   <td style="text-align:right;"> 10326.541 </td>
   <td style="text-align:right;"> 21459.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41359.78569 </td>
   <td style="text-align:right;"> 889.803536 </td>
   <td style="text-align:right;"> 8266.277 </td>
   <td style="text-align:right;"> 21691.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31551.67055 </td>
   <td style="text-align:right;"> 720.675551 </td>
   <td style="text-align:right;"> 11743.685 </td>
   <td style="text-align:right;"> 21035.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33836.04369 </td>
   <td style="text-align:right;"> 765.177286 </td>
   <td style="text-align:right;"> 11651.693 </td>
   <td style="text-align:right;"> 21758.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17124.44159 </td>
   <td style="text-align:right;"> 518.381253 </td>
   <td style="text-align:right;"> 9350.929 </td>
   <td style="text-align:right;"> 22155.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33962.24277 </td>
   <td style="text-align:right;"> 762.005844 </td>
   <td style="text-align:right;"> 11389.962 </td>
   <td style="text-align:right;"> 21860.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23433.77743 </td>
   <td style="text-align:right;"> 610.814534 </td>
   <td style="text-align:right;"> 11155.644 </td>
   <td style="text-align:right;"> 20937.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18993.36472 </td>
   <td style="text-align:right;"> 533.817158 </td>
   <td style="text-align:right;"> 11786.939 </td>
   <td style="text-align:right;"> 21824.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35501.84758 </td>
   <td style="text-align:right;"> 808.034923 </td>
   <td style="text-align:right;"> 8694.171 </td>
   <td style="text-align:right;"> 21515.94 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31049.24473 </td>
   <td style="text-align:right;"> 709.024662 </td>
   <td style="text-align:right;"> 10787.379 </td>
   <td style="text-align:right;"> 21468.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43198.33547 </td>
   <td style="text-align:right;"> 907.915852 </td>
   <td style="text-align:right;"> 7903.857 </td>
   <td style="text-align:right;"> 21923.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39869.48669 </td>
   <td style="text-align:right;"> 865.447236 </td>
   <td style="text-align:right;"> 8374.594 </td>
   <td style="text-align:right;"> 21781.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29501.57817 </td>
   <td style="text-align:right;"> 705.336357 </td>
   <td style="text-align:right;"> 9436.283 </td>
   <td style="text-align:right;"> 21579.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27543.50084 </td>
   <td style="text-align:right;"> 677.843667 </td>
   <td style="text-align:right;"> 9649.581 </td>
   <td style="text-align:right;"> 21561.36 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37788.10157 </td>
   <td style="text-align:right;"> 824.180206 </td>
   <td style="text-align:right;"> 10048.258 </td>
   <td style="text-align:right;"> 21756.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -47078.27177 </td>
   <td style="text-align:right;"> 987.985916 </td>
   <td style="text-align:right;"> 7675.585 </td>
   <td style="text-align:right;"> 21865.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -53294.82617 </td>
   <td style="text-align:right;"> 1079.959677 </td>
   <td style="text-align:right;"> 7096.802 </td>
   <td style="text-align:right;"> 21847.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -53593.24048 </td>
   <td style="text-align:right;"> 1086.786734 </td>
   <td style="text-align:right;"> 7177.029 </td>
   <td style="text-align:right;"> 21533.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -54429.80717 </td>
   <td style="text-align:right;"> 1085.736106 </td>
   <td style="text-align:right;"> 6452.154 </td>
   <td style="text-align:right;"> 21253.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -48682.63917 </td>
   <td style="text-align:right;"> 989.094853 </td>
   <td style="text-align:right;"> 8939.435 </td>
   <td style="text-align:right;"> 21138.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20288.87435 </td>
   <td style="text-align:right;"> 565.783748 </td>
   <td style="text-align:right;"> 11952.591 </td>
   <td style="text-align:right;"> 20932.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9780.86011 </td>
   <td style="text-align:right;"> 405.978353 </td>
   <td style="text-align:right;"> 12855.984 </td>
   <td style="text-align:right;"> 21560.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41060.46481 </td>
   <td style="text-align:right;"> 875.906284 </td>
   <td style="text-align:right;"> 9352.142 </td>
   <td style="text-align:right;"> 21597.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26569.75588 </td>
   <td style="text-align:right;"> 657.386373 </td>
   <td style="text-align:right;"> 9349.296 </td>
   <td style="text-align:right;"> 21414.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25873.21760 </td>
   <td style="text-align:right;"> 662.664030 </td>
   <td style="text-align:right;"> 9512.145 </td>
   <td style="text-align:right;"> 21727.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30564.64509 </td>
   <td style="text-align:right;"> 716.263625 </td>
   <td style="text-align:right;"> 8870.938 </td>
   <td style="text-align:right;"> 21472.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33932.51041 </td>
   <td style="text-align:right;"> 761.866875 </td>
   <td style="text-align:right;"> 9004.891 </td>
   <td style="text-align:right;"> 21545.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7813.50037 </td>
   <td style="text-align:right;"> 355.441284 </td>
   <td style="text-align:right;"> 13715.604 </td>
   <td style="text-align:right;"> 20906.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 84.01994 </td>
   <td style="text-align:right;"> 246.590317 </td>
   <td style="text-align:right;"> 12986.285 </td>
   <td style="text-align:right;"> 21541.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1399.70859 </td>
   <td style="text-align:right;"> 229.529233 </td>
   <td style="text-align:right;"> 12766.328 </td>
   <td style="text-align:right;"> 21431.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20752.71573 </td>
   <td style="text-align:right;"> 564.937092 </td>
   <td style="text-align:right;"> 12295.057 </td>
   <td style="text-align:right;"> 21025.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29690.78888 </td>
   <td style="text-align:right;"> 694.360651 </td>
   <td style="text-align:right;"> 12498.254 </td>
   <td style="text-align:right;"> 21751.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33617.08481 </td>
   <td style="text-align:right;"> 750.826127 </td>
   <td style="text-align:right;"> 13798.162 </td>
   <td style="text-align:right;"> 21736.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33186.16942 </td>
   <td style="text-align:right;"> 742.623269 </td>
   <td style="text-align:right;"> 13360.517 </td>
   <td style="text-align:right;"> 21693.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22925.14738 </td>
   <td style="text-align:right;"> 598.134620 </td>
   <td style="text-align:right;"> 10573.351 </td>
   <td style="text-align:right;"> 21511.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25708.25182 </td>
   <td style="text-align:right;"> 640.000525 </td>
   <td style="text-align:right;"> 10524.292 </td>
   <td style="text-align:right;"> 21520.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39891.98533 </td>
   <td style="text-align:right;"> 855.198961 </td>
   <td style="text-align:right;"> 9130.201 </td>
   <td style="text-align:right;"> 21620.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23671.74050 </td>
   <td style="text-align:right;"> 595.255305 </td>
   <td style="text-align:right;"> 11772.350 </td>
   <td style="text-align:right;"> 21673.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42220.37443 </td>
   <td style="text-align:right;"> 904.698613 </td>
   <td style="text-align:right;"> 9863.852 </td>
   <td style="text-align:right;"> 20864.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29085.80332 </td>
   <td style="text-align:right;"> 703.510134 </td>
   <td style="text-align:right;"> 9930.572 </td>
   <td style="text-align:right;"> 21039.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19799.94195 </td>
   <td style="text-align:right;"> 553.816486 </td>
   <td style="text-align:right;"> 11649.175 </td>
   <td style="text-align:right;"> 21926.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38151.37189 </td>
   <td style="text-align:right;"> 837.347489 </td>
   <td style="text-align:right;"> 8684.818 </td>
   <td style="text-align:right;"> 21165.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42373.33368 </td>
   <td style="text-align:right;"> 908.897584 </td>
   <td style="text-align:right;"> 9135.191 </td>
   <td style="text-align:right;"> 21606.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42391.63946 </td>
   <td style="text-align:right;"> 910.189497 </td>
   <td style="text-align:right;"> 9123.945 </td>
   <td style="text-align:right;"> 21513.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20383.55445 </td>
   <td style="text-align:right;"> 548.767075 </td>
   <td style="text-align:right;"> 11498.808 </td>
   <td style="text-align:right;"> 21446.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36039.56330 </td>
   <td style="text-align:right;"> 812.948832 </td>
   <td style="text-align:right;"> 9551.328 </td>
   <td style="text-align:right;"> 21666.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11585.20864 </td>
   <td style="text-align:right;"> 413.417911 </td>
   <td style="text-align:right;"> 12771.676 </td>
   <td style="text-align:right;"> 21179.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17926.33986 </td>
   <td style="text-align:right;"> 539.707790 </td>
   <td style="text-align:right;"> 11452.685 </td>
   <td style="text-align:right;"> 21436.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23952.32530 </td>
   <td style="text-align:right;"> 615.201465 </td>
   <td style="text-align:right;"> 10037.947 </td>
   <td style="text-align:right;"> 21719.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25461.15210 </td>
   <td style="text-align:right;"> 626.979857 </td>
   <td style="text-align:right;"> 11076.278 </td>
   <td style="text-align:right;"> 21847.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31096.63417 </td>
   <td style="text-align:right;"> 723.711164 </td>
   <td style="text-align:right;"> 9726.233 </td>
   <td style="text-align:right;"> 20976.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25260.66769 </td>
   <td style="text-align:right;"> 637.688997 </td>
   <td style="text-align:right;"> 9430.360 </td>
   <td style="text-align:right;"> 20800.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -45385.17487 </td>
   <td style="text-align:right;"> 951.534547 </td>
   <td style="text-align:right;"> 9325.194 </td>
   <td style="text-align:right;"> 20723.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38204.62222 </td>
   <td style="text-align:right;"> 829.739380 </td>
   <td style="text-align:right;"> 9434.905 </td>
   <td style="text-align:right;"> 21403.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44583.52899 </td>
   <td style="text-align:right;"> 918.363929 </td>
   <td style="text-align:right;"> 9720.703 </td>
   <td style="text-align:right;"> 20919.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44288.69461 </td>
   <td style="text-align:right;"> 918.050719 </td>
   <td style="text-align:right;"> 9542.740 </td>
   <td style="text-align:right;"> 20940.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28252.91970 </td>
   <td style="text-align:right;"> 677.824216 </td>
   <td style="text-align:right;"> 9142.280 </td>
   <td style="text-align:right;"> 21168.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26208.96683 </td>
   <td style="text-align:right;"> 652.904938 </td>
   <td style="text-align:right;"> 10322.526 </td>
   <td style="text-align:right;"> 21568.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23136.07922 </td>
   <td style="text-align:right;"> 605.579545 </td>
   <td style="text-align:right;"> 10748.368 </td>
   <td style="text-align:right;"> 21477.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8187.15589 </td>
   <td style="text-align:right;"> 371.528156 </td>
   <td style="text-align:right;"> 12948.948 </td>
   <td style="text-align:right;"> 21060.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -51657.80741 </td>
   <td style="text-align:right;"> 1029.369807 </td>
   <td style="text-align:right;"> 9971.186 </td>
   <td style="text-align:right;"> 21591.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8617.08812 </td>
   <td style="text-align:right;"> 394.381824 </td>
   <td style="text-align:right;"> 10750.045 </td>
   <td style="text-align:right;"> 21025.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32829.88177 </td>
   <td style="text-align:right;"> 740.821907 </td>
   <td style="text-align:right;"> 11225.202 </td>
   <td style="text-align:right;"> 21219.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5142.34547 </td>
   <td style="text-align:right;"> 322.699353 </td>
   <td style="text-align:right;"> 11846.483 </td>
   <td style="text-align:right;"> 22107.94 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -4524.77066 </td>
   <td style="text-align:right;"> 320.304025 </td>
   <td style="text-align:right;"> 11015.583 </td>
   <td style="text-align:right;"> 22230.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22126.08410 </td>
   <td style="text-align:right;"> 583.306253 </td>
   <td style="text-align:right;"> 11788.902 </td>
   <td style="text-align:right;"> 21616.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14627.80762 </td>
   <td style="text-align:right;"> 474.817751 </td>
   <td style="text-align:right;"> 11355.974 </td>
   <td style="text-align:right;"> 21238.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23095.58513 </td>
   <td style="text-align:right;"> 603.250742 </td>
   <td style="text-align:right;"> 11415.994 </td>
   <td style="text-align:right;"> 20782.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34790.08773 </td>
   <td style="text-align:right;"> 788.523928 </td>
   <td style="text-align:right;"> 10266.801 </td>
   <td style="text-align:right;"> 21047.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30155.14109 </td>
   <td style="text-align:right;"> 700.239083 </td>
   <td style="text-align:right;"> 11907.344 </td>
   <td style="text-align:right;"> 21544.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12049.86244 </td>
   <td style="text-align:right;"> 426.562509 </td>
   <td style="text-align:right;"> 11469.488 </td>
   <td style="text-align:right;"> 21446.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28830.59792 </td>
   <td style="text-align:right;"> 706.454448 </td>
   <td style="text-align:right;"> 9404.978 </td>
   <td style="text-align:right;"> 21273.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29269.44703 </td>
   <td style="text-align:right;"> 689.217852 </td>
   <td style="text-align:right;"> 11021.835 </td>
   <td style="text-align:right;"> 20982.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22906.46671 </td>
   <td style="text-align:right;"> 599.982031 </td>
   <td style="text-align:right;"> 11997.397 </td>
   <td style="text-align:right;"> 21104.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16818.16266 </td>
   <td style="text-align:right;"> 510.108606 </td>
   <td style="text-align:right;"> 10694.148 </td>
   <td style="text-align:right;"> 21478.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 527.16138 </td>
   <td style="text-align:right;"> 239.564790 </td>
   <td style="text-align:right;"> 13079.427 </td>
   <td style="text-align:right;"> 21343.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7388.50151 </td>
   <td style="text-align:right;"> 359.345081 </td>
   <td style="text-align:right;"> 13275.814 </td>
   <td style="text-align:right;"> 21291.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39149.87434 </td>
   <td style="text-align:right;"> 856.423178 </td>
   <td style="text-align:right;"> 8168.237 </td>
   <td style="text-align:right;"> 21555.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14932.68533 </td>
   <td style="text-align:right;"> 495.633007 </td>
   <td style="text-align:right;"> 11044.335 </td>
   <td style="text-align:right;"> 21784.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30522.68791 </td>
   <td style="text-align:right;"> 724.954144 </td>
   <td style="text-align:right;"> 11885.074 </td>
   <td style="text-align:right;"> 21894.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30209.61003 </td>
   <td style="text-align:right;"> 699.051969 </td>
   <td style="text-align:right;"> 10917.428 </td>
   <td style="text-align:right;"> 20502.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19021.02027 </td>
   <td style="text-align:right;"> 529.852061 </td>
   <td style="text-align:right;"> 10637.809 </td>
   <td style="text-align:right;"> 20582.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20275.81292 </td>
   <td style="text-align:right;"> 552.790716 </td>
   <td style="text-align:right;"> 10493.800 </td>
   <td style="text-align:right;"> 20708.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35977.48462 </td>
   <td style="text-align:right;"> 799.651918 </td>
   <td style="text-align:right;"> 10247.239 </td>
   <td style="text-align:right;"> 20879.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36637.75731 </td>
   <td style="text-align:right;"> 806.908700 </td>
   <td style="text-align:right;"> 10498.506 </td>
   <td style="text-align:right;"> 21047.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22181.71518 </td>
   <td style="text-align:right;"> 580.984525 </td>
   <td style="text-align:right;"> 11458.231 </td>
   <td style="text-align:right;"> 21457.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33999.59092 </td>
   <td style="text-align:right;"> 778.696447 </td>
   <td style="text-align:right;"> 9647.516 </td>
   <td style="text-align:right;"> 21311.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19110.75456 </td>
   <td style="text-align:right;"> 541.129264 </td>
   <td style="text-align:right;"> 11865.458 </td>
   <td style="text-align:right;"> 21355.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28170.24914 </td>
   <td style="text-align:right;"> 680.602410 </td>
   <td style="text-align:right;"> 10412.107 </td>
   <td style="text-align:right;"> 21285.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13150.89817 </td>
   <td style="text-align:right;"> 447.921910 </td>
   <td style="text-align:right;"> 12815.915 </td>
   <td style="text-align:right;"> 21255.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32144.98914 </td>
   <td style="text-align:right;"> 745.644636 </td>
   <td style="text-align:right;"> 9224.339 </td>
   <td style="text-align:right;"> 21728.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15657.62095 </td>
   <td style="text-align:right;"> 493.823587 </td>
   <td style="text-align:right;"> 11302.097 </td>
   <td style="text-align:right;"> 21036.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15560.84449 </td>
   <td style="text-align:right;"> 490.629323 </td>
   <td style="text-align:right;"> 12271.472 </td>
   <td style="text-align:right;"> 21256.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29998.53679 </td>
   <td style="text-align:right;"> 694.454354 </td>
   <td style="text-align:right;"> 11837.777 </td>
   <td style="text-align:right;"> 21531.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13182.92466 </td>
   <td style="text-align:right;"> 443.916205 </td>
   <td style="text-align:right;"> 11144.295 </td>
   <td style="text-align:right;"> 21292.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24687.15088 </td>
   <td style="text-align:right;"> 644.737974 </td>
   <td style="text-align:right;"> 9158.124 </td>
   <td style="text-align:right;"> 21538.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16939.96815 </td>
   <td style="text-align:right;"> 509.309835 </td>
   <td style="text-align:right;"> 13237.655 </td>
   <td style="text-align:right;"> 21463.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1629.85925 </td>
   <td style="text-align:right;"> 232.498274 </td>
   <td style="text-align:right;"> 12566.880 </td>
   <td style="text-align:right;"> 21539.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19929.05962 </td>
   <td style="text-align:right;"> 551.469086 </td>
   <td style="text-align:right;"> 12757.769 </td>
   <td style="text-align:right;"> 21496.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18238.75893 </td>
   <td style="text-align:right;"> 530.042212 </td>
   <td style="text-align:right;"> 10210.861 </td>
   <td style="text-align:right;"> 21704.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16394.94643 </td>
   <td style="text-align:right;"> 491.145966 </td>
   <td style="text-align:right;"> 13250.866 </td>
   <td style="text-align:right;"> 21327.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21473.02386 </td>
   <td style="text-align:right;"> 599.395209 </td>
   <td style="text-align:right;"> 9625.616 </td>
   <td style="text-align:right;"> 21847.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34603.27861 </td>
   <td style="text-align:right;"> 773.154286 </td>
   <td style="text-align:right;"> 11023.698 </td>
   <td style="text-align:right;"> 21676.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30516.95092 </td>
   <td style="text-align:right;"> 715.263513 </td>
   <td style="text-align:right;"> 11066.230 </td>
   <td style="text-align:right;"> 21102.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19916.66138 </td>
   <td style="text-align:right;"> 563.212721 </td>
   <td style="text-align:right;"> 10418.543 </td>
   <td style="text-align:right;"> 21276.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20943.10420 </td>
   <td style="text-align:right;"> 569.204286 </td>
   <td style="text-align:right;"> 12133.545 </td>
   <td style="text-align:right;"> 21573.24 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15699.77004 </td>
   <td style="text-align:right;"> 470.375790 </td>
   <td style="text-align:right;"> 11160.996 </td>
   <td style="text-align:right;"> 21389.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35558.82488 </td>
   <td style="text-align:right;"> 789.944468 </td>
   <td style="text-align:right;"> 10337.504 </td>
   <td style="text-align:right;"> 21396.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23401.96142 </td>
   <td style="text-align:right;"> 607.122892 </td>
   <td style="text-align:right;"> 10877.079 </td>
   <td style="text-align:right;"> 20903.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28604.47575 </td>
   <td style="text-align:right;"> 672.514624 </td>
   <td style="text-align:right;"> 11156.383 </td>
   <td style="text-align:right;"> 22239.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14346.29133 </td>
   <td style="text-align:right;"> 462.680392 </td>
   <td style="text-align:right;"> 10874.462 </td>
   <td style="text-align:right;"> 22246.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24417.50648 </td>
   <td style="text-align:right;"> 613.379451 </td>
   <td style="text-align:right;"> 11375.140 </td>
   <td style="text-align:right;"> 22154.73 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22838.31133 </td>
   <td style="text-align:right;"> 603.606468 </td>
   <td style="text-align:right;"> 10942.638 </td>
   <td style="text-align:right;"> 21245.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38517.87790 </td>
   <td style="text-align:right;"> 846.792884 </td>
   <td style="text-align:right;"> 8898.027 </td>
   <td style="text-align:right;"> 21405.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23284.90704 </td>
   <td style="text-align:right;"> 603.064626 </td>
   <td style="text-align:right;"> 11029.142 </td>
   <td style="text-align:right;"> 20876.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32872.40129 </td>
   <td style="text-align:right;"> 748.227178 </td>
   <td style="text-align:right;"> 11516.080 </td>
   <td style="text-align:right;"> 21066.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29809.62557 </td>
   <td style="text-align:right;"> 711.077478 </td>
   <td style="text-align:right;"> 9490.269 </td>
   <td style="text-align:right;"> 21067.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12648.96243 </td>
   <td style="text-align:right;"> 450.281625 </td>
   <td style="text-align:right;"> 11128.766 </td>
   <td style="text-align:right;"> 21735.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25160.73308 </td>
   <td style="text-align:right;"> 631.252529 </td>
   <td style="text-align:right;"> 10950.619 </td>
   <td style="text-align:right;"> 21557.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21603.69508 </td>
   <td style="text-align:right;"> 593.676082 </td>
   <td style="text-align:right;"> 10802.836 </td>
   <td style="text-align:right;"> 21394.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39259.22050 </td>
   <td style="text-align:right;"> 849.185753 </td>
   <td style="text-align:right;"> 9181.114 </td>
   <td style="text-align:right;"> 21365.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35301.19340 </td>
   <td style="text-align:right;"> 785.172786 </td>
   <td style="text-align:right;"> 10366.704 </td>
   <td style="text-align:right;"> 21510.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43198.46853 </td>
   <td style="text-align:right;"> 923.707185 </td>
   <td style="text-align:right;"> 8254.193 </td>
   <td style="text-align:right;"> 21459.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9066.70934 </td>
   <td style="text-align:right;"> 374.410272 </td>
   <td style="text-align:right;"> 13061.599 </td>
   <td style="text-align:right;"> 21339.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28088.04040 </td>
   <td style="text-align:right;"> 693.049645 </td>
   <td style="text-align:right;"> 9374.053 </td>
   <td style="text-align:right;"> 21492.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29846.71717 </td>
   <td style="text-align:right;"> 713.827311 </td>
   <td style="text-align:right;"> 10227.142 </td>
   <td style="text-align:right;"> 21731.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29844.78222 </td>
   <td style="text-align:right;"> 708.479201 </td>
   <td style="text-align:right;"> 11147.021 </td>
   <td style="text-align:right;"> 21650.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36848.53750 </td>
   <td style="text-align:right;"> 828.386411 </td>
   <td style="text-align:right;"> 8166.356 </td>
   <td style="text-align:right;"> 21872.24 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37989.33615 </td>
   <td style="text-align:right;"> 816.486535 </td>
   <td style="text-align:right;"> 10433.772 </td>
   <td style="text-align:right;"> 21509.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7147.18812 </td>
   <td style="text-align:right;"> 362.267706 </td>
   <td style="text-align:right;"> 11779.370 </td>
   <td style="text-align:right;"> 20886.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26555.32247 </td>
   <td style="text-align:right;"> 642.306889 </td>
   <td style="text-align:right;"> 11670.259 </td>
   <td style="text-align:right;"> 21348.84 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20774.48714 </td>
   <td style="text-align:right;"> 557.847076 </td>
   <td style="text-align:right;"> 11275.145 </td>
   <td style="text-align:right;"> 21298.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17217.48192 </td>
   <td style="text-align:right;"> 508.631668 </td>
   <td style="text-align:right;"> 11790.329 </td>
   <td style="text-align:right;"> 21668.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21148.19481 </td>
   <td style="text-align:right;"> 577.587711 </td>
   <td style="text-align:right;"> 11551.771 </td>
   <td style="text-align:right;"> 21254.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30793.72018 </td>
   <td style="text-align:right;"> 722.103581 </td>
   <td style="text-align:right;"> 10783.685 </td>
   <td style="text-align:right;"> 21176.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25420.13458 </td>
   <td style="text-align:right;"> 628.758023 </td>
   <td style="text-align:right;"> 10377.549 </td>
   <td style="text-align:right;"> 21470.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21826.90586 </td>
   <td style="text-align:right;"> 573.125485 </td>
   <td style="text-align:right;"> 11154.972 </td>
   <td style="text-align:right;"> 21725.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22509.69185 </td>
   <td style="text-align:right;"> 605.339045 </td>
   <td style="text-align:right;"> 10159.627 </td>
   <td style="text-align:right;"> 20902.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36895.38005 </td>
   <td style="text-align:right;"> 819.000409 </td>
   <td style="text-align:right;"> 10837.811 </td>
   <td style="text-align:right;"> 20944.05 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14756.73380 </td>
   <td style="text-align:right;"> 470.602937 </td>
   <td style="text-align:right;"> 10644.638 </td>
   <td style="text-align:right;"> 21186.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9539.40164 </td>
   <td style="text-align:right;"> 386.061178 </td>
   <td style="text-align:right;"> 10803.502 </td>
   <td style="text-align:right;"> 21456.43 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17665.47367 </td>
   <td style="text-align:right;"> 501.082847 </td>
   <td style="text-align:right;"> 13515.602 </td>
   <td style="text-align:right;"> 21660.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14327.15555 </td>
   <td style="text-align:right;"> 476.036209 </td>
   <td style="text-align:right;"> 9854.750 </td>
   <td style="text-align:right;"> 21118.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16821.61454 </td>
   <td style="text-align:right;"> 510.281789 </td>
   <td style="text-align:right;"> 9768.456 </td>
   <td style="text-align:right;"> 21093.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16866.82354 </td>
   <td style="text-align:right;"> 510.503651 </td>
   <td style="text-align:right;"> 9902.755 </td>
   <td style="text-align:right;"> 21122.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19939.54491 </td>
   <td style="text-align:right;"> 555.153039 </td>
   <td style="text-align:right;"> 10186.126 </td>
   <td style="text-align:right;"> 20988.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13811.11001 </td>
   <td style="text-align:right;"> 453.326396 </td>
   <td style="text-align:right;"> 13194.261 </td>
   <td style="text-align:right;"> 21187.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33575.84047 </td>
   <td style="text-align:right;"> 767.580970 </td>
   <td style="text-align:right;"> 9635.573 </td>
   <td style="text-align:right;"> 21748.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25235.95888 </td>
   <td style="text-align:right;"> 653.830583 </td>
   <td style="text-align:right;"> 8699.702 </td>
   <td style="text-align:right;"> 21538.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18807.96076 </td>
   <td style="text-align:right;"> 553.269265 </td>
   <td style="text-align:right;"> 9731.568 </td>
   <td style="text-align:right;"> 21379.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30604.48675 </td>
   <td style="text-align:right;"> 722.598000 </td>
   <td style="text-align:right;"> 8568.394 </td>
   <td style="text-align:right;"> 21614.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -48045.61961 </td>
   <td style="text-align:right;"> 995.952896 </td>
   <td style="text-align:right;"> 9513.912 </td>
   <td style="text-align:right;"> 20918.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28248.05844 </td>
   <td style="text-align:right;"> 695.847627 </td>
   <td style="text-align:right;"> 9474.695 </td>
   <td style="text-align:right;"> 20974.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9278.30454 </td>
   <td style="text-align:right;"> 378.667752 </td>
   <td style="text-align:right;"> 11845.425 </td>
   <td style="text-align:right;"> 21002.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38204.96297 </td>
   <td style="text-align:right;"> 857.537585 </td>
   <td style="text-align:right;"> 8873.011 </td>
   <td style="text-align:right;"> 21805.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -47047.59088 </td>
   <td style="text-align:right;"> 976.366800 </td>
   <td style="text-align:right;"> 8559.534 </td>
   <td style="text-align:right;"> 21711.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42327.25862 </td>
   <td style="text-align:right;"> 908.724319 </td>
   <td style="text-align:right;"> 7596.116 </td>
   <td style="text-align:right;"> 21753.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10844.06318 </td>
   <td style="text-align:right;"> 411.382299 </td>
   <td style="text-align:right;"> 13363.469 </td>
   <td style="text-align:right;"> 21044.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19112.82202 </td>
   <td style="text-align:right;"> 542.591023 </td>
   <td style="text-align:right;"> 12468.316 </td>
   <td style="text-align:right;"> 21148.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27272.34502 </td>
   <td style="text-align:right;"> 660.164770 </td>
   <td style="text-align:right;"> 10954.420 </td>
   <td style="text-align:right;"> 21450.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32370.71354 </td>
   <td style="text-align:right;"> 753.013321 </td>
   <td style="text-align:right;"> 9348.917 </td>
   <td style="text-align:right;"> 21596.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42633.15371 </td>
   <td style="text-align:right;"> 890.002709 </td>
   <td style="text-align:right;"> 11078.326 </td>
   <td style="text-align:right;"> 21440.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33378.15441 </td>
   <td style="text-align:right;"> 757.083914 </td>
   <td style="text-align:right;"> 10595.074 </td>
   <td style="text-align:right;"> 21496.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26398.84464 </td>
   <td style="text-align:right;"> 662.184666 </td>
   <td style="text-align:right;"> 10364.303 </td>
   <td style="text-align:right;"> 21906.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27949.06572 </td>
   <td style="text-align:right;"> 680.285749 </td>
   <td style="text-align:right;"> 10901.751 </td>
   <td style="text-align:right;"> 21075.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29694.06520 </td>
   <td style="text-align:right;"> 709.819082 </td>
   <td style="text-align:right;"> 9573.340 </td>
   <td style="text-align:right;"> 21445.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24721.87872 </td>
   <td style="text-align:right;"> 631.168340 </td>
   <td style="text-align:right;"> 9757.376 </td>
   <td style="text-align:right;"> 21554.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12841.63550 </td>
   <td style="text-align:right;"> 449.764372 </td>
   <td style="text-align:right;"> 11407.113 </td>
   <td style="text-align:right;"> 21205.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32761.27165 </td>
   <td style="text-align:right;"> 758.015196 </td>
   <td style="text-align:right;"> 8746.232 </td>
   <td style="text-align:right;"> 21478.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30734.32966 </td>
   <td style="text-align:right;"> 719.996289 </td>
   <td style="text-align:right;"> 12132.478 </td>
   <td style="text-align:right;"> 21351.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20002.88130 </td>
   <td style="text-align:right;"> 571.758437 </td>
   <td style="text-align:right;"> 8624.434 </td>
   <td style="text-align:right;"> 21733.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31050.68807 </td>
   <td style="text-align:right;"> 721.025264 </td>
   <td style="text-align:right;"> 11434.289 </td>
   <td style="text-align:right;"> 21430.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34979.50764 </td>
   <td style="text-align:right;"> 786.280009 </td>
   <td style="text-align:right;"> 9466.534 </td>
   <td style="text-align:right;"> 21572.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20925.50657 </td>
   <td style="text-align:right;"> 561.349646 </td>
   <td style="text-align:right;"> 12294.136 </td>
   <td style="text-align:right;"> 21284.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35209.60210 </td>
   <td style="text-align:right;"> 793.107831 </td>
   <td style="text-align:right;"> 9572.130 </td>
   <td style="text-align:right;"> 21487.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38413.26364 </td>
   <td style="text-align:right;"> 833.989576 </td>
   <td style="text-align:right;"> 10788.351 </td>
   <td style="text-align:right;"> 21697.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10495.98925 </td>
   <td style="text-align:right;"> 398.195203 </td>
   <td style="text-align:right;"> 13723.632 </td>
   <td style="text-align:right;"> 21187.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3834.69576 </td>
   <td style="text-align:right;"> 184.993375 </td>
   <td style="text-align:right;"> 13715.192 </td>
   <td style="text-align:right;"> 21123.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3911.04841 </td>
   <td style="text-align:right;"> 170.811290 </td>
   <td style="text-align:right;"> 14038.927 </td>
   <td style="text-align:right;"> 21594.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41896.89088 </td>
   <td style="text-align:right;"> 931.372488 </td>
   <td style="text-align:right;"> 6260.431 </td>
   <td style="text-align:right;"> 21333.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -417.36624 </td>
   <td style="text-align:right;"> 235.497102 </td>
   <td style="text-align:right;"> 13415.451 </td>
   <td style="text-align:right;"> 21328.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -4734.23154 </td>
   <td style="text-align:right;"> 292.742113 </td>
   <td style="text-align:right;"> 15779.107 </td>
   <td style="text-align:right;"> 21323.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5245.71981 </td>
   <td style="text-align:right;"> 333.276508 </td>
   <td style="text-align:right;"> 10802.760 </td>
   <td style="text-align:right;"> 21876.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35996.05597 </td>
   <td style="text-align:right;"> 792.352479 </td>
   <td style="text-align:right;"> 11257.558 </td>
   <td style="text-align:right;"> 21480.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13792.26874 </td>
   <td style="text-align:right;"> 467.725636 </td>
   <td style="text-align:right;"> 11539.250 </td>
   <td style="text-align:right;"> 21963.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23026.29275 </td>
   <td style="text-align:right;"> 601.370032 </td>
   <td style="text-align:right;"> 10437.131 </td>
   <td style="text-align:right;"> 20811.36 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31571.34979 </td>
   <td style="text-align:right;"> 737.226458 </td>
   <td style="text-align:right;"> 10466.012 </td>
   <td style="text-align:right;"> 21089.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10000.26472 </td>
   <td style="text-align:right;"> 396.890685 </td>
   <td style="text-align:right;"> 11270.532 </td>
   <td style="text-align:right;"> 20982.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34422.71664 </td>
   <td style="text-align:right;"> 793.139749 </td>
   <td style="text-align:right;"> 8477.183 </td>
   <td style="text-align:right;"> 21325.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17991.49921 </td>
   <td style="text-align:right;"> 516.182072 </td>
   <td style="text-align:right;"> 12266.436 </td>
   <td style="text-align:right;"> 21478.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23208.64664 </td>
   <td style="text-align:right;"> 594.374040 </td>
   <td style="text-align:right;"> 12762.052 </td>
   <td style="text-align:right;"> 21582.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -3110.95581 </td>
   <td style="text-align:right;"> 298.806632 </td>
   <td style="text-align:right;"> 11710.463 </td>
   <td style="text-align:right;"> 21609.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20777.13770 </td>
   <td style="text-align:right;"> 582.509159 </td>
   <td style="text-align:right;"> 9728.218 </td>
   <td style="text-align:right;"> 21610.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34526.86381 </td>
   <td style="text-align:right;"> 792.561424 </td>
   <td style="text-align:right;"> 8916.184 </td>
   <td style="text-align:right;"> 21424.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30784.00668 </td>
   <td style="text-align:right;"> 697.079516 </td>
   <td style="text-align:right;"> 12182.603 </td>
   <td style="text-align:right;"> 21601.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18027.81156 </td>
   <td style="text-align:right;"> 535.664443 </td>
   <td style="text-align:right;"> 9571.828 </td>
   <td style="text-align:right;"> 21576.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25943.37270 </td>
   <td style="text-align:right;"> 647.527090 </td>
   <td style="text-align:right;"> 10586.117 </td>
   <td style="text-align:right;"> 21576.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46632.74570 </td>
   <td style="text-align:right;"> 951.966130 </td>
   <td style="text-align:right;"> 11789.521 </td>
   <td style="text-align:right;"> 21688.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -54377.52848 </td>
   <td style="text-align:right;"> 1069.708101 </td>
   <td style="text-align:right;"> 11842.237 </td>
   <td style="text-align:right;"> 21487.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40476.40774 </td>
   <td style="text-align:right;"> 860.455731 </td>
   <td style="text-align:right;"> 11255.634 </td>
   <td style="text-align:right;"> 21131.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43314.03868 </td>
   <td style="text-align:right;"> 906.940348 </td>
   <td style="text-align:right;"> 10899.022 </td>
   <td style="text-align:right;"> 21810.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25127.46900 </td>
   <td style="text-align:right;"> 641.610168 </td>
   <td style="text-align:right;"> 9805.891 </td>
   <td style="text-align:right;"> 21744.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12229.25454 </td>
   <td style="text-align:right;"> 428.915363 </td>
   <td style="text-align:right;"> 12789.668 </td>
   <td style="text-align:right;"> 21404.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6855.00007 </td>
   <td style="text-align:right;"> 341.982366 </td>
   <td style="text-align:right;"> 13347.193 </td>
   <td style="text-align:right;"> 21842.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15286.93708 </td>
   <td style="text-align:right;"> 481.138181 </td>
   <td style="text-align:right;"> 11756.073 </td>
   <td style="text-align:right;"> 22091.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16912.46398 </td>
   <td style="text-align:right;"> 512.873706 </td>
   <td style="text-align:right;"> 11760.932 </td>
   <td style="text-align:right;"> 21710.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30821.24793 </td>
   <td style="text-align:right;"> 717.260519 </td>
   <td style="text-align:right;"> 10144.204 </td>
   <td style="text-align:right;"> 21098.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19147.06968 </td>
   <td style="text-align:right;"> 545.994165 </td>
   <td style="text-align:right;"> 11369.477 </td>
   <td style="text-align:right;"> 21684.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18151.41284 </td>
   <td style="text-align:right;"> 527.847880 </td>
   <td style="text-align:right;"> 11833.382 </td>
   <td style="text-align:right;"> 21218.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17730.34524 </td>
   <td style="text-align:right;"> 509.787794 </td>
   <td style="text-align:right;"> 12318.727 </td>
   <td style="text-align:right;"> 20497.94 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22045.16915 </td>
   <td style="text-align:right;"> 584.210740 </td>
   <td style="text-align:right;"> 12070.179 </td>
   <td style="text-align:right;"> 21837.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6052.67506 </td>
   <td style="text-align:right;"> 336.255408 </td>
   <td style="text-align:right;"> 12079.046 </td>
   <td style="text-align:right;"> 20813.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10934.20986 </td>
   <td style="text-align:right;"> 399.858808 </td>
   <td style="text-align:right;"> 13511.704 </td>
   <td style="text-align:right;"> 21037.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25784.54534 </td>
   <td style="text-align:right;"> 641.684984 </td>
   <td style="text-align:right;"> 9916.544 </td>
   <td style="text-align:right;"> 20953.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -3294.85071 </td>
   <td style="text-align:right;"> 298.989118 </td>
   <td style="text-align:right;"> 11053.365 </td>
   <td style="text-align:right;"> 21341.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17905.66765 </td>
   <td style="text-align:right;"> 527.249263 </td>
   <td style="text-align:right;"> 11672.596 </td>
   <td style="text-align:right;"> 21630.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19820.36646 </td>
   <td style="text-align:right;"> 536.916456 </td>
   <td style="text-align:right;"> 12756.958 </td>
   <td style="text-align:right;"> 21429.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42085.91805 </td>
   <td style="text-align:right;"> 915.979914 </td>
   <td style="text-align:right;"> 7963.240 </td>
   <td style="text-align:right;"> 21358.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17977.54660 </td>
   <td style="text-align:right;"> 515.887482 </td>
   <td style="text-align:right;"> 12285.482 </td>
   <td style="text-align:right;"> 21115.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30963.95829 </td>
   <td style="text-align:right;"> 734.050966 </td>
   <td style="text-align:right;"> 9286.311 </td>
   <td style="text-align:right;"> 21776.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34117.93042 </td>
   <td style="text-align:right;"> 780.364846 </td>
   <td style="text-align:right;"> 9386.066 </td>
   <td style="text-align:right;"> 21396.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23894.35390 </td>
   <td style="text-align:right;"> 625.591219 </td>
   <td style="text-align:right;"> 9515.027 </td>
   <td style="text-align:right;"> 21312.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21840.93131 </td>
   <td style="text-align:right;"> 575.579046 </td>
   <td style="text-align:right;"> 12482.223 </td>
   <td style="text-align:right;"> 21446.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31180.72052 </td>
   <td style="text-align:right;"> 723.037148 </td>
   <td style="text-align:right;"> 10114.979 </td>
   <td style="text-align:right;"> 21189.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20420.73086 </td>
   <td style="text-align:right;"> 569.527058 </td>
   <td style="text-align:right;"> 10247.003 </td>
   <td style="text-align:right;"> 21556.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39565.28509 </td>
   <td style="text-align:right;"> 859.253725 </td>
   <td style="text-align:right;"> 9565.946 </td>
   <td style="text-align:right;"> 21319.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38597.50271 </td>
   <td style="text-align:right;"> 842.521838 </td>
   <td style="text-align:right;"> 8784.074 </td>
   <td style="text-align:right;"> 20982.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16761.86042 </td>
   <td style="text-align:right;"> 519.930718 </td>
   <td style="text-align:right;"> 10872.456 </td>
   <td style="text-align:right;"> 20915.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20771.90362 </td>
   <td style="text-align:right;"> 566.780094 </td>
   <td style="text-align:right;"> 9133.446 </td>
   <td style="text-align:right;"> 21294.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33647.52930 </td>
   <td style="text-align:right;"> 776.565128 </td>
   <td style="text-align:right;"> 10272.106 </td>
   <td style="text-align:right;"> 21860.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35309.92209 </td>
   <td style="text-align:right;"> 801.280474 </td>
   <td style="text-align:right;"> 10000.249 </td>
   <td style="text-align:right;"> 22006.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -45915.37857 </td>
   <td style="text-align:right;"> 974.292974 </td>
   <td style="text-align:right;"> 8422.817 </td>
   <td style="text-align:right;"> 21796.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30364.93611 </td>
   <td style="text-align:right;"> 727.808885 </td>
   <td style="text-align:right;"> 9698.440 </td>
   <td style="text-align:right;"> 22053.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27980.26914 </td>
   <td style="text-align:right;"> 694.378252 </td>
   <td style="text-align:right;"> 9510.021 </td>
   <td style="text-align:right;"> 22157.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27234.97742 </td>
   <td style="text-align:right;"> 678.414914 </td>
   <td style="text-align:right;"> 9552.272 </td>
   <td style="text-align:right;"> 21838.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24190.75745 </td>
   <td style="text-align:right;"> 642.752523 </td>
   <td style="text-align:right;"> 8360.304 </td>
   <td style="text-align:right;"> 21992.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36166.64394 </td>
   <td style="text-align:right;"> 795.833259 </td>
   <td style="text-align:right;"> 11569.923 </td>
   <td style="text-align:right;"> 20813.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20868.23035 </td>
   <td style="text-align:right;"> 582.137962 </td>
   <td style="text-align:right;"> 10687.469 </td>
   <td style="text-align:right;"> 21940.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36966.01103 </td>
   <td style="text-align:right;"> 831.544053 </td>
   <td style="text-align:right;"> 9646.827 </td>
   <td style="text-align:right;"> 20897.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15378.81027 </td>
   <td style="text-align:right;"> 476.767835 </td>
   <td style="text-align:right;"> 10543.763 </td>
   <td style="text-align:right;"> 21734.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29608.88021 </td>
   <td style="text-align:right;"> 712.273571 </td>
   <td style="text-align:right;"> 9978.118 </td>
   <td style="text-align:right;"> 20981.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18663.21188 </td>
   <td style="text-align:right;"> 529.367808 </td>
   <td style="text-align:right;"> 11354.410 </td>
   <td style="text-align:right;"> 21743.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19195.16204 </td>
   <td style="text-align:right;"> 539.516296 </td>
   <td style="text-align:right;"> 10936.212 </td>
   <td style="text-align:right;"> 21802.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36159.20418 </td>
   <td style="text-align:right;"> 813.506313 </td>
   <td style="text-align:right;"> 11940.854 </td>
   <td style="text-align:right;"> 21421.94 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10768.66991 </td>
   <td style="text-align:right;"> 427.182379 </td>
   <td style="text-align:right;"> 9804.750 </td>
   <td style="text-align:right;"> 21372.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14718.42792 </td>
   <td style="text-align:right;"> 481.456356 </td>
   <td style="text-align:right;"> 10159.949 </td>
   <td style="text-align:right;"> 21092.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10479.91124 </td>
   <td style="text-align:right;"> 405.128060 </td>
   <td style="text-align:right;"> 14247.824 </td>
   <td style="text-align:right;"> 21290.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5773.08884 </td>
   <td style="text-align:right;"> 349.087441 </td>
   <td style="text-align:right;"> 11396.611 </td>
   <td style="text-align:right;"> 21186.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39448.95244 </td>
   <td style="text-align:right;"> 843.059993 </td>
   <td style="text-align:right;"> 10730.027 </td>
   <td style="text-align:right;"> 21292.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31439.83943 </td>
   <td style="text-align:right;"> 739.235428 </td>
   <td style="text-align:right;"> 7982.234 </td>
   <td style="text-align:right;"> 20810.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27230.16933 </td>
   <td style="text-align:right;"> 669.116726 </td>
   <td style="text-align:right;"> 8528.117 </td>
   <td style="text-align:right;"> 20447.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41817.21172 </td>
   <td style="text-align:right;"> 900.611226 </td>
   <td style="text-align:right;"> 10556.436 </td>
   <td style="text-align:right;"> 21121.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31324.58645 </td>
   <td style="text-align:right;"> 723.524118 </td>
   <td style="text-align:right;"> 9868.164 </td>
   <td style="text-align:right;"> 21388.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23403.85460 </td>
   <td style="text-align:right;"> 601.710350 </td>
   <td style="text-align:right;"> 11124.985 </td>
   <td style="text-align:right;"> 21350.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44013.17601 </td>
   <td style="text-align:right;"> 925.170801 </td>
   <td style="text-align:right;"> 9452.135 </td>
   <td style="text-align:right;"> 21458.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22507.53575 </td>
   <td style="text-align:right;"> 599.439600 </td>
   <td style="text-align:right;"> 8767.793 </td>
   <td style="text-align:right;"> 21675.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35966.90551 </td>
   <td style="text-align:right;"> 817.204062 </td>
   <td style="text-align:right;"> 7890.366 </td>
   <td style="text-align:right;"> 21474.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14453.69634 </td>
   <td style="text-align:right;"> 467.569793 </td>
   <td style="text-align:right;"> 13352.338 </td>
   <td style="text-align:right;"> 21305.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7323.35960 </td>
   <td style="text-align:right;"> 358.850812 </td>
   <td style="text-align:right;"> 11702.281 </td>
   <td style="text-align:right;"> 21400.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -48038.12755 </td>
   <td style="text-align:right;"> 992.306625 </td>
   <td style="text-align:right;"> 9986.645 </td>
   <td style="text-align:right;"> 21525.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29470.20590 </td>
   <td style="text-align:right;"> 705.250848 </td>
   <td style="text-align:right;"> 10737.927 </td>
   <td style="text-align:right;"> 21291.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15429.42343 </td>
   <td style="text-align:right;"> 482.694843 </td>
   <td style="text-align:right;"> 10974.987 </td>
   <td style="text-align:right;"> 21616.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -4840.65108 </td>
   <td style="text-align:right;"> 328.537776 </td>
   <td style="text-align:right;"> 11609.949 </td>
   <td style="text-align:right;"> 21379.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21278.62943 </td>
   <td style="text-align:right;"> 570.842664 </td>
   <td style="text-align:right;"> 11639.790 </td>
   <td style="text-align:right;"> 21456.73 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25799.83956 </td>
   <td style="text-align:right;"> 655.154486 </td>
   <td style="text-align:right;"> 10173.766 </td>
   <td style="text-align:right;"> 21177.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35714.09448 </td>
   <td style="text-align:right;"> 797.906321 </td>
   <td style="text-align:right;"> 10457.888 </td>
   <td style="text-align:right;"> 21292.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36402.77630 </td>
   <td style="text-align:right;"> 813.821738 </td>
   <td style="text-align:right;"> 10379.969 </td>
   <td style="text-align:right;"> 21315.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17551.84811 </td>
   <td style="text-align:right;"> 522.410082 </td>
   <td style="text-align:right;"> 10496.095 </td>
   <td style="text-align:right;"> 21247.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35483.98355 </td>
   <td style="text-align:right;"> 794.707501 </td>
   <td style="text-align:right;"> 9559.423 </td>
   <td style="text-align:right;"> 21530.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17344.51497 </td>
   <td style="text-align:right;"> 515.914615 </td>
   <td style="text-align:right;"> 11666.539 </td>
   <td style="text-align:right;"> 21465.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27223.05601 </td>
   <td style="text-align:right;"> 676.521372 </td>
   <td style="text-align:right;"> 12492.420 </td>
   <td style="text-align:right;"> 21530.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32935.12085 </td>
   <td style="text-align:right;"> 765.062966 </td>
   <td style="text-align:right;"> 11665.967 </td>
   <td style="text-align:right;"> 21446.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6526.60440 </td>
   <td style="text-align:right;"> 334.455315 </td>
   <td style="text-align:right;"> 12313.029 </td>
   <td style="text-align:right;"> 21783.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24232.00846 </td>
   <td style="text-align:right;"> 620.459403 </td>
   <td style="text-align:right;"> 11796.909 </td>
   <td style="text-align:right;"> 21783.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16751.56964 </td>
   <td style="text-align:right;"> 514.527093 </td>
   <td style="text-align:right;"> 11467.043 </td>
   <td style="text-align:right;"> 21672.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33999.36559 </td>
   <td style="text-align:right;"> 773.982414 </td>
   <td style="text-align:right;"> 9520.900 </td>
   <td style="text-align:right;"> 21223.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11204.09002 </td>
   <td style="text-align:right;"> 409.716608 </td>
   <td style="text-align:right;"> 13947.338 </td>
   <td style="text-align:right;"> 22025.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18057.24133 </td>
   <td style="text-align:right;"> 524.605637 </td>
   <td style="text-align:right;"> 10779.089 </td>
   <td style="text-align:right;"> 21180.05 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13429.67473 </td>
   <td style="text-align:right;"> 464.276722 </td>
   <td style="text-align:right;"> 11881.701 </td>
   <td style="text-align:right;"> 21585.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37367.43173 </td>
   <td style="text-align:right;"> 820.602176 </td>
   <td style="text-align:right;"> 9313.881 </td>
   <td style="text-align:right;"> 21210.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30179.36448 </td>
   <td style="text-align:right;"> 723.236030 </td>
   <td style="text-align:right;"> 9691.540 </td>
   <td style="text-align:right;"> 21655.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29750.89948 </td>
   <td style="text-align:right;"> 702.227516 </td>
   <td style="text-align:right;"> 11074.923 </td>
   <td style="text-align:right;"> 21188.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27944.83370 </td>
   <td style="text-align:right;"> 699.924621 </td>
   <td style="text-align:right;"> 8456.545 </td>
   <td style="text-align:right;"> 21206.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29424.95247 </td>
   <td style="text-align:right;"> 700.666552 </td>
   <td style="text-align:right;"> 11919.098 </td>
   <td style="text-align:right;"> 20757.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -3024.32030 </td>
   <td style="text-align:right;"> 308.239365 </td>
   <td style="text-align:right;"> 11806.743 </td>
   <td style="text-align:right;"> 20773.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37775.24950 </td>
   <td style="text-align:right;"> 823.219059 </td>
   <td style="text-align:right;"> 10720.045 </td>
   <td style="text-align:right;"> 20939.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30600.03599 </td>
   <td style="text-align:right;"> 724.025389 </td>
   <td style="text-align:right;"> 8552.399 </td>
   <td style="text-align:right;"> 21075.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17393.57798 </td>
   <td style="text-align:right;"> 511.600676 </td>
   <td style="text-align:right;"> 11786.884 </td>
   <td style="text-align:right;"> 21601.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -45637.04969 </td>
   <td style="text-align:right;"> 962.202075 </td>
   <td style="text-align:right;"> 7995.779 </td>
   <td style="text-align:right;"> 21773.84 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11929.91989 </td>
   <td style="text-align:right;"> 430.644140 </td>
   <td style="text-align:right;"> 12860.842 </td>
   <td style="text-align:right;"> 21171.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30072.20378 </td>
   <td style="text-align:right;"> 706.253978 </td>
   <td style="text-align:right;"> 10150.300 </td>
   <td style="text-align:right;"> 21199.43 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14818.59099 </td>
   <td style="text-align:right;"> 480.320140 </td>
   <td style="text-align:right;"> 11930.159 </td>
   <td style="text-align:right;"> 21588.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28445.66490 </td>
   <td style="text-align:right;"> 681.922580 </td>
   <td style="text-align:right;"> 9473.595 </td>
   <td style="text-align:right;"> 21058.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39195.05815 </td>
   <td style="text-align:right;"> 844.410544 </td>
   <td style="text-align:right;"> 10554.665 </td>
   <td style="text-align:right;"> 21748.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37649.89263 </td>
   <td style="text-align:right;"> 846.302518 </td>
   <td style="text-align:right;"> 7526.678 </td>
   <td style="text-align:right;"> 21805.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30520.97674 </td>
   <td style="text-align:right;"> 719.968968 </td>
   <td style="text-align:right;"> 10043.936 </td>
   <td style="text-align:right;"> 21394.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30139.30926 </td>
   <td style="text-align:right;"> 720.182596 </td>
   <td style="text-align:right;"> 9249.941 </td>
   <td style="text-align:right;"> 21067.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38867.75054 </td>
   <td style="text-align:right;"> 840.683726 </td>
   <td style="text-align:right;"> 9929.572 </td>
   <td style="text-align:right;"> 21227.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5203.08422 </td>
   <td style="text-align:right;"> 348.000012 </td>
   <td style="text-align:right;"> 10621.383 </td>
   <td style="text-align:right;"> 21575.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12165.24846 </td>
   <td style="text-align:right;"> 432.250001 </td>
   <td style="text-align:right;"> 10865.375 </td>
   <td style="text-align:right;"> 21305.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23928.09179 </td>
   <td style="text-align:right;"> 626.378269 </td>
   <td style="text-align:right;"> 10376.896 </td>
   <td style="text-align:right;"> 20895.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42874.87515 </td>
   <td style="text-align:right;"> 906.361935 </td>
   <td style="text-align:right;"> 8855.800 </td>
   <td style="text-align:right;"> 21510.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27122.36099 </td>
   <td style="text-align:right;"> 674.053598 </td>
   <td style="text-align:right;"> 9193.381 </td>
   <td style="text-align:right;"> 21428.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34561.97043 </td>
   <td style="text-align:right;"> 778.999711 </td>
   <td style="text-align:right;"> 10161.882 </td>
   <td style="text-align:right;"> 21352.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40283.78559 </td>
   <td style="text-align:right;"> 861.208538 </td>
   <td style="text-align:right;"> 9902.690 </td>
   <td style="text-align:right;"> 21435.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32397.95365 </td>
   <td style="text-align:right;"> 757.191104 </td>
   <td style="text-align:right;"> 8375.832 </td>
   <td style="text-align:right;"> 21685.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -55693.64379 </td>
   <td style="text-align:right;"> 1107.237787 </td>
   <td style="text-align:right;"> 8314.630 </td>
   <td style="text-align:right;"> 21341.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -1556.14708 </td>
   <td style="text-align:right;"> 273.555590 </td>
   <td style="text-align:right;"> 12785.889 </td>
   <td style="text-align:right;"> 21246.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18881.90956 </td>
   <td style="text-align:right;"> 537.408261 </td>
   <td style="text-align:right;"> 11985.548 </td>
   <td style="text-align:right;"> 21759.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37198.84146 </td>
   <td style="text-align:right;"> 838.170063 </td>
   <td style="text-align:right;"> 8631.714 </td>
   <td style="text-align:right;"> 21584.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43691.02242 </td>
   <td style="text-align:right;"> 917.076262 </td>
   <td style="text-align:right;"> 8722.674 </td>
   <td style="text-align:right;"> 21384.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13677.53987 </td>
   <td style="text-align:right;"> 467.956348 </td>
   <td style="text-align:right;"> 11548.360 </td>
   <td style="text-align:right;"> 21457.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16018.01791 </td>
   <td style="text-align:right;"> 500.173602 </td>
   <td style="text-align:right;"> 11819.222 </td>
   <td style="text-align:right;"> 21490.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37583.35699 </td>
   <td style="text-align:right;"> 819.266576 </td>
   <td style="text-align:right;"> 10067.146 </td>
   <td style="text-align:right;"> 21177.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24811.12999 </td>
   <td style="text-align:right;"> 636.748988 </td>
   <td style="text-align:right;"> 9823.587 </td>
   <td style="text-align:right;"> 21223.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39418.06455 </td>
   <td style="text-align:right;"> 834.633086 </td>
   <td style="text-align:right;"> 11738.696 </td>
   <td style="text-align:right;"> 20998.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23074.43332 </td>
   <td style="text-align:right;"> 595.608128 </td>
   <td style="text-align:right;"> 14218.695 </td>
   <td style="text-align:right;"> 21798.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12722.30779 </td>
   <td style="text-align:right;"> 456.815475 </td>
   <td style="text-align:right;"> 11478.630 </td>
   <td style="text-align:right;"> 21539.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15581.56440 </td>
   <td style="text-align:right;"> 479.989691 </td>
   <td style="text-align:right;"> 14010.540 </td>
   <td style="text-align:right;"> 21437.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31932.59373 </td>
   <td style="text-align:right;"> 760.151447 </td>
   <td style="text-align:right;"> 9282.788 </td>
   <td style="text-align:right;"> 21883.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30867.09371 </td>
   <td style="text-align:right;"> 722.323507 </td>
   <td style="text-align:right;"> 9408.031 </td>
   <td style="text-align:right;"> 21066.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26746.40423 </td>
   <td style="text-align:right;"> 649.254295 </td>
   <td style="text-align:right;"> 12649.824 </td>
   <td style="text-align:right;"> 21446.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7076.30584 </td>
   <td style="text-align:right;"> 369.434866 </td>
   <td style="text-align:right;"> 11591.941 </td>
   <td style="text-align:right;"> 21327.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29130.86345 </td>
   <td style="text-align:right;"> 689.405245 </td>
   <td style="text-align:right;"> 10279.587 </td>
   <td style="text-align:right;"> 21384.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31487.70682 </td>
   <td style="text-align:right;"> 739.217719 </td>
   <td style="text-align:right;"> 9499.885 </td>
   <td style="text-align:right;"> 21414.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28056.72540 </td>
   <td style="text-align:right;"> 683.481747 </td>
   <td style="text-align:right;"> 9717.076 </td>
   <td style="text-align:right;"> 21475.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -47031.13520 </td>
   <td style="text-align:right;"> 970.820767 </td>
   <td style="text-align:right;"> 9326.792 </td>
   <td style="text-align:right;"> 21355.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30239.18191 </td>
   <td style="text-align:right;"> 721.231701 </td>
   <td style="text-align:right;"> 9434.287 </td>
   <td style="text-align:right;"> 21403.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35997.48319 </td>
   <td style="text-align:right;"> 811.731009 </td>
   <td style="text-align:right;"> 9658.445 </td>
   <td style="text-align:right;"> 21237.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22685.07215 </td>
   <td style="text-align:right;"> 601.107859 </td>
   <td style="text-align:right;"> 10792.271 </td>
   <td style="text-align:right;"> 21395.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17257.19386 </td>
   <td style="text-align:right;"> 518.739511 </td>
   <td style="text-align:right;"> 10262.393 </td>
   <td style="text-align:right;"> 21557.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14367.17119 </td>
   <td style="text-align:right;"> 475.096746 </td>
   <td style="text-align:right;"> 10931.316 </td>
   <td style="text-align:right;"> 21607.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29554.83765 </td>
   <td style="text-align:right;"> 701.415470 </td>
   <td style="text-align:right;"> 10745.923 </td>
   <td style="text-align:right;"> 21790.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7422.09981 </td>
   <td style="text-align:right;"> 352.390287 </td>
   <td style="text-align:right;"> 12630.442 </td>
   <td style="text-align:right;"> 21086.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27319.36731 </td>
   <td style="text-align:right;"> 658.168023 </td>
   <td style="text-align:right;"> 10879.037 </td>
   <td style="text-align:right;"> 21661.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43552.52639 </td>
   <td style="text-align:right;"> 909.038629 </td>
   <td style="text-align:right;"> 8931.008 </td>
   <td style="text-align:right;"> 21411.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21905.35193 </td>
   <td style="text-align:right;"> 568.444926 </td>
   <td style="text-align:right;"> 11325.402 </td>
   <td style="text-align:right;"> 21248.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26527.91643 </td>
   <td style="text-align:right;"> 643.601974 </td>
   <td style="text-align:right;"> 11290.643 </td>
   <td style="text-align:right;"> 21213.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13786.36051 </td>
   <td style="text-align:right;"> 459.740359 </td>
   <td style="text-align:right;"> 11322.713 </td>
   <td style="text-align:right;"> 21868.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7666.52247 </td>
   <td style="text-align:right;"> 366.147365 </td>
   <td style="text-align:right;"> 11865.356 </td>
   <td style="text-align:right;"> 20689.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12639.87228 </td>
   <td style="text-align:right;"> 438.725130 </td>
   <td style="text-align:right;"> 13819.096 </td>
   <td style="text-align:right;"> 21517.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12723.39271 </td>
   <td style="text-align:right;"> 453.727594 </td>
   <td style="text-align:right;"> 10640.691 </td>
   <td style="text-align:right;"> 21153.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28435.09507 </td>
   <td style="text-align:right;"> 690.404809 </td>
   <td style="text-align:right;"> 11345.805 </td>
   <td style="text-align:right;"> 21513.73 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18147.61222 </td>
   <td style="text-align:right;"> 509.868904 </td>
   <td style="text-align:right;"> 12257.147 </td>
   <td style="text-align:right;"> 21228.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 251.90729 </td>
   <td style="text-align:right;"> 230.492260 </td>
   <td style="text-align:right;"> 11909.096 </td>
   <td style="text-align:right;"> 21216.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22067.91959 </td>
   <td style="text-align:right;"> 565.822704 </td>
   <td style="text-align:right;"> 11682.622 </td>
   <td style="text-align:right;"> 21090.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10996.96288 </td>
   <td style="text-align:right;"> 399.981150 </td>
   <td style="text-align:right;"> 11256.934 </td>
   <td style="text-align:right;"> 21184.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29168.40518 </td>
   <td style="text-align:right;"> 686.057042 </td>
   <td style="text-align:right;"> 10728.931 </td>
   <td style="text-align:right;"> 21706.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31825.62303 </td>
   <td style="text-align:right;"> 736.070846 </td>
   <td style="text-align:right;"> 10782.634 </td>
   <td style="text-align:right;"> 21505.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30982.68075 </td>
   <td style="text-align:right;"> 726.996286 </td>
   <td style="text-align:right;"> 9744.448 </td>
   <td style="text-align:right;"> 21092.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21525.48721 </td>
   <td style="text-align:right;"> 588.784772 </td>
   <td style="text-align:right;"> 10510.352 </td>
   <td style="text-align:right;"> 21680.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -45968.51248 </td>
   <td style="text-align:right;"> 948.063792 </td>
   <td style="text-align:right;"> 10078.129 </td>
   <td style="text-align:right;"> 21196.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27973.09363 </td>
   <td style="text-align:right;"> 696.531009 </td>
   <td style="text-align:right;"> 8378.534 </td>
   <td style="text-align:right;"> 21423.73 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14424.40212 </td>
   <td style="text-align:right;"> 457.838274 </td>
   <td style="text-align:right;"> 12943.913 </td>
   <td style="text-align:right;"> 21558.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43549.83098 </td>
   <td style="text-align:right;"> 929.830410 </td>
   <td style="text-align:right;"> 9218.000 </td>
   <td style="text-align:right;"> 21587.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -57928.29330 </td>
   <td style="text-align:right;"> 1144.099876 </td>
   <td style="text-align:right;"> 6103.557 </td>
   <td style="text-align:right;"> 21152.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35439.15996 </td>
   <td style="text-align:right;"> 803.615010 </td>
   <td style="text-align:right;"> 9755.805 </td>
   <td style="text-align:right;"> 21858.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39663.98322 </td>
   <td style="text-align:right;"> 883.673213 </td>
   <td style="text-align:right;"> 8108.900 </td>
   <td style="text-align:right;"> 22028.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25517.37969 </td>
   <td style="text-align:right;"> 632.325811 </td>
   <td style="text-align:right;"> 9694.114 </td>
   <td style="text-align:right;"> 20811.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35243.21951 </td>
   <td style="text-align:right;"> 785.780861 </td>
   <td style="text-align:right;"> 8772.208 </td>
   <td style="text-align:right;"> 20799.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12352.05410 </td>
   <td style="text-align:right;"> 454.707070 </td>
   <td style="text-align:right;"> 12078.739 </td>
   <td style="text-align:right;"> 21339.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35498.08063 </td>
   <td style="text-align:right;"> 793.382925 </td>
   <td style="text-align:right;"> 8372.812 </td>
   <td style="text-align:right;"> 21193.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40777.41058 </td>
   <td style="text-align:right;"> 886.370473 </td>
   <td style="text-align:right;"> 9459.545 </td>
   <td style="text-align:right;"> 20958.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -53539.37354 </td>
   <td style="text-align:right;"> 1091.868520 </td>
   <td style="text-align:right;"> 6496.598 </td>
   <td style="text-align:right;"> 22070.36 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -48391.83812 </td>
   <td style="text-align:right;"> 1001.080972 </td>
   <td style="text-align:right;"> 8089.076 </td>
   <td style="text-align:right;"> 22230.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21894.29543 </td>
   <td style="text-align:right;"> 585.788926 </td>
   <td style="text-align:right;"> 10846.352 </td>
   <td style="text-align:right;"> 20684.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18698.77625 </td>
   <td style="text-align:right;"> 544.718670 </td>
   <td style="text-align:right;"> 11664.438 </td>
   <td style="text-align:right;"> 22296.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19821.30572 </td>
   <td style="text-align:right;"> 561.640638 </td>
   <td style="text-align:right;"> 11479.286 </td>
   <td style="text-align:right;"> 22260.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18543.36028 </td>
   <td style="text-align:right;"> 543.986753 </td>
   <td style="text-align:right;"> 10109.082 </td>
   <td style="text-align:right;"> 21580.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20567.90907 </td>
   <td style="text-align:right;"> 553.240476 </td>
   <td style="text-align:right;"> 12513.380 </td>
   <td style="text-align:right;"> 20989.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31922.69589 </td>
   <td style="text-align:right;"> 735.915951 </td>
   <td style="text-align:right;"> 11554.114 </td>
   <td style="text-align:right;"> 21830.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9487.02588 </td>
   <td style="text-align:right;"> 97.054994 </td>
   <td style="text-align:right;"> 13404.359 </td>
   <td style="text-align:right;"> 21639.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8704.57193 </td>
   <td style="text-align:right;"> 105.915726 </td>
   <td style="text-align:right;"> 14393.527 </td>
   <td style="text-align:right;"> 21470.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11895.00367 </td>
   <td style="text-align:right;"> 406.432688 </td>
   <td style="text-align:right;"> 14773.083 </td>
   <td style="text-align:right;"> 21653.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3873.40960 </td>
   <td style="text-align:right;"> 186.400634 </td>
   <td style="text-align:right;"> 12762.042 </td>
   <td style="text-align:right;"> 20690.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5528.77524 </td>
   <td style="text-align:right;"> 168.854291 </td>
   <td style="text-align:right;"> 12177.561 </td>
   <td style="text-align:right;"> 20558.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28952.46648 </td>
   <td style="text-align:right;"> 670.507040 </td>
   <td style="text-align:right;"> 12890.932 </td>
   <td style="text-align:right;"> 21861.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6164.68855 </td>
   <td style="text-align:right;"> 346.533175 </td>
   <td style="text-align:right;"> 11806.079 </td>
   <td style="text-align:right;"> 21427.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24837.27885 </td>
   <td style="text-align:right;"> 630.126944 </td>
   <td style="text-align:right;"> 10700.486 </td>
   <td style="text-align:right;"> 21300.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26634.69585 </td>
   <td style="text-align:right;"> 655.679429 </td>
   <td style="text-align:right;"> 10680.456 </td>
   <td style="text-align:right;"> 21294.94 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33260.10242 </td>
   <td style="text-align:right;"> 752.059571 </td>
   <td style="text-align:right;"> 10366.017 </td>
   <td style="text-align:right;"> 21276.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33067.93471 </td>
   <td style="text-align:right;"> 763.423161 </td>
   <td style="text-align:right;"> 10453.793 </td>
   <td style="text-align:right;"> 21432.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26704.43446 </td>
   <td style="text-align:right;"> 646.573103 </td>
   <td style="text-align:right;"> 11750.736 </td>
   <td style="text-align:right;"> 21096.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24023.60818 </td>
   <td style="text-align:right;"> 611.163693 </td>
   <td style="text-align:right;"> 10125.543 </td>
   <td style="text-align:right;"> 21862.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19525.02733 </td>
   <td style="text-align:right;"> 540.400764 </td>
   <td style="text-align:right;"> 10852.166 </td>
   <td style="text-align:right;"> 21478.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15197.06028 </td>
   <td style="text-align:right;"> 473.459377 </td>
   <td style="text-align:right;"> 12006.021 </td>
   <td style="text-align:right;"> 20583.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -52664.84727 </td>
   <td style="text-align:right;"> 1070.362375 </td>
   <td style="text-align:right;"> 7526.013 </td>
   <td style="text-align:right;"> 21562.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -58030.46165 </td>
   <td style="text-align:right;"> 1168.259813 </td>
   <td style="text-align:right;"> 4909.893 </td>
   <td style="text-align:right;"> 21324.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -56098.28129 </td>
   <td style="text-align:right;"> 1125.450760 </td>
   <td style="text-align:right;"> 6552.294 </td>
   <td style="text-align:right;"> 21093.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29514.07900 </td>
   <td style="text-align:right;"> 727.141614 </td>
   <td style="text-align:right;"> 9622.398 </td>
   <td style="text-align:right;"> 21215.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40053.28926 </td>
   <td style="text-align:right;"> 880.997675 </td>
   <td style="text-align:right;"> 9953.000 </td>
   <td style="text-align:right;"> 21200.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23758.45818 </td>
   <td style="text-align:right;"> 609.699859 </td>
   <td style="text-align:right;"> 11009.782 </td>
   <td style="text-align:right;"> 21829.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24025.21488 </td>
   <td style="text-align:right;"> 623.245425 </td>
   <td style="text-align:right;"> 9608.660 </td>
   <td style="text-align:right;"> 21067.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27357.64631 </td>
   <td style="text-align:right;"> 665.599197 </td>
   <td style="text-align:right;"> 12125.250 </td>
   <td style="text-align:right;"> 21770.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24684.63718 </td>
   <td style="text-align:right;"> 627.681436 </td>
   <td style="text-align:right;"> 11754.397 </td>
   <td style="text-align:right;"> 22024.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12208.19765 </td>
   <td style="text-align:right;"> 436.309273 </td>
   <td style="text-align:right;"> 10705.287 </td>
   <td style="text-align:right;"> 21475.24 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26016.55006 </td>
   <td style="text-align:right;"> 638.237412 </td>
   <td style="text-align:right;"> 12011.845 </td>
   <td style="text-align:right;"> 21889.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22753.59168 </td>
   <td style="text-align:right;"> 614.427432 </td>
   <td style="text-align:right;"> 9427.564 </td>
   <td style="text-align:right;"> 21358.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26882.81923 </td>
   <td style="text-align:right;"> 674.118165 </td>
   <td style="text-align:right;"> 10311.130 </td>
   <td style="text-align:right;"> 21438.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19450.96387 </td>
   <td style="text-align:right;"> 553.805324 </td>
   <td style="text-align:right;"> 8968.267 </td>
   <td style="text-align:right;"> 21242.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38250.31117 </td>
   <td style="text-align:right;"> 828.817434 </td>
   <td style="text-align:right;"> 10356.404 </td>
   <td style="text-align:right;"> 21004.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35080.64495 </td>
   <td style="text-align:right;"> 791.026600 </td>
   <td style="text-align:right;"> 10576.988 </td>
   <td style="text-align:right;"> 21772.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33450.17906 </td>
   <td style="text-align:right;"> 741.792464 </td>
   <td style="text-align:right;"> 11790.453 </td>
   <td style="text-align:right;"> 20936.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10417.57006 </td>
   <td style="text-align:right;"> 424.634429 </td>
   <td style="text-align:right;"> 10427.426 </td>
   <td style="text-align:right;"> 21372.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11870.94097 </td>
   <td style="text-align:right;"> 428.574668 </td>
   <td style="text-align:right;"> 11341.206 </td>
   <td style="text-align:right;"> 21455.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31944.89057 </td>
   <td style="text-align:right;"> 736.715221 </td>
   <td style="text-align:right;"> 10901.393 </td>
   <td style="text-align:right;"> 20497.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35813.29506 </td>
   <td style="text-align:right;"> 814.749650 </td>
   <td style="text-align:right;"> 8045.066 </td>
   <td style="text-align:right;"> 21873.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34851.77991 </td>
   <td style="text-align:right;"> 810.385126 </td>
   <td style="text-align:right;"> 6897.693 </td>
   <td style="text-align:right;"> 22134.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6038.56584 </td>
   <td style="text-align:right;"> 333.880170 </td>
   <td style="text-align:right;"> 12023.282 </td>
   <td style="text-align:right;"> 20839.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17202.33926 </td>
   <td style="text-align:right;"> 500.773175 </td>
   <td style="text-align:right;"> 12494.858 </td>
   <td style="text-align:right;"> 21022.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39663.71984 </td>
   <td style="text-align:right;"> 872.156594 </td>
   <td style="text-align:right;"> 7980.594 </td>
   <td style="text-align:right;"> 21734.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38752.05632 </td>
   <td style="text-align:right;"> 861.286232 </td>
   <td style="text-align:right;"> 8994.762 </td>
   <td style="text-align:right;"> 21645.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33143.85959 </td>
   <td style="text-align:right;"> 756.207451 </td>
   <td style="text-align:right;"> 10658.104 </td>
   <td style="text-align:right;"> 21622.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43710.31869 </td>
   <td style="text-align:right;"> 920.676564 </td>
   <td style="text-align:right;"> 9163.282 </td>
   <td style="text-align:right;"> 21055.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13107.24906 </td>
   <td style="text-align:right;"> 452.900293 </td>
   <td style="text-align:right;"> 11040.230 </td>
   <td style="text-align:right;"> 21164.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41545.26207 </td>
   <td style="text-align:right;"> 887.551144 </td>
   <td style="text-align:right;"> 10676.385 </td>
   <td style="text-align:right;"> 21199.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44700.66666 </td>
   <td style="text-align:right;"> 936.799171 </td>
   <td style="text-align:right;"> 10403.840 </td>
   <td style="text-align:right;"> 21162.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23674.41311 </td>
   <td style="text-align:right;"> 610.630833 </td>
   <td style="text-align:right;"> 8927.127 </td>
   <td style="text-align:right;"> 21374.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23551.65617 </td>
   <td style="text-align:right;"> 603.303161 </td>
   <td style="text-align:right;"> 9495.234 </td>
   <td style="text-align:right;"> 21309.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11851.80941 </td>
   <td style="text-align:right;"> 432.071504 </td>
   <td style="text-align:right;"> 12427.092 </td>
   <td style="text-align:right;"> 21127.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32044.72875 </td>
   <td style="text-align:right;"> 724.201415 </td>
   <td style="text-align:right;"> 9935.992 </td>
   <td style="text-align:right;"> 21101.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21035.19295 </td>
   <td style="text-align:right;"> 586.808854 </td>
   <td style="text-align:right;"> 10846.042 </td>
   <td style="text-align:right;"> 20827.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32760.87174 </td>
   <td style="text-align:right;"> 749.651633 </td>
   <td style="text-align:right;"> 10520.618 </td>
   <td style="text-align:right;"> 21750.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10854.00101 </td>
   <td style="text-align:right;"> 413.621620 </td>
   <td style="text-align:right;"> 11918.383 </td>
   <td style="text-align:right;"> 21139.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -3626.34422 </td>
   <td style="text-align:right;"> 303.523245 </td>
   <td style="text-align:right;"> 12668.947 </td>
   <td style="text-align:right;"> 20971.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15195.17165 </td>
   <td style="text-align:right;"> 478.848658 </td>
   <td style="text-align:right;"> 12468.028 </td>
   <td style="text-align:right;"> 21116.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30338.64396 </td>
   <td style="text-align:right;"> 713.153275 </td>
   <td style="text-align:right;"> 10823.045 </td>
   <td style="text-align:right;"> 21833.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18187.94163 </td>
   <td style="text-align:right;"> 531.731984 </td>
   <td style="text-align:right;"> 11392.415 </td>
   <td style="text-align:right;"> 20977.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29862.19217 </td>
   <td style="text-align:right;"> 717.773931 </td>
   <td style="text-align:right;"> 10416.692 </td>
   <td style="text-align:right;"> 21830.94 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21011.59271 </td>
   <td style="text-align:right;"> 558.565653 </td>
   <td style="text-align:right;"> 11911.563 </td>
   <td style="text-align:right;"> 20921.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25337.54835 </td>
   <td style="text-align:right;"> 644.361628 </td>
   <td style="text-align:right;"> 11868.071 </td>
   <td style="text-align:right;"> 21816.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16284.84604 </td>
   <td style="text-align:right;"> 490.664957 </td>
   <td style="text-align:right;"> 10753.126 </td>
   <td style="text-align:right;"> 20718.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6516.35959 </td>
   <td style="text-align:right;"> 349.383198 </td>
   <td style="text-align:right;"> 13650.980 </td>
   <td style="text-align:right;"> 21309.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28898.00437 </td>
   <td style="text-align:right;"> 676.473567 </td>
   <td style="text-align:right;"> 10851.591 </td>
   <td style="text-align:right;"> 21581.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23337.21291 </td>
   <td style="text-align:right;"> 598.830039 </td>
   <td style="text-align:right;"> 9657.497 </td>
   <td style="text-align:right;"> 21786.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27846.41191 </td>
   <td style="text-align:right;"> 674.791871 </td>
   <td style="text-align:right;"> 9997.475 </td>
   <td style="text-align:right;"> 21362.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40921.47523 </td>
   <td style="text-align:right;"> 885.375243 </td>
   <td style="text-align:right;"> 8821.952 </td>
   <td style="text-align:right;"> 21653.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29326.28706 </td>
   <td style="text-align:right;"> 700.443545 </td>
   <td style="text-align:right;"> 10138.621 </td>
   <td style="text-align:right;"> 21590.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18032.67117 </td>
   <td style="text-align:right;"> 518.711535 </td>
   <td style="text-align:right;"> 11420.079 </td>
   <td style="text-align:right;"> 20862.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20564.98518 </td>
   <td style="text-align:right;"> 549.573768 </td>
   <td style="text-align:right;"> 11944.695 </td>
   <td style="text-align:right;"> 20767.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12746.24226 </td>
   <td style="text-align:right;"> 432.859415 </td>
   <td style="text-align:right;"> 12777.444 </td>
   <td style="text-align:right;"> 21105.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43603.80662 </td>
   <td style="text-align:right;"> 930.587544 </td>
   <td style="text-align:right;"> 8568.846 </td>
   <td style="text-align:right;"> 21606.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41765.50495 </td>
   <td style="text-align:right;"> 900.307636 </td>
   <td style="text-align:right;"> 9677.098 </td>
   <td style="text-align:right;"> 21167.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39524.68150 </td>
   <td style="text-align:right;"> 881.575863 </td>
   <td style="text-align:right;"> 7956.044 </td>
   <td style="text-align:right;"> 21310.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14778.67173 </td>
   <td style="text-align:right;"> 464.526935 </td>
   <td style="text-align:right;"> 12543.569 </td>
   <td style="text-align:right;"> 21049.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15214.78084 </td>
   <td style="text-align:right;"> 477.310180 </td>
   <td style="text-align:right;"> 11319.802 </td>
   <td style="text-align:right;"> 21116.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37865.78954 </td>
   <td style="text-align:right;"> 836.942553 </td>
   <td style="text-align:right;"> 9406.267 </td>
   <td style="text-align:right;"> 21179.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22961.91950 </td>
   <td style="text-align:right;"> 612.347662 </td>
   <td style="text-align:right;"> 10340.065 </td>
   <td style="text-align:right;"> 21488.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17340.57294 </td>
   <td style="text-align:right;"> 511.420187 </td>
   <td style="text-align:right;"> 11346.352 </td>
   <td style="text-align:right;"> 21472.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18576.36255 </td>
   <td style="text-align:right;"> 523.726353 </td>
   <td style="text-align:right;"> 12125.067 </td>
   <td style="text-align:right;"> 21672.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -4762.91813 </td>
   <td style="text-align:right;"> 328.764635 </td>
   <td style="text-align:right;"> 12573.986 </td>
   <td style="text-align:right;"> 21315.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6363.86482 </td>
   <td style="text-align:right;"> 342.436486 </td>
   <td style="text-align:right;"> 13347.764 </td>
   <td style="text-align:right;"> 20920.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12862.53004 </td>
   <td style="text-align:right;"> 445.752590 </td>
   <td style="text-align:right;"> 12811.924 </td>
   <td style="text-align:right;"> 20951.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33710.93098 </td>
   <td style="text-align:right;"> 755.851387 </td>
   <td style="text-align:right;"> 10174.290 </td>
   <td style="text-align:right;"> 21579.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38864.40523 </td>
   <td style="text-align:right;"> 845.177111 </td>
   <td style="text-align:right;"> 10336.205 </td>
   <td style="text-align:right;"> 21283.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16672.77070 </td>
   <td style="text-align:right;"> 495.784263 </td>
   <td style="text-align:right;"> 10867.892 </td>
   <td style="text-align:right;"> 21410.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26859.55910 </td>
   <td style="text-align:right;"> 659.760162 </td>
   <td style="text-align:right;"> 10415.213 </td>
   <td style="text-align:right;"> 21187.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28114.13096 </td>
   <td style="text-align:right;"> 677.583829 </td>
   <td style="text-align:right;"> 10583.212 </td>
   <td style="text-align:right;"> 21816.24 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33874.50126 </td>
   <td style="text-align:right;"> 762.395995 </td>
   <td style="text-align:right;"> 10099.048 </td>
   <td style="text-align:right;"> 21609.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43628.26809 </td>
   <td style="text-align:right;"> 937.540143 </td>
   <td style="text-align:right;"> 6390.864 </td>
   <td style="text-align:right;"> 21133.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41679.04845 </td>
   <td style="text-align:right;"> 910.137179 </td>
   <td style="text-align:right;"> 6364.090 </td>
   <td style="text-align:right;"> 20899.43 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -48684.95448 </td>
   <td style="text-align:right;"> 1011.135234 </td>
   <td style="text-align:right;"> 7580.264 </td>
   <td style="text-align:right;"> 21121.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -49540.21657 </td>
   <td style="text-align:right;"> 1016.112102 </td>
   <td style="text-align:right;"> 8423.293 </td>
   <td style="text-align:right;"> 20992.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18999.16231 </td>
   <td style="text-align:right;"> 538.979242 </td>
   <td style="text-align:right;"> 10608.986 </td>
   <td style="text-align:right;"> 21407.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11707.81911 </td>
   <td style="text-align:right;"> 439.662196 </td>
   <td style="text-align:right;"> 10696.107 </td>
   <td style="text-align:right;"> 21648.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27648.25740 </td>
   <td style="text-align:right;"> 674.272979 </td>
   <td style="text-align:right;"> 11994.688 </td>
   <td style="text-align:right;"> 21472.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32937.72215 </td>
   <td style="text-align:right;"> 753.201513 </td>
   <td style="text-align:right;"> 11532.056 </td>
   <td style="text-align:right;"> 21723.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26270.05109 </td>
   <td style="text-align:right;"> 654.581216 </td>
   <td style="text-align:right;"> 9943.569 </td>
   <td style="text-align:right;"> 21447.36 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28644.75584 </td>
   <td style="text-align:right;"> 686.623831 </td>
   <td style="text-align:right;"> 10415.319 </td>
   <td style="text-align:right;"> 21406.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44563.92943 </td>
   <td style="text-align:right;"> 943.188109 </td>
   <td style="text-align:right;"> 8351.801 </td>
   <td style="text-align:right;"> 21930.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -3702.87025 </td>
   <td style="text-align:right;"> 300.126098 </td>
   <td style="text-align:right;"> 12635.565 </td>
   <td style="text-align:right;"> 20972.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5643.43964 </td>
   <td style="text-align:right;"> 331.319700 </td>
   <td style="text-align:right;"> 12959.440 </td>
   <td style="text-align:right;"> 21336.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18312.16353 </td>
   <td style="text-align:right;"> 523.593856 </td>
   <td style="text-align:right;"> 12332.727 </td>
   <td style="text-align:right;"> 21318.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33661.00519 </td>
   <td style="text-align:right;"> 764.316562 </td>
   <td style="text-align:right;"> 10244.306 </td>
   <td style="text-align:right;"> 21451.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22135.58046 </td>
   <td style="text-align:right;"> 586.898569 </td>
   <td style="text-align:right;"> 11632.764 </td>
   <td style="text-align:right;"> 21373.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30950.53408 </td>
   <td style="text-align:right;"> 735.494398 </td>
   <td style="text-align:right;"> 8779.769 </td>
   <td style="text-align:right;"> 21402.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19863.72395 </td>
   <td style="text-align:right;"> 564.221937 </td>
   <td style="text-align:right;"> 9383.580 </td>
   <td style="text-align:right;"> 21421.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23504.79134 </td>
   <td style="text-align:right;"> 625.290401 </td>
   <td style="text-align:right;"> 9127.130 </td>
   <td style="text-align:right;"> 21846.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26100.08252 </td>
   <td style="text-align:right;"> 659.232301 </td>
   <td style="text-align:right;"> 9809.046 </td>
   <td style="text-align:right;"> 21712.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19318.55707 </td>
   <td style="text-align:right;"> 547.164782 </td>
   <td style="text-align:right;"> 10141.272 </td>
   <td style="text-align:right;"> 21263.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33551.91008 </td>
   <td style="text-align:right;"> 755.849025 </td>
   <td style="text-align:right;"> 10221.589 </td>
   <td style="text-align:right;"> 21191.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14538.96797 </td>
   <td style="text-align:right;"> 483.120610 </td>
   <td style="text-align:right;"> 11057.832 </td>
   <td style="text-align:right;"> 21495.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17285.94962 </td>
   <td style="text-align:right;"> 534.870940 </td>
   <td style="text-align:right;"> 10430.557 </td>
   <td style="text-align:right;"> 21704.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42560.07552 </td>
   <td style="text-align:right;"> 905.883877 </td>
   <td style="text-align:right;"> 9573.693 </td>
   <td style="text-align:right;"> 21121.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37923.55897 </td>
   <td style="text-align:right;"> 842.508513 </td>
   <td style="text-align:right;"> 7830.030 </td>
   <td style="text-align:right;"> 20888.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38841.30783 </td>
   <td style="text-align:right;"> 853.893524 </td>
   <td style="text-align:right;"> 10077.646 </td>
   <td style="text-align:right;"> 21406.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25634.73056 </td>
   <td style="text-align:right;"> 647.788935 </td>
   <td style="text-align:right;"> 9517.365 </td>
   <td style="text-align:right;"> 21713.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17013.72189 </td>
   <td style="text-align:right;"> 507.833427 </td>
   <td style="text-align:right;"> 12973.928 </td>
   <td style="text-align:right;"> 22151.84 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15241.92927 </td>
   <td style="text-align:right;"> 488.457565 </td>
   <td style="text-align:right;"> 11958.595 </td>
   <td style="text-align:right;"> 21293.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -2551.22453 </td>
   <td style="text-align:right;"> 303.122671 </td>
   <td style="text-align:right;"> 11977.874 </td>
   <td style="text-align:right;"> 21230.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15418.83159 </td>
   <td style="text-align:right;"> 479.184342 </td>
   <td style="text-align:right;"> 13258.499 </td>
   <td style="text-align:right;"> 20917.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -47769.49010 </td>
   <td style="text-align:right;"> 983.478432 </td>
   <td style="text-align:right;"> 8535.343 </td>
   <td style="text-align:right;"> 21837.24 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17862.90064 </td>
   <td style="text-align:right;"> 523.698266 </td>
   <td style="text-align:right;"> 11896.725 </td>
   <td style="text-align:right;"> 21080.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31497.17476 </td>
   <td style="text-align:right;"> 731.065472 </td>
   <td style="text-align:right;"> 10433.965 </td>
   <td style="text-align:right;"> 21802.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32040.67099 </td>
   <td style="text-align:right;"> 737.230377 </td>
   <td style="text-align:right;"> 10371.070 </td>
   <td style="text-align:right;"> 22087.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16568.34223 </td>
   <td style="text-align:right;"> 502.841244 </td>
   <td style="text-align:right;"> 11854.821 </td>
   <td style="text-align:right;"> 20689.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22763.01200 </td>
   <td style="text-align:right;"> 599.899234 </td>
   <td style="text-align:right;"> 11094.942 </td>
   <td style="text-align:right;"> 20528.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24391.13263 </td>
   <td style="text-align:right;"> 618.748084 </td>
   <td style="text-align:right;"> 11060.977 </td>
   <td style="text-align:right;"> 21839.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22772.81034 </td>
   <td style="text-align:right;"> 595.228409 </td>
   <td style="text-align:right;"> 11314.203 </td>
   <td style="text-align:right;"> 22082.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38694.18747 </td>
   <td style="text-align:right;"> 853.431231 </td>
   <td style="text-align:right;"> 8061.113 </td>
   <td style="text-align:right;"> 20897.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5514.04324 </td>
   <td style="text-align:right;"> 329.326409 </td>
   <td style="text-align:right;"> 13651.846 </td>
   <td style="text-align:right;"> 21813.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15991.87048 </td>
   <td style="text-align:right;"> 497.638622 </td>
   <td style="text-align:right;"> 11439.753 </td>
   <td style="text-align:right;"> 21113.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -1262.85684 </td>
   <td style="text-align:right;"> 264.733937 </td>
   <td style="text-align:right;"> 10869.019 </td>
   <td style="text-align:right;"> 21620.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27989.74459 </td>
   <td style="text-align:right;"> 667.794957 </td>
   <td style="text-align:right;"> 11879.704 </td>
   <td style="text-align:right;"> 21346.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25121.01951 </td>
   <td style="text-align:right;"> 647.907665 </td>
   <td style="text-align:right;"> 9620.359 </td>
   <td style="text-align:right;"> 21597.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25685.05293 </td>
   <td style="text-align:right;"> 636.551680 </td>
   <td style="text-align:right;"> 11234.791 </td>
   <td style="text-align:right;"> 21269.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22020.73690 </td>
   <td style="text-align:right;"> 579.284163 </td>
   <td style="text-align:right;"> 10208.535 </td>
   <td style="text-align:right;"> 20998.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40904.93570 </td>
   <td style="text-align:right;"> 884.675511 </td>
   <td style="text-align:right;"> 9322.204 </td>
   <td style="text-align:right;"> 21903.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26978.35181 </td>
   <td style="text-align:right;"> 677.610736 </td>
   <td style="text-align:right;"> 9942.350 </td>
   <td style="text-align:right;"> 21932.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31036.56239 </td>
   <td style="text-align:right;"> 722.941666 </td>
   <td style="text-align:right;"> 10493.115 </td>
   <td style="text-align:right;"> 20479.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35473.49251 </td>
   <td style="text-align:right;"> 784.395744 </td>
   <td style="text-align:right;"> 9957.974 </td>
   <td style="text-align:right;"> 21136.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36029.08628 </td>
   <td style="text-align:right;"> 804.307692 </td>
   <td style="text-align:right;"> 10287.134 </td>
   <td style="text-align:right;"> 21423.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31140.04355 </td>
   <td style="text-align:right;"> 726.603181 </td>
   <td style="text-align:right;"> 10583.513 </td>
   <td style="text-align:right;"> 21418.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15411.84391 </td>
   <td style="text-align:right;"> 500.603046 </td>
   <td style="text-align:right;"> 9162.846 </td>
   <td style="text-align:right;"> 21444.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26163.86416 </td>
   <td style="text-align:right;"> 652.912341 </td>
   <td style="text-align:right;"> 10137.447 </td>
   <td style="text-align:right;"> 21254.43 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19204.34370 </td>
   <td style="text-align:right;"> 544.115809 </td>
   <td style="text-align:right;"> 11424.631 </td>
   <td style="text-align:right;"> 21564.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22008.36785 </td>
   <td style="text-align:right;"> 572.098036 </td>
   <td style="text-align:right;"> 12725.969 </td>
   <td style="text-align:right;"> 21635.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17733.89153 </td>
   <td style="text-align:right;"> 506.049427 </td>
   <td style="text-align:right;"> 11299.990 </td>
   <td style="text-align:right;"> 21627.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27509.12530 </td>
   <td style="text-align:right;"> 689.895341 </td>
   <td style="text-align:right;"> 9953.248 </td>
   <td style="text-align:right;"> 21211.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30382.14975 </td>
   <td style="text-align:right;"> 712.073232 </td>
   <td style="text-align:right;"> 10164.424 </td>
   <td style="text-align:right;"> 21542.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23238.14587 </td>
   <td style="text-align:right;"> 598.840317 </td>
   <td style="text-align:right;"> 10950.319 </td>
   <td style="text-align:right;"> 21747.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36944.89125 </td>
   <td style="text-align:right;"> 839.282708 </td>
   <td style="text-align:right;"> 9128.648 </td>
   <td style="text-align:right;"> 21195.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1151.21797 </td>
   <td style="text-align:right;"> 216.790152 </td>
   <td style="text-align:right;"> 13748.178 </td>
   <td style="text-align:right;"> 21564.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16642.41801 </td>
   <td style="text-align:right;"> 495.865772 </td>
   <td style="text-align:right;"> 11478.425 </td>
   <td style="text-align:right;"> 21145.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14615.07229 </td>
   <td style="text-align:right;"> 471.821170 </td>
   <td style="text-align:right;"> 11062.907 </td>
   <td style="text-align:right;"> 21606.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10472.37249 </td>
   <td style="text-align:right;"> 404.249777 </td>
   <td style="text-align:right;"> 13602.941 </td>
   <td style="text-align:right;"> 21462.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13729.18395 </td>
   <td style="text-align:right;"> 454.774193 </td>
   <td style="text-align:right;"> 11773.931 </td>
   <td style="text-align:right;"> 20901.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11521.43250 </td>
   <td style="text-align:right;"> 427.636872 </td>
   <td style="text-align:right;"> 12829.560 </td>
   <td style="text-align:right;"> 21101.94 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15568.52655 </td>
   <td style="text-align:right;"> 487.822856 </td>
   <td style="text-align:right;"> 12131.717 </td>
   <td style="text-align:right;"> 21343.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37041.63340 </td>
   <td style="text-align:right;"> 808.505595 </td>
   <td style="text-align:right;"> 11304.879 </td>
   <td style="text-align:right;"> 21379.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24575.96981 </td>
   <td style="text-align:right;"> 622.411651 </td>
   <td style="text-align:right;"> 11029.913 </td>
   <td style="text-align:right;"> 21477.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23062.69300 </td>
   <td style="text-align:right;"> 597.379615 </td>
   <td style="text-align:right;"> 9883.193 </td>
   <td style="text-align:right;"> 21872.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10462.33089 </td>
   <td style="text-align:right;"> 395.970359 </td>
   <td style="text-align:right;"> 12870.495 </td>
   <td style="text-align:right;"> 21790.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16552.74852 </td>
   <td style="text-align:right;"> 508.955437 </td>
   <td style="text-align:right;"> 11820.347 </td>
   <td style="text-align:right;"> 21125.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -4171.09611 </td>
   <td style="text-align:right;"> 324.898096 </td>
   <td style="text-align:right;"> 13007.807 </td>
   <td style="text-align:right;"> 21755.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -76.36428 </td>
   <td style="text-align:right;"> 264.608645 </td>
   <td style="text-align:right;"> 13341.659 </td>
   <td style="text-align:right;"> 21699.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33611.04548 </td>
   <td style="text-align:right;"> 748.959946 </td>
   <td style="text-align:right;"> 9594.766 </td>
   <td style="text-align:right;"> 21219.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28513.53268 </td>
   <td style="text-align:right;"> 673.439846 </td>
   <td style="text-align:right;"> 10942.017 </td>
   <td style="text-align:right;"> 21165.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11994.07325 </td>
   <td style="text-align:right;"> 431.168827 </td>
   <td style="text-align:right;"> 11733.784 </td>
   <td style="text-align:right;"> 21470.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32516.82307 </td>
   <td style="text-align:right;"> 752.625855 </td>
   <td style="text-align:right;"> 9244.201 </td>
   <td style="text-align:right;"> 21063.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32301.65150 </td>
   <td style="text-align:right;"> 734.157352 </td>
   <td style="text-align:right;"> 10848.069 </td>
   <td style="text-align:right;"> 21457.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38477.91339 </td>
   <td style="text-align:right;"> 836.575872 </td>
   <td style="text-align:right;"> 9121.304 </td>
   <td style="text-align:right;"> 21413.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43743.69305 </td>
   <td style="text-align:right;"> 931.911466 </td>
   <td style="text-align:right;"> 9198.281 </td>
   <td style="text-align:right;"> 21197.43 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8333.32618 </td>
   <td style="text-align:right;"> 360.106184 </td>
   <td style="text-align:right;"> 12388.298 </td>
   <td style="text-align:right;"> 21903.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24757.93407 </td>
   <td style="text-align:right;"> 642.279297 </td>
   <td style="text-align:right;"> 9552.459 </td>
   <td style="text-align:right;"> 21011.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9997.61902 </td>
   <td style="text-align:right;"> 385.836405 </td>
   <td style="text-align:right;"> 13218.520 </td>
   <td style="text-align:right;"> 21680.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9412.27800 </td>
   <td style="text-align:right;"> 400.410808 </td>
   <td style="text-align:right;"> 11141.294 </td>
   <td style="text-align:right;"> 21043.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7324.19768 </td>
   <td style="text-align:right;"> 368.756805 </td>
   <td style="text-align:right;"> 11469.956 </td>
   <td style="text-align:right;"> 21259.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26048.13672 </td>
   <td style="text-align:right;"> 653.469912 </td>
   <td style="text-align:right;"> 10010.464 </td>
   <td style="text-align:right;"> 21482.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29683.33214 </td>
   <td style="text-align:right;"> 697.232282 </td>
   <td style="text-align:right;"> 11441.706 </td>
   <td style="text-align:right;"> 21136.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6379.49401 </td>
   <td style="text-align:right;"> 339.517640 </td>
   <td style="text-align:right;"> 11604.723 </td>
   <td style="text-align:right;"> 21510.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32428.54775 </td>
   <td style="text-align:right;"> 761.518050 </td>
   <td style="text-align:right;"> 9027.304 </td>
   <td style="text-align:right;"> 21131.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12742.28247 </td>
   <td style="text-align:right;"> 446.499012 </td>
   <td style="text-align:right;"> 12216.166 </td>
   <td style="text-align:right;"> 21306.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26704.15612 </td>
   <td style="text-align:right;"> 659.913085 </td>
   <td style="text-align:right;"> 10571.751 </td>
   <td style="text-align:right;"> 20601.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14187.81493 </td>
   <td style="text-align:right;"> 485.320307 </td>
   <td style="text-align:right;"> 10797.533 </td>
   <td style="text-align:right;"> 20873.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26877.10717 </td>
   <td style="text-align:right;"> 648.398199 </td>
   <td style="text-align:right;"> 11098.247 </td>
   <td style="text-align:right;"> 21502.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17336.46781 </td>
   <td style="text-align:right;"> 491.120656 </td>
   <td style="text-align:right;"> 11688.736 </td>
   <td style="text-align:right;"> 21838.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9415.71647 </td>
   <td style="text-align:right;"> 382.414005 </td>
   <td style="text-align:right;"> 14103.867 </td>
   <td style="text-align:right;"> 21856.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6176.55022 </td>
   <td style="text-align:right;"> 335.008977 </td>
   <td style="text-align:right;"> 13669.252 </td>
   <td style="text-align:right;"> 21817.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31029.74919 </td>
   <td style="text-align:right;"> 727.347570 </td>
   <td style="text-align:right;"> 9251.184 </td>
   <td style="text-align:right;"> 21294.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8410.15073 </td>
   <td style="text-align:right;"> 377.442629 </td>
   <td style="text-align:right;"> 13119.240 </td>
   <td style="text-align:right;"> 21759.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14494.97131 </td>
   <td style="text-align:right;"> 472.864025 </td>
   <td style="text-align:right;"> 11594.588 </td>
   <td style="text-align:right;"> 21602.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38734.87150 </td>
   <td style="text-align:right;"> 850.360432 </td>
   <td style="text-align:right;"> 8414.821 </td>
   <td style="text-align:right;"> 21303.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23551.39588 </td>
   <td style="text-align:right;"> 622.718834 </td>
   <td style="text-align:right;"> 10015.950 </td>
   <td style="text-align:right;"> 21520.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36403.47594 </td>
   <td style="text-align:right;"> 801.909665 </td>
   <td style="text-align:right;"> 10381.886 </td>
   <td style="text-align:right;"> 21611.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24651.44321 </td>
   <td style="text-align:right;"> 656.334121 </td>
   <td style="text-align:right;"> 9188.123 </td>
   <td style="text-align:right;"> 21182.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18403.57349 </td>
   <td style="text-align:right;"> 526.623962 </td>
   <td style="text-align:right;"> 12867.815 </td>
   <td style="text-align:right;"> 21341.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17671.38191 </td>
   <td style="text-align:right;"> 520.705366 </td>
   <td style="text-align:right;"> 10352.923 </td>
   <td style="text-align:right;"> 21264.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25106.00698 </td>
   <td style="text-align:right;"> 621.540407 </td>
   <td style="text-align:right;"> 11323.323 </td>
   <td style="text-align:right;"> 21022.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12372.68925 </td>
   <td style="text-align:right;"> 431.379261 </td>
   <td style="text-align:right;"> 10660.776 </td>
   <td style="text-align:right;"> 20951.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19562.40122 </td>
   <td style="text-align:right;"> 554.572614 </td>
   <td style="text-align:right;"> 11552.350 </td>
   <td style="text-align:right;"> 21543.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15884.97272 </td>
   <td style="text-align:right;"> 497.511226 </td>
   <td style="text-align:right;"> 10059.525 </td>
   <td style="text-align:right;"> 21973.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13860.55159 </td>
   <td style="text-align:right;"> 445.567264 </td>
   <td style="text-align:right;"> 12204.423 </td>
   <td style="text-align:right;"> 20959.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37236.50639 </td>
   <td style="text-align:right;"> 802.105358 </td>
   <td style="text-align:right;"> 12401.923 </td>
   <td style="text-align:right;"> 21003.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25740.55795 </td>
   <td style="text-align:right;"> 641.533459 </td>
   <td style="text-align:right;"> 10066.485 </td>
   <td style="text-align:right;"> 21045.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24817.84803 </td>
   <td style="text-align:right;"> 631.796179 </td>
   <td style="text-align:right;"> 11255.259 </td>
   <td style="text-align:right;"> 21016.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28397.63530 </td>
   <td style="text-align:right;"> 704.617072 </td>
   <td style="text-align:right;"> 9564.862 </td>
   <td style="text-align:right;"> 21182.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30472.18043 </td>
   <td style="text-align:right;"> 728.013585 </td>
   <td style="text-align:right;"> 9791.794 </td>
   <td style="text-align:right;"> 21199.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26758.13082 </td>
   <td style="text-align:right;"> 677.944677 </td>
   <td style="text-align:right;"> 9166.544 </td>
   <td style="text-align:right;"> 21370.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17430.26982 </td>
   <td style="text-align:right;"> 508.897085 </td>
   <td style="text-align:right;"> 11269.362 </td>
   <td style="text-align:right;"> 21300.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25173.39598 </td>
   <td style="text-align:right;"> 622.520154 </td>
   <td style="text-align:right;"> 11493.936 </td>
   <td style="text-align:right;"> 21203.43 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15848.66758 </td>
   <td style="text-align:right;"> 475.778641 </td>
   <td style="text-align:right;"> 13164.004 </td>
   <td style="text-align:right;"> 21279.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30705.96962 </td>
   <td style="text-align:right;"> 734.099085 </td>
   <td style="text-align:right;"> 8803.067 </td>
   <td style="text-align:right;"> 21158.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36667.03972 </td>
   <td style="text-align:right;"> 811.641588 </td>
   <td style="text-align:right;"> 10377.554 </td>
   <td style="text-align:right;"> 21669.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31769.87094 </td>
   <td style="text-align:right;"> 749.960239 </td>
   <td style="text-align:right;"> 9971.203 </td>
   <td style="text-align:right;"> 21349.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21888.84862 </td>
   <td style="text-align:right;"> 580.319247 </td>
   <td style="text-align:right;"> 10940.748 </td>
   <td style="text-align:right;"> 21714.73 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31717.45923 </td>
   <td style="text-align:right;"> 711.816904 </td>
   <td style="text-align:right;"> 12479.944 </td>
   <td style="text-align:right;"> 21764.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24196.66056 </td>
   <td style="text-align:right;"> 613.200095 </td>
   <td style="text-align:right;"> 12030.345 </td>
   <td style="text-align:right;"> 21946.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31877.95967 </td>
   <td style="text-align:right;"> 717.622538 </td>
   <td style="text-align:right;"> 11623.518 </td>
   <td style="text-align:right;"> 20711.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44059.02769 </td>
   <td style="text-align:right;"> 934.411891 </td>
   <td style="text-align:right;"> 10639.796 </td>
   <td style="text-align:right;"> 22004.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10014.91593 </td>
   <td style="text-align:right;"> 406.016772 </td>
   <td style="text-align:right;"> 10327.646 </td>
   <td style="text-align:right;"> 21613.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10629.21264 </td>
   <td style="text-align:right;"> 411.766487 </td>
   <td style="text-align:right;"> 11162.934 </td>
   <td style="text-align:right;"> 21814.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32552.87957 </td>
   <td style="text-align:right;"> 753.973350 </td>
   <td style="text-align:right;"> 11101.958 </td>
   <td style="text-align:right;"> 21364.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6955.08503 </td>
   <td style="text-align:right;"> 354.524734 </td>
   <td style="text-align:right;"> 11780.002 </td>
   <td style="text-align:right;"> 20886.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29766.41569 </td>
   <td style="text-align:right;"> 716.650279 </td>
   <td style="text-align:right;"> 8934.798 </td>
   <td style="text-align:right;"> 21877.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43968.81279 </td>
   <td style="text-align:right;"> 932.762929 </td>
   <td style="text-align:right;"> 9809.322 </td>
   <td style="text-align:right;"> 21556.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29865.18739 </td>
   <td style="text-align:right;"> 750.338753 </td>
   <td style="text-align:right;"> 7815.431 </td>
   <td style="text-align:right;"> 21790.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -48433.21386 </td>
   <td style="text-align:right;"> 1008.211991 </td>
   <td style="text-align:right;"> 8739.945 </td>
   <td style="text-align:right;"> 21826.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29495.38925 </td>
   <td style="text-align:right;"> 708.700635 </td>
   <td style="text-align:right;"> 7861.831 </td>
   <td style="text-align:right;"> 21819.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12168.47569 </td>
   <td style="text-align:right;"> 447.873538 </td>
   <td style="text-align:right;"> 10606.466 </td>
   <td style="text-align:right;"> 21036.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39568.10596 </td>
   <td style="text-align:right;"> 857.849184 </td>
   <td style="text-align:right;"> 10125.270 </td>
   <td style="text-align:right;"> 21798.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20724.05894 </td>
   <td style="text-align:right;"> 575.045075 </td>
   <td style="text-align:right;"> 10158.825 </td>
   <td style="text-align:right;"> 21430.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25454.45386 </td>
   <td style="text-align:right;"> 646.847051 </td>
   <td style="text-align:right;"> 9929.533 </td>
   <td style="text-align:right;"> 21548.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14735.66314 </td>
   <td style="text-align:right;"> 465.807579 </td>
   <td style="text-align:right;"> 11915.860 </td>
   <td style="text-align:right;"> 21571.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15703.41965 </td>
   <td style="text-align:right;"> 503.136103 </td>
   <td style="text-align:right;"> 8613.488 </td>
   <td style="text-align:right;"> 21352.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40233.55957 </td>
   <td style="text-align:right;"> 863.732355 </td>
   <td style="text-align:right;"> 10736.527 </td>
   <td style="text-align:right;"> 20786.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42129.25186 </td>
   <td style="text-align:right;"> 920.961998 </td>
   <td style="text-align:right;"> 8247.839 </td>
   <td style="text-align:right;"> 21014.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3188.44864 </td>
   <td style="text-align:right;"> 181.558802 </td>
   <td style="text-align:right;"> 14544.006 </td>
   <td style="text-align:right;"> 22044.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22163.80785 </td>
   <td style="text-align:right;"> 593.899093 </td>
   <td style="text-align:right;"> 9912.506 </td>
   <td style="text-align:right;"> 20923.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26509.94824 </td>
   <td style="text-align:right;"> 657.218594 </td>
   <td style="text-align:right;"> 10424.201 </td>
   <td style="text-align:right;"> 21986.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25134.01359 </td>
   <td style="text-align:right;"> 635.262365 </td>
   <td style="text-align:right;"> 10156.741 </td>
   <td style="text-align:right;"> 21840.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34393.62677 </td>
   <td style="text-align:right;"> 768.921963 </td>
   <td style="text-align:right;"> 10382.724 </td>
   <td style="text-align:right;"> 22013.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28346.76209 </td>
   <td style="text-align:right;"> 697.784019 </td>
   <td style="text-align:right;"> 9881.863 </td>
   <td style="text-align:right;"> 21384.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29027.27925 </td>
   <td style="text-align:right;"> 700.833137 </td>
   <td style="text-align:right;"> 9864.971 </td>
   <td style="text-align:right;"> 21470.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -50160.13024 </td>
   <td style="text-align:right;"> 1024.284964 </td>
   <td style="text-align:right;"> 8316.818 </td>
   <td style="text-align:right;"> 21581.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38587.21320 </td>
   <td style="text-align:right;"> 851.226140 </td>
   <td style="text-align:right;"> 7566.165 </td>
   <td style="text-align:right;"> 21744.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12932.87173 </td>
   <td style="text-align:right;"> 454.876301 </td>
   <td style="text-align:right;"> 10907.093 </td>
   <td style="text-align:right;"> 21092.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24277.10490 </td>
   <td style="text-align:right;"> 622.678299 </td>
   <td style="text-align:right;"> 12258.491 </td>
   <td style="text-align:right;"> 21598.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6395.98571 </td>
   <td style="text-align:right;"> 347.665456 </td>
   <td style="text-align:right;"> 11489.601 </td>
   <td style="text-align:right;"> 21282.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22252.53460 </td>
   <td style="text-align:right;"> 587.231148 </td>
   <td style="text-align:right;"> 11904.957 </td>
   <td style="text-align:right;"> 21413.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39968.61021 </td>
   <td style="text-align:right;"> 856.848954 </td>
   <td style="text-align:right;"> 8795.652 </td>
   <td style="text-align:right;"> 21786.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38665.71555 </td>
   <td style="text-align:right;"> 844.196950 </td>
   <td style="text-align:right;"> 9448.981 </td>
   <td style="text-align:right;"> 20825.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28012.23578 </td>
   <td style="text-align:right;"> 683.169365 </td>
   <td style="text-align:right;"> 10310.271 </td>
   <td style="text-align:right;"> 22046.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37570.16145 </td>
   <td style="text-align:right;"> 825.430638 </td>
   <td style="text-align:right;"> 10142.293 </td>
   <td style="text-align:right;"> 21390.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38812.93264 </td>
   <td style="text-align:right;"> 845.219865 </td>
   <td style="text-align:right;"> 10770.692 </td>
   <td style="text-align:right;"> 21687.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26610.30122 </td>
   <td style="text-align:right;"> 671.901892 </td>
   <td style="text-align:right;"> 9386.455 </td>
   <td style="text-align:right;"> 21751.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24033.51887 </td>
   <td style="text-align:right;"> 610.407166 </td>
   <td style="text-align:right;"> 10294.596 </td>
   <td style="text-align:right;"> 21324.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21265.02507 </td>
   <td style="text-align:right;"> 552.415632 </td>
   <td style="text-align:right;"> 12077.803 </td>
   <td style="text-align:right;"> 21386.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22408.31919 </td>
   <td style="text-align:right;"> 567.681932 </td>
   <td style="text-align:right;"> 12198.026 </td>
   <td style="text-align:right;"> 21380.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24291.77400 </td>
   <td style="text-align:right;"> 608.696759 </td>
   <td style="text-align:right;"> 11392.008 </td>
   <td style="text-align:right;"> 21467.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22440.95980 </td>
   <td style="text-align:right;"> 606.638481 </td>
   <td style="text-align:right;"> 8955.274 </td>
   <td style="text-align:right;"> 20969.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29098.17022 </td>
   <td style="text-align:right;"> 709.462197 </td>
   <td style="text-align:right;"> 8733.163 </td>
   <td style="text-align:right;"> 20672.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34932.33329 </td>
   <td style="text-align:right;"> 786.964849 </td>
   <td style="text-align:right;"> 10409.179 </td>
   <td style="text-align:right;"> 20595.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21139.48338 </td>
   <td style="text-align:right;"> 575.844801 </td>
   <td style="text-align:right;"> 10865.449 </td>
   <td style="text-align:right;"> 22141.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23278.93538 </td>
   <td style="text-align:right;"> 608.097760 </td>
   <td style="text-align:right;"> 10170.357 </td>
   <td style="text-align:right;"> 21936.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25114.31947 </td>
   <td style="text-align:right;"> 639.254648 </td>
   <td style="text-align:right;"> 11495.474 </td>
   <td style="text-align:right;"> 21007.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20699.44304 </td>
   <td style="text-align:right;"> 572.232099 </td>
   <td style="text-align:right;"> 11441.070 </td>
   <td style="text-align:right;"> 21088.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14984.61411 </td>
   <td style="text-align:right;"> 468.386205 </td>
   <td style="text-align:right;"> 12413.071 </td>
   <td style="text-align:right;"> 21890.05 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7259.96291 </td>
   <td style="text-align:right;"> 142.056231 </td>
   <td style="text-align:right;"> 12255.582 </td>
   <td style="text-align:right;"> 21647.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10604.81481 </td>
   <td style="text-align:right;"> 397.641865 </td>
   <td style="text-align:right;"> 14090.616 </td>
   <td style="text-align:right;"> 21518.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38295.08960 </td>
   <td style="text-align:right;"> 841.025827 </td>
   <td style="text-align:right;"> 9743.372 </td>
   <td style="text-align:right;"> 21338.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21488.44285 </td>
   <td style="text-align:right;"> 584.132400 </td>
   <td style="text-align:right;"> 10682.991 </td>
   <td style="text-align:right;"> 21446.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27304.84381 </td>
   <td style="text-align:right;"> 674.157048 </td>
   <td style="text-align:right;"> 10881.065 </td>
   <td style="text-align:right;"> 21150.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18340.37998 </td>
   <td style="text-align:right;"> 514.705688 </td>
   <td style="text-align:right;"> 13473.161 </td>
   <td style="text-align:right;"> 21371.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18416.92304 </td>
   <td style="text-align:right;"> 523.467651 </td>
   <td style="text-align:right;"> 12974.081 </td>
   <td style="text-align:right;"> 21076.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -60089.54777 </td>
   <td style="text-align:right;"> 1179.502364 </td>
   <td style="text-align:right;"> 5783.431 </td>
   <td style="text-align:right;"> 22095.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17036.28456 </td>
   <td style="text-align:right;"> 517.156332 </td>
   <td style="text-align:right;"> 10185.710 </td>
   <td style="text-align:right;"> 21310.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23778.66056 </td>
   <td style="text-align:right;"> 611.370626 </td>
   <td style="text-align:right;"> 12271.521 </td>
   <td style="text-align:right;"> 20849.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17570.45854 </td>
   <td style="text-align:right;"> 516.768981 </td>
   <td style="text-align:right;"> 11280.700 </td>
   <td style="text-align:right;"> 21104.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27170.46618 </td>
   <td style="text-align:right;"> 650.239543 </td>
   <td style="text-align:right;"> 11591.172 </td>
   <td style="text-align:right;"> 21343.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25343.68813 </td>
   <td style="text-align:right;"> 624.460720 </td>
   <td style="text-align:right;"> 11466.172 </td>
   <td style="text-align:right;"> 21496.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29323.66704 </td>
   <td style="text-align:right;"> 708.736331 </td>
   <td style="text-align:right;"> 9754.492 </td>
   <td style="text-align:right;"> 21610.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36087.91164 </td>
   <td style="text-align:right;"> 807.294420 </td>
   <td style="text-align:right;"> 10244.806 </td>
   <td style="text-align:right;"> 21728.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33687.29042 </td>
   <td style="text-align:right;"> 776.013332 </td>
   <td style="text-align:right;"> 8672.555 </td>
   <td style="text-align:right;"> 21198.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30736.75100 </td>
   <td style="text-align:right;"> 720.294939 </td>
   <td style="text-align:right;"> 10203.150 </td>
   <td style="text-align:right;"> 21504.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28302.65672 </td>
   <td style="text-align:right;"> 672.722893 </td>
   <td style="text-align:right;"> 11535.123 </td>
   <td style="text-align:right;"> 21028.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36045.32526 </td>
   <td style="text-align:right;"> 807.788631 </td>
   <td style="text-align:right;"> 9772.516 </td>
   <td style="text-align:right;"> 21600.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38308.78089 </td>
   <td style="text-align:right;"> 846.001416 </td>
   <td style="text-align:right;"> 9984.643 </td>
   <td style="text-align:right;"> 22327.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28770.65234 </td>
   <td style="text-align:right;"> 688.779882 </td>
   <td style="text-align:right;"> 10851.327 </td>
   <td style="text-align:right;"> 21666.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16929.94389 </td>
   <td style="text-align:right;"> 496.829401 </td>
   <td style="text-align:right;"> 11386.281 </td>
   <td style="text-align:right;"> 21449.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16379.83823 </td>
   <td style="text-align:right;"> 515.127784 </td>
   <td style="text-align:right;"> 10806.641 </td>
   <td style="text-align:right;"> 21333.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22406.66318 </td>
   <td style="text-align:right;"> 594.361914 </td>
   <td style="text-align:right;"> 10381.767 </td>
   <td style="text-align:right;"> 21741.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44133.12092 </td>
   <td style="text-align:right;"> 935.767000 </td>
   <td style="text-align:right;"> 7921.508 </td>
   <td style="text-align:right;"> 21072.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16393.80995 </td>
   <td style="text-align:right;"> 492.193611 </td>
   <td style="text-align:right;"> 11915.365 </td>
   <td style="text-align:right;"> 21672.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16664.14857 </td>
   <td style="text-align:right;"> 511.853135 </td>
   <td style="text-align:right;"> 11442.598 </td>
   <td style="text-align:right;"> 21309.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24251.27974 </td>
   <td style="text-align:right;"> 626.142571 </td>
   <td style="text-align:right;"> 11007.282 </td>
   <td style="text-align:right;"> 21515.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34681.13796 </td>
   <td style="text-align:right;"> 790.283594 </td>
   <td style="text-align:right;"> 9191.950 </td>
   <td style="text-align:right;"> 21862.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37090.57581 </td>
   <td style="text-align:right;"> 815.814562 </td>
   <td style="text-align:right;"> 9729.349 </td>
   <td style="text-align:right;"> 21104.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17047.93744 </td>
   <td style="text-align:right;"> 516.153738 </td>
   <td style="text-align:right;"> 10947.333 </td>
   <td style="text-align:right;"> 21981.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32051.09993 </td>
   <td style="text-align:right;"> 743.750443 </td>
   <td style="text-align:right;"> 9324.807 </td>
   <td style="text-align:right;"> 20881.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -48601.90443 </td>
   <td style="text-align:right;"> 1002.507277 </td>
   <td style="text-align:right;"> 8583.516 </td>
   <td style="text-align:right;"> 21526.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35624.25147 </td>
   <td style="text-align:right;"> 801.428181 </td>
   <td style="text-align:right;"> 8540.084 </td>
   <td style="text-align:right;"> 21753.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35080.79119 </td>
   <td style="text-align:right;"> 779.567780 </td>
   <td style="text-align:right;"> 10503.154 </td>
   <td style="text-align:right;"> 21255.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26373.21849 </td>
   <td style="text-align:right;"> 661.457020 </td>
   <td style="text-align:right;"> 9768.241 </td>
   <td style="text-align:right;"> 21174.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21334.93969 </td>
   <td style="text-align:right;"> 570.863987 </td>
   <td style="text-align:right;"> 12098.542 </td>
   <td style="text-align:right;"> 21130.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24777.47867 </td>
   <td style="text-align:right;"> 629.875815 </td>
   <td style="text-align:right;"> 10870.555 </td>
   <td style="text-align:right;"> 22211.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36348.93465 </td>
   <td style="text-align:right;"> 803.468980 </td>
   <td style="text-align:right;"> 10245.331 </td>
   <td style="text-align:right;"> 22336.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34741.71984 </td>
   <td style="text-align:right;"> 791.708674 </td>
   <td style="text-align:right;"> 9461.704 </td>
   <td style="text-align:right;"> 20498.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14745.39108 </td>
   <td style="text-align:right;"> 472.450852 </td>
   <td style="text-align:right;"> 12030.009 </td>
   <td style="text-align:right;"> 21585.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11633.03771 </td>
   <td style="text-align:right;"> 433.825510 </td>
   <td style="text-align:right;"> 11404.795 </td>
   <td style="text-align:right;"> 21079.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27824.70585 </td>
   <td style="text-align:right;"> 681.175901 </td>
   <td style="text-align:right;"> 10729.433 </td>
   <td style="text-align:right;"> 21474.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28204.00374 </td>
   <td style="text-align:right;"> 677.265137 </td>
   <td style="text-align:right;"> 10525.754 </td>
   <td style="text-align:right;"> 21228.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33523.13650 </td>
   <td style="text-align:right;"> 772.605098 </td>
   <td style="text-align:right;"> 9690.026 </td>
   <td style="text-align:right;"> 21490.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22851.48675 </td>
   <td style="text-align:right;"> 600.511517 </td>
   <td style="text-align:right;"> 10225.332 </td>
   <td style="text-align:right;"> 21645.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37337.85217 </td>
   <td style="text-align:right;"> 810.964296 </td>
   <td style="text-align:right;"> 11045.395 </td>
   <td style="text-align:right;"> 21649.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18553.53962 </td>
   <td style="text-align:right;"> 537.002645 </td>
   <td style="text-align:right;"> 9773.139 </td>
   <td style="text-align:right;"> 21201.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20128.54128 </td>
   <td style="text-align:right;"> 551.686179 </td>
   <td style="text-align:right;"> 10027.877 </td>
   <td style="text-align:right;"> 21205.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30546.69669 </td>
   <td style="text-align:right;"> 715.543442 </td>
   <td style="text-align:right;"> 11468.497 </td>
   <td style="text-align:right;"> 21707.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28794.18619 </td>
   <td style="text-align:right;"> 697.619700 </td>
   <td style="text-align:right;"> 9863.668 </td>
   <td style="text-align:right;"> 21432.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21491.21399 </td>
   <td style="text-align:right;"> 569.056865 </td>
   <td style="text-align:right;"> 11691.613 </td>
   <td style="text-align:right;"> 20898.05 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17560.10098 </td>
   <td style="text-align:right;"> 505.996055 </td>
   <td style="text-align:right;"> 11350.292 </td>
   <td style="text-align:right;"> 20790.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11166.97515 </td>
   <td style="text-align:right;"> 413.289443 </td>
   <td style="text-align:right;"> 10509.941 </td>
   <td style="text-align:right;"> 20815.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24817.02054 </td>
   <td style="text-align:right;"> 612.644318 </td>
   <td style="text-align:right;"> 12419.883 </td>
   <td style="text-align:right;"> 20942.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23551.58909 </td>
   <td style="text-align:right;"> 615.723621 </td>
   <td style="text-align:right;"> 9394.243 </td>
   <td style="text-align:right;"> 21627.24 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20432.75254 </td>
   <td style="text-align:right;"> 553.237725 </td>
   <td style="text-align:right;"> 11535.655 </td>
   <td style="text-align:right;"> 21249.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24899.96600 </td>
   <td style="text-align:right;"> 644.589642 </td>
   <td style="text-align:right;"> 10782.990 </td>
   <td style="text-align:right;"> 20894.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30277.93581 </td>
   <td style="text-align:right;"> 726.982631 </td>
   <td style="text-align:right;"> 8934.872 </td>
   <td style="text-align:right;"> 21196.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25268.41555 </td>
   <td style="text-align:right;"> 639.061062 </td>
   <td style="text-align:right;"> 11228.456 </td>
   <td style="text-align:right;"> 21332.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25268.41555 </td>
   <td style="text-align:right;"> 639.061062 </td>
   <td style="text-align:right;"> 11228.456 </td>
   <td style="text-align:right;"> 21332.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35813.35119 </td>
   <td style="text-align:right;"> 791.820812 </td>
   <td style="text-align:right;"> 9804.207 </td>
   <td style="text-align:right;"> 20803.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30315.05315 </td>
   <td style="text-align:right;"> 714.671341 </td>
   <td style="text-align:right;"> 9389.928 </td>
   <td style="text-align:right;"> 20698.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30146.67615 </td>
   <td style="text-align:right;"> 696.449411 </td>
   <td style="text-align:right;"> 10732.830 </td>
   <td style="text-align:right;"> 20436.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33200.24915 </td>
   <td style="text-align:right;"> 753.316585 </td>
   <td style="text-align:right;"> 10106.794 </td>
   <td style="text-align:right;"> 20649.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21514.68549 </td>
   <td style="text-align:right;"> 584.431173 </td>
   <td style="text-align:right;"> 11335.939 </td>
   <td style="text-align:right;"> 20884.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33408.32861 </td>
   <td style="text-align:right;"> 760.400142 </td>
   <td style="text-align:right;"> 9597.309 </td>
   <td style="text-align:right;"> 21814.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10502.87196 </td>
   <td style="text-align:right;"> 413.337918 </td>
   <td style="text-align:right;"> 12043.848 </td>
   <td style="text-align:right;"> 20884.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28026.78706 </td>
   <td style="text-align:right;"> 679.429454 </td>
   <td style="text-align:right;"> 9737.417 </td>
   <td style="text-align:right;"> 21555.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31298.00024 </td>
   <td style="text-align:right;"> 722.212531 </td>
   <td style="text-align:right;"> 10510.604 </td>
   <td style="text-align:right;"> 21090.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16601.21545 </td>
   <td style="text-align:right;"> 503.336923 </td>
   <td style="text-align:right;"> 12138.765 </td>
   <td style="text-align:right;"> 21691.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17033.90596 </td>
   <td style="text-align:right;"> 509.233795 </td>
   <td style="text-align:right;"> 12324.388 </td>
   <td style="text-align:right;"> 21813.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20585.04710 </td>
   <td style="text-align:right;"> 563.763469 </td>
   <td style="text-align:right;"> 10820.754 </td>
   <td style="text-align:right;"> 21419.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22441.64445 </td>
   <td style="text-align:right;"> 596.179940 </td>
   <td style="text-align:right;"> 10882.948 </td>
   <td style="text-align:right;"> 22133.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20454.14180 </td>
   <td style="text-align:right;"> 565.850252 </td>
   <td style="text-align:right;"> 11122.317 </td>
   <td style="text-align:right;"> 22084.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31638.92449 </td>
   <td style="text-align:right;"> 732.769228 </td>
   <td style="text-align:right;"> 10092.712 </td>
   <td style="text-align:right;"> 21119.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24344.98010 </td>
   <td style="text-align:right;"> 638.981766 </td>
   <td style="text-align:right;"> 10470.683 </td>
   <td style="text-align:right;"> 21547.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25510.74885 </td>
   <td style="text-align:right;"> 653.954760 </td>
   <td style="text-align:right;"> 10662.229 </td>
   <td style="text-align:right;"> 21456.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22754.77223 </td>
   <td style="text-align:right;"> 580.898848 </td>
   <td style="text-align:right;"> 11849.770 </td>
   <td style="text-align:right;"> 21297.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24206.01743 </td>
   <td style="text-align:right;"> 611.658699 </td>
   <td style="text-align:right;"> 11363.229 </td>
   <td style="text-align:right;"> 21149.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26458.24434 </td>
   <td style="text-align:right;"> 644.218896 </td>
   <td style="text-align:right;"> 11482.842 </td>
   <td style="text-align:right;"> 21014.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32722.25727 </td>
   <td style="text-align:right;"> 739.640925 </td>
   <td style="text-align:right;"> 12309.948 </td>
   <td style="text-align:right;"> 21094.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30211.02130 </td>
   <td style="text-align:right;"> 709.363595 </td>
   <td style="text-align:right;"> 11013.029 </td>
   <td style="text-align:right;"> 20978.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36730.65991 </td>
   <td style="text-align:right;"> 819.831947 </td>
   <td style="text-align:right;"> 9367.614 </td>
   <td style="text-align:right;"> 21788.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27571.83758 </td>
   <td style="text-align:right;"> 665.668539 </td>
   <td style="text-align:right;"> 10350.825 </td>
   <td style="text-align:right;"> 20949.73 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17955.73418 </td>
   <td style="text-align:right;"> 525.125625 </td>
   <td style="text-align:right;"> 13412.941 </td>
   <td style="text-align:right;"> 21787.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13239.01554 </td>
   <td style="text-align:right;"> 474.292994 </td>
   <td style="text-align:right;"> 11038.877 </td>
   <td style="text-align:right;"> 21344.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29699.76597 </td>
   <td style="text-align:right;"> 698.520279 </td>
   <td style="text-align:right;"> 9365.256 </td>
   <td style="text-align:right;"> 21561.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38549.13550 </td>
   <td style="text-align:right;"> 821.305142 </td>
   <td style="text-align:right;"> 10569.136 </td>
   <td style="text-align:right;"> 21325.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23991.07186 </td>
   <td style="text-align:right;"> 627.922276 </td>
   <td style="text-align:right;"> 10215.911 </td>
   <td style="text-align:right;"> 21159.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26359.51235 </td>
   <td style="text-align:right;"> 649.181525 </td>
   <td style="text-align:right;"> 10313.085 </td>
   <td style="text-align:right;"> 21415.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35464.89461 </td>
   <td style="text-align:right;"> 779.070718 </td>
   <td style="text-align:right;"> 10324.722 </td>
   <td style="text-align:right;"> 21621.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14968.38123 </td>
   <td style="text-align:right;"> 485.515171 </td>
   <td style="text-align:right;"> 10357.307 </td>
   <td style="text-align:right;"> 21648.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16376.70568 </td>
   <td style="text-align:right;"> 500.957589 </td>
   <td style="text-align:right;"> 10583.673 </td>
   <td style="text-align:right;"> 21460.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38066.81565 </td>
   <td style="text-align:right;"> 839.732431 </td>
   <td style="text-align:right;"> 8819.179 </td>
   <td style="text-align:right;"> 20653.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22855.53967 </td>
   <td style="text-align:right;"> 612.954069 </td>
   <td style="text-align:right;"> 11550.065 </td>
   <td style="text-align:right;"> 21490.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18964.56431 </td>
   <td style="text-align:right;"> 552.830686 </td>
   <td style="text-align:right;"> 9471.242 </td>
   <td style="text-align:right;"> 21915.94 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29192.84808 </td>
   <td style="text-align:right;"> 680.649793 </td>
   <td style="text-align:right;"> 12179.686 </td>
   <td style="text-align:right;"> 21129.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17513.60709 </td>
   <td style="text-align:right;"> 521.196864 </td>
   <td style="text-align:right;"> 10301.064 </td>
   <td style="text-align:right;"> 21160.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31002.70065 </td>
   <td style="text-align:right;"> 734.248161 </td>
   <td style="text-align:right;"> 9555.622 </td>
   <td style="text-align:right;"> 21888.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26648.62944 </td>
   <td style="text-align:right;"> 655.241879 </td>
   <td style="text-align:right;"> 11152.727 </td>
   <td style="text-align:right;"> 21160.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24326.25791 </td>
   <td style="text-align:right;"> 627.137557 </td>
   <td style="text-align:right;"> 11407.470 </td>
   <td style="text-align:right;"> 21186.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18574.85191 </td>
   <td style="text-align:right;"> 536.764249 </td>
   <td style="text-align:right;"> 10720.300 </td>
   <td style="text-align:right;"> 20720.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23489.32281 </td>
   <td style="text-align:right;"> 611.698016 </td>
   <td style="text-align:right;"> 11622.663 </td>
   <td style="text-align:right;"> 21655.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10847.74965 </td>
   <td style="text-align:right;"> 420.787067 </td>
   <td style="text-align:right;"> 11820.511 </td>
   <td style="text-align:right;"> 21764.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7790.11390 </td>
   <td style="text-align:right;"> 374.790548 </td>
   <td style="text-align:right;"> 10762.210 </td>
   <td style="text-align:right;"> 21433.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22630.88305 </td>
   <td style="text-align:right;"> 607.582361 </td>
   <td style="text-align:right;"> 8845.597 </td>
   <td style="text-align:right;"> 21279.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34544.40994 </td>
   <td style="text-align:right;"> 783.018336 </td>
   <td style="text-align:right;"> 8764.919 </td>
   <td style="text-align:right;"> 21691.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28111.10566 </td>
   <td style="text-align:right;"> 686.587233 </td>
   <td style="text-align:right;"> 9630.258 </td>
   <td style="text-align:right;"> 21225.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18186.53724 </td>
   <td style="text-align:right;"> 514.823912 </td>
   <td style="text-align:right;"> 13323.697 </td>
   <td style="text-align:right;"> 21606.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32063.18111 </td>
   <td style="text-align:right;"> 743.398563 </td>
   <td style="text-align:right;"> 10195.457 </td>
   <td style="text-align:right;"> 21065.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30184.03989 </td>
   <td style="text-align:right;"> 722.029378 </td>
   <td style="text-align:right;"> 9947.171 </td>
   <td style="text-align:right;"> 20906.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26128.72407 </td>
   <td style="text-align:right;"> 656.944317 </td>
   <td style="text-align:right;"> 10615.401 </td>
   <td style="text-align:right;"> 21121.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22897.01328 </td>
   <td style="text-align:right;"> 603.598452 </td>
   <td style="text-align:right;"> 10629.896 </td>
   <td style="text-align:right;"> 20740.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38687.30200 </td>
   <td style="text-align:right;"> 827.755972 </td>
   <td style="text-align:right;"> 9298.601 </td>
   <td style="text-align:right;"> 21743.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36539.12316 </td>
   <td style="text-align:right;"> 826.601682 </td>
   <td style="text-align:right;"> 9862.588 </td>
   <td style="text-align:right;"> 21221.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31033.47231 </td>
   <td style="text-align:right;"> 735.433258 </td>
   <td style="text-align:right;"> 10311.157 </td>
   <td style="text-align:right;"> 20975.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21027.86469 </td>
   <td style="text-align:right;"> 576.041132 </td>
   <td style="text-align:right;"> 10135.338 </td>
   <td style="text-align:right;"> 21559.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24428.91815 </td>
   <td style="text-align:right;"> 622.310060 </td>
   <td style="text-align:right;"> 12413.766 </td>
   <td style="text-align:right;"> 21557.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26281.73383 </td>
   <td style="text-align:right;"> 663.581691 </td>
   <td style="text-align:right;"> 8693.947 </td>
   <td style="text-align:right;"> 21318.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28666.00201 </td>
   <td style="text-align:right;"> 699.315592 </td>
   <td style="text-align:right;"> 8683.509 </td>
   <td style="text-align:right;"> 21453.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26972.41197 </td>
   <td style="text-align:right;"> 663.252702 </td>
   <td style="text-align:right;"> 10596.049 </td>
   <td style="text-align:right;"> 21737.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23016.92236 </td>
   <td style="text-align:right;"> 608.005297 </td>
   <td style="text-align:right;"> 10262.160 </td>
   <td style="text-align:right;"> 21719.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41490.60907 </td>
   <td style="text-align:right;"> 892.982698 </td>
   <td style="text-align:right;"> 9434.797 </td>
   <td style="text-align:right;"> 21275.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39009.96217 </td>
   <td style="text-align:right;"> 848.807818 </td>
   <td style="text-align:right;"> 9633.174 </td>
   <td style="text-align:right;"> 21553.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33818.95729 </td>
   <td style="text-align:right;"> 783.426077 </td>
   <td style="text-align:right;"> 7926.748 </td>
   <td style="text-align:right;"> 22075.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8455.34152 </td>
   <td style="text-align:right;"> 381.141352 </td>
   <td style="text-align:right;"> 10907.317 </td>
   <td style="text-align:right;"> 20776.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12741.17346 </td>
   <td style="text-align:right;"> 441.654015 </td>
   <td style="text-align:right;"> 12093.895 </td>
   <td style="text-align:right;"> 20962.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43614.78088 </td>
   <td style="text-align:right;"> 925.839386 </td>
   <td style="text-align:right;"> 8330.203 </td>
   <td style="text-align:right;"> 21773.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14074.30758 </td>
   <td style="text-align:right;"> 457.353006 </td>
   <td style="text-align:right;"> 12261.223 </td>
   <td style="text-align:right;"> 21854.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12804.27950 </td>
   <td style="text-align:right;"> 447.230149 </td>
   <td style="text-align:right;"> 11278.056 </td>
   <td style="text-align:right;"> 21172.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23891.26504 </td>
   <td style="text-align:right;"> 635.440445 </td>
   <td style="text-align:right;"> 10546.413 </td>
   <td style="text-align:right;"> 21211.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20690.54231 </td>
   <td style="text-align:right;"> 589.177291 </td>
   <td style="text-align:right;"> 10340.415 </td>
   <td style="text-align:right;"> 21427.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24341.24596 </td>
   <td style="text-align:right;"> 650.321272 </td>
   <td style="text-align:right;"> 10129.163 </td>
   <td style="text-align:right;"> 21344.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28849.08033 </td>
   <td style="text-align:right;"> 677.161922 </td>
   <td style="text-align:right;"> 8996.240 </td>
   <td style="text-align:right;"> 21546.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18448.32130 </td>
   <td style="text-align:right;"> 530.868743 </td>
   <td style="text-align:right;"> 12656.967 </td>
   <td style="text-align:right;"> 20553.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -2220.97194 </td>
   <td style="text-align:right;"> 292.346549 </td>
   <td style="text-align:right;"> 12286.361 </td>
   <td style="text-align:right;"> 22107.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20875.85763 </td>
   <td style="text-align:right;"> 550.179683 </td>
   <td style="text-align:right;"> 12747.393 </td>
   <td style="text-align:right;"> 21004.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8287.11932 </td>
   <td style="text-align:right;"> 374.261531 </td>
   <td style="text-align:right;"> 11407.609 </td>
   <td style="text-align:right;"> 21580.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41887.32103 </td>
   <td style="text-align:right;"> 893.387007 </td>
   <td style="text-align:right;"> 9219.964 </td>
   <td style="text-align:right;"> 21725.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39010.24448 </td>
   <td style="text-align:right;"> 858.269510 </td>
   <td style="text-align:right;"> 8629.793 </td>
   <td style="text-align:right;"> 21400.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19744.27473 </td>
   <td style="text-align:right;"> 549.664827 </td>
   <td style="text-align:right;"> 11075.510 </td>
   <td style="text-align:right;"> 21477.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31160.11383 </td>
   <td style="text-align:right;"> 735.007706 </td>
   <td style="text-align:right;"> 9415.597 </td>
   <td style="text-align:right;"> 21551.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22233.86987 </td>
   <td style="text-align:right;"> 596.946748 </td>
   <td style="text-align:right;"> 9919.669 </td>
   <td style="text-align:right;"> 21477.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33870.85600 </td>
   <td style="text-align:right;"> 762.550328 </td>
   <td style="text-align:right;"> 11630.868 </td>
   <td style="text-align:right;"> 21377.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33123.68013 </td>
   <td style="text-align:right;"> 745.769622 </td>
   <td style="text-align:right;"> 12604.614 </td>
   <td style="text-align:right;"> 21313.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30469.33201 </td>
   <td style="text-align:right;"> 702.096023 </td>
   <td style="text-align:right;"> 12933.252 </td>
   <td style="text-align:right;"> 21422.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25487.77908 </td>
   <td style="text-align:right;"> 644.028269 </td>
   <td style="text-align:right;"> 9589.242 </td>
   <td style="text-align:right;"> 21327.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35476.09370 </td>
   <td style="text-align:right;"> 786.573548 </td>
   <td style="text-align:right;"> 10959.785 </td>
   <td style="text-align:right;"> 21235.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24260.59016 </td>
   <td style="text-align:right;"> 618.001713 </td>
   <td style="text-align:right;"> 10914.643 </td>
   <td style="text-align:right;"> 21729.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27924.80912 </td>
   <td style="text-align:right;"> 701.230441 </td>
   <td style="text-align:right;"> 9290.412 </td>
   <td style="text-align:right;"> 21681.05 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29219.53151 </td>
   <td style="text-align:right;"> 696.424034 </td>
   <td style="text-align:right;"> 10363.733 </td>
   <td style="text-align:right;"> 21714.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21050.82317 </td>
   <td style="text-align:right;"> 569.632631 </td>
   <td style="text-align:right;"> 11860.809 </td>
   <td style="text-align:right;"> 20982.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -52085.01635 </td>
   <td style="text-align:right;"> 1048.932603 </td>
   <td style="text-align:right;"> 8554.235 </td>
   <td style="text-align:right;"> 21705.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -55205.48674 </td>
   <td style="text-align:right;"> 1100.178480 </td>
   <td style="text-align:right;"> 8039.397 </td>
   <td style="text-align:right;"> 21608.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -58921.61000 </td>
   <td style="text-align:right;"> 1151.747498 </td>
   <td style="text-align:right;"> 8808.364 </td>
   <td style="text-align:right;"> 21608.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23181.54506 </td>
   <td style="text-align:right;"> 615.324507 </td>
   <td style="text-align:right;"> 9827.923 </td>
   <td style="text-align:right;"> 21115.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25129.89842 </td>
   <td style="text-align:right;"> 626.840859 </td>
   <td style="text-align:right;"> 10257.939 </td>
   <td style="text-align:right;"> 20851.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32603.13149 </td>
   <td style="text-align:right;"> 758.588922 </td>
   <td style="text-align:right;"> 8687.567 </td>
   <td style="text-align:right;"> 21558.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26243.54300 </td>
   <td style="text-align:right;"> 649.216531 </td>
   <td style="text-align:right;"> 9608.904 </td>
   <td style="text-align:right;"> 21811.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16645.42702 </td>
   <td style="text-align:right;"> 490.110859 </td>
   <td style="text-align:right;"> 12832.591 </td>
   <td style="text-align:right;"> 21445.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33409.06361 </td>
   <td style="text-align:right;"> 781.126441 </td>
   <td style="text-align:right;"> 7704.178 </td>
   <td style="text-align:right;"> 20945.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33602.45173 </td>
   <td style="text-align:right;"> 782.040032 </td>
   <td style="text-align:right;"> 8180.305 </td>
   <td style="text-align:right;"> 21012.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28050.47728 </td>
   <td style="text-align:right;"> 684.814856 </td>
   <td style="text-align:right;"> 10278.669 </td>
   <td style="text-align:right;"> 21709.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31273.78737 </td>
   <td style="text-align:right;"> 728.224806 </td>
   <td style="text-align:right;"> 10738.412 </td>
   <td style="text-align:right;"> 21743.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25073.72164 </td>
   <td style="text-align:right;"> 632.536605 </td>
   <td style="text-align:right;"> 10263.481 </td>
   <td style="text-align:right;"> 21305.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46265.34331 </td>
   <td style="text-align:right;"> 971.482607 </td>
   <td style="text-align:right;"> 8297.462 </td>
   <td style="text-align:right;"> 21565.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29852.08529 </td>
   <td style="text-align:right;"> 699.731015 </td>
   <td style="text-align:right;"> 11344.453 </td>
   <td style="text-align:right;"> 21197.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25250.16656 </td>
   <td style="text-align:right;"> 650.790847 </td>
   <td style="text-align:right;"> 9095.081 </td>
   <td style="text-align:right;"> 22237.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35099.80467 </td>
   <td style="text-align:right;"> 803.156691 </td>
   <td style="text-align:right;"> 8413.502 </td>
   <td style="text-align:right;"> 22499.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25410.59802 </td>
   <td style="text-align:right;"> 646.925991 </td>
   <td style="text-align:right;"> 10629.656 </td>
   <td style="text-align:right;"> 21363.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46638.30316 </td>
   <td style="text-align:right;"> 973.608360 </td>
   <td style="text-align:right;"> 8852.287 </td>
   <td style="text-align:right;"> 22015.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28829.77993 </td>
   <td style="text-align:right;"> 690.815119 </td>
   <td style="text-align:right;"> 10364.841 </td>
   <td style="text-align:right;"> 20829.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39264.02541 </td>
   <td style="text-align:right;"> 842.224526 </td>
   <td style="text-align:right;"> 11191.830 </td>
   <td style="text-align:right;"> 21321.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18114.27952 </td>
   <td style="text-align:right;"> 520.842149 </td>
   <td style="text-align:right;"> 11597.613 </td>
   <td style="text-align:right;"> 21231.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27060.37372 </td>
   <td style="text-align:right;"> 664.034736 </td>
   <td style="text-align:right;"> 10372.348 </td>
   <td style="text-align:right;"> 20639.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31364.83925 </td>
   <td style="text-align:right;"> 732.578269 </td>
   <td style="text-align:right;"> 9471.145 </td>
   <td style="text-align:right;"> 20849.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32489.61785 </td>
   <td style="text-align:right;"> 745.041537 </td>
   <td style="text-align:right;"> 10152.404 </td>
   <td style="text-align:right;"> 20906.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36217.13997 </td>
   <td style="text-align:right;"> 803.968052 </td>
   <td style="text-align:right;"> 9946.290 </td>
   <td style="text-align:right;"> 21372.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14724.49443 </td>
   <td style="text-align:right;"> 471.754006 </td>
   <td style="text-align:right;"> 10308.425 </td>
   <td style="text-align:right;"> 21507.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14073.29654 </td>
   <td style="text-align:right;"> 460.480926 </td>
   <td style="text-align:right;"> 10514.139 </td>
   <td style="text-align:right;"> 21428.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20982.11411 </td>
   <td style="text-align:right;"> 588.001969 </td>
   <td style="text-align:right;"> 9692.016 </td>
   <td style="text-align:right;"> 21341.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40228.77064 </td>
   <td style="text-align:right;"> 881.617526 </td>
   <td style="text-align:right;"> 9896.558 </td>
   <td style="text-align:right;"> 21419.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34546.30811 </td>
   <td style="text-align:right;"> 795.932564 </td>
   <td style="text-align:right;"> 9619.494 </td>
   <td style="text-align:right;"> 21373.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18913.01797 </td>
   <td style="text-align:right;"> 567.295237 </td>
   <td style="text-align:right;"> 9663.701 </td>
   <td style="text-align:right;"> 22181.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39359.59369 </td>
   <td style="text-align:right;"> 846.216955 </td>
   <td style="text-align:right;"> 10441.220 </td>
   <td style="text-align:right;"> 21577.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34688.74847 </td>
   <td style="text-align:right;"> 788.310729 </td>
   <td style="text-align:right;"> 7432.798 </td>
   <td style="text-align:right;"> 21593.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30224.69331 </td>
   <td style="text-align:right;"> 716.789213 </td>
   <td style="text-align:right;"> 10409.335 </td>
   <td style="text-align:right;"> 21750.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23074.51309 </td>
   <td style="text-align:right;"> 594.083429 </td>
   <td style="text-align:right;"> 11963.115 </td>
   <td style="text-align:right;"> 21020.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22484.06804 </td>
   <td style="text-align:right;"> 585.639279 </td>
   <td style="text-align:right;"> 10856.934 </td>
   <td style="text-align:right;"> 21311.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10514.43065 </td>
   <td style="text-align:right;"> 417.009279 </td>
   <td style="text-align:right;"> 11863.381 </td>
   <td style="text-align:right;"> 21195.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13934.26511 </td>
   <td style="text-align:right;"> 458.503451 </td>
   <td style="text-align:right;"> 12198.308 </td>
   <td style="text-align:right;"> 21175.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35636.52936 </td>
   <td style="text-align:right;"> 779.942621 </td>
   <td style="text-align:right;"> 10206.234 </td>
   <td style="text-align:right;"> 21026.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36951.38225 </td>
   <td style="text-align:right;"> 829.208082 </td>
   <td style="text-align:right;"> 8523.671 </td>
   <td style="text-align:right;"> 21351.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27957.46729 </td>
   <td style="text-align:right;"> 684.740604 </td>
   <td style="text-align:right;"> 10094.692 </td>
   <td style="text-align:right;"> 21435.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22853.38247 </td>
   <td style="text-align:right;"> 604.058137 </td>
   <td style="text-align:right;"> 9413.610 </td>
   <td style="text-align:right;"> 21409.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22057.76172 </td>
   <td style="text-align:right;"> 580.023362 </td>
   <td style="text-align:right;"> 12564.365 </td>
   <td style="text-align:right;"> 20563.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18988.19655 </td>
   <td style="text-align:right;"> 550.811399 </td>
   <td style="text-align:right;"> 10223.758 </td>
   <td style="text-align:right;"> 20913.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -52016.03790 </td>
   <td style="text-align:right;"> 1047.104874 </td>
   <td style="text-align:right;"> 8755.797 </td>
   <td style="text-align:right;"> 21781.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28179.83588 </td>
   <td style="text-align:right;"> 680.281228 </td>
   <td style="text-align:right;"> 10873.463 </td>
   <td style="text-align:right;"> 21087.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24949.14606 </td>
   <td style="text-align:right;"> 646.003380 </td>
   <td style="text-align:right;"> 9452.861 </td>
   <td style="text-align:right;"> 21055.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28310.46298 </td>
   <td style="text-align:right;"> 691.965183 </td>
   <td style="text-align:right;"> 9234.307 </td>
   <td style="text-align:right;"> 21436.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29620.64848 </td>
   <td style="text-align:right;"> 712.489167 </td>
   <td style="text-align:right;"> 10298.248 </td>
   <td style="text-align:right;"> 20985.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21549.82872 </td>
   <td style="text-align:right;"> 576.689388 </td>
   <td style="text-align:right;"> 10986.842 </td>
   <td style="text-align:right;"> 21412.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27415.01352 </td>
   <td style="text-align:right;"> 675.794713 </td>
   <td style="text-align:right;"> 10051.804 </td>
   <td style="text-align:right;"> 21046.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21572.81198 </td>
   <td style="text-align:right;"> 580.232325 </td>
   <td style="text-align:right;"> 11539.790 </td>
   <td style="text-align:right;"> 21308.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17095.50488 </td>
   <td style="text-align:right;"> 520.501341 </td>
   <td style="text-align:right;"> 10743.130 </td>
   <td style="text-align:right;"> 21434.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27138.12708 </td>
   <td style="text-align:right;"> 653.366558 </td>
   <td style="text-align:right;"> 11569.814 </td>
   <td style="text-align:right;"> 21187.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33546.81019 </td>
   <td style="text-align:right;"> 750.127507 </td>
   <td style="text-align:right;"> 11687.145 </td>
   <td style="text-align:right;"> 21375.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16703.03486 </td>
   <td style="text-align:right;"> 506.186648 </td>
   <td style="text-align:right;"> 12194.676 </td>
   <td style="text-align:right;"> 21380.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11928.73509 </td>
   <td style="text-align:right;"> 428.639706 </td>
   <td style="text-align:right;"> 12745.321 </td>
   <td style="text-align:right;"> 21694.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27813.86571 </td>
   <td style="text-align:right;"> 672.330295 </td>
   <td style="text-align:right;"> 9753.066 </td>
   <td style="text-align:right;"> 21482.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28517.72924 </td>
   <td style="text-align:right;"> 674.166594 </td>
   <td style="text-align:right;"> 11755.480 </td>
   <td style="text-align:right;"> 21888.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42573.96610 </td>
   <td style="text-align:right;"> 911.194361 </td>
   <td style="text-align:right;"> 9339.269 </td>
   <td style="text-align:right;"> 20933.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20990.79579 </td>
   <td style="text-align:right;"> 587.211918 </td>
   <td style="text-align:right;"> 9972.933 </td>
   <td style="text-align:right;"> 20951.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16736.55386 </td>
   <td style="text-align:right;"> 502.625967 </td>
   <td style="text-align:right;"> 10119.276 </td>
   <td style="text-align:right;"> 21771.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28702.61806 </td>
   <td style="text-align:right;"> 677.092510 </td>
   <td style="text-align:right;"> 12168.367 </td>
   <td style="text-align:right;"> 21022.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19558.68470 </td>
   <td style="text-align:right;"> 565.510832 </td>
   <td style="text-align:right;"> 8566.729 </td>
   <td style="text-align:right;"> 21074.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41789.74785 </td>
   <td style="text-align:right;"> 894.995368 </td>
   <td style="text-align:right;"> 10324.807 </td>
   <td style="text-align:right;"> 20977.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39475.19607 </td>
   <td style="text-align:right;"> 861.355222 </td>
   <td style="text-align:right;"> 9594.557 </td>
   <td style="text-align:right;"> 20766.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38309.53565 </td>
   <td style="text-align:right;"> 845.750246 </td>
   <td style="text-align:right;"> 8648.945 </td>
   <td style="text-align:right;"> 21382.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26644.35771 </td>
   <td style="text-align:right;"> 652.923520 </td>
   <td style="text-align:right;"> 10969.018 </td>
   <td style="text-align:right;"> 22098.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29584.35395 </td>
   <td style="text-align:right;"> 700.837489 </td>
   <td style="text-align:right;"> 10190.392 </td>
   <td style="text-align:right;"> 21271.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30823.65190 </td>
   <td style="text-align:right;"> 716.500131 </td>
   <td style="text-align:right;"> 11450.518 </td>
   <td style="text-align:right;"> 21663.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -55489.65409 </td>
   <td style="text-align:right;"> 1113.672823 </td>
   <td style="text-align:right;"> 6749.826 </td>
   <td style="text-align:right;"> 21340.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -70745.62599 </td>
   <td style="text-align:right;"> 1352.643936 </td>
   <td style="text-align:right;"> 5428.865 </td>
   <td style="text-align:right;"> 21483.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37157.24030 </td>
   <td style="text-align:right;"> 807.692701 </td>
   <td style="text-align:right;"> 9877.649 </td>
   <td style="text-align:right;"> 21625.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37893.21040 </td>
   <td style="text-align:right;"> 839.844593 </td>
   <td style="text-align:right;"> 10473.482 </td>
   <td style="text-align:right;"> 21172.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29870.12056 </td>
   <td style="text-align:right;"> 721.159742 </td>
   <td style="text-align:right;"> 9389.200 </td>
   <td style="text-align:right;"> 21201.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30918.58730 </td>
   <td style="text-align:right;"> 722.111742 </td>
   <td style="text-align:right;"> 9525.178 </td>
   <td style="text-align:right;"> 21599.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -3927.85203 </td>
   <td style="text-align:right;"> 309.891729 </td>
   <td style="text-align:right;"> 13847.886 </td>
   <td style="text-align:right;"> 21221.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1918.36554 </td>
   <td style="text-align:right;"> 222.686973 </td>
   <td style="text-align:right;"> 11814.425 </td>
   <td style="text-align:right;"> 21188.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15018.08784 </td>
   <td style="text-align:right;"> 466.566885 </td>
   <td style="text-align:right;"> 13562.791 </td>
   <td style="text-align:right;"> 20614.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6019.44895 </td>
   <td style="text-align:right;"> 352.149907 </td>
   <td style="text-align:right;"> 11859.792 </td>
   <td style="text-align:right;"> 21646.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -47446.45742 </td>
   <td style="text-align:right;"> 954.376139 </td>
   <td style="text-align:right;"> 10088.183 </td>
   <td style="text-align:right;"> 21266.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26022.23744 </td>
   <td style="text-align:right;"> 651.891361 </td>
   <td style="text-align:right;"> 8678.749 </td>
   <td style="text-align:right;"> 21341.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -52234.94697 </td>
   <td style="text-align:right;"> 1043.741032 </td>
   <td style="text-align:right;"> 9305.369 </td>
   <td style="text-align:right;"> 21714.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36258.93070 </td>
   <td style="text-align:right;"> 787.716480 </td>
   <td style="text-align:right;"> 11002.028 </td>
   <td style="text-align:right;"> 21103.05 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8273.87260 </td>
   <td style="text-align:right;"> 384.729221 </td>
   <td style="text-align:right;"> 10877.714 </td>
   <td style="text-align:right;"> 21206.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33445.66321 </td>
   <td style="text-align:right;"> 739.279221 </td>
   <td style="text-align:right;"> 11891.564 </td>
   <td style="text-align:right;"> 21525.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16603.49797 </td>
   <td style="text-align:right;"> 516.125729 </td>
   <td style="text-align:right;"> 9629.159 </td>
   <td style="text-align:right;"> 20714.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19047.85112 </td>
   <td style="text-align:right;"> 552.590689 </td>
   <td style="text-align:right;"> 9678.493 </td>
   <td style="text-align:right;"> 20748.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30738.39735 </td>
   <td style="text-align:right;"> 729.519217 </td>
   <td style="text-align:right;"> 9488.096 </td>
   <td style="text-align:right;"> 21397.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31588.04677 </td>
   <td style="text-align:right;"> 734.567055 </td>
   <td style="text-align:right;"> 10755.131 </td>
   <td style="text-align:right;"> 21293.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33515.21387 </td>
   <td style="text-align:right;"> 756.545646 </td>
   <td style="text-align:right;"> 10057.185 </td>
   <td style="text-align:right;"> 20888.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7196.26595 </td>
   <td style="text-align:right;"> 361.233631 </td>
   <td style="text-align:right;"> 13118.184 </td>
   <td style="text-align:right;"> 21999.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -1067.31765 </td>
   <td style="text-align:right;"> 252.989098 </td>
   <td style="text-align:right;"> 14358.607 </td>
   <td style="text-align:right;"> 22000.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15352.02513 </td>
   <td style="text-align:right;"> 480.178214 </td>
   <td style="text-align:right;"> 11579.621 </td>
   <td style="text-align:right;"> 20816.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -1062.94104 </td>
   <td style="text-align:right;"> 256.487515 </td>
   <td style="text-align:right;"> 14372.498 </td>
   <td style="text-align:right;"> 21884.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -53126.62552 </td>
   <td style="text-align:right;"> 1064.445451 </td>
   <td style="text-align:right;"> 8623.722 </td>
   <td style="text-align:right;"> 21103.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -54352.96345 </td>
   <td style="text-align:right;"> 1097.683020 </td>
   <td style="text-align:right;"> 6288.916 </td>
   <td style="text-align:right;"> 21062.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -68341.06811 </td>
   <td style="text-align:right;"> 1303.564101 </td>
   <td style="text-align:right;"> 6820.214 </td>
   <td style="text-align:right;"> 21003.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -63487.08296 </td>
   <td style="text-align:right;"> 1229.438724 </td>
   <td style="text-align:right;"> 6878.114 </td>
   <td style="text-align:right;"> 21184.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32286.01436 </td>
   <td style="text-align:right;"> 745.037710 </td>
   <td style="text-align:right;"> 11243.273 </td>
   <td style="text-align:right;"> 21586.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28586.10100 </td>
   <td style="text-align:right;"> 695.771174 </td>
   <td style="text-align:right;"> 9630.583 </td>
   <td style="text-align:right;"> 21139.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31646.44944 </td>
   <td style="text-align:right;"> 744.364384 </td>
   <td style="text-align:right;"> 9432.762 </td>
   <td style="text-align:right;"> 21258.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -45405.71062 </td>
   <td style="text-align:right;"> 932.297453 </td>
   <td style="text-align:right;"> 9176.427 </td>
   <td style="text-align:right;"> 21363.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46310.14487 </td>
   <td style="text-align:right;"> 957.875175 </td>
   <td style="text-align:right;"> 7958.237 </td>
   <td style="text-align:right;"> 21533.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19454.74501 </td>
   <td style="text-align:right;"> 539.778959 </td>
   <td style="text-align:right;"> 11665.956 </td>
   <td style="text-align:right;"> 20987.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18550.20703 </td>
   <td style="text-align:right;"> 535.569699 </td>
   <td style="text-align:right;"> 12115.034 </td>
   <td style="text-align:right;"> 21454.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38909.06442 </td>
   <td style="text-align:right;"> 843.509962 </td>
   <td style="text-align:right;"> 10265.690 </td>
   <td style="text-align:right;"> 22410.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28918.16883 </td>
   <td style="text-align:right;"> 680.336351 </td>
   <td style="text-align:right;"> 11837.210 </td>
   <td style="text-align:right;"> 21639.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23323.67709 </td>
   <td style="text-align:right;"> 597.750449 </td>
   <td style="text-align:right;"> 12591.556 </td>
   <td style="text-align:right;"> 21163.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25321.19230 </td>
   <td style="text-align:right;"> 638.277229 </td>
   <td style="text-align:right;"> 10372.564 </td>
   <td style="text-align:right;"> 21895.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30675.75967 </td>
   <td style="text-align:right;"> 729.468984 </td>
   <td style="text-align:right;"> 9247.007 </td>
   <td style="text-align:right;"> 22217.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15851.34786 </td>
   <td style="text-align:right;"> 482.551540 </td>
   <td style="text-align:right;"> 12693.768 </td>
   <td style="text-align:right;"> 20471.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36418.62953 </td>
   <td style="text-align:right;"> 809.529044 </td>
   <td style="text-align:right;"> 8796.169 </td>
   <td style="text-align:right;"> 22234.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27744.77122 </td>
   <td style="text-align:right;"> 679.671887 </td>
   <td style="text-align:right;"> 10375.315 </td>
   <td style="text-align:right;"> 20570.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23870.43211 </td>
   <td style="text-align:right;"> 618.485611 </td>
   <td style="text-align:right;"> 11094.143 </td>
   <td style="text-align:right;"> 21493.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22248.76014 </td>
   <td style="text-align:right;"> 583.786520 </td>
   <td style="text-align:right;"> 10953.501 </td>
   <td style="text-align:right;"> 21276.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22987.33032 </td>
   <td style="text-align:right;"> 601.072134 </td>
   <td style="text-align:right;"> 10659.571 </td>
   <td style="text-align:right;"> 21368.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14213.53321 </td>
   <td style="text-align:right;"> 462.998793 </td>
   <td style="text-align:right;"> 12385.275 </td>
   <td style="text-align:right;"> 21232.73 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17440.94554 </td>
   <td style="text-align:right;"> 505.711545 </td>
   <td style="text-align:right;"> 13576.260 </td>
   <td style="text-align:right;"> 21112.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7724.40731 </td>
   <td style="text-align:right;"> 360.448845 </td>
   <td style="text-align:right;"> 12787.412 </td>
   <td style="text-align:right;"> 21360.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28454.94497 </td>
   <td style="text-align:right;"> 674.699072 </td>
   <td style="text-align:right;"> 11104.647 </td>
   <td style="text-align:right;"> 21383.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14555.92690 </td>
   <td style="text-align:right;"> 481.231643 </td>
   <td style="text-align:right;"> 11282.863 </td>
   <td style="text-align:right;"> 21267.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7415.15745 </td>
   <td style="text-align:right;"> 375.221595 </td>
   <td style="text-align:right;"> 11302.169 </td>
   <td style="text-align:right;"> 21006.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35175.74490 </td>
   <td style="text-align:right;"> 782.222074 </td>
   <td style="text-align:right;"> 11621.422 </td>
   <td style="text-align:right;"> 21379.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32127.37299 </td>
   <td style="text-align:right;"> 740.924274 </td>
   <td style="text-align:right;"> 10805.062 </td>
   <td style="text-align:right;"> 21245.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30641.31608 </td>
   <td style="text-align:right;"> 725.629600 </td>
   <td style="text-align:right;"> 8784.436 </td>
   <td style="text-align:right;"> 21073.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28792.75221 </td>
   <td style="text-align:right;"> 692.986682 </td>
   <td style="text-align:right;"> 9836.432 </td>
   <td style="text-align:right;"> 21117.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35151.79117 </td>
   <td style="text-align:right;"> 791.973667 </td>
   <td style="text-align:right;"> 10121.653 </td>
   <td style="text-align:right;"> 21335.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33475.17800 </td>
   <td style="text-align:right;"> 772.192972 </td>
   <td style="text-align:right;"> 8850.404 </td>
   <td style="text-align:right;"> 21219.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -2405.86881 </td>
   <td style="text-align:right;"> 280.965462 </td>
   <td style="text-align:right;"> 13565.236 </td>
   <td style="text-align:right;"> 21708.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13648.44275 </td>
   <td style="text-align:right;"> 448.042624 </td>
   <td style="text-align:right;"> 13859.008 </td>
   <td style="text-align:right;"> 21658.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26139.34812 </td>
   <td style="text-align:right;"> 636.624540 </td>
   <td style="text-align:right;"> 13090.661 </td>
   <td style="text-align:right;"> 20899.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20949.71478 </td>
   <td style="text-align:right;"> 583.903656 </td>
   <td style="text-align:right;"> 9358.536 </td>
   <td style="text-align:right;"> 20919.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35924.62676 </td>
   <td style="text-align:right;"> 815.709018 </td>
   <td style="text-align:right;"> 10281.101 </td>
   <td style="text-align:right;"> 20918.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46614.14064 </td>
   <td style="text-align:right;"> 949.001338 </td>
   <td style="text-align:right;"> 8454.092 </td>
   <td style="text-align:right;"> 21952.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39862.17470 </td>
   <td style="text-align:right;"> 888.461735 </td>
   <td style="text-align:right;"> 7956.409 </td>
   <td style="text-align:right;"> 21009.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36096.59004 </td>
   <td style="text-align:right;"> 839.377407 </td>
   <td style="text-align:right;"> 7072.761 </td>
   <td style="text-align:right;"> 21068.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36527.00348 </td>
   <td style="text-align:right;"> 836.740155 </td>
   <td style="text-align:right;"> 7814.633 </td>
   <td style="text-align:right;"> 21038.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34779.15315 </td>
   <td style="text-align:right;"> 785.788655 </td>
   <td style="text-align:right;"> 9062.913 </td>
   <td style="text-align:right;"> 20917.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27085.71235 </td>
   <td style="text-align:right;"> 667.566537 </td>
   <td style="text-align:right;"> 9786.865 </td>
   <td style="text-align:right;"> 21607.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -49875.55255 </td>
   <td style="text-align:right;"> 1029.083072 </td>
   <td style="text-align:right;"> 8357.594 </td>
   <td style="text-align:right;"> 21846.36 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38073.34354 </td>
   <td style="text-align:right;"> 852.036362 </td>
   <td style="text-align:right;"> 8429.444 </td>
   <td style="text-align:right;"> 21591.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27493.75142 </td>
   <td style="text-align:right;"> 667.964171 </td>
   <td style="text-align:right;"> 11791.952 </td>
   <td style="text-align:right;"> 21694.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23891.34702 </td>
   <td style="text-align:right;"> 609.468806 </td>
   <td style="text-align:right;"> 11724.537 </td>
   <td style="text-align:right;"> 21563.43 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14990.12989 </td>
   <td style="text-align:right;"> 481.944942 </td>
   <td style="text-align:right;"> 10049.064 </td>
   <td style="text-align:right;"> 21253.84 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12720.07468 </td>
   <td style="text-align:right;"> 445.274566 </td>
   <td style="text-align:right;"> 12196.823 </td>
   <td style="text-align:right;"> 21651.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -45150.75043 </td>
   <td style="text-align:right;"> 931.617875 </td>
   <td style="text-align:right;"> 9928.653 </td>
   <td style="text-align:right;"> 21488.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40719.82799 </td>
   <td style="text-align:right;"> 893.201375 </td>
   <td style="text-align:right;"> 8624.954 </td>
   <td style="text-align:right;"> 21671.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24933.99868 </td>
   <td style="text-align:right;"> 653.891980 </td>
   <td style="text-align:right;"> 9105.581 </td>
   <td style="text-align:right;"> 21432.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -63841.90680 </td>
   <td style="text-align:right;"> 1231.997927 </td>
   <td style="text-align:right;"> 7213.483 </td>
   <td style="text-align:right;"> 21383.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28452.31118 </td>
   <td style="text-align:right;"> 697.397790 </td>
   <td style="text-align:right;"> 8627.364 </td>
   <td style="text-align:right;"> 21646.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25044.57421 </td>
   <td style="text-align:right;"> 629.404334 </td>
   <td style="text-align:right;"> 11252.469 </td>
   <td style="text-align:right;"> 21040.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32943.40374 </td>
   <td style="text-align:right;"> 745.288455 </td>
   <td style="text-align:right;"> 11983.389 </td>
   <td style="text-align:right;"> 21174.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20866.55445 </td>
   <td style="text-align:right;"> 582.679675 </td>
   <td style="text-align:right;"> 10599.816 </td>
   <td style="text-align:right;"> 21886.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35394.92364 </td>
   <td style="text-align:right;"> 786.370243 </td>
   <td style="text-align:right;"> 11760.490 </td>
   <td style="text-align:right;"> 21461.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27766.00417 </td>
   <td style="text-align:right;"> 687.232146 </td>
   <td style="text-align:right;"> 9124.706 </td>
   <td style="text-align:right;"> 21172.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28929.51239 </td>
   <td style="text-align:right;"> 701.903517 </td>
   <td style="text-align:right;"> 10411.059 </td>
   <td style="text-align:right;"> 20756.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12805.17816 </td>
   <td style="text-align:right;"> 448.971617 </td>
   <td style="text-align:right;"> 11714.368 </td>
   <td style="text-align:right;"> 22220.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9577.36085 </td>
   <td style="text-align:right;"> 390.439510 </td>
   <td style="text-align:right;"> 14042.133 </td>
   <td style="text-align:right;"> 21350.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9785.35335 </td>
   <td style="text-align:right;"> 390.233822 </td>
   <td style="text-align:right;"> 12954.461 </td>
   <td style="text-align:right;"> 21762.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11093.71100 </td>
   <td style="text-align:right;"> 411.944905 </td>
   <td style="text-align:right;"> 12801.243 </td>
   <td style="text-align:right;"> 21714.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -3825.42432 </td>
   <td style="text-align:right;"> 305.735646 </td>
   <td style="text-align:right;"> 13246.512 </td>
   <td style="text-align:right;"> 21448.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8396.12985 </td>
   <td style="text-align:right;"> 381.998200 </td>
   <td style="text-align:right;"> 12407.602 </td>
   <td style="text-align:right;"> 22243.94 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31007.17472 </td>
   <td style="text-align:right;"> 737.661274 </td>
   <td style="text-align:right;"> 10266.299 </td>
   <td style="text-align:right;"> 21647.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12031.84038 </td>
   <td style="text-align:right;"> 437.186832 </td>
   <td style="text-align:right;"> 11170.587 </td>
   <td style="text-align:right;"> 21413.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39189.34605 </td>
   <td style="text-align:right;"> 853.204559 </td>
   <td style="text-align:right;"> 10056.382 </td>
   <td style="text-align:right;"> 20975.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16793.95448 </td>
   <td style="text-align:right;"> 514.013899 </td>
   <td style="text-align:right;"> 10804.951 </td>
   <td style="text-align:right;"> 21642.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17300.71865 </td>
   <td style="text-align:right;"> 498.439228 </td>
   <td style="text-align:right;"> 13124.400 </td>
   <td style="text-align:right;"> 21182.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16455.95221 </td>
   <td style="text-align:right;"> 500.954913 </td>
   <td style="text-align:right;"> 12494.617 </td>
   <td style="text-align:right;"> 21609.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -4538.01235 </td>
   <td style="text-align:right;"> 321.609719 </td>
   <td style="text-align:right;"> 11933.978 </td>
   <td style="text-align:right;"> 21593.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15459.54103 </td>
   <td style="text-align:right;"> 487.211050 </td>
   <td style="text-align:right;"> 11786.770 </td>
   <td style="text-align:right;"> 21065.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13143.93475 </td>
   <td style="text-align:right;"> 433.291287 </td>
   <td style="text-align:right;"> 12789.549 </td>
   <td style="text-align:right;"> 21470.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40381.01331 </td>
   <td style="text-align:right;"> 896.861818 </td>
   <td style="text-align:right;"> 7724.309 </td>
   <td style="text-align:right;"> 21369.73 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38006.56336 </td>
   <td style="text-align:right;"> 857.492384 </td>
   <td style="text-align:right;"> 8091.606 </td>
   <td style="text-align:right;"> 21448.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39087.51660 </td>
   <td style="text-align:right;"> 858.152146 </td>
   <td style="text-align:right;"> 8726.933 </td>
   <td style="text-align:right;"> 21408.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26622.25124 </td>
   <td style="text-align:right;"> 670.955029 </td>
   <td style="text-align:right;"> 10904.183 </td>
   <td style="text-align:right;"> 21124.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32606.06382 </td>
   <td style="text-align:right;"> 747.303306 </td>
   <td style="text-align:right;"> 9793.311 </td>
   <td style="text-align:right;"> 21285.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41221.66008 </td>
   <td style="text-align:right;"> 891.206267 </td>
   <td style="text-align:right;"> 9004.791 </td>
   <td style="text-align:right;"> 21326.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16752.63405 </td>
   <td style="text-align:right;"> 501.792492 </td>
   <td style="text-align:right;"> 11350.832 </td>
   <td style="text-align:right;"> 21482.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37081.03196 </td>
   <td style="text-align:right;"> 809.299281 </td>
   <td style="text-align:right;"> 9896.839 </td>
   <td style="text-align:right;"> 21006.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30571.63667 </td>
   <td style="text-align:right;"> 722.595764 </td>
   <td style="text-align:right;"> 10110.417 </td>
   <td style="text-align:right;"> 21833.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24785.82770 </td>
   <td style="text-align:right;"> 639.036535 </td>
   <td style="text-align:right;"> 11521.907 </td>
   <td style="text-align:right;"> 20958.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23621.83488 </td>
   <td style="text-align:right;"> 609.778137 </td>
   <td style="text-align:right;"> 12010.316 </td>
   <td style="text-align:right;"> 21789.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13261.74035 </td>
   <td style="text-align:right;"> 457.982429 </td>
   <td style="text-align:right;"> 11168.152 </td>
   <td style="text-align:right;"> 21400.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9100.22092 </td>
   <td style="text-align:right;"> 394.060475 </td>
   <td style="text-align:right;"> 11429.648 </td>
   <td style="text-align:right;"> 21428.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36475.79805 </td>
   <td style="text-align:right;"> 810.435655 </td>
   <td style="text-align:right;"> 10240.947 </td>
   <td style="text-align:right;"> 21698.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28202.47499 </td>
   <td style="text-align:right;"> 678.705223 </td>
   <td style="text-align:right;"> 10842.045 </td>
   <td style="text-align:right;"> 20726.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34510.63650 </td>
   <td style="text-align:right;"> 777.883706 </td>
   <td style="text-align:right;"> 10369.836 </td>
   <td style="text-align:right;"> 20489.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30949.36260 </td>
   <td style="text-align:right;"> 728.632522 </td>
   <td style="text-align:right;"> 9790.430 </td>
   <td style="text-align:right;"> 22308.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34719.12732 </td>
   <td style="text-align:right;"> 777.362812 </td>
   <td style="text-align:right;"> 10213.774 </td>
   <td style="text-align:right;"> 22248.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31423.45388 </td>
   <td style="text-align:right;"> 727.976524 </td>
   <td style="text-align:right;"> 10011.963 </td>
   <td style="text-align:right;"> 21145.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15509.10075 </td>
   <td style="text-align:right;"> 474.675141 </td>
   <td style="text-align:right;"> 11537.730 </td>
   <td style="text-align:right;"> 21945.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12287.24338 </td>
   <td style="text-align:right;"> 422.724511 </td>
   <td style="text-align:right;"> 12206.623 </td>
   <td style="text-align:right;"> 22062.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22943.42936 </td>
   <td style="text-align:right;"> 610.629539 </td>
   <td style="text-align:right;"> 10853.334 </td>
   <td style="text-align:right;"> 20756.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43604.70693 </td>
   <td style="text-align:right;"> 921.352103 </td>
   <td style="text-align:right;"> 7918.700 </td>
   <td style="text-align:right;"> 22171.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39154.64425 </td>
   <td style="text-align:right;"> 847.077854 </td>
   <td style="text-align:right;"> 9059.028 </td>
   <td style="text-align:right;"> 21942.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23695.96877 </td>
   <td style="text-align:right;"> 611.328134 </td>
   <td style="text-align:right;"> 11960.745 </td>
   <td style="text-align:right;"> 21034.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29284.93930 </td>
   <td style="text-align:right;"> 689.044720 </td>
   <td style="text-align:right;"> 11511.507 </td>
   <td style="text-align:right;"> 21736.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28253.48408 </td>
   <td style="text-align:right;"> 673.415564 </td>
   <td style="text-align:right;"> 11618.551 </td>
   <td style="text-align:right;"> 21628.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15306.41423 </td>
   <td style="text-align:right;"> 492.039017 </td>
   <td style="text-align:right;"> 11132.645 </td>
   <td style="text-align:right;"> 21146.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7831.55014 </td>
   <td style="text-align:right;"> 376.535352 </td>
   <td style="text-align:right;"> 11639.790 </td>
   <td style="text-align:right;"> 20975.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -2677.73994 </td>
   <td style="text-align:right;"> 288.476382 </td>
   <td style="text-align:right;"> 13181.324 </td>
   <td style="text-align:right;"> 22084.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29833.21399 </td>
   <td style="text-align:right;"> 705.590247 </td>
   <td style="text-align:right;"> 10190.477 </td>
   <td style="text-align:right;"> 21175.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27722.28174 </td>
   <td style="text-align:right;"> 670.805428 </td>
   <td style="text-align:right;"> 10239.472 </td>
   <td style="text-align:right;"> 20995.94 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25445.29823 </td>
   <td style="text-align:right;"> 646.054477 </td>
   <td style="text-align:right;"> 8477.103 </td>
   <td style="text-align:right;"> 20912.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 13639.55429 </td>
   <td style="text-align:right;"> 47.410444 </td>
   <td style="text-align:right;"> 12810.912 </td>
   <td style="text-align:right;"> 22053.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16617.09477 </td>
   <td style="text-align:right;"> 504.589490 </td>
   <td style="text-align:right;"> 11351.506 </td>
   <td style="text-align:right;"> 21438.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18381.16687 </td>
   <td style="text-align:right;"> 527.607646 </td>
   <td style="text-align:right;"> 12660.899 </td>
   <td style="text-align:right;"> 21390.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7953.20127 </td>
   <td style="text-align:right;"> 360.654858 </td>
   <td style="text-align:right;"> 13171.823 </td>
   <td style="text-align:right;"> 21659.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11838.93148 </td>
   <td style="text-align:right;"> 414.464535 </td>
   <td style="text-align:right;"> 13719.110 </td>
   <td style="text-align:right;"> 21047.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7910.63433 </td>
   <td style="text-align:right;"> 370.453651 </td>
   <td style="text-align:right;"> 13030.452 </td>
   <td style="text-align:right;"> 21719.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7043.70001 </td>
   <td style="text-align:right;"> 356.671010 </td>
   <td style="text-align:right;"> 12274.878 </td>
   <td style="text-align:right;"> 21734.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7464.59857 </td>
   <td style="text-align:right;"> 367.918961 </td>
   <td style="text-align:right;"> 11724.405 </td>
   <td style="text-align:right;"> 21655.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21218.48099 </td>
   <td style="text-align:right;"> 578.949323 </td>
   <td style="text-align:right;"> 12214.916 </td>
   <td style="text-align:right;"> 21625.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23905.76148 </td>
   <td style="text-align:right;"> 615.812625 </td>
   <td style="text-align:right;"> 10578.645 </td>
   <td style="text-align:right;"> 21406.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32125.73038 </td>
   <td style="text-align:right;"> 732.070872 </td>
   <td style="text-align:right;"> 11364.842 </td>
   <td style="text-align:right;"> 21065.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34129.22787 </td>
   <td style="text-align:right;"> 775.981014 </td>
   <td style="text-align:right;"> 9635.972 </td>
   <td style="text-align:right;"> 21897.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34832.18126 </td>
   <td style="text-align:right;"> 789.104224 </td>
   <td style="text-align:right;"> 9554.436 </td>
   <td style="text-align:right;"> 21475.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30019.60162 </td>
   <td style="text-align:right;"> 715.061656 </td>
   <td style="text-align:right;"> 10575.988 </td>
   <td style="text-align:right;"> 22220.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34975.84696 </td>
   <td style="text-align:right;"> 777.664442 </td>
   <td style="text-align:right;"> 10935.567 </td>
   <td style="text-align:right;"> 21902.36 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36784.10159 </td>
   <td style="text-align:right;"> 795.262889 </td>
   <td style="text-align:right;"> 12035.090 </td>
   <td style="text-align:right;"> 22042.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25488.68079 </td>
   <td style="text-align:right;"> 644.110024 </td>
   <td style="text-align:right;"> 10266.635 </td>
   <td style="text-align:right;"> 21233.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -4219.06888 </td>
   <td style="text-align:right;"> 312.752683 </td>
   <td style="text-align:right;"> 12679.907 </td>
   <td style="text-align:right;"> 21100.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -4511.35392 </td>
   <td style="text-align:right;"> 318.548576 </td>
   <td style="text-align:right;"> 12779.812 </td>
   <td style="text-align:right;"> 21010.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8787.92932 </td>
   <td style="text-align:right;"> 386.816518 </td>
   <td style="text-align:right;"> 12773.312 </td>
   <td style="text-align:right;"> 21549.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21214.42549 </td>
   <td style="text-align:right;"> 568.642214 </td>
   <td style="text-align:right;"> 12497.487 </td>
   <td style="text-align:right;"> 21501.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8570.29088 </td>
   <td style="text-align:right;"> 387.731185 </td>
   <td style="text-align:right;"> 10688.618 </td>
   <td style="text-align:right;"> 20889.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9430.36195 </td>
   <td style="text-align:right;"> 398.934540 </td>
   <td style="text-align:right;"> 10865.522 </td>
   <td style="text-align:right;"> 20877.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39535.90635 </td>
   <td style="text-align:right;"> 838.647958 </td>
   <td style="text-align:right;"> 10608.794 </td>
   <td style="text-align:right;"> 21315.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23797.04520 </td>
   <td style="text-align:right;"> 616.974508 </td>
   <td style="text-align:right;"> 11025.194 </td>
   <td style="text-align:right;"> 21842.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24088.03914 </td>
   <td style="text-align:right;"> 608.521435 </td>
   <td style="text-align:right;"> 10849.294 </td>
   <td style="text-align:right;"> 20955.73 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13772.19131 </td>
   <td style="text-align:right;"> 466.624057 </td>
   <td style="text-align:right;"> 12901.800 </td>
   <td style="text-align:right;"> 21413.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18689.35924 </td>
   <td style="text-align:right;"> 536.417756 </td>
   <td style="text-align:right;"> 13208.040 </td>
   <td style="text-align:right;"> 21433.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12611.87879 </td>
   <td style="text-align:right;"> 459.012188 </td>
   <td style="text-align:right;"> 11732.148 </td>
   <td style="text-align:right;"> 21274.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25343.42995 </td>
   <td style="text-align:right;"> 626.055122 </td>
   <td style="text-align:right;"> 10438.009 </td>
   <td style="text-align:right;"> 21408.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20843.69118 </td>
   <td style="text-align:right;"> 574.250889 </td>
   <td style="text-align:right;"> 9504.863 </td>
   <td style="text-align:right;"> 21914.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26388.68007 </td>
   <td style="text-align:right;"> 651.721398 </td>
   <td style="text-align:right;"> 11201.098 </td>
   <td style="text-align:right;"> 22013.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31164.39781 </td>
   <td style="text-align:right;"> 714.958273 </td>
   <td style="text-align:right;"> 11942.779 </td>
   <td style="text-align:right;"> 21584.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29721.68195 </td>
   <td style="text-align:right;"> 710.396368 </td>
   <td style="text-align:right;"> 10436.065 </td>
   <td style="text-align:right;"> 21037.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31636.78522 </td>
   <td style="text-align:right;"> 733.169722 </td>
   <td style="text-align:right;"> 9512.143 </td>
   <td style="text-align:right;"> 21421.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18808.58387 </td>
   <td style="text-align:right;"> 544.722621 </td>
   <td style="text-align:right;"> 11961.320 </td>
   <td style="text-align:right;"> 21559.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18078.21697 </td>
   <td style="text-align:right;"> 510.604117 </td>
   <td style="text-align:right;"> 12212.201 </td>
   <td style="text-align:right;"> 21358.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16413.30356 </td>
   <td style="text-align:right;"> 505.471367 </td>
   <td style="text-align:right;"> 11507.338 </td>
   <td style="text-align:right;"> 20962.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17724.67914 </td>
   <td style="text-align:right;"> 526.679798 </td>
   <td style="text-align:right;"> 11343.887 </td>
   <td style="text-align:right;"> 21072.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17052.82363 </td>
   <td style="text-align:right;"> 506.382043 </td>
   <td style="text-align:right;"> 11420.363 </td>
   <td style="text-align:right;"> 21242.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21752.08742 </td>
   <td style="text-align:right;"> 584.820770 </td>
   <td style="text-align:right;"> 11390.739 </td>
   <td style="text-align:right;"> 21790.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25044.32857 </td>
   <td style="text-align:right;"> 640.329498 </td>
   <td style="text-align:right;"> 10140.080 </td>
   <td style="text-align:right;"> 21115.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20435.21412 </td>
   <td style="text-align:right;"> 559.740084 </td>
   <td style="text-align:right;"> 10349.064 </td>
   <td style="text-align:right;"> 21054.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43030.73226 </td>
   <td style="text-align:right;"> 906.791100 </td>
   <td style="text-align:right;"> 9866.049 </td>
   <td style="text-align:right;"> 21420.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46028.88480 </td>
   <td style="text-align:right;"> 951.828669 </td>
   <td style="text-align:right;"> 9618.740 </td>
   <td style="text-align:right;"> 21403.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10350.60892 </td>
   <td style="text-align:right;"> 419.180784 </td>
   <td style="text-align:right;"> 11225.138 </td>
   <td style="text-align:right;"> 20898.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24530.86888 </td>
   <td style="text-align:right;"> 605.701346 </td>
   <td style="text-align:right;"> 12884.319 </td>
   <td style="text-align:right;"> 21197.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40934.23513 </td>
   <td style="text-align:right;"> 876.496877 </td>
   <td style="text-align:right;"> 10048.744 </td>
   <td style="text-align:right;"> 21612.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10485.03525 </td>
   <td style="text-align:right;"> 424.499278 </td>
   <td style="text-align:right;"> 9618.044 </td>
   <td style="text-align:right;"> 21377.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13471.36004 </td>
   <td style="text-align:right;"> 455.534264 </td>
   <td style="text-align:right;"> 10817.838 </td>
   <td style="text-align:right;"> 21308.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24530.92590 </td>
   <td style="text-align:right;"> 624.799707 </td>
   <td style="text-align:right;"> 9485.161 </td>
   <td style="text-align:right;"> 21544.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36150.15168 </td>
   <td style="text-align:right;"> 802.230070 </td>
   <td style="text-align:right;"> 9519.853 </td>
   <td style="text-align:right;"> 21716.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35572.38608 </td>
   <td style="text-align:right;"> 794.859120 </td>
   <td style="text-align:right;"> 9506.776 </td>
   <td style="text-align:right;"> 21654.84 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43006.57566 </td>
   <td style="text-align:right;"> 914.527394 </td>
   <td style="text-align:right;"> 9537.507 </td>
   <td style="text-align:right;"> 21247.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36973.78022 </td>
   <td style="text-align:right;"> 812.555461 </td>
   <td style="text-align:right;"> 10158.215 </td>
   <td style="text-align:right;"> 21522.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34926.25548 </td>
   <td style="text-align:right;"> 800.436892 </td>
   <td style="text-align:right;"> 9308.960 </td>
   <td style="text-align:right;"> 21746.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -45008.07124 </td>
   <td style="text-align:right;"> 955.154476 </td>
   <td style="text-align:right;"> 9227.495 </td>
   <td style="text-align:right;"> 21861.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42222.87113 </td>
   <td style="text-align:right;"> 891.835526 </td>
   <td style="text-align:right;"> 9394.833 </td>
   <td style="text-align:right;"> 21027.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21167.77502 </td>
   <td style="text-align:right;"> 574.607389 </td>
   <td style="text-align:right;"> 11271.774 </td>
   <td style="text-align:right;"> 21291.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28434.37513 </td>
   <td style="text-align:right;"> 684.385943 </td>
   <td style="text-align:right;"> 10113.639 </td>
   <td style="text-align:right;"> 21509.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41903.09664 </td>
   <td style="text-align:right;"> 902.028102 </td>
   <td style="text-align:right;"> 8433.999 </td>
   <td style="text-align:right;"> 21386.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21691.90522 </td>
   <td style="text-align:right;"> 581.805325 </td>
   <td style="text-align:right;"> 11166.465 </td>
   <td style="text-align:right;"> 21708.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41902.32226 </td>
   <td style="text-align:right;"> 895.506834 </td>
   <td style="text-align:right;"> 9226.747 </td>
   <td style="text-align:right;"> 21140.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23399.95047 </td>
   <td style="text-align:right;"> 625.088573 </td>
   <td style="text-align:right;"> 10501.475 </td>
   <td style="text-align:right;"> 22076.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32699.12475 </td>
   <td style="text-align:right;"> 740.226406 </td>
   <td style="text-align:right;"> 9806.797 </td>
   <td style="text-align:right;"> 20829.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33599.38472 </td>
   <td style="text-align:right;"> 757.408555 </td>
   <td style="text-align:right;"> 10731.711 </td>
   <td style="text-align:right;"> 21737.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25265.20893 </td>
   <td style="text-align:right;"> 652.999256 </td>
   <td style="text-align:right;"> 9807.759 </td>
   <td style="text-align:right;"> 21075.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42175.88135 </td>
   <td style="text-align:right;"> 906.817761 </td>
   <td style="text-align:right;"> 8500.510 </td>
   <td style="text-align:right;"> 21379.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13455.72529 </td>
   <td style="text-align:right;"> 449.299653 </td>
   <td style="text-align:right;"> 11716.476 </td>
   <td style="text-align:right;"> 21343.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13146.60557 </td>
   <td style="text-align:right;"> 442.699478 </td>
   <td style="text-align:right;"> 11973.192 </td>
   <td style="text-align:right;"> 21277.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41681.02000 </td>
   <td style="text-align:right;"> 895.537331 </td>
   <td style="text-align:right;"> 10001.390 </td>
   <td style="text-align:right;"> 21061.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42309.31665 </td>
   <td style="text-align:right;"> 908.843274 </td>
   <td style="text-align:right;"> 9005.642 </td>
   <td style="text-align:right;"> 22279.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41168.75788 </td>
   <td style="text-align:right;"> 892.044229 </td>
   <td style="text-align:right;"> 8732.998 </td>
   <td style="text-align:right;"> 21997.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23334.26297 </td>
   <td style="text-align:right;"> 601.010878 </td>
   <td style="text-align:right;"> 12796.713 </td>
   <td style="text-align:right;"> 20698.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -49368.45639 </td>
   <td style="text-align:right;"> 1007.180395 </td>
   <td style="text-align:right;"> 8568.823 </td>
   <td style="text-align:right;"> 22143.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -50717.09884 </td>
   <td style="text-align:right;"> 1031.245236 </td>
   <td style="text-align:right;"> 8529.763 </td>
   <td style="text-align:right;"> 20474.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23096.63125 </td>
   <td style="text-align:right;"> 601.767175 </td>
   <td style="text-align:right;"> 11430.264 </td>
   <td style="text-align:right;"> 22310.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -45361.53642 </td>
   <td style="text-align:right;"> 945.332689 </td>
   <td style="text-align:right;"> 9276.753 </td>
   <td style="text-align:right;"> 20499.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10817.25246 </td>
   <td style="text-align:right;"> 404.311340 </td>
   <td style="text-align:right;"> 13267.403 </td>
   <td style="text-align:right;"> 21549.73 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14968.20850 </td>
   <td style="text-align:right;"> 483.290072 </td>
   <td style="text-align:right;"> 9932.428 </td>
   <td style="text-align:right;"> 20766.36 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24560.73173 </td>
   <td style="text-align:right;"> 627.447127 </td>
   <td style="text-align:right;"> 10360.319 </td>
   <td style="text-align:right;"> 20844.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16739.41800 </td>
   <td style="text-align:right;"> 511.466551 </td>
   <td style="text-align:right;"> 10415.555 </td>
   <td style="text-align:right;"> 20947.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8268.40058 </td>
   <td style="text-align:right;"> 376.126315 </td>
   <td style="text-align:right;"> 11696.644 </td>
   <td style="text-align:right;"> 22041.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25125.70670 </td>
   <td style="text-align:right;"> 628.644012 </td>
   <td style="text-align:right;"> 12308.432 </td>
   <td style="text-align:right;"> 20959.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32545.00431 </td>
   <td style="text-align:right;"> 752.706377 </td>
   <td style="text-align:right;"> 9595.214 </td>
   <td style="text-align:right;"> 21600.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26092.07971 </td>
   <td style="text-align:right;"> 649.348043 </td>
   <td style="text-align:right;"> 11029.487 </td>
   <td style="text-align:right;"> 21510.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29585.61419 </td>
   <td style="text-align:right;"> 713.969595 </td>
   <td style="text-align:right;"> 10369.462 </td>
   <td style="text-align:right;"> 20730.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35715.78305 </td>
   <td style="text-align:right;"> 786.304445 </td>
   <td style="text-align:right;"> 10358.976 </td>
   <td style="text-align:right;"> 22086.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14067.34196 </td>
   <td style="text-align:right;"> 461.046576 </td>
   <td style="text-align:right;"> 11545.324 </td>
   <td style="text-align:right;"> 20517.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37777.30842 </td>
   <td style="text-align:right;"> 840.069229 </td>
   <td style="text-align:right;"> 9087.243 </td>
   <td style="text-align:right;"> 22198.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33289.29582 </td>
   <td style="text-align:right;"> 765.553474 </td>
   <td style="text-align:right;"> 9251.551 </td>
   <td style="text-align:right;"> 22140.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46798.53992 </td>
   <td style="text-align:right;"> 982.139975 </td>
   <td style="text-align:right;"> 8011.363 </td>
   <td style="text-align:right;"> 21178.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31809.45304 </td>
   <td style="text-align:right;"> 738.452830 </td>
   <td style="text-align:right;"> 10321.468 </td>
   <td style="text-align:right;"> 21574.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29536.48950 </td>
   <td style="text-align:right;"> 689.763842 </td>
   <td style="text-align:right;"> 10607.696 </td>
   <td style="text-align:right;"> 21565.24 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27960.50598 </td>
   <td style="text-align:right;"> 675.236048 </td>
   <td style="text-align:right;"> 10442.172 </td>
   <td style="text-align:right;"> 21035.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24875.02257 </td>
   <td style="text-align:right;"> 630.614005 </td>
   <td style="text-align:right;"> 9835.941 </td>
   <td style="text-align:right;"> 20743.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33748.51698 </td>
   <td style="text-align:right;"> 767.316254 </td>
   <td style="text-align:right;"> 11346.081 </td>
   <td style="text-align:right;"> 21617.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36420.98682 </td>
   <td style="text-align:right;"> 816.485694 </td>
   <td style="text-align:right;"> 8892.239 </td>
   <td style="text-align:right;"> 21606.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21908.09808 </td>
   <td style="text-align:right;"> 590.362855 </td>
   <td style="text-align:right;"> 10085.999 </td>
   <td style="text-align:right;"> 21158.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23606.92886 </td>
   <td style="text-align:right;"> 606.878639 </td>
   <td style="text-align:right;"> 10351.321 </td>
   <td style="text-align:right;"> 21604.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28344.24677 </td>
   <td style="text-align:right;"> 670.865900 </td>
   <td style="text-align:right;"> 10904.078 </td>
   <td style="text-align:right;"> 21782.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31234.20803 </td>
   <td style="text-align:right;"> 717.571904 </td>
   <td style="text-align:right;"> 11267.114 </td>
   <td style="text-align:right;"> 21994.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41884.08969 </td>
   <td style="text-align:right;"> 895.082247 </td>
   <td style="text-align:right;"> 10413.117 </td>
   <td style="text-align:right;"> 21061.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43328.04456 </td>
   <td style="text-align:right;"> 935.441076 </td>
   <td style="text-align:right;"> 7837.541 </td>
   <td style="text-align:right;"> 20304.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34868.35868 </td>
   <td style="text-align:right;"> 805.348045 </td>
   <td style="text-align:right;"> 8287.492 </td>
   <td style="text-align:right;"> 21064.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29450.22379 </td>
   <td style="text-align:right;"> 714.798117 </td>
   <td style="text-align:right;"> 8765.280 </td>
   <td style="text-align:right;"> 21659.73 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37930.65150 </td>
   <td style="text-align:right;"> 829.837923 </td>
   <td style="text-align:right;"> 10445.967 </td>
   <td style="text-align:right;"> 22034.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37022.21941 </td>
   <td style="text-align:right;"> 810.643389 </td>
   <td style="text-align:right;"> 10880.522 </td>
   <td style="text-align:right;"> 21322.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31846.61775 </td>
   <td style="text-align:right;"> 739.730166 </td>
   <td style="text-align:right;"> 9768.957 </td>
   <td style="text-align:right;"> 21723.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41791.09800 </td>
   <td style="text-align:right;"> 886.343552 </td>
   <td style="text-align:right;"> 9710.612 </td>
   <td style="text-align:right;"> 21690.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31108.55704 </td>
   <td style="text-align:right;"> 726.757528 </td>
   <td style="text-align:right;"> 9834.948 </td>
   <td style="text-align:right;"> 21525.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38672.88212 </td>
   <td style="text-align:right;"> 826.213385 </td>
   <td style="text-align:right;"> 9688.078 </td>
   <td style="text-align:right;"> 21139.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24994.83637 </td>
   <td style="text-align:right;"> 641.259304 </td>
   <td style="text-align:right;"> 10194.209 </td>
   <td style="text-align:right;"> 21960.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44740.86461 </td>
   <td style="text-align:right;"> 934.465335 </td>
   <td style="text-align:right;"> 8977.260 </td>
   <td style="text-align:right;"> 20976.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36656.43620 </td>
   <td style="text-align:right;"> 817.162094 </td>
   <td style="text-align:right;"> 7568.712 </td>
   <td style="text-align:right;"> 20856.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43462.97132 </td>
   <td style="text-align:right;"> 920.346060 </td>
   <td style="text-align:right;"> 9933.870 </td>
   <td style="text-align:right;"> 22000.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31930.28828 </td>
   <td style="text-align:right;"> 749.258905 </td>
   <td style="text-align:right;"> 9028.304 </td>
   <td style="text-align:right;"> 21682.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8382.39369 </td>
   <td style="text-align:right;"> 360.772325 </td>
   <td style="text-align:right;"> 13621.039 </td>
   <td style="text-align:right;"> 21807.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7532.97522 </td>
   <td style="text-align:right;"> 341.282267 </td>
   <td style="text-align:right;"> 14102.262 </td>
   <td style="text-align:right;"> 21831.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24093.76735 </td>
   <td style="text-align:right;"> 620.045790 </td>
   <td style="text-align:right;"> 11468.429 </td>
   <td style="text-align:right;"> 20704.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28196.07936 </td>
   <td style="text-align:right;"> 680.772400 </td>
   <td style="text-align:right;"> 11711.095 </td>
   <td style="text-align:right;"> 21341.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26389.80546 </td>
   <td style="text-align:right;"> 674.274178 </td>
   <td style="text-align:right;"> 8990.834 </td>
   <td style="text-align:right;"> 21493.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27383.89417 </td>
   <td style="text-align:right;"> 686.989427 </td>
   <td style="text-align:right;"> 10146.985 </td>
   <td style="text-align:right;"> 21506.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18972.05862 </td>
   <td style="text-align:right;"> 526.852727 </td>
   <td style="text-align:right;"> 11378.730 </td>
   <td style="text-align:right;"> 21237.84 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33436.10694 </td>
   <td style="text-align:right;"> 764.236434 </td>
   <td style="text-align:right;"> 10086.563 </td>
   <td style="text-align:right;"> 21596.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30138.92068 </td>
   <td style="text-align:right;"> 729.100569 </td>
   <td style="text-align:right;"> 9076.426 </td>
   <td style="text-align:right;"> 21547.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24307.51447 </td>
   <td style="text-align:right;"> 625.284482 </td>
   <td style="text-align:right;"> 10632.212 </td>
   <td style="text-align:right;"> 21078.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23626.05923 </td>
   <td style="text-align:right;"> 609.506302 </td>
   <td style="text-align:right;"> 10639.806 </td>
   <td style="text-align:right;"> 21230.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38065.02109 </td>
   <td style="text-align:right;"> 816.480902 </td>
   <td style="text-align:right;"> 11620.653 </td>
   <td style="text-align:right;"> 21217.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37340.22870 </td>
   <td style="text-align:right;"> 833.878912 </td>
   <td style="text-align:right;"> 7112.448 </td>
   <td style="text-align:right;"> 21844.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31674.93655 </td>
   <td style="text-align:right;"> 742.697400 </td>
   <td style="text-align:right;"> 10623.243 </td>
   <td style="text-align:right;"> 21439.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25687.33120 </td>
   <td style="text-align:right;"> 646.845148 </td>
   <td style="text-align:right;"> 10557.326 </td>
   <td style="text-align:right;"> 21281.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17910.28622 </td>
   <td style="text-align:right;"> 526.940780 </td>
   <td style="text-align:right;"> 11324.764 </td>
   <td style="text-align:right;"> 21527.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22074.43280 </td>
   <td style="text-align:right;"> 587.650025 </td>
   <td style="text-align:right;"> 10331.687 </td>
   <td style="text-align:right;"> 21159.36 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34088.44224 </td>
   <td style="text-align:right;"> 772.642369 </td>
   <td style="text-align:right;"> 9985.701 </td>
   <td style="text-align:right;"> 21466.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41612.22818 </td>
   <td style="text-align:right;"> 882.597026 </td>
   <td style="text-align:right;"> 9372.988 </td>
   <td style="text-align:right;"> 21876.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38809.09385 </td>
   <td style="text-align:right;"> 841.665475 </td>
   <td style="text-align:right;"> 9585.914 </td>
   <td style="text-align:right;"> 21791.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27169.93919 </td>
   <td style="text-align:right;"> 670.709483 </td>
   <td style="text-align:right;"> 11054.629 </td>
   <td style="text-align:right;"> 21195.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21767.53367 </td>
   <td style="text-align:right;"> 592.620410 </td>
   <td style="text-align:right;"> 10211.513 </td>
   <td style="text-align:right;"> 21452.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24793.38354 </td>
   <td style="text-align:right;"> 635.909888 </td>
   <td style="text-align:right;"> 11555.056 </td>
   <td style="text-align:right;"> 21254.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24881.52246 </td>
   <td style="text-align:right;"> 641.372114 </td>
   <td style="text-align:right;"> 9450.183 </td>
   <td style="text-align:right;"> 21515.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22636.66546 </td>
   <td style="text-align:right;"> 593.068760 </td>
   <td style="text-align:right;"> 12396.488 </td>
   <td style="text-align:right;"> 21754.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29563.58329 </td>
   <td style="text-align:right;"> 702.920534 </td>
   <td style="text-align:right;"> 9822.527 </td>
   <td style="text-align:right;"> 21614.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -54186.75843 </td>
   <td style="text-align:right;"> 1068.399415 </td>
   <td style="text-align:right;"> 8451.381 </td>
   <td style="text-align:right;"> 21177.05 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17500.80856 </td>
   <td style="text-align:right;"> 538.285003 </td>
   <td style="text-align:right;"> 9619.126 </td>
   <td style="text-align:right;"> 21319.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28544.03516 </td>
   <td style="text-align:right;"> 685.818762 </td>
   <td style="text-align:right;"> 8803.303 </td>
   <td style="text-align:right;"> 21493.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25956.13365 </td>
   <td style="text-align:right;"> 643.773457 </td>
   <td style="text-align:right;"> 9709.322 </td>
   <td style="text-align:right;"> 21158.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30727.54857 </td>
   <td style="text-align:right;"> 713.462599 </td>
   <td style="text-align:right;"> 9995.532 </td>
   <td style="text-align:right;"> 21175.05 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25213.92568 </td>
   <td style="text-align:right;"> 635.862672 </td>
   <td style="text-align:right;"> 9882.277 </td>
   <td style="text-align:right;"> 21287.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38711.63763 </td>
   <td style="text-align:right;"> 838.306137 </td>
   <td style="text-align:right;"> 10437.461 </td>
   <td style="text-align:right;"> 21323.24 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21815.18248 </td>
   <td style="text-align:right;"> 595.981769 </td>
   <td style="text-align:right;"> 9764.167 </td>
   <td style="text-align:right;"> 20987.05 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20120.07105 </td>
   <td style="text-align:right;"> 570.961005 </td>
   <td style="text-align:right;"> 9588.438 </td>
   <td style="text-align:right;"> 20979.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26483.59771 </td>
   <td style="text-align:right;"> 656.738295 </td>
   <td style="text-align:right;"> 9071.493 </td>
   <td style="text-align:right;"> 21756.05 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22477.21278 </td>
   <td style="text-align:right;"> 604.991488 </td>
   <td style="text-align:right;"> 8286.726 </td>
   <td style="text-align:right;"> 21806.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18678.84448 </td>
   <td style="text-align:right;"> 553.129762 </td>
   <td style="text-align:right;"> 9097.654 </td>
   <td style="text-align:right;"> 21094.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -50047.28926 </td>
   <td style="text-align:right;"> 1015.687207 </td>
   <td style="text-align:right;"> 10508.341 </td>
   <td style="text-align:right;"> 21213.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -782.46823 </td>
   <td style="text-align:right;"> 272.380515 </td>
   <td style="text-align:right;"> 10898.258 </td>
   <td style="text-align:right;"> 21667.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32646.86331 </td>
   <td style="text-align:right;"> 762.969734 </td>
   <td style="text-align:right;"> 9248.807 </td>
   <td style="text-align:right;"> 21311.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33957.89712 </td>
   <td style="text-align:right;"> 776.841103 </td>
   <td style="text-align:right;"> 10027.330 </td>
   <td style="text-align:right;"> 21096.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19507.27673 </td>
   <td style="text-align:right;"> 549.980344 </td>
   <td style="text-align:right;"> 11267.179 </td>
   <td style="text-align:right;"> 21307.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23330.02160 </td>
   <td style="text-align:right;"> 622.029401 </td>
   <td style="text-align:right;"> 10350.461 </td>
   <td style="text-align:right;"> 21437.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21784.60840 </td>
   <td style="text-align:right;"> 596.769799 </td>
   <td style="text-align:right;"> 10356.403 </td>
   <td style="text-align:right;"> 21124.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20477.21242 </td>
   <td style="text-align:right;"> 563.651578 </td>
   <td style="text-align:right;"> 11371.278 </td>
   <td style="text-align:right;"> 20862.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25432.51623 </td>
   <td style="text-align:right;"> 645.384657 </td>
   <td style="text-align:right;"> 12072.933 </td>
   <td style="text-align:right;"> 21030.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29263.36322 </td>
   <td style="text-align:right;"> 704.894945 </td>
   <td style="text-align:right;"> 8804.804 </td>
   <td style="text-align:right;"> 21721.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25418.95221 </td>
   <td style="text-align:right;"> 642.000017 </td>
   <td style="text-align:right;"> 11031.864 </td>
   <td style="text-align:right;"> 21026.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40898.49516 </td>
   <td style="text-align:right;"> 892.579855 </td>
   <td style="text-align:right;"> 8322.472 </td>
   <td style="text-align:right;"> 21678.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -51164.40562 </td>
   <td style="text-align:right;"> 1040.680854 </td>
   <td style="text-align:right;"> 10007.045 </td>
   <td style="text-align:right;"> 21241.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30685.25135 </td>
   <td style="text-align:right;"> 729.957660 </td>
   <td style="text-align:right;"> 8483.767 </td>
   <td style="text-align:right;"> 21452.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26500.70626 </td>
   <td style="text-align:right;"> 662.661751 </td>
   <td style="text-align:right;"> 9136.676 </td>
   <td style="text-align:right;"> 21522.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30494.06612 </td>
   <td style="text-align:right;"> 718.594997 </td>
   <td style="text-align:right;"> 10257.362 </td>
   <td style="text-align:right;"> 20987.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21846.63780 </td>
   <td style="text-align:right;"> 583.063802 </td>
   <td style="text-align:right;"> 11576.650 </td>
   <td style="text-align:right;"> 21267.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29364.64614 </td>
   <td style="text-align:right;"> 678.916540 </td>
   <td style="text-align:right;"> 10939.106 </td>
   <td style="text-align:right;"> 21376.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21593.17511 </td>
   <td style="text-align:right;"> 576.814387 </td>
   <td style="text-align:right;"> 11447.679 </td>
   <td style="text-align:right;"> 21549.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25121.74650 </td>
   <td style="text-align:right;"> 624.918754 </td>
   <td style="text-align:right;"> 11270.948 </td>
   <td style="text-align:right;"> 21751.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8588.08779 </td>
   <td style="text-align:right;"> 380.513380 </td>
   <td style="text-align:right;"> 12360.590 </td>
   <td style="text-align:right;"> 21044.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38907.96935 </td>
   <td style="text-align:right;"> 850.245258 </td>
   <td style="text-align:right;"> 8698.955 </td>
   <td style="text-align:right;"> 21791.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36141.59323 </td>
   <td style="text-align:right;"> 816.533349 </td>
   <td style="text-align:right;"> 8762.008 </td>
   <td style="text-align:right;"> 21716.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11678.60922 </td>
   <td style="text-align:right;"> 433.948643 </td>
   <td style="text-align:right;"> 12648.996 </td>
   <td style="text-align:right;"> 21258.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37704.72622 </td>
   <td style="text-align:right;"> 839.938811 </td>
   <td style="text-align:right;"> 8916.009 </td>
   <td style="text-align:right;"> 21446.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25818.36269 </td>
   <td style="text-align:right;"> 642.510547 </td>
   <td style="text-align:right;"> 10891.287 </td>
   <td style="text-align:right;"> 21635.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17739.27807 </td>
   <td style="text-align:right;"> 529.531200 </td>
   <td style="text-align:right;"> 11304.310 </td>
   <td style="text-align:right;"> 21310.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26256.86760 </td>
   <td style="text-align:right;"> 651.245734 </td>
   <td style="text-align:right;"> 10613.361 </td>
   <td style="text-align:right;"> 21494.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22483.47183 </td>
   <td style="text-align:right;"> 578.803790 </td>
   <td style="text-align:right;"> 13686.451 </td>
   <td style="text-align:right;"> 21305.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30338.01979 </td>
   <td style="text-align:right;"> 724.326443 </td>
   <td style="text-align:right;"> 7559.580 </td>
   <td style="text-align:right;"> 21105.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -51075.44610 </td>
   <td style="text-align:right;"> 1028.383318 </td>
   <td style="text-align:right;"> 11439.614 </td>
   <td style="text-align:right;"> 20930.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33101.01615 </td>
   <td style="text-align:right;"> 751.337225 </td>
   <td style="text-align:right;"> 10412.474 </td>
   <td style="text-align:right;"> 21383.24 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21248.48029 </td>
   <td style="text-align:right;"> 579.788091 </td>
   <td style="text-align:right;"> 10704.102 </td>
   <td style="text-align:right;"> 21318.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8855.13838 </td>
   <td style="text-align:right;"> 389.206748 </td>
   <td style="text-align:right;"> 12650.279 </td>
   <td style="text-align:right;"> 21583.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31425.26057 </td>
   <td style="text-align:right;"> 737.836661 </td>
   <td style="text-align:right;"> 9646.676 </td>
   <td style="text-align:right;"> 21805.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27829.07924 </td>
   <td style="text-align:right;"> 673.273254 </td>
   <td style="text-align:right;"> 10405.721 </td>
   <td style="text-align:right;"> 20948.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26357.05771 </td>
   <td style="text-align:right;"> 661.617513 </td>
   <td style="text-align:right;"> 9496.563 </td>
   <td style="text-align:right;"> 21292.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44215.19549 </td>
   <td style="text-align:right;"> 931.806993 </td>
   <td style="text-align:right;"> 9572.100 </td>
   <td style="text-align:right;"> 21225.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23287.51666 </td>
   <td style="text-align:right;"> 611.594717 </td>
   <td style="text-align:right;"> 9798.828 </td>
   <td style="text-align:right;"> 21940.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38894.31935 </td>
   <td style="text-align:right;"> 856.613296 </td>
   <td style="text-align:right;"> 9620.463 </td>
   <td style="text-align:right;"> 21597.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26087.19171 </td>
   <td style="text-align:right;"> 640.967189 </td>
   <td style="text-align:right;"> 10849.023 </td>
   <td style="text-align:right;"> 21127.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16465.66860 </td>
   <td style="text-align:right;"> 502.519864 </td>
   <td style="text-align:right;"> 11017.330 </td>
   <td style="text-align:right;"> 21214.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17649.30777 </td>
   <td style="text-align:right;"> 517.200933 </td>
   <td style="text-align:right;"> 11521.121 </td>
   <td style="text-align:right;"> 21879.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40093.83838 </td>
   <td style="text-align:right;"> 865.240757 </td>
   <td style="text-align:right;"> 8886.542 </td>
   <td style="text-align:right;"> 20944.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35526.46989 </td>
   <td style="text-align:right;"> 794.025736 </td>
   <td style="text-align:right;"> 9013.119 </td>
   <td style="text-align:right;"> 20865.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32012.14780 </td>
   <td style="text-align:right;"> 758.339780 </td>
   <td style="text-align:right;"> 10594.530 </td>
   <td style="text-align:right;"> 21615.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26631.02190 </td>
   <td style="text-align:right;"> 647.477204 </td>
   <td style="text-align:right;"> 9950.783 </td>
   <td style="text-align:right;"> 20899.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19632.70529 </td>
   <td style="text-align:right;"> 556.731326 </td>
   <td style="text-align:right;"> 12062.872 </td>
   <td style="text-align:right;"> 20915.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9570.31173 </td>
   <td style="text-align:right;"> 400.228221 </td>
   <td style="text-align:right;"> 11969.329 </td>
   <td style="text-align:right;"> 20882.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21854.32548 </td>
   <td style="text-align:right;"> 588.906884 </td>
   <td style="text-align:right;"> 11402.714 </td>
   <td style="text-align:right;"> 21203.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32403.96150 </td>
   <td style="text-align:right;"> 743.123178 </td>
   <td style="text-align:right;"> 9630.625 </td>
   <td style="text-align:right;"> 21071.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18912.48222 </td>
   <td style="text-align:right;"> 548.862755 </td>
   <td style="text-align:right;"> 10911.279 </td>
   <td style="text-align:right;"> 21608.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19917.06896 </td>
   <td style="text-align:right;"> 540.999369 </td>
   <td style="text-align:right;"> 12905.298 </td>
   <td style="text-align:right;"> 20788.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22186.66794 </td>
   <td style="text-align:right;"> 574.466686 </td>
   <td style="text-align:right;"> 12827.659 </td>
   <td style="text-align:right;"> 20835.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18407.09625 </td>
   <td style="text-align:right;"> 517.168325 </td>
   <td style="text-align:right;"> 10158.108 </td>
   <td style="text-align:right;"> 21775.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36704.62633 </td>
   <td style="text-align:right;"> 822.301906 </td>
   <td style="text-align:right;"> 10254.938 </td>
   <td style="text-align:right;"> 20929.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39802.39361 </td>
   <td style="text-align:right;"> 859.219411 </td>
   <td style="text-align:right;"> 10255.639 </td>
   <td style="text-align:right;"> 21208.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44359.92184 </td>
   <td style="text-align:right;"> 939.564181 </td>
   <td style="text-align:right;"> 8826.263 </td>
   <td style="text-align:right;"> 21479.43 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29576.99064 </td>
   <td style="text-align:right;"> 702.012150 </td>
   <td style="text-align:right;"> 9757.694 </td>
   <td style="text-align:right;"> 21259.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27746.85606 </td>
   <td style="text-align:right;"> 676.420941 </td>
   <td style="text-align:right;"> 9450.540 </td>
   <td style="text-align:right;"> 21311.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30835.35039 </td>
   <td style="text-align:right;"> 728.131675 </td>
   <td style="text-align:right;"> 9877.682 </td>
   <td style="text-align:right;"> 21508.05 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46807.12271 </td>
   <td style="text-align:right;"> 973.222836 </td>
   <td style="text-align:right;"> 9774.448 </td>
   <td style="text-align:right;"> 20919.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39100.10484 </td>
   <td style="text-align:right;"> 867.511737 </td>
   <td style="text-align:right;"> 7041.905 </td>
   <td style="text-align:right;"> 21690.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43548.19849 </td>
   <td style="text-align:right;"> 930.894677 </td>
   <td style="text-align:right;"> 7651.879 </td>
   <td style="text-align:right;"> 21380.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44790.39737 </td>
   <td style="text-align:right;"> 955.274705 </td>
   <td style="text-align:right;"> 6669.455 </td>
   <td style="text-align:right;"> 21306.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34704.25595 </td>
   <td style="text-align:right;"> 800.127611 </td>
   <td style="text-align:right;"> 6956.073 </td>
   <td style="text-align:right;"> 21243.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30844.97773 </td>
   <td style="text-align:right;"> 699.429763 </td>
   <td style="text-align:right;"> 12391.364 </td>
   <td style="text-align:right;"> 21859.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5761.02334 </td>
   <td style="text-align:right;"> 331.714662 </td>
   <td style="text-align:right;"> 12988.852 </td>
   <td style="text-align:right;"> 21165.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14791.42596 </td>
   <td style="text-align:right;"> 484.279946 </td>
   <td style="text-align:right;"> 11998.631 </td>
   <td style="text-align:right;"> 21307.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -2752.07064 </td>
   <td style="text-align:right;"> 300.453531 </td>
   <td style="text-align:right;"> 12717.415 </td>
   <td style="text-align:right;"> 21320.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14421.24120 </td>
   <td style="text-align:right;"> 449.634333 </td>
   <td style="text-align:right;"> 12911.420 </td>
   <td style="text-align:right;"> 21550.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24935.17988 </td>
   <td style="text-align:right;"> 636.603840 </td>
   <td style="text-align:right;"> 11469.990 </td>
   <td style="text-align:right;"> 21157.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10605.74678 </td>
   <td style="text-align:right;"> 395.202395 </td>
   <td style="text-align:right;"> 12159.413 </td>
   <td style="text-align:right;"> 21383.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32193.27735 </td>
   <td style="text-align:right;"> 720.950177 </td>
   <td style="text-align:right;"> 11622.890 </td>
   <td style="text-align:right;"> 21483.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30150.85404 </td>
   <td style="text-align:right;"> 691.078494 </td>
   <td style="text-align:right;"> 11458.076 </td>
   <td style="text-align:right;"> 21500.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26647.00692 </td>
   <td style="text-align:right;"> 673.134097 </td>
   <td style="text-align:right;"> 9282.761 </td>
   <td style="text-align:right;"> 21470.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30615.57369 </td>
   <td style="text-align:right;"> 712.185398 </td>
   <td style="text-align:right;"> 11710.636 </td>
   <td style="text-align:right;"> 21219.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36205.56641 </td>
   <td style="text-align:right;"> 807.786611 </td>
   <td style="text-align:right;"> 10243.753 </td>
   <td style="text-align:right;"> 21288.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34994.26201 </td>
   <td style="text-align:right;"> 782.784434 </td>
   <td style="text-align:right;"> 10426.210 </td>
   <td style="text-align:right;"> 21266.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28027.11533 </td>
   <td style="text-align:right;"> 683.147463 </td>
   <td style="text-align:right;"> 9724.739 </td>
   <td style="text-align:right;"> 21690.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36434.52498 </td>
   <td style="text-align:right;"> 801.416281 </td>
   <td style="text-align:right;"> 10595.712 </td>
   <td style="text-align:right;"> 21671.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35317.69085 </td>
   <td style="text-align:right;"> 783.327114 </td>
   <td style="text-align:right;"> 12551.690 </td>
   <td style="text-align:right;"> 21387.24 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32541.40709 </td>
   <td style="text-align:right;"> 763.501273 </td>
   <td style="text-align:right;"> 8838.608 </td>
   <td style="text-align:right;"> 21340.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37090.11023 </td>
   <td style="text-align:right;"> 830.989375 </td>
   <td style="text-align:right;"> 8842.690 </td>
   <td style="text-align:right;"> 21459.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -54906.30259 </td>
   <td style="text-align:right;"> 1094.750464 </td>
   <td style="text-align:right;"> 7455.158 </td>
   <td style="text-align:right;"> 21406.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21810.55607 </td>
   <td style="text-align:right;"> 596.810838 </td>
   <td style="text-align:right;"> 10699.233 </td>
   <td style="text-align:right;"> 21322.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23495.32573 </td>
   <td style="text-align:right;"> 628.653001 </td>
   <td style="text-align:right;"> 9638.312 </td>
   <td style="text-align:right;"> 21447.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23167.69268 </td>
   <td style="text-align:right;"> 616.795335 </td>
   <td style="text-align:right;"> 9657.276 </td>
   <td style="text-align:right;"> 21381.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21716.63302 </td>
   <td style="text-align:right;"> 598.200875 </td>
   <td style="text-align:right;"> 8759.900 </td>
   <td style="text-align:right;"> 21155.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25903.49044 </td>
   <td style="text-align:right;"> 638.758581 </td>
   <td style="text-align:right;"> 12762.973 </td>
   <td style="text-align:right;"> 21215.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22002.85888 </td>
   <td style="text-align:right;"> 609.128137 </td>
   <td style="text-align:right;"> 8582.654 </td>
   <td style="text-align:right;"> 21115.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28272.49168 </td>
   <td style="text-align:right;"> 703.708222 </td>
   <td style="text-align:right;"> 7798.843 </td>
   <td style="text-align:right;"> 21104.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27717.94417 </td>
   <td style="text-align:right;"> 679.755538 </td>
   <td style="text-align:right;"> 8797.779 </td>
   <td style="text-align:right;"> 21655.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21551.68613 </td>
   <td style="text-align:right;"> 574.221426 </td>
   <td style="text-align:right;"> 12634.882 </td>
   <td style="text-align:right;"> 20799.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9553.67725 </td>
   <td style="text-align:right;"> 385.342781 </td>
   <td style="text-align:right;"> 11198.934 </td>
   <td style="text-align:right;"> 21216.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -52424.41511 </td>
   <td style="text-align:right;"> 1037.894261 </td>
   <td style="text-align:right;"> 8824.122 </td>
   <td style="text-align:right;"> 21203.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -54643.39813 </td>
   <td style="text-align:right;"> 1098.836305 </td>
   <td style="text-align:right;"> 9177.174 </td>
   <td style="text-align:right;"> 21484.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18026.84801 </td>
   <td style="text-align:right;"> 531.332738 </td>
   <td style="text-align:right;"> 8481.351 </td>
   <td style="text-align:right;"> 21166.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41848.57204 </td>
   <td style="text-align:right;"> 890.897897 </td>
   <td style="text-align:right;"> 9869.617 </td>
   <td style="text-align:right;"> 21534.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36831.63967 </td>
   <td style="text-align:right;"> 816.457061 </td>
   <td style="text-align:right;"> 9173.797 </td>
   <td style="text-align:right;"> 21478.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -47700.26403 </td>
   <td style="text-align:right;"> 978.216956 </td>
   <td style="text-align:right;"> 8476.460 </td>
   <td style="text-align:right;"> 21152.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34775.61212 </td>
   <td style="text-align:right;"> 794.951287 </td>
   <td style="text-align:right;"> 7763.138 </td>
   <td style="text-align:right;"> 21555.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32904.56705 </td>
   <td style="text-align:right;"> 737.120316 </td>
   <td style="text-align:right;"> 11129.709 </td>
   <td style="text-align:right;"> 21824.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25210.74729 </td>
   <td style="text-align:right;"> 628.914620 </td>
   <td style="text-align:right;"> 11139.234 </td>
   <td style="text-align:right;"> 21851.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -48202.11205 </td>
   <td style="text-align:right;"> 998.765007 </td>
   <td style="text-align:right;"> 9590.512 </td>
   <td style="text-align:right;"> 20979.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37965.80241 </td>
   <td style="text-align:right;"> 851.708825 </td>
   <td style="text-align:right;"> 8764.889 </td>
   <td style="text-align:right;"> 21133.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15726.97664 </td>
   <td style="text-align:right;"> 488.408682 </td>
   <td style="text-align:right;"> 11133.399 </td>
   <td style="text-align:right;"> 22015.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27023.38056 </td>
   <td style="text-align:right;"> 675.026695 </td>
   <td style="text-align:right;"> 9992.220 </td>
   <td style="text-align:right;"> 20874.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39615.61231 </td>
   <td style="text-align:right;"> 854.895113 </td>
   <td style="text-align:right;"> 8999.376 </td>
   <td style="text-align:right;"> 21881.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31479.49966 </td>
   <td style="text-align:right;"> 736.103594 </td>
   <td style="text-align:right;"> 9904.204 </td>
   <td style="text-align:right;"> 21340.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19960.35782 </td>
   <td style="text-align:right;"> 549.893513 </td>
   <td style="text-align:right;"> 11694.409 </td>
   <td style="text-align:right;"> 21871.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40285.18981 </td>
   <td style="text-align:right;"> 891.081847 </td>
   <td style="text-align:right;"> 8247.643 </td>
   <td style="text-align:right;"> 21317.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37204.68325 </td>
   <td style="text-align:right;"> 837.990250 </td>
   <td style="text-align:right;"> 8914.565 </td>
   <td style="text-align:right;"> 21374.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20584.34602 </td>
   <td style="text-align:right;"> 565.182598 </td>
   <td style="text-align:right;"> 11371.732 </td>
   <td style="text-align:right;"> 20874.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18960.62870 </td>
   <td style="text-align:right;"> 537.861939 </td>
   <td style="text-align:right;"> 11907.442 </td>
   <td style="text-align:right;"> 20708.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21412.13550 </td>
   <td style="text-align:right;"> 571.623274 </td>
   <td style="text-align:right;"> 10478.982 </td>
   <td style="text-align:right;"> 21873.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38691.46391 </td>
   <td style="text-align:right;"> 844.514940 </td>
   <td style="text-align:right;"> 9998.908 </td>
   <td style="text-align:right;"> 21237.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24104.92339 </td>
   <td style="text-align:right;"> 628.362008 </td>
   <td style="text-align:right;"> 8555.663 </td>
   <td style="text-align:right;"> 21874.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30753.90238 </td>
   <td style="text-align:right;"> 716.545973 </td>
   <td style="text-align:right;"> 10218.936 </td>
   <td style="text-align:right;"> 22118.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33577.38193 </td>
   <td style="text-align:right;"> 754.252335 </td>
   <td style="text-align:right;"> 9656.870 </td>
   <td style="text-align:right;"> 21703.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28398.37392 </td>
   <td style="text-align:right;"> 684.917788 </td>
   <td style="text-align:right;"> 10148.666 </td>
   <td style="text-align:right;"> 21056.24 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19177.34427 </td>
   <td style="text-align:right;"> 550.489971 </td>
   <td style="text-align:right;"> 9517.782 </td>
   <td style="text-align:right;"> 21106.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40800.78317 </td>
   <td style="text-align:right;"> 861.536865 </td>
   <td style="text-align:right;"> 10666.160 </td>
   <td style="text-align:right;"> 21785.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29892.47599 </td>
   <td style="text-align:right;"> 686.144155 </td>
   <td style="text-align:right;"> 11692.771 </td>
   <td style="text-align:right;"> 21789.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25270.95195 </td>
   <td style="text-align:right;"> 622.714287 </td>
   <td style="text-align:right;"> 11125.461 </td>
   <td style="text-align:right;"> 21879.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27392.07299 </td>
   <td style="text-align:right;"> 656.020059 </td>
   <td style="text-align:right;"> 11636.947 </td>
   <td style="text-align:right;"> 22151.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40078.24802 </td>
   <td style="text-align:right;"> 877.164946 </td>
   <td style="text-align:right;"> 8529.204 </td>
   <td style="text-align:right;"> 21210.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -3588.48332 </td>
   <td style="text-align:right;"> 298.857646 </td>
   <td style="text-align:right;"> 13438.419 </td>
   <td style="text-align:right;"> 21375.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36879.74932 </td>
   <td style="text-align:right;"> 822.879114 </td>
   <td style="text-align:right;"> 8359.840 </td>
   <td style="text-align:right;"> 21471.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28751.18156 </td>
   <td style="text-align:right;"> 679.219116 </td>
   <td style="text-align:right;"> 11421.581 </td>
   <td style="text-align:right;"> 21447.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30422.34702 </td>
   <td style="text-align:right;"> 720.204123 </td>
   <td style="text-align:right;"> 9327.510 </td>
   <td style="text-align:right;"> 21255.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31722.78751 </td>
   <td style="text-align:right;"> 749.000463 </td>
   <td style="text-align:right;"> 7997.099 </td>
   <td style="text-align:right;"> 21219.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38293.47581 </td>
   <td style="text-align:right;"> 834.785686 </td>
   <td style="text-align:right;"> 9473.670 </td>
   <td style="text-align:right;"> 21229.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43069.77477 </td>
   <td style="text-align:right;"> 922.199168 </td>
   <td style="text-align:right;"> 8374.432 </td>
   <td style="text-align:right;"> 20945.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42385.86147 </td>
   <td style="text-align:right;"> 910.636981 </td>
   <td style="text-align:right;"> 9067.881 </td>
   <td style="text-align:right;"> 21031.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33433.90530 </td>
   <td style="text-align:right;"> 770.639724 </td>
   <td style="text-align:right;"> 9187.441 </td>
   <td style="text-align:right;"> 21373.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38034.11588 </td>
   <td style="text-align:right;"> 843.087671 </td>
   <td style="text-align:right;"> 8569.977 </td>
   <td style="text-align:right;"> 21004.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15186.17324 </td>
   <td style="text-align:right;"> 482.969097 </td>
   <td style="text-align:right;"> 10610.684 </td>
   <td style="text-align:right;"> 20895.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37311.75990 </td>
   <td style="text-align:right;"> 821.801460 </td>
   <td style="text-align:right;"> 10673.494 </td>
   <td style="text-align:right;"> 21519.73 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18203.07723 </td>
   <td style="text-align:right;"> 535.918774 </td>
   <td style="text-align:right;"> 11026.427 </td>
   <td style="text-align:right;"> 21171.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34990.56500 </td>
   <td style="text-align:right;"> 779.238308 </td>
   <td style="text-align:right;"> 10586.788 </td>
   <td style="text-align:right;"> 21296.43 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23172.02998 </td>
   <td style="text-align:right;"> 610.859278 </td>
   <td style="text-align:right;"> 10801.539 </td>
   <td style="text-align:right;"> 21497.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32108.51466 </td>
   <td style="text-align:right;"> 738.551657 </td>
   <td style="text-align:right;"> 9912.267 </td>
   <td style="text-align:right;"> 21355.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13169.41399 </td>
   <td style="text-align:right;"> 455.751615 </td>
   <td style="text-align:right;"> 11806.829 </td>
   <td style="text-align:right;"> 21517.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12438.13278 </td>
   <td style="text-align:right;"> 427.681221 </td>
   <td style="text-align:right;"> 13254.636 </td>
   <td style="text-align:right;"> 21613.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8618.59234 </td>
   <td style="text-align:right;"> 388.030407 </td>
   <td style="text-align:right;"> 12183.567 </td>
   <td style="text-align:right;"> 21274.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12903.00181 </td>
   <td style="text-align:right;"> 457.712853 </td>
   <td style="text-align:right;"> 10862.444 </td>
   <td style="text-align:right;"> 21415.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15112.05411 </td>
   <td style="text-align:right;"> 480.216349 </td>
   <td style="text-align:right;"> 10461.714 </td>
   <td style="text-align:right;"> 21423.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35858.00273 </td>
   <td style="text-align:right;"> 810.320617 </td>
   <td style="text-align:right;"> 9304.410 </td>
   <td style="text-align:right;"> 21254.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19409.45756 </td>
   <td style="text-align:right;"> 558.028786 </td>
   <td style="text-align:right;"> 11458.207 </td>
   <td style="text-align:right;"> 21591.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35034.90390 </td>
   <td style="text-align:right;"> 765.940043 </td>
   <td style="text-align:right;"> 10362.443 </td>
   <td style="text-align:right;"> 21275.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26426.08206 </td>
   <td style="text-align:right;"> 678.521433 </td>
   <td style="text-align:right;"> 10166.340 </td>
   <td style="text-align:right;"> 21447.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33226.73556 </td>
   <td style="text-align:right;"> 760.771769 </td>
   <td style="text-align:right;"> 10465.010 </td>
   <td style="text-align:right;"> 21200.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24592.14469 </td>
   <td style="text-align:right;"> 632.344566 </td>
   <td style="text-align:right;"> 10189.101 </td>
   <td style="text-align:right;"> 21232.73 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20291.52571 </td>
   <td style="text-align:right;"> 562.808685 </td>
   <td style="text-align:right;"> 12092.260 </td>
   <td style="text-align:right;"> 21607.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13484.76449 </td>
   <td style="text-align:right;"> 449.293811 </td>
   <td style="text-align:right;"> 11786.008 </td>
   <td style="text-align:right;"> 21378.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23128.35985 </td>
   <td style="text-align:right;"> 603.045055 </td>
   <td style="text-align:right;"> 10722.990 </td>
   <td style="text-align:right;"> 21294.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14754.08473 </td>
   <td style="text-align:right;"> 470.815630 </td>
   <td style="text-align:right;"> 12222.435 </td>
   <td style="text-align:right;"> 21479.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42779.27500 </td>
   <td style="text-align:right;"> 928.668553 </td>
   <td style="text-align:right;"> 7368.452 </td>
   <td style="text-align:right;"> 21482.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35322.36309 </td>
   <td style="text-align:right;"> 803.367928 </td>
   <td style="text-align:right;"> 10381.949 </td>
   <td style="text-align:right;"> 21700.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36357.83494 </td>
   <td style="text-align:right;"> 823.131393 </td>
   <td style="text-align:right;"> 7679.641 </td>
   <td style="text-align:right;"> 21586.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41495.07403 </td>
   <td style="text-align:right;"> 887.241551 </td>
   <td style="text-align:right;"> 9268.039 </td>
   <td style="text-align:right;"> 21434.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15448.31422 </td>
   <td style="text-align:right;"> 493.345165 </td>
   <td style="text-align:right;"> 10161.968 </td>
   <td style="text-align:right;"> 21247.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23370.93888 </td>
   <td style="text-align:right;"> 598.592494 </td>
   <td style="text-align:right;"> 12662.755 </td>
   <td style="text-align:right;"> 21473.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22144.34275 </td>
   <td style="text-align:right;"> 595.623371 </td>
   <td style="text-align:right;"> 9901.489 </td>
   <td style="text-align:right;"> 21694.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26911.41102 </td>
   <td style="text-align:right;"> 661.152130 </td>
   <td style="text-align:right;"> 11134.363 </td>
   <td style="text-align:right;"> 21672.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26760.55169 </td>
   <td style="text-align:right;"> 681.046943 </td>
   <td style="text-align:right;"> 9434.835 </td>
   <td style="text-align:right;"> 21974.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25007.29338 </td>
   <td style="text-align:right;"> 649.498867 </td>
   <td style="text-align:right;"> 10223.697 </td>
   <td style="text-align:right;"> 21987.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25335.45745 </td>
   <td style="text-align:right;"> 642.858583 </td>
   <td style="text-align:right;"> 12253.565 </td>
   <td style="text-align:right;"> 21623.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26407.89295 </td>
   <td style="text-align:right;"> 650.326436 </td>
   <td style="text-align:right;"> 12391.441 </td>
   <td style="text-align:right;"> 21493.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 340.75153 </td>
   <td style="text-align:right;"> 249.418761 </td>
   <td style="text-align:right;"> 12236.778 </td>
   <td style="text-align:right;"> 21598.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31307.41532 </td>
   <td style="text-align:right;"> 733.816818 </td>
   <td style="text-align:right;"> 11318.514 </td>
   <td style="text-align:right;"> 21650.84 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12882.52576 </td>
   <td style="text-align:right;"> 461.759918 </td>
   <td style="text-align:right;"> 10617.372 </td>
   <td style="text-align:right;"> 21511.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9822.34196 </td>
   <td style="text-align:right;"> 407.271324 </td>
   <td style="text-align:right;"> 9618.145 </td>
   <td style="text-align:right;"> 21774.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16064.48383 </td>
   <td style="text-align:right;"> 503.952365 </td>
   <td style="text-align:right;"> 9168.321 </td>
   <td style="text-align:right;"> 21781.94 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26067.16554 </td>
   <td style="text-align:right;"> 651.355908 </td>
   <td style="text-align:right;"> 9356.206 </td>
   <td style="text-align:right;"> 21829.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40273.38817 </td>
   <td style="text-align:right;"> 872.706309 </td>
   <td style="text-align:right;"> 8642.149 </td>
   <td style="text-align:right;"> 21261.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35660.06450 </td>
   <td style="text-align:right;"> 785.059901 </td>
   <td style="text-align:right;"> 10890.149 </td>
   <td style="text-align:right;"> 21155.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20481.83539 </td>
   <td style="text-align:right;"> 562.220867 </td>
   <td style="text-align:right;"> 9647.857 </td>
   <td style="text-align:right;"> 20871.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32132.58025 </td>
   <td style="text-align:right;"> 728.948808 </td>
   <td style="text-align:right;"> 11707.690 </td>
   <td style="text-align:right;"> 22369.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28814.84825 </td>
   <td style="text-align:right;"> 689.571827 </td>
   <td style="text-align:right;"> 10902.194 </td>
   <td style="text-align:right;"> 22023.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42186.64858 </td>
   <td style="text-align:right;"> 919.011458 </td>
   <td style="text-align:right;"> 7554.533 </td>
   <td style="text-align:right;"> 20979.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31714.02835 </td>
   <td style="text-align:right;"> 747.142807 </td>
   <td style="text-align:right;"> 9583.410 </td>
   <td style="text-align:right;"> 22330.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30262.86782 </td>
   <td style="text-align:right;"> 699.608082 </td>
   <td style="text-align:right;"> 12125.107 </td>
   <td style="text-align:right;"> 21990.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23606.92235 </td>
   <td style="text-align:right;"> 605.416572 </td>
   <td style="text-align:right;"> 9848.553 </td>
   <td style="text-align:right;"> 21346.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23304.37231 </td>
   <td style="text-align:right;"> 595.691387 </td>
   <td style="text-align:right;"> 11396.689 </td>
   <td style="text-align:right;"> 21611.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23455.42121 </td>
   <td style="text-align:right;"> 598.393130 </td>
   <td style="text-align:right;"> 11349.737 </td>
   <td style="text-align:right;"> 22170.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7434.61076 </td>
   <td style="text-align:right;"> 368.002188 </td>
   <td style="text-align:right;"> 13180.220 </td>
   <td style="text-align:right;"> 20346.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33973.55426 </td>
   <td style="text-align:right;"> 767.215451 </td>
   <td style="text-align:right;"> 10122.770 </td>
   <td style="text-align:right;"> 22249.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21507.11424 </td>
   <td style="text-align:right;"> 581.165947 </td>
   <td style="text-align:right;"> 10310.334 </td>
   <td style="text-align:right;"> 21722.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33024.77424 </td>
   <td style="text-align:right;"> 765.099252 </td>
   <td style="text-align:right;"> 9897.249 </td>
   <td style="text-align:right;"> 21555.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34042.71413 </td>
   <td style="text-align:right;"> 781.116314 </td>
   <td style="text-align:right;"> 9998.864 </td>
   <td style="text-align:right;"> 21609.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33961.27830 </td>
   <td style="text-align:right;"> 769.367218 </td>
   <td style="text-align:right;"> 11186.801 </td>
   <td style="text-align:right;"> 21567.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30962.72537 </td>
   <td style="text-align:right;"> 723.107957 </td>
   <td style="text-align:right;"> 11065.007 </td>
   <td style="text-align:right;"> 21751.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8632.36204 </td>
   <td style="text-align:right;"> 361.601726 </td>
   <td style="text-align:right;"> 12278.308 </td>
   <td style="text-align:right;"> 21602.73 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18113.66674 </td>
   <td style="text-align:right;"> 522.769540 </td>
   <td style="text-align:right;"> 12307.056 </td>
   <td style="text-align:right;"> 22084.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10694.57288 </td>
   <td style="text-align:right;"> 425.183495 </td>
   <td style="text-align:right;"> 11882.660 </td>
   <td style="text-align:right;"> 22011.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7546.88086 </td>
   <td style="text-align:right;"> 357.758513 </td>
   <td style="text-align:right;"> 11714.885 </td>
   <td style="text-align:right;"> 21418.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5509.76509 </td>
   <td style="text-align:right;"> 325.878681 </td>
   <td style="text-align:right;"> 11619.510 </td>
   <td style="text-align:right;"> 21415.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35260.19162 </td>
   <td style="text-align:right;"> 793.496988 </td>
   <td style="text-align:right;"> 10866.101 </td>
   <td style="text-align:right;"> 21401.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15577.87253 </td>
   <td style="text-align:right;"> 501.656045 </td>
   <td style="text-align:right;"> 10298.510 </td>
   <td style="text-align:right;"> 21196.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29172.02487 </td>
   <td style="text-align:right;"> 697.593592 </td>
   <td style="text-align:right;"> 10786.625 </td>
   <td style="text-align:right;"> 21663.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9650.50547 </td>
   <td style="text-align:right;"> 409.882856 </td>
   <td style="text-align:right;"> 10084.951 </td>
   <td style="text-align:right;"> 20780.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -53877.98585 </td>
   <td style="text-align:right;"> 1068.088078 </td>
   <td style="text-align:right;"> 9832.225 </td>
   <td style="text-align:right;"> 20637.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -54579.26817 </td>
   <td style="text-align:right;"> 1097.514764 </td>
   <td style="text-align:right;"> 7523.085 </td>
   <td style="text-align:right;"> 20974.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29435.53139 </td>
   <td style="text-align:right;"> 706.461194 </td>
   <td style="text-align:right;"> 9930.203 </td>
   <td style="text-align:right;"> 20611.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33653.00839 </td>
   <td style="text-align:right;"> 765.889504 </td>
   <td style="text-align:right;"> 9830.907 </td>
   <td style="text-align:right;"> 22101.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27770.72873 </td>
   <td style="text-align:right;"> 682.411778 </td>
   <td style="text-align:right;"> 10162.793 </td>
   <td style="text-align:right;"> 21714.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25171.94637 </td>
   <td style="text-align:right;"> 625.133102 </td>
   <td style="text-align:right;"> 11844.033 </td>
   <td style="text-align:right;"> 21204.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19176.03304 </td>
   <td style="text-align:right;"> 540.772167 </td>
   <td style="text-align:right;"> 10093.182 </td>
   <td style="text-align:right;"> 21055.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25618.17073 </td>
   <td style="text-align:right;"> 638.373348 </td>
   <td style="text-align:right;"> 12082.684 </td>
   <td style="text-align:right;"> 20880.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21797.67897 </td>
   <td style="text-align:right;"> 589.837793 </td>
   <td style="text-align:right;"> 9806.869 </td>
   <td style="text-align:right;"> 20884.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26794.35869 </td>
   <td style="text-align:right;"> 654.615494 </td>
   <td style="text-align:right;"> 10775.132 </td>
   <td style="text-align:right;"> 21618.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -47306.28799 </td>
   <td style="text-align:right;"> 993.520003 </td>
   <td style="text-align:right;"> 7802.110 </td>
   <td style="text-align:right;"> 21781.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33132.40272 </td>
   <td style="text-align:right;"> 744.072005 </td>
   <td style="text-align:right;"> 11084.658 </td>
   <td style="text-align:right;"> 21303.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29769.22224 </td>
   <td style="text-align:right;"> 719.356751 </td>
   <td style="text-align:right;"> 8667.129 </td>
   <td style="text-align:right;"> 20816.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41878.15766 </td>
   <td style="text-align:right;"> 882.643267 </td>
   <td style="text-align:right;"> 9942.597 </td>
   <td style="text-align:right;"> 21784.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29708.55092 </td>
   <td style="text-align:right;"> 706.227089 </td>
   <td style="text-align:right;"> 11613.999 </td>
   <td style="text-align:right;"> 21021.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30158.58799 </td>
   <td style="text-align:right;"> 694.697554 </td>
   <td style="text-align:right;"> 11966.483 </td>
   <td style="text-align:right;"> 21716.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27224.42425 </td>
   <td style="text-align:right;"> 650.189987 </td>
   <td style="text-align:right;"> 12823.823 </td>
   <td style="text-align:right;"> 21600.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27039.13920 </td>
   <td style="text-align:right;"> 651.355263 </td>
   <td style="text-align:right;"> 11839.190 </td>
   <td style="text-align:right;"> 21499.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18476.68246 </td>
   <td style="text-align:right;"> 540.115004 </td>
   <td style="text-align:right;"> 10465.608 </td>
   <td style="text-align:right;"> 20748.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30006.07615 </td>
   <td style="text-align:right;"> 694.922881 </td>
   <td style="text-align:right;"> 11271.814 </td>
   <td style="text-align:right;"> 21386.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20235.39816 </td>
   <td style="text-align:right;"> 560.913477 </td>
   <td style="text-align:right;"> 11352.193 </td>
   <td style="text-align:right;"> 21333.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17246.26980 </td>
   <td style="text-align:right;"> 513.981552 </td>
   <td style="text-align:right;"> 11491.981 </td>
   <td style="text-align:right;"> 21542.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -946.43357 </td>
   <td style="text-align:right;"> 239.345723 </td>
   <td style="text-align:right;"> 14640.676 </td>
   <td style="text-align:right;"> 21034.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2417.22899 </td>
   <td style="text-align:right;"> 198.471241 </td>
   <td style="text-align:right;"> 14205.701 </td>
   <td style="text-align:right;"> 21334.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6851.53072 </td>
   <td style="text-align:right;"> 367.904316 </td>
   <td style="text-align:right;"> 11082.482 </td>
   <td style="text-align:right;"> 21250.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5535.58697 </td>
   <td style="text-align:right;"> 348.942863 </td>
   <td style="text-align:right;"> 11362.703 </td>
   <td style="text-align:right;"> 21156.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20158.57474 </td>
   <td style="text-align:right;"> 554.077478 </td>
   <td style="text-align:right;"> 10254.696 </td>
   <td style="text-align:right;"> 21518.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33793.44300 </td>
   <td style="text-align:right;"> 763.506510 </td>
   <td style="text-align:right;"> 10572.471 </td>
   <td style="text-align:right;"> 21376.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33574.18332 </td>
   <td style="text-align:right;"> 754.118374 </td>
   <td style="text-align:right;"> 11900.601 </td>
   <td style="text-align:right;"> 21304.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9179.56086 </td>
   <td style="text-align:right;"> 399.727683 </td>
   <td style="text-align:right;"> 12360.953 </td>
   <td style="text-align:right;"> 21211.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38093.76252 </td>
   <td style="text-align:right;"> 844.207970 </td>
   <td style="text-align:right;"> 9055.631 </td>
   <td style="text-align:right;"> 20945.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25627.31594 </td>
   <td style="text-align:right;"> 637.459861 </td>
   <td style="text-align:right;"> 11166.288 </td>
   <td style="text-align:right;"> 21678.36 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21342.29119 </td>
   <td style="text-align:right;"> 583.424671 </td>
   <td style="text-align:right;"> 10835.011 </td>
   <td style="text-align:right;"> 21142.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28180.93062 </td>
   <td style="text-align:right;"> 680.020987 </td>
   <td style="text-align:right;"> 11093.485 </td>
   <td style="text-align:right;"> 21616.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28910.00866 </td>
   <td style="text-align:right;"> 683.763207 </td>
   <td style="text-align:right;"> 12520.069 </td>
   <td style="text-align:right;"> 21616.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17797.00546 </td>
   <td style="text-align:right;"> 530.588536 </td>
   <td style="text-align:right;"> 11100.087 </td>
   <td style="text-align:right;"> 21794.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23768.95392 </td>
   <td style="text-align:right;"> 624.403537 </td>
   <td style="text-align:right;"> 10268.787 </td>
   <td style="text-align:right;"> 21107.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30547.28657 </td>
   <td style="text-align:right;"> 703.252539 </td>
   <td style="text-align:right;"> 12249.187 </td>
   <td style="text-align:right;"> 21408.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31777.65584 </td>
   <td style="text-align:right;"> 728.509731 </td>
   <td style="text-align:right;"> 9980.344 </td>
   <td style="text-align:right;"> 21371.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32860.46955 </td>
   <td style="text-align:right;"> 768.612804 </td>
   <td style="text-align:right;"> 9654.179 </td>
   <td style="text-align:right;"> 21369.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24728.95230 </td>
   <td style="text-align:right;"> 619.446181 </td>
   <td style="text-align:right;"> 10623.732 </td>
   <td style="text-align:right;"> 21949.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32894.46116 </td>
   <td style="text-align:right;"> 723.559085 </td>
   <td style="text-align:right;"> 11578.534 </td>
   <td style="text-align:right;"> 21629.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11157.52874 </td>
   <td style="text-align:right;"> 404.932984 </td>
   <td style="text-align:right;"> 12116.921 </td>
   <td style="text-align:right;"> 21472.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28680.28653 </td>
   <td style="text-align:right;"> 704.262384 </td>
   <td style="text-align:right;"> 9782.111 </td>
   <td style="text-align:right;"> 21430.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24460.99144 </td>
   <td style="text-align:right;"> 617.992479 </td>
   <td style="text-align:right;"> 10767.972 </td>
   <td style="text-align:right;"> 21325.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30806.33009 </td>
   <td style="text-align:right;"> 721.813527 </td>
   <td style="text-align:right;"> 10465.584 </td>
   <td style="text-align:right;"> 21399.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27033.21597 </td>
   <td style="text-align:right;"> 664.049088 </td>
   <td style="text-align:right;"> 9226.470 </td>
   <td style="text-align:right;"> 21252.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21770.03065 </td>
   <td style="text-align:right;"> 591.355325 </td>
   <td style="text-align:right;"> 11927.948 </td>
   <td style="text-align:right;"> 21887.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22758.27406 </td>
   <td style="text-align:right;"> 605.899242 </td>
   <td style="text-align:right;"> 10405.538 </td>
   <td style="text-align:right;"> 21851.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43450.64004 </td>
   <td style="text-align:right;"> 913.322099 </td>
   <td style="text-align:right;"> 9995.380 </td>
   <td style="text-align:right;"> 21671.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33430.15119 </td>
   <td style="text-align:right;"> 761.649172 </td>
   <td style="text-align:right;"> 9963.355 </td>
   <td style="text-align:right;"> 21485.94 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16755.53143 </td>
   <td style="text-align:right;"> 504.781335 </td>
   <td style="text-align:right;"> 12026.576 </td>
   <td style="text-align:right;"> 21257.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28221.10088 </td>
   <td style="text-align:right;"> 676.100556 </td>
   <td style="text-align:right;"> 11707.641 </td>
   <td style="text-align:right;"> 21683.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44103.15310 </td>
   <td style="text-align:right;"> 934.975656 </td>
   <td style="text-align:right;"> 7982.013 </td>
   <td style="text-align:right;"> 21529.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24712.43488 </td>
   <td style="text-align:right;"> 621.866913 </td>
   <td style="text-align:right;"> 11240.833 </td>
   <td style="text-align:right;"> 21432.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39943.93681 </td>
   <td style="text-align:right;"> 873.783803 </td>
   <td style="text-align:right;"> 9159.960 </td>
   <td style="text-align:right;"> 21264.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29637.36719 </td>
   <td style="text-align:right;"> 710.564293 </td>
   <td style="text-align:right;"> 9715.828 </td>
   <td style="text-align:right;"> 21558.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15963.40381 </td>
   <td style="text-align:right;"> 496.727649 </td>
   <td style="text-align:right;"> 10685.228 </td>
   <td style="text-align:right;"> 21430.24 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16748.00246 </td>
   <td style="text-align:right;"> 506.481090 </td>
   <td style="text-align:right;"> 11275.542 </td>
   <td style="text-align:right;"> 21534.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35134.44817 </td>
   <td style="text-align:right;"> 786.462576 </td>
   <td style="text-align:right;"> 10464.685 </td>
   <td style="text-align:right;"> 20895.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34644.55271 </td>
   <td style="text-align:right;"> 795.355829 </td>
   <td style="text-align:right;"> 9629.847 </td>
   <td style="text-align:right;"> 21358.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36487.76256 </td>
   <td style="text-align:right;"> 822.151565 </td>
   <td style="text-align:right;"> 9952.578 </td>
   <td style="text-align:right;"> 21501.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30292.03196 </td>
   <td style="text-align:right;"> 719.295985 </td>
   <td style="text-align:right;"> 12024.165 </td>
   <td style="text-align:right;"> 21589.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23453.22994 </td>
   <td style="text-align:right;"> 617.132236 </td>
   <td style="text-align:right;"> 11777.260 </td>
   <td style="text-align:right;"> 21536.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14527.12320 </td>
   <td style="text-align:right;"> 499.274597 </td>
   <td style="text-align:right;"> 9707.718 </td>
   <td style="text-align:right;"> 21181.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8018.40892 </td>
   <td style="text-align:right;"> 391.981420 </td>
   <td style="text-align:right;"> 11249.876 </td>
   <td style="text-align:right;"> 21141.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23794.57386 </td>
   <td style="text-align:right;"> 618.295434 </td>
   <td style="text-align:right;"> 12447.667 </td>
   <td style="text-align:right;"> 21362.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15529.99477 </td>
   <td style="text-align:right;"> 489.676927 </td>
   <td style="text-align:right;"> 11755.634 </td>
   <td style="text-align:right;"> 21419.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15374.86020 </td>
   <td style="text-align:right;"> 494.217655 </td>
   <td style="text-align:right;"> 11932.926 </td>
   <td style="text-align:right;"> 21258.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6152.36131 </td>
   <td style="text-align:right;"> 338.010185 </td>
   <td style="text-align:right;"> 12823.949 </td>
   <td style="text-align:right;"> 21364.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -3998.68346 </td>
   <td style="text-align:right;"> 309.564213 </td>
   <td style="text-align:right;"> 13634.901 </td>
   <td style="text-align:right;"> 21510.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -171.70811 </td>
   <td style="text-align:right;"> 250.053997 </td>
   <td style="text-align:right;"> 14261.847 </td>
   <td style="text-align:right;"> 21738.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11585.05394 </td>
   <td style="text-align:right;"> 428.815272 </td>
   <td style="text-align:right;"> 11619.114 </td>
   <td style="text-align:right;"> 21119.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28739.22618 </td>
   <td style="text-align:right;"> 674.716178 </td>
   <td style="text-align:right;"> 11617.721 </td>
   <td style="text-align:right;"> 21112.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13027.09582 </td>
   <td style="text-align:right;"> 459.899695 </td>
   <td style="text-align:right;"> 10485.222 </td>
   <td style="text-align:right;"> 21680.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34948.19652 </td>
   <td style="text-align:right;"> 798.672859 </td>
   <td style="text-align:right;"> 10179.198 </td>
   <td style="text-align:right;"> 20894.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30453.01944 </td>
   <td style="text-align:right;"> 715.463084 </td>
   <td style="text-align:right;"> 11847.039 </td>
   <td style="text-align:right;"> 21237.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18254.37168 </td>
   <td style="text-align:right;"> 530.255658 </td>
   <td style="text-align:right;"> 11193.441 </td>
   <td style="text-align:right;"> 21925.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -2569.88524 </td>
   <td style="text-align:right;"> 266.636777 </td>
   <td style="text-align:right;"> 12930.829 </td>
   <td style="text-align:right;"> 22129.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13734.86446 </td>
   <td style="text-align:right;"> 465.108433 </td>
   <td style="text-align:right;"> 11062.735 </td>
   <td style="text-align:right;"> 20755.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32680.07655 </td>
   <td style="text-align:right;"> 749.746378 </td>
   <td style="text-align:right;"> 11102.499 </td>
   <td style="text-align:right;"> 21924.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19611.83054 </td>
   <td style="text-align:right;"> 550.256663 </td>
   <td style="text-align:right;"> 10445.865 </td>
   <td style="text-align:right;"> 21911.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8985.69304 </td>
   <td style="text-align:right;"> 389.846296 </td>
   <td style="text-align:right;"> 10283.280 </td>
   <td style="text-align:right;"> 22017.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16482.02970 </td>
   <td style="text-align:right;"> 494.516984 </td>
   <td style="text-align:right;"> 12684.821 </td>
   <td style="text-align:right;"> 21407.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20198.34963 </td>
   <td style="text-align:right;"> 566.049212 </td>
   <td style="text-align:right;"> 11222.208 </td>
   <td style="text-align:right;"> 21242.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25613.50702 </td>
   <td style="text-align:right;"> 634.543430 </td>
   <td style="text-align:right;"> 10928.011 </td>
   <td style="text-align:right;"> 21519.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26235.71947 </td>
   <td style="text-align:right;"> 634.883867 </td>
   <td style="text-align:right;"> 12289.698 </td>
   <td style="text-align:right;"> 21407.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11628.27769 </td>
   <td style="text-align:right;"> 431.116421 </td>
   <td style="text-align:right;"> 10876.956 </td>
   <td style="text-align:right;"> 21029.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38549.96991 </td>
   <td style="text-align:right;"> 841.043836 </td>
   <td style="text-align:right;"> 10395.680 </td>
   <td style="text-align:right;"> 21350.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16024.27939 </td>
   <td style="text-align:right;"> 501.867980 </td>
   <td style="text-align:right;"> 10334.217 </td>
   <td style="text-align:right;"> 21627.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34434.55492 </td>
   <td style="text-align:right;"> 764.021205 </td>
   <td style="text-align:right;"> 12190.292 </td>
   <td style="text-align:right;"> 21631.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29858.27961 </td>
   <td style="text-align:right;"> 702.368863 </td>
   <td style="text-align:right;"> 10943.476 </td>
   <td style="text-align:right;"> 21715.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38375.57901 </td>
   <td style="text-align:right;"> 853.344594 </td>
   <td style="text-align:right;"> 8521.798 </td>
   <td style="text-align:right;"> 21090.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -51928.84792 </td>
   <td style="text-align:right;"> 1050.950791 </td>
   <td style="text-align:right;"> 8556.636 </td>
   <td style="text-align:right;"> 21724.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19609.86511 </td>
   <td style="text-align:right;"> 553.968887 </td>
   <td style="text-align:right;"> 10129.120 </td>
   <td style="text-align:right;"> 21529.24 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21332.41893 </td>
   <td style="text-align:right;"> 582.023515 </td>
   <td style="text-align:right;"> 9901.825 </td>
   <td style="text-align:right;"> 21235.84 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23168.80569 </td>
   <td style="text-align:right;"> 607.498185 </td>
   <td style="text-align:right;"> 9978.427 </td>
   <td style="text-align:right;"> 21484.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19932.80800 </td>
   <td style="text-align:right;"> 548.504418 </td>
   <td style="text-align:right;"> 11710.554 </td>
   <td style="text-align:right;"> 21424.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14363.72156 </td>
   <td style="text-align:right;"> 484.949370 </td>
   <td style="text-align:right;"> 9163.873 </td>
   <td style="text-align:right;"> 21423.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15831.34211 </td>
   <td style="text-align:right;"> 501.781137 </td>
   <td style="text-align:right;"> 9824.474 </td>
   <td style="text-align:right;"> 21545.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14224.67052 </td>
   <td style="text-align:right;"> 468.005929 </td>
   <td style="text-align:right;"> 10490.637 </td>
   <td style="text-align:right;"> 21406.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15130.90769 </td>
   <td style="text-align:right;"> 487.268398 </td>
   <td style="text-align:right;"> 10506.240 </td>
   <td style="text-align:right;"> 21287.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33597.88814 </td>
   <td style="text-align:right;"> 764.456887 </td>
   <td style="text-align:right;"> 11079.791 </td>
   <td style="text-align:right;"> 21576.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34594.97592 </td>
   <td style="text-align:right;"> 779.233441 </td>
   <td style="text-align:right;"> 9276.176 </td>
   <td style="text-align:right;"> 21301.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12225.15081 </td>
   <td style="text-align:right;"> 446.531905 </td>
   <td style="text-align:right;"> 11280.798 </td>
   <td style="text-align:right;"> 20955.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39646.39074 </td>
   <td style="text-align:right;"> 857.064406 </td>
   <td style="text-align:right;"> 9939.181 </td>
   <td style="text-align:right;"> 21356.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10741.30235 </td>
   <td style="text-align:right;"> 416.639454 </td>
   <td style="text-align:right;"> 12287.586 </td>
   <td style="text-align:right;"> 21323.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13559.27596 </td>
   <td style="text-align:right;"> 460.442484 </td>
   <td style="text-align:right;"> 12701.931 </td>
   <td style="text-align:right;"> 21201.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24704.05535 </td>
   <td style="text-align:right;"> 620.412839 </td>
   <td style="text-align:right;"> 10906.749 </td>
   <td style="text-align:right;"> 21466.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26066.30279 </td>
   <td style="text-align:right;"> 653.015285 </td>
   <td style="text-align:right;"> 10058.878 </td>
   <td style="text-align:right;"> 21511.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6724.34186 </td>
   <td style="text-align:right;"> 341.651636 </td>
   <td style="text-align:right;"> 13928.530 </td>
   <td style="text-align:right;"> 21105.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29024.20323 </td>
   <td style="text-align:right;"> 696.474979 </td>
   <td style="text-align:right;"> 10508.742 </td>
   <td style="text-align:right;"> 21555.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36725.74852 </td>
   <td style="text-align:right;"> 826.740553 </td>
   <td style="text-align:right;"> 8808.533 </td>
   <td style="text-align:right;"> 21068.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26367.94444 </td>
   <td style="text-align:right;"> 667.690061 </td>
   <td style="text-align:right;"> 10147.689 </td>
   <td style="text-align:right;"> 21383.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22940.61754 </td>
   <td style="text-align:right;"> 617.149895 </td>
   <td style="text-align:right;"> 9328.142 </td>
   <td style="text-align:right;"> 21210.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17281.10737 </td>
   <td style="text-align:right;"> 509.990398 </td>
   <td style="text-align:right;"> 11074.798 </td>
   <td style="text-align:right;"> 21377.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28483.74941 </td>
   <td style="text-align:right;"> 699.411228 </td>
   <td style="text-align:right;"> 10484.021 </td>
   <td style="text-align:right;"> 21739.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6913.12661 </td>
   <td style="text-align:right;"> 336.642830 </td>
   <td style="text-align:right;"> 13191.166 </td>
   <td style="text-align:right;"> 21129.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19783.92816 </td>
   <td style="text-align:right;"> 555.799619 </td>
   <td style="text-align:right;"> 10867.066 </td>
   <td style="text-align:right;"> 21277.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42291.77743 </td>
   <td style="text-align:right;"> 897.432796 </td>
   <td style="text-align:right;"> 9078.925 </td>
   <td style="text-align:right;"> 21663.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35033.47824 </td>
   <td style="text-align:right;"> 790.374719 </td>
   <td style="text-align:right;"> 8976.878 </td>
   <td style="text-align:right;"> 21381.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35321.09350 </td>
   <td style="text-align:right;"> 776.441073 </td>
   <td style="text-align:right;"> 10228.963 </td>
   <td style="text-align:right;"> 20831.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44267.10147 </td>
   <td style="text-align:right;"> 928.551525 </td>
   <td style="text-align:right;"> 8405.185 </td>
   <td style="text-align:right;"> 21250.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38086.13310 </td>
   <td style="text-align:right;"> 841.122594 </td>
   <td style="text-align:right;"> 9195.184 </td>
   <td style="text-align:right;"> 21408.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36947.60779 </td>
   <td style="text-align:right;"> 825.928180 </td>
   <td style="text-align:right;"> 8300.413 </td>
   <td style="text-align:right;"> 21335.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40049.41587 </td>
   <td style="text-align:right;"> 869.923332 </td>
   <td style="text-align:right;"> 9149.068 </td>
   <td style="text-align:right;"> 21371.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39589.58464 </td>
   <td style="text-align:right;"> 860.728302 </td>
   <td style="text-align:right;"> 8426.033 </td>
   <td style="text-align:right;"> 21481.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41080.24497 </td>
   <td style="text-align:right;"> 886.689868 </td>
   <td style="text-align:right;"> 7234.227 </td>
   <td style="text-align:right;"> 21689.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42777.51573 </td>
   <td style="text-align:right;"> 913.858959 </td>
   <td style="text-align:right;"> 10412.325 </td>
   <td style="text-align:right;"> 21529.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20687.93811 </td>
   <td style="text-align:right;"> 593.682010 </td>
   <td style="text-align:right;"> 8950.715 </td>
   <td style="text-align:right;"> 21984.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24150.54935 </td>
   <td style="text-align:right;"> 623.897479 </td>
   <td style="text-align:right;"> 11979.633 </td>
   <td style="text-align:right;"> 22050.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6852.27677 </td>
   <td style="text-align:right;"> 367.532989 </td>
   <td style="text-align:right;"> 11210.823 </td>
   <td style="text-align:right;"> 21778.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6055.08867 </td>
   <td style="text-align:right;"> 359.636226 </td>
   <td style="text-align:right;"> 10726.828 </td>
   <td style="text-align:right;"> 21875.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19704.03236 </td>
   <td style="text-align:right;"> 553.071654 </td>
   <td style="text-align:right;"> 10831.098 </td>
   <td style="text-align:right;"> 21610.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9959.74569 </td>
   <td style="text-align:right;"> 406.440701 </td>
   <td style="text-align:right;"> 10900.824 </td>
   <td style="text-align:right;"> 21256.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21524.73225 </td>
   <td style="text-align:right;"> 580.677741 </td>
   <td style="text-align:right;"> 10756.301 </td>
   <td style="text-align:right;"> 21391.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8756.56672 </td>
   <td style="text-align:right;"> 378.807353 </td>
   <td style="text-align:right;"> 12940.519 </td>
   <td style="text-align:right;"> 21498.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37683.55125 </td>
   <td style="text-align:right;"> 842.702451 </td>
   <td style="text-align:right;"> 8107.959 </td>
   <td style="text-align:right;"> 21639.05 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20099.44688 </td>
   <td style="text-align:right;"> 545.973863 </td>
   <td style="text-align:right;"> 12475.131 </td>
   <td style="text-align:right;"> 21262.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19846.94145 </td>
   <td style="text-align:right;"> 570.550565 </td>
   <td style="text-align:right;"> 9826.045 </td>
   <td style="text-align:right;"> 21416.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33170.85994 </td>
   <td style="text-align:right;"> 758.651750 </td>
   <td style="text-align:right;"> 10839.366 </td>
   <td style="text-align:right;"> 21424.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31916.03867 </td>
   <td style="text-align:right;"> 727.502827 </td>
   <td style="text-align:right;"> 10567.573 </td>
   <td style="text-align:right;"> 21644.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15727.27257 </td>
   <td style="text-align:right;"> 483.226119 </td>
   <td style="text-align:right;"> 11383.845 </td>
   <td style="text-align:right;"> 20528.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29135.77661 </td>
   <td style="text-align:right;"> 684.232478 </td>
   <td style="text-align:right;"> 12093.395 </td>
   <td style="text-align:right;"> 20964.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23112.19093 </td>
   <td style="text-align:right;"> 615.096401 </td>
   <td style="text-align:right;"> 8839.484 </td>
   <td style="text-align:right;"> 21322.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29916.83322 </td>
   <td style="text-align:right;"> 715.657924 </td>
   <td style="text-align:right;"> 10503.378 </td>
   <td style="text-align:right;"> 21467.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29305.42762 </td>
   <td style="text-align:right;"> 715.854008 </td>
   <td style="text-align:right;"> 9536.058 </td>
   <td style="text-align:right;"> 21520.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31181.60683 </td>
   <td style="text-align:right;"> 716.273624 </td>
   <td style="text-align:right;"> 11095.822 </td>
   <td style="text-align:right;"> 21149.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15829.01891 </td>
   <td style="text-align:right;"> 493.193595 </td>
   <td style="text-align:right;"> 11956.741 </td>
   <td style="text-align:right;"> 21616.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13582.81772 </td>
   <td style="text-align:right;"> 459.790044 </td>
   <td style="text-align:right;"> 11870.904 </td>
   <td style="text-align:right;"> 21246.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24853.87309 </td>
   <td style="text-align:right;"> 617.819686 </td>
   <td style="text-align:right;"> 11393.021 </td>
   <td style="text-align:right;"> 21956.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25281.79449 </td>
   <td style="text-align:right;"> 621.401616 </td>
   <td style="text-align:right;"> 11636.778 </td>
   <td style="text-align:right;"> 21990.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11466.31184 </td>
   <td style="text-align:right;"> 426.777233 </td>
   <td style="text-align:right;"> 10260.987 </td>
   <td style="text-align:right;"> 21717.43 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42449.26198 </td>
   <td style="text-align:right;"> 911.962159 </td>
   <td style="text-align:right;"> 10469.855 </td>
   <td style="text-align:right;"> 21911.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33800.59206 </td>
   <td style="text-align:right;"> 779.150613 </td>
   <td style="text-align:right;"> 9658.789 </td>
   <td style="text-align:right;"> 21429.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31562.49234 </td>
   <td style="text-align:right;"> 717.742579 </td>
   <td style="text-align:right;"> 11783.294 </td>
   <td style="text-align:right;"> 22027.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32330.26008 </td>
   <td style="text-align:right;"> 739.430653 </td>
   <td style="text-align:right;"> 11664.514 </td>
   <td style="text-align:right;"> 21789.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22270.23595 </td>
   <td style="text-align:right;"> 605.950103 </td>
   <td style="text-align:right;"> 9072.452 </td>
   <td style="text-align:right;"> 21650.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16514.90196 </td>
   <td style="text-align:right;"> 474.937129 </td>
   <td style="text-align:right;"> 14417.686 </td>
   <td style="text-align:right;"> 21452.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10851.83467 </td>
   <td style="text-align:right;"> 432.139184 </td>
   <td style="text-align:right;"> 10102.671 </td>
   <td style="text-align:right;"> 21870.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -53402.00672 </td>
   <td style="text-align:right;"> 1072.245908 </td>
   <td style="text-align:right;"> 9562.278 </td>
   <td style="text-align:right;"> 20961.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23952.78164 </td>
   <td style="text-align:right;"> 620.890745 </td>
   <td style="text-align:right;"> 9492.506 </td>
   <td style="text-align:right;"> 21528.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19285.47044 </td>
   <td style="text-align:right;"> 549.795043 </td>
   <td style="text-align:right;"> 10636.515 </td>
   <td style="text-align:right;"> 21259.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31971.49081 </td>
   <td style="text-align:right;"> 747.466932 </td>
   <td style="text-align:right;"> 8479.661 </td>
   <td style="text-align:right;"> 21449.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24199.81801 </td>
   <td style="text-align:right;"> 617.550751 </td>
   <td style="text-align:right;"> 11705.486 </td>
   <td style="text-align:right;"> 21743.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -51661.87808 </td>
   <td style="text-align:right;"> 1045.655836 </td>
   <td style="text-align:right;"> 8631.004 </td>
   <td style="text-align:right;"> 20841.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38092.27621 </td>
   <td style="text-align:right;"> 843.936558 </td>
   <td style="text-align:right;"> 8250.430 </td>
   <td style="text-align:right;"> 21175.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36885.30818 </td>
   <td style="text-align:right;"> 810.253545 </td>
   <td style="text-align:right;"> 10847.937 </td>
   <td style="text-align:right;"> 21575.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30453.15056 </td>
   <td style="text-align:right;"> 713.417329 </td>
   <td style="text-align:right;"> 10507.478 </td>
   <td style="text-align:right;"> 21618.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33439.09964 </td>
   <td style="text-align:right;"> 769.271402 </td>
   <td style="text-align:right;"> 9398.313 </td>
   <td style="text-align:right;"> 21068.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23872.27410 </td>
   <td style="text-align:right;"> 608.791398 </td>
   <td style="text-align:right;"> 11426.484 </td>
   <td style="text-align:right;"> 21903.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33572.70256 </td>
   <td style="text-align:right;"> 761.899070 </td>
   <td style="text-align:right;"> 10541.289 </td>
   <td style="text-align:right;"> 21146.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32075.94708 </td>
   <td style="text-align:right;"> 737.248270 </td>
   <td style="text-align:right;"> 11052.790 </td>
   <td style="text-align:right;"> 21170.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28912.44543 </td>
   <td style="text-align:right;"> 700.709008 </td>
   <td style="text-align:right;"> 9645.073 </td>
   <td style="text-align:right;"> 21592.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22335.56673 </td>
   <td style="text-align:right;"> 576.710478 </td>
   <td style="text-align:right;"> 11136.211 </td>
   <td style="text-align:right;"> 21317.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31292.08142 </td>
   <td style="text-align:right;"> 724.375740 </td>
   <td style="text-align:right;"> 9659.107 </td>
   <td style="text-align:right;"> 22525.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31424.34130 </td>
   <td style="text-align:right;"> 731.407678 </td>
   <td style="text-align:right;"> 11080.666 </td>
   <td style="text-align:right;"> 21911.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -718.41142 </td>
   <td style="text-align:right;"> 260.044836 </td>
   <td style="text-align:right;"> 12124.664 </td>
   <td style="text-align:right;"> 21258.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -45469.83245 </td>
   <td style="text-align:right;"> 946.745774 </td>
   <td style="text-align:right;"> 9550.889 </td>
   <td style="text-align:right;"> 21791.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19134.58910 </td>
   <td style="text-align:right;"> 534.159361 </td>
   <td style="text-align:right;"> 12622.961 </td>
   <td style="text-align:right;"> 21038.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15075.94628 </td>
   <td style="text-align:right;"> 481.427900 </td>
   <td style="text-align:right;"> 10924.327 </td>
   <td style="text-align:right;"> 22185.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6379.46784 </td>
   <td style="text-align:right;"> 147.173642 </td>
   <td style="text-align:right;"> 14174.255 </td>
   <td style="text-align:right;"> 21140.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12753.82190 </td>
   <td style="text-align:right;"> 431.848167 </td>
   <td style="text-align:right;"> 13675.893 </td>
   <td style="text-align:right;"> 21159.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7476.33568 </td>
   <td style="text-align:right;"> 363.392972 </td>
   <td style="text-align:right;"> 12052.821 </td>
   <td style="text-align:right;"> 20733.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28016.43385 </td>
   <td style="text-align:right;"> 671.239010 </td>
   <td style="text-align:right;"> 11092.272 </td>
   <td style="text-align:right;"> 21360.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28386.75319 </td>
   <td style="text-align:right;"> 689.298950 </td>
   <td style="text-align:right;"> 10442.412 </td>
   <td style="text-align:right;"> 21319.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15858.45788 </td>
   <td style="text-align:right;"> 494.481460 </td>
   <td style="text-align:right;"> 11547.521 </td>
   <td style="text-align:right;"> 21719.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36042.26728 </td>
   <td style="text-align:right;"> 801.094482 </td>
   <td style="text-align:right;"> 9436.551 </td>
   <td style="text-align:right;"> 21140.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23487.57560 </td>
   <td style="text-align:right;"> 610.931573 </td>
   <td style="text-align:right;"> 11037.917 </td>
   <td style="text-align:right;"> 21646.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22655.13485 </td>
   <td style="text-align:right;"> 586.880444 </td>
   <td style="text-align:right;"> 10781.709 </td>
   <td style="text-align:right;"> 21011.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28895.86259 </td>
   <td style="text-align:right;"> 689.053527 </td>
   <td style="text-align:right;"> 9595.561 </td>
   <td style="text-align:right;"> 21177.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44410.72400 </td>
   <td style="text-align:right;"> 924.333488 </td>
   <td style="text-align:right;"> 10026.171 </td>
   <td style="text-align:right;"> 21991.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17259.72144 </td>
   <td style="text-align:right;"> 527.030940 </td>
   <td style="text-align:right;"> 10387.970 </td>
   <td style="text-align:right;"> 21378.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20967.80087 </td>
   <td style="text-align:right;"> 591.165302 </td>
   <td style="text-align:right;"> 10244.000 </td>
   <td style="text-align:right;"> 21591.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33627.78786 </td>
   <td style="text-align:right;"> 781.893058 </td>
   <td style="text-align:right;"> 9936.492 </td>
   <td style="text-align:right;"> 21680.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31643.30450 </td>
   <td style="text-align:right;"> 736.650483 </td>
   <td style="text-align:right;"> 9434.643 </td>
   <td style="text-align:right;"> 21736.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39065.87670 </td>
   <td style="text-align:right;"> 837.613883 </td>
   <td style="text-align:right;"> 10247.623 </td>
   <td style="text-align:right;"> 21555.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35630.41940 </td>
   <td style="text-align:right;"> 797.681242 </td>
   <td style="text-align:right;"> 8835.847 </td>
   <td style="text-align:right;"> 21580.84 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30115.91150 </td>
   <td style="text-align:right;"> 712.461696 </td>
   <td style="text-align:right;"> 9321.526 </td>
   <td style="text-align:right;"> 21058.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39016.50652 </td>
   <td style="text-align:right;"> 850.980650 </td>
   <td style="text-align:right;"> 9265.467 </td>
   <td style="text-align:right;"> 21900.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11727.21689 </td>
   <td style="text-align:right;"> 432.048765 </td>
   <td style="text-align:right;"> 11985.232 </td>
   <td style="text-align:right;"> 21244.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17670.47199 </td>
   <td style="text-align:right;"> 527.991822 </td>
   <td style="text-align:right;"> 11265.154 </td>
   <td style="text-align:right;"> 21574.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14610.57704 </td>
   <td style="text-align:right;"> 469.710448 </td>
   <td style="text-align:right;"> 12243.180 </td>
   <td style="text-align:right;"> 21359.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39442.40003 </td>
   <td style="text-align:right;"> 845.086051 </td>
   <td style="text-align:right;"> 8987.231 </td>
   <td style="text-align:right;"> 21974.43 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -47934.06607 </td>
   <td style="text-align:right;"> 1005.206702 </td>
   <td style="text-align:right;"> 8128.139 </td>
   <td style="text-align:right;"> 20735.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17046.84296 </td>
   <td style="text-align:right;"> 502.021207 </td>
   <td style="text-align:right;"> 12061.882 </td>
   <td style="text-align:right;"> 21848.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20631.86153 </td>
   <td style="text-align:right;"> 558.791780 </td>
   <td style="text-align:right;"> 12062.227 </td>
   <td style="text-align:right;"> 21878.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19751.31942 </td>
   <td style="text-align:right;"> 546.791559 </td>
   <td style="text-align:right;"> 11691.409 </td>
   <td style="text-align:right;"> 20806.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33596.19335 </td>
   <td style="text-align:right;"> 757.677440 </td>
   <td style="text-align:right;"> 10607.889 </td>
   <td style="text-align:right;"> 20862.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30728.32984 </td>
   <td style="text-align:right;"> 719.133703 </td>
   <td style="text-align:right;"> 9856.848 </td>
   <td style="text-align:right;"> 21537.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41627.11955 </td>
   <td style="text-align:right;"> 882.345864 </td>
   <td style="text-align:right;"> 11246.981 </td>
   <td style="text-align:right;"> 21540.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -1400.66681 </td>
   <td style="text-align:right;"> 254.636526 </td>
   <td style="text-align:right;"> 12597.933 </td>
   <td style="text-align:right;"> 21075.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -3166.52702 </td>
   <td style="text-align:right;"> 279.958584 </td>
   <td style="text-align:right;"> 12649.107 </td>
   <td style="text-align:right;"> 21249.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11864.33812 </td>
   <td style="text-align:right;"> 424.531084 </td>
   <td style="text-align:right;"> 12895.836 </td>
   <td style="text-align:right;"> 21103.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22511.43311 </td>
   <td style="text-align:right;"> 598.835454 </td>
   <td style="text-align:right;"> 10707.766 </td>
   <td style="text-align:right;"> 21228.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20557.03739 </td>
   <td style="text-align:right;"> 574.418081 </td>
   <td style="text-align:right;"> 10757.132 </td>
   <td style="text-align:right;"> 21664.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30921.11580 </td>
   <td style="text-align:right;"> 723.629848 </td>
   <td style="text-align:right;"> 10416.993 </td>
   <td style="text-align:right;"> 20714.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25013.68856 </td>
   <td style="text-align:right;"> 629.781120 </td>
   <td style="text-align:right;"> 11379.165 </td>
   <td style="text-align:right;"> 22096.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -49322.56009 </td>
   <td style="text-align:right;"> 1007.454085 </td>
   <td style="text-align:right;"> 7802.637 </td>
   <td style="text-align:right;"> 21594.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6143.80863 </td>
   <td style="text-align:right;"> 341.866986 </td>
   <td style="text-align:right;"> 12935.918 </td>
   <td style="text-align:right;"> 21122.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -1836.73750 </td>
   <td style="text-align:right;"> 282.644572 </td>
   <td style="text-align:right;"> 11788.252 </td>
   <td style="text-align:right;"> 21000.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13625.71091 </td>
   <td style="text-align:right;"> 457.708149 </td>
   <td style="text-align:right;"> 12977.572 </td>
   <td style="text-align:right;"> 21173.36 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14313.94277 </td>
   <td style="text-align:right;"> 479.656144 </td>
   <td style="text-align:right;"> 10781.278 </td>
   <td style="text-align:right;"> 21234.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30655.89969 </td>
   <td style="text-align:right;"> 731.454934 </td>
   <td style="text-align:right;"> 9946.120 </td>
   <td style="text-align:right;"> 21280.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39918.06075 </td>
   <td style="text-align:right;"> 881.685453 </td>
   <td style="text-align:right;"> 8753.718 </td>
   <td style="text-align:right;"> 21491.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24992.75330 </td>
   <td style="text-align:right;"> 639.249857 </td>
   <td style="text-align:right;"> 10363.388 </td>
   <td style="text-align:right;"> 21447.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20340.59342 </td>
   <td style="text-align:right;"> 561.004974 </td>
   <td style="text-align:right;"> 11803.764 </td>
   <td style="text-align:right;"> 21435.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28681.24036 </td>
   <td style="text-align:right;"> 688.910366 </td>
   <td style="text-align:right;"> 10926.939 </td>
   <td style="text-align:right;"> 21015.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33495.53666 </td>
   <td style="text-align:right;"> 759.836427 </td>
   <td style="text-align:right;"> 9380.308 </td>
   <td style="text-align:right;"> 21689.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36254.71069 </td>
   <td style="text-align:right;"> 807.340226 </td>
   <td style="text-align:right;"> 9732.706 </td>
   <td style="text-align:right;"> 20744.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20384.14066 </td>
   <td style="text-align:right;"> 561.752294 </td>
   <td style="text-align:right;"> 12180.018 </td>
   <td style="text-align:right;"> 21591.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14676.67200 </td>
   <td style="text-align:right;"> 454.622172 </td>
   <td style="text-align:right;"> 13953.075 </td>
   <td style="text-align:right;"> 21789.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -53287.05771 </td>
   <td style="text-align:right;"> 1062.912621 </td>
   <td style="text-align:right;"> 8176.473 </td>
   <td style="text-align:right;"> 21371.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7249.69565 </td>
   <td style="text-align:right;"> 353.288962 </td>
   <td style="text-align:right;"> 12286.147 </td>
   <td style="text-align:right;"> 21474.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -4438.97846 </td>
   <td style="text-align:right;"> 317.428598 </td>
   <td style="text-align:right;"> 11662.983 </td>
   <td style="text-align:right;"> 21488.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -47456.23088 </td>
   <td style="text-align:right;"> 972.932246 </td>
   <td style="text-align:right;"> 9494.310 </td>
   <td style="text-align:right;"> 21284.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18687.63844 </td>
   <td style="text-align:right;"> 539.259474 </td>
   <td style="text-align:right;"> 10431.774 </td>
   <td style="text-align:right;"> 21638.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20920.82425 </td>
   <td style="text-align:right;"> 578.287443 </td>
   <td style="text-align:right;"> 9930.692 </td>
   <td style="text-align:right;"> 21323.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41811.34604 </td>
   <td style="text-align:right;"> 890.844084 </td>
   <td style="text-align:right;"> 9682.287 </td>
   <td style="text-align:right;"> 21388.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19104.60158 </td>
   <td style="text-align:right;"> 549.792308 </td>
   <td style="text-align:right;"> 10119.780 </td>
   <td style="text-align:right;"> 21320.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35745.52483 </td>
   <td style="text-align:right;"> 782.596538 </td>
   <td style="text-align:right;"> 11363.529 </td>
   <td style="text-align:right;"> 21182.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15655.25925 </td>
   <td style="text-align:right;"> 497.108085 </td>
   <td style="text-align:right;"> 9746.820 </td>
   <td style="text-align:right;"> 21091.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14431.08314 </td>
   <td style="text-align:right;"> 466.562213 </td>
   <td style="text-align:right;"> 13777.711 </td>
   <td style="text-align:right;"> 21412.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14799.67059 </td>
   <td style="text-align:right;"> 471.471791 </td>
   <td style="text-align:right;"> 13778.283 </td>
   <td style="text-align:right;"> 21355.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -3187.23760 </td>
   <td style="text-align:right;"> 279.619517 </td>
   <td style="text-align:right;"> 14571.237 </td>
   <td style="text-align:right;"> 21199.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13895.87234 </td>
   <td style="text-align:right;"> 451.381314 </td>
   <td style="text-align:right;"> 11925.882 </td>
   <td style="text-align:right;"> 21365.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21132.55632 </td>
   <td style="text-align:right;"> 566.957149 </td>
   <td style="text-align:right;"> 11858.361 </td>
   <td style="text-align:right;"> 21164.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22192.51690 </td>
   <td style="text-align:right;"> 588.114250 </td>
   <td style="text-align:right;"> 12158.755 </td>
   <td style="text-align:right;"> 21610.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38885.65892 </td>
   <td style="text-align:right;"> 835.694945 </td>
   <td style="text-align:right;"> 10586.633 </td>
   <td style="text-align:right;"> 21552.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23505.27467 </td>
   <td style="text-align:right;"> 612.143380 </td>
   <td style="text-align:right;"> 9393.994 </td>
   <td style="text-align:right;"> 20976.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28592.09252 </td>
   <td style="text-align:right;"> 674.192968 </td>
   <td style="text-align:right;"> 12156.090 </td>
   <td style="text-align:right;"> 21575.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10794.38614 </td>
   <td style="text-align:right;"> 434.727927 </td>
   <td style="text-align:right;"> 10929.651 </td>
   <td style="text-align:right;"> 21577.43 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3239.22235 </td>
   <td style="text-align:right;"> 188.747289 </td>
   <td style="text-align:right;"> 12201.376 </td>
   <td style="text-align:right;"> 21300.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5479.59757 </td>
   <td style="text-align:right;"> 334.282955 </td>
   <td style="text-align:right;"> 13709.684 </td>
   <td style="text-align:right;"> 22270.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27062.74909 </td>
   <td style="text-align:right;"> 689.716667 </td>
   <td style="text-align:right;"> 8527.857 </td>
   <td style="text-align:right;"> 22410.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -45464.61743 </td>
   <td style="text-align:right;"> 947.716563 </td>
   <td style="text-align:right;"> 9794.780 </td>
   <td style="text-align:right;"> 20764.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -51717.83545 </td>
   <td style="text-align:right;"> 1041.468042 </td>
   <td style="text-align:right;"> 10420.964 </td>
   <td style="text-align:right;"> 20784.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5096.98484 </td>
   <td style="text-align:right;"> 337.801437 </td>
   <td style="text-align:right;"> 10270.883 </td>
   <td style="text-align:right;"> 21061.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26502.84948 </td>
   <td style="text-align:right;"> 658.267858 </td>
   <td style="text-align:right;"> 9919.423 </td>
   <td style="text-align:right;"> 21106.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8394.49902 </td>
   <td style="text-align:right;"> 375.222949 </td>
   <td style="text-align:right;"> 11702.737 </td>
   <td style="text-align:right;"> 21316.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1541.81307 </td>
   <td style="text-align:right;"> 221.971062 </td>
   <td style="text-align:right;"> 13166.224 </td>
   <td style="text-align:right;"> 21748.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8973.19464 </td>
   <td style="text-align:right;"> 368.340049 </td>
   <td style="text-align:right;"> 13478.006 </td>
   <td style="text-align:right;"> 21297.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26847.57082 </td>
   <td style="text-align:right;"> 659.442902 </td>
   <td style="text-align:right;"> 9792.985 </td>
   <td style="text-align:right;"> 21534.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34457.54022 </td>
   <td style="text-align:right;"> 768.090153 </td>
   <td style="text-align:right;"> 9523.031 </td>
   <td style="text-align:right;"> 21339.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15712.58017 </td>
   <td style="text-align:right;"> 493.022303 </td>
   <td style="text-align:right;"> 11457.255 </td>
   <td style="text-align:right;"> 21858.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20546.81554 </td>
   <td style="text-align:right;"> 556.728251 </td>
   <td style="text-align:right;"> 12097.256 </td>
   <td style="text-align:right;"> 21567.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6609.24219 </td>
   <td style="text-align:right;"> 348.626554 </td>
   <td style="text-align:right;"> 11995.691 </td>
   <td style="text-align:right;"> 21291.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19123.52447 </td>
   <td style="text-align:right;"> 536.703770 </td>
   <td style="text-align:right;"> 12398.018 </td>
   <td style="text-align:right;"> 21653.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17802.52770 </td>
   <td style="text-align:right;"> 510.171809 </td>
   <td style="text-align:right;"> 12841.052 </td>
   <td style="text-align:right;"> 21545.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39791.52306 </td>
   <td style="text-align:right;"> 860.074597 </td>
   <td style="text-align:right;"> 8293.389 </td>
   <td style="text-align:right;"> 21280.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33313.06169 </td>
   <td style="text-align:right;"> 766.727119 </td>
   <td style="text-align:right;"> 9751.255 </td>
   <td style="text-align:right;"> 21013.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39359.31914 </td>
   <td style="text-align:right;"> 865.077363 </td>
   <td style="text-align:right;"> 8607.913 </td>
   <td style="text-align:right;"> 21821.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33102.19316 </td>
   <td style="text-align:right;"> 772.738672 </td>
   <td style="text-align:right;"> 8890.108 </td>
   <td style="text-align:right;"> 21248.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21992.71877 </td>
   <td style="text-align:right;"> 598.618706 </td>
   <td style="text-align:right;"> 10464.059 </td>
   <td style="text-align:right;"> 21296.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22296.14616 </td>
   <td style="text-align:right;"> 582.124066 </td>
   <td style="text-align:right;"> 10621.408 </td>
   <td style="text-align:right;"> 21745.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34579.98175 </td>
   <td style="text-align:right;"> 769.135525 </td>
   <td style="text-align:right;"> 10488.501 </td>
   <td style="text-align:right;"> 21782.36 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11554.67279 </td>
   <td style="text-align:right;"> 432.527593 </td>
   <td style="text-align:right;"> 11467.787 </td>
   <td style="text-align:right;"> 21024.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39555.50935 </td>
   <td style="text-align:right;"> 854.675656 </td>
   <td style="text-align:right;"> 9769.215 </td>
   <td style="text-align:right;"> 20972.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -50540.58331 </td>
   <td style="text-align:right;"> 1033.143791 </td>
   <td style="text-align:right;"> 6638.184 </td>
   <td style="text-align:right;"> 21240.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46238.09261 </td>
   <td style="text-align:right;"> 970.352346 </td>
   <td style="text-align:right;"> 7108.323 </td>
   <td style="text-align:right;"> 20919.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42701.19188 </td>
   <td style="text-align:right;"> 905.997289 </td>
   <td style="text-align:right;"> 9310.104 </td>
   <td style="text-align:right;"> 22065.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32066.24880 </td>
   <td style="text-align:right;"> 746.161455 </td>
   <td style="text-align:right;"> 9188.150 </td>
   <td style="text-align:right;"> 21996.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34301.92641 </td>
   <td style="text-align:right;"> 774.397412 </td>
   <td style="text-align:right;"> 10570.223 </td>
   <td style="text-align:right;"> 22197.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40811.17394 </td>
   <td style="text-align:right;"> 869.000575 </td>
   <td style="text-align:right;"> 10898.833 </td>
   <td style="text-align:right;"> 22110.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19128.47174 </td>
   <td style="text-align:right;"> 527.498780 </td>
   <td style="text-align:right;"> 9733.957 </td>
   <td style="text-align:right;"> 20812.05 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18352.78218 </td>
   <td style="text-align:right;"> 514.657953 </td>
   <td style="text-align:right;"> 11761.960 </td>
   <td style="text-align:right;"> 21259.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13447.78983 </td>
   <td style="text-align:right;"> 457.721304 </td>
   <td style="text-align:right;"> 10280.369 </td>
   <td style="text-align:right;"> 21515.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14946.48610 </td>
   <td style="text-align:right;"> 478.636887 </td>
   <td style="text-align:right;"> 11118.539 </td>
   <td style="text-align:right;"> 21623.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34774.03414 </td>
   <td style="text-align:right;"> 785.087964 </td>
   <td style="text-align:right;"> 9932.237 </td>
   <td style="text-align:right;"> 21758.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22110.79267 </td>
   <td style="text-align:right;"> 584.779883 </td>
   <td style="text-align:right;"> 11472.617 </td>
   <td style="text-align:right;"> 21677.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22785.75066 </td>
   <td style="text-align:right;"> 612.046233 </td>
   <td style="text-align:right;"> 9364.398 </td>
   <td style="text-align:right;"> 21335.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33612.41854 </td>
   <td style="text-align:right;"> 771.660733 </td>
   <td style="text-align:right;"> 9967.413 </td>
   <td style="text-align:right;"> 21878.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22932.44412 </td>
   <td style="text-align:right;"> 612.845943 </td>
   <td style="text-align:right;"> 10434.361 </td>
   <td style="text-align:right;"> 20784.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23053.83046 </td>
   <td style="text-align:right;"> 592.470114 </td>
   <td style="text-align:right;"> 10482.069 </td>
   <td style="text-align:right;"> 22232.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26132.03763 </td>
   <td style="text-align:right;"> 662.034299 </td>
   <td style="text-align:right;"> 10661.009 </td>
   <td style="text-align:right;"> 20638.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39334.51782 </td>
   <td style="text-align:right;"> 847.194224 </td>
   <td style="text-align:right;"> 9290.043 </td>
   <td style="text-align:right;"> 22125.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14360.15978 </td>
   <td style="text-align:right;"> 468.929462 </td>
   <td style="text-align:right;"> 11536.263 </td>
   <td style="text-align:right;"> 22058.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24749.89317 </td>
   <td style="text-align:right;"> 621.723486 </td>
   <td style="text-align:right;"> 11276.337 </td>
   <td style="text-align:right;"> 21399.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23387.61407 </td>
   <td style="text-align:right;"> 620.923289 </td>
   <td style="text-align:right;"> 10408.456 </td>
   <td style="text-align:right;"> 21367.84 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13965.80578 </td>
   <td style="text-align:right;"> 458.142659 </td>
   <td style="text-align:right;"> 12698.865 </td>
   <td style="text-align:right;"> 21040.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32935.66459 </td>
   <td style="text-align:right;"> 759.423499 </td>
   <td style="text-align:right;"> 8399.953 </td>
   <td style="text-align:right;"> 20908.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44703.81690 </td>
   <td style="text-align:right;"> 939.269589 </td>
   <td style="text-align:right;"> 8315.525 </td>
   <td style="text-align:right;"> 21321.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44625.14173 </td>
   <td style="text-align:right;"> 943.272895 </td>
   <td style="text-align:right;"> 7714.725 </td>
   <td style="text-align:right;"> 21448.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32843.82315 </td>
   <td style="text-align:right;"> 760.842056 </td>
   <td style="text-align:right;"> 8889.518 </td>
   <td style="text-align:right;"> 21205.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -3442.70495 </td>
   <td style="text-align:right;"> 291.555480 </td>
   <td style="text-align:right;"> 13812.960 </td>
   <td style="text-align:right;"> 21427.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17535.09669 </td>
   <td style="text-align:right;"> 504.635578 </td>
   <td style="text-align:right;"> 12983.464 </td>
   <td style="text-align:right;"> 21545.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -45907.39001 </td>
   <td style="text-align:right;"> 964.193918 </td>
   <td style="text-align:right;"> 8125.020 </td>
   <td style="text-align:right;"> 21300.24 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41798.51718 </td>
   <td style="text-align:right;"> 893.733729 </td>
   <td style="text-align:right;"> 8625.580 </td>
   <td style="text-align:right;"> 22054.73 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21730.55691 </td>
   <td style="text-align:right;"> 587.659703 </td>
   <td style="text-align:right;"> 11059.319 </td>
   <td style="text-align:right;"> 21515.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34557.86488 </td>
   <td style="text-align:right;"> 765.650749 </td>
   <td style="text-align:right;"> 11010.634 </td>
   <td style="text-align:right;"> 21958.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28383.45499 </td>
   <td style="text-align:right;"> 690.186750 </td>
   <td style="text-align:right;"> 11339.313 </td>
   <td style="text-align:right;"> 20847.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25600.91701 </td>
   <td style="text-align:right;"> 649.656824 </td>
   <td style="text-align:right;"> 10100.408 </td>
   <td style="text-align:right;"> 20593.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21136.02054 </td>
   <td style="text-align:right;"> 578.248190 </td>
   <td style="text-align:right;"> 10879.972 </td>
   <td style="text-align:right;"> 21849.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33443.58396 </td>
   <td style="text-align:right;"> 751.671146 </td>
   <td style="text-align:right;"> 10813.250 </td>
   <td style="text-align:right;"> 21375.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41594.66071 </td>
   <td style="text-align:right;"> 877.045419 </td>
   <td style="text-align:right;"> 10376.647 </td>
   <td style="text-align:right;"> 21333.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41849.86983 </td>
   <td style="text-align:right;"> 902.743033 </td>
   <td style="text-align:right;"> 7805.785 </td>
   <td style="text-align:right;"> 21730.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36231.34108 </td>
   <td style="text-align:right;"> 800.409654 </td>
   <td style="text-align:right;"> 10680.125 </td>
   <td style="text-align:right;"> 20785.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20104.72407 </td>
   <td style="text-align:right;"> 568.456906 </td>
   <td style="text-align:right;"> 8373.326 </td>
   <td style="text-align:right;"> 20986.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15686.14907 </td>
   <td style="text-align:right;"> 475.115418 </td>
   <td style="text-align:right;"> 13005.397 </td>
   <td style="text-align:right;"> 21060.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14023.83455 </td>
   <td style="text-align:right;"> 441.307159 </td>
   <td style="text-align:right;"> 13781.597 </td>
   <td style="text-align:right;"> 21202.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14868.57537 </td>
   <td style="text-align:right;"> 483.119514 </td>
   <td style="text-align:right;"> 11176.116 </td>
   <td style="text-align:right;"> 21393.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19469.97277 </td>
   <td style="text-align:right;"> 541.960738 </td>
   <td style="text-align:right;"> 10561.166 </td>
   <td style="text-align:right;"> 21304.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15560.98160 </td>
   <td style="text-align:right;"> 481.187396 </td>
   <td style="text-align:right;"> 12622.956 </td>
   <td style="text-align:right;"> 21074.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15084.23600 </td>
   <td style="text-align:right;"> 476.697410 </td>
   <td style="text-align:right;"> 11392.364 </td>
   <td style="text-align:right;"> 20665.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18543.50137 </td>
   <td style="text-align:right;"> 526.793255 </td>
   <td style="text-align:right;"> 12202.004 </td>
   <td style="text-align:right;"> 20819.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12601.35945 </td>
   <td style="text-align:right;"> 438.095597 </td>
   <td style="text-align:right;"> 11676.488 </td>
   <td style="text-align:right;"> 21415.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22243.28559 </td>
   <td style="text-align:right;"> 581.851735 </td>
   <td style="text-align:right;"> 12852.032 </td>
   <td style="text-align:right;"> 21358.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17892.59382 </td>
   <td style="text-align:right;"> 531.523717 </td>
   <td style="text-align:right;"> 10013.137 </td>
   <td style="text-align:right;"> 20378.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15282.97513 </td>
   <td style="text-align:right;"> 477.836682 </td>
   <td style="text-align:right;"> 12577.465 </td>
   <td style="text-align:right;"> 20700.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23002.54300 </td>
   <td style="text-align:right;"> 614.619510 </td>
   <td style="text-align:right;"> 9059.829 </td>
   <td style="text-align:right;"> 21456.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21515.07527 </td>
   <td style="text-align:right;"> 597.127722 </td>
   <td style="text-align:right;"> 8953.980 </td>
   <td style="text-align:right;"> 21561.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41732.27814 </td>
   <td style="text-align:right;"> 875.499745 </td>
   <td style="text-align:right;"> 11428.382 </td>
   <td style="text-align:right;"> 20900.73 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35375.40062 </td>
   <td style="text-align:right;"> 806.372369 </td>
   <td style="text-align:right;"> 8618.524 </td>
   <td style="text-align:right;"> 21697.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42105.49784 </td>
   <td style="text-align:right;"> 912.123642 </td>
   <td style="text-align:right;"> 8966.522 </td>
   <td style="text-align:right;"> 21249.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14348.10942 </td>
   <td style="text-align:right;"> 469.835365 </td>
   <td style="text-align:right;"> 11409.532 </td>
   <td style="text-align:right;"> 22085.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8486.41195 </td>
   <td style="text-align:right;"> 389.452509 </td>
   <td style="text-align:right;"> 10493.541 </td>
   <td style="text-align:right;"> 21906.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10311.73581 </td>
   <td style="text-align:right;"> 382.478865 </td>
   <td style="text-align:right;"> 14666.787 </td>
   <td style="text-align:right;"> 21183.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10260.41121 </td>
   <td style="text-align:right;"> 398.473464 </td>
   <td style="text-align:right;"> 12295.396 </td>
   <td style="text-align:right;"> 21741.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37190.75507 </td>
   <td style="text-align:right;"> 843.164428 </td>
   <td style="text-align:right;"> 8041.399 </td>
   <td style="text-align:right;"> 21528.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23594.62042 </td>
   <td style="text-align:right;"> 596.200412 </td>
   <td style="text-align:right;"> 12186.954 </td>
   <td style="text-align:right;"> 21392.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18081.14293 </td>
   <td style="text-align:right;"> 514.414729 </td>
   <td style="text-align:right;"> 11713.076 </td>
   <td style="text-align:right;"> 21248.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30554.50219 </td>
   <td style="text-align:right;"> 711.518168 </td>
   <td style="text-align:right;"> 10966.290 </td>
   <td style="text-align:right;"> 21615.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38644.18097 </td>
   <td style="text-align:right;"> 839.943170 </td>
   <td style="text-align:right;"> 10238.016 </td>
   <td style="text-align:right;"> 21199.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29892.72313 </td>
   <td style="text-align:right;"> 707.019827 </td>
   <td style="text-align:right;"> 9975.861 </td>
   <td style="text-align:right;"> 21100.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34784.70821 </td>
   <td style="text-align:right;"> 779.585721 </td>
   <td style="text-align:right;"> 9430.777 </td>
   <td style="text-align:right;"> 21016.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22762.21080 </td>
   <td style="text-align:right;"> 607.363693 </td>
   <td style="text-align:right;"> 10888.257 </td>
   <td style="text-align:right;"> 21767.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33515.71028 </td>
   <td style="text-align:right;"> 756.807790 </td>
   <td style="text-align:right;"> 9895.879 </td>
   <td style="text-align:right;"> 21163.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25593.45929 </td>
   <td style="text-align:right;"> 644.580449 </td>
   <td style="text-align:right;"> 9808.670 </td>
   <td style="text-align:right;"> 21645.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27283.46306 </td>
   <td style="text-align:right;"> 678.294375 </td>
   <td style="text-align:right;"> 10146.496 </td>
   <td style="text-align:right;"> 21090.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22995.81124 </td>
   <td style="text-align:right;"> 606.109603 </td>
   <td style="text-align:right;"> 10599.471 </td>
   <td style="text-align:right;"> 21454.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15319.34948 </td>
   <td style="text-align:right;"> 484.025560 </td>
   <td style="text-align:right;"> 11461.302 </td>
   <td style="text-align:right;"> 21361.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32999.36321 </td>
   <td style="text-align:right;"> 769.171653 </td>
   <td style="text-align:right;"> 10491.359 </td>
   <td style="text-align:right;"> 21354.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18445.94819 </td>
   <td style="text-align:right;"> 529.847548 </td>
   <td style="text-align:right;"> 10279.916 </td>
   <td style="text-align:right;"> 21713.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37583.20974 </td>
   <td style="text-align:right;"> 826.249529 </td>
   <td style="text-align:right;"> 10491.249 </td>
   <td style="text-align:right;"> 21473.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12334.35202 </td>
   <td style="text-align:right;"> 428.747559 </td>
   <td style="text-align:right;"> 11054.258 </td>
   <td style="text-align:right;"> 22272.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23673.95730 </td>
   <td style="text-align:right;"> 593.682084 </td>
   <td style="text-align:right;"> 11671.134 </td>
   <td style="text-align:right;"> 21644.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17238.46132 </td>
   <td style="text-align:right;"> 512.784552 </td>
   <td style="text-align:right;"> 10825.793 </td>
   <td style="text-align:right;"> 21441.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27539.35496 </td>
   <td style="text-align:right;"> 661.565624 </td>
   <td style="text-align:right;"> 11031.258 </td>
   <td style="text-align:right;"> 21842.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14588.89262 </td>
   <td style="text-align:right;"> 479.674975 </td>
   <td style="text-align:right;"> 11926.397 </td>
   <td style="text-align:right;"> 20957.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5629.83383 </td>
   <td style="text-align:right;"> 323.245313 </td>
   <td style="text-align:right;"> 14238.548 </td>
   <td style="text-align:right;"> 20753.36 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12068.29496 </td>
   <td style="text-align:right;"> 431.703757 </td>
   <td style="text-align:right;"> 12216.992 </td>
   <td style="text-align:right;"> 20915.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40233.87557 </td>
   <td style="text-align:right;"> 877.084309 </td>
   <td style="text-align:right;"> 8353.974 </td>
   <td style="text-align:right;"> 21627.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23124.86662 </td>
   <td style="text-align:right;"> 597.236813 </td>
   <td style="text-align:right;"> 12046.328 </td>
   <td style="text-align:right;"> 21525.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8698.30096 </td>
   <td style="text-align:right;"> 381.563888 </td>
   <td style="text-align:right;"> 11584.801 </td>
   <td style="text-align:right;"> 21391.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29388.35528 </td>
   <td style="text-align:right;"> 686.594505 </td>
   <td style="text-align:right;"> 11797.321 </td>
   <td style="text-align:right;"> 21293.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33059.02692 </td>
   <td style="text-align:right;"> 752.498494 </td>
   <td style="text-align:right;"> 8808.094 </td>
   <td style="text-align:right;"> 21385.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17738.62880 </td>
   <td style="text-align:right;"> 516.048225 </td>
   <td style="text-align:right;"> 12769.729 </td>
   <td style="text-align:right;"> 21422.94 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20168.79803 </td>
   <td style="text-align:right;"> 545.858824 </td>
   <td style="text-align:right;"> 10537.074 </td>
   <td style="text-align:right;"> 21592.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11541.57013 </td>
   <td style="text-align:right;"> 413.229735 </td>
   <td style="text-align:right;"> 10689.556 </td>
   <td style="text-align:right;"> 21684.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24332.53777 </td>
   <td style="text-align:right;"> 609.663621 </td>
   <td style="text-align:right;"> 10828.998 </td>
   <td style="text-align:right;"> 21631.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26855.22646 </td>
   <td style="text-align:right;"> 677.038766 </td>
   <td style="text-align:right;"> 8817.608 </td>
   <td style="text-align:right;"> 20928.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23922.10527 </td>
   <td style="text-align:right;"> 613.852363 </td>
   <td style="text-align:right;"> 11281.390 </td>
   <td style="text-align:right;"> 20937.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43954.54153 </td>
   <td style="text-align:right;"> 931.318624 </td>
   <td style="text-align:right;"> 8629.460 </td>
   <td style="text-align:right;"> 21721.24 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -63481.33287 </td>
   <td style="text-align:right;"> 1241.583842 </td>
   <td style="text-align:right;"> 7039.554 </td>
   <td style="text-align:right;"> 21105.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -58775.54812 </td>
   <td style="text-align:right;"> 1144.123980 </td>
   <td style="text-align:right;"> 9594.175 </td>
   <td style="text-align:right;"> 22096.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -50933.67591 </td>
   <td style="text-align:right;"> 1027.828575 </td>
   <td style="text-align:right;"> 9799.252 </td>
   <td style="text-align:right;"> 22148.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -51876.07032 </td>
   <td style="text-align:right;"> 1045.758985 </td>
   <td style="text-align:right;"> 8841.821 </td>
   <td style="text-align:right;"> 22188.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37711.45257 </td>
   <td style="text-align:right;"> 847.390014 </td>
   <td style="text-align:right;"> 7172.393 </td>
   <td style="text-align:right;"> 22209.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31497.40476 </td>
   <td style="text-align:right;"> 741.744878 </td>
   <td style="text-align:right;"> 9756.454 </td>
   <td style="text-align:right;"> 21767.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30360.93453 </td>
   <td style="text-align:right;"> 715.065702 </td>
   <td style="text-align:right;"> 10374.146 </td>
   <td style="text-align:right;"> 21685.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21472.76925 </td>
   <td style="text-align:right;"> 588.726271 </td>
   <td style="text-align:right;"> 10642.106 </td>
   <td style="text-align:right;"> 20968.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25071.76568 </td>
   <td style="text-align:right;"> 619.749555 </td>
   <td style="text-align:right;"> 12969.282 </td>
   <td style="text-align:right;"> 21297.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35328.21027 </td>
   <td style="text-align:right;"> 783.709707 </td>
   <td style="text-align:right;"> 11115.953 </td>
   <td style="text-align:right;"> 21704.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16415.90326 </td>
   <td style="text-align:right;"> 502.475920 </td>
   <td style="text-align:right;"> 11115.067 </td>
   <td style="text-align:right;"> 21839.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24914.38794 </td>
   <td style="text-align:right;"> 628.708755 </td>
   <td style="text-align:right;"> 12068.104 </td>
   <td style="text-align:right;"> 22090.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7237.38284 </td>
   <td style="text-align:right;"> 365.307917 </td>
   <td style="text-align:right;"> 10427.791 </td>
   <td style="text-align:right;"> 21705.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19693.16195 </td>
   <td style="text-align:right;"> 554.323052 </td>
   <td style="text-align:right;"> 10251.627 </td>
   <td style="text-align:right;"> 22055.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29866.99374 </td>
   <td style="text-align:right;"> 708.648538 </td>
   <td style="text-align:right;"> 11254.161 </td>
   <td style="text-align:right;"> 22215.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24529.15459 </td>
   <td style="text-align:right;"> 621.556076 </td>
   <td style="text-align:right;"> 12175.801 </td>
   <td style="text-align:right;"> 22106.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24711.95599 </td>
   <td style="text-align:right;"> 625.086961 </td>
   <td style="text-align:right;"> 11210.761 </td>
   <td style="text-align:right;"> 21994.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30290.83725 </td>
   <td style="text-align:right;"> 722.130699 </td>
   <td style="text-align:right;"> 9183.583 </td>
   <td style="text-align:right;"> 21463.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43924.42590 </td>
   <td style="text-align:right;"> 919.609676 </td>
   <td style="text-align:right;"> 10668.525 </td>
   <td style="text-align:right;"> 21387.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36279.86773 </td>
   <td style="text-align:right;"> 812.791911 </td>
   <td style="text-align:right;"> 9893.925 </td>
   <td style="text-align:right;"> 21474.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17774.80620 </td>
   <td style="text-align:right;"> 503.827561 </td>
   <td style="text-align:right;"> 11264.120 </td>
   <td style="text-align:right;"> 21165.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18489.83253 </td>
   <td style="text-align:right;"> 520.501134 </td>
   <td style="text-align:right;"> 12501.054 </td>
   <td style="text-align:right;"> 21798.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25860.83985 </td>
   <td style="text-align:right;"> 664.396253 </td>
   <td style="text-align:right;"> 9904.674 </td>
   <td style="text-align:right;"> 22186.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20025.01850 </td>
   <td style="text-align:right;"> 535.490933 </td>
   <td style="text-align:right;"> 12263.556 </td>
   <td style="text-align:right;"> 21154.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34285.66397 </td>
   <td style="text-align:right;"> 765.289537 </td>
   <td style="text-align:right;"> 9010.814 </td>
   <td style="text-align:right;"> 21795.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32123.97104 </td>
   <td style="text-align:right;"> 728.894277 </td>
   <td style="text-align:right;"> 11165.336 </td>
   <td style="text-align:right;"> 21393.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25713.81684 </td>
   <td style="text-align:right;"> 651.641651 </td>
   <td style="text-align:right;"> 10245.005 </td>
   <td style="text-align:right;"> 22135.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26199.84329 </td>
   <td style="text-align:right;"> 637.805117 </td>
   <td style="text-align:right;"> 11197.120 </td>
   <td style="text-align:right;"> 21047.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7571.15186 </td>
   <td style="text-align:right;"> 133.544845 </td>
   <td style="text-align:right;"> 12788.071 </td>
   <td style="text-align:right;"> 21232.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5968.49328 </td>
   <td style="text-align:right;"> 326.716179 </td>
   <td style="text-align:right;"> 15170.862 </td>
   <td style="text-align:right;"> 21505.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -777.78706 </td>
   <td style="text-align:right;"> 263.616069 </td>
   <td style="text-align:right;"> 11296.993 </td>
   <td style="text-align:right;"> 21775.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9661.26418 </td>
   <td style="text-align:right;"> 385.768946 </td>
   <td style="text-align:right;"> 12252.337 </td>
   <td style="text-align:right;"> 21883.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14683.92288 </td>
   <td style="text-align:right;"> 481.221487 </td>
   <td style="text-align:right;"> 12473.060 </td>
   <td style="text-align:right;"> 21893.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26677.75285 </td>
   <td style="text-align:right;"> 641.651017 </td>
   <td style="text-align:right;"> 10944.492 </td>
   <td style="text-align:right;"> 20929.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24490.48675 </td>
   <td style="text-align:right;"> 649.768426 </td>
   <td style="text-align:right;"> 9992.318 </td>
   <td style="text-align:right;"> 21699.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42176.48027 </td>
   <td style="text-align:right;"> 893.870511 </td>
   <td style="text-align:right;"> 9337.778 </td>
   <td style="text-align:right;"> 21230.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13796.38791 </td>
   <td style="text-align:right;"> 470.792307 </td>
   <td style="text-align:right;"> 11035.482 </td>
   <td style="text-align:right;"> 21218.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40426.30541 </td>
   <td style="text-align:right;"> 864.362178 </td>
   <td style="text-align:right;"> 10574.503 </td>
   <td style="text-align:right;"> 21455.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19575.53568 </td>
   <td style="text-align:right;"> 541.377818 </td>
   <td style="text-align:right;"> 12955.991 </td>
   <td style="text-align:right;"> 21333.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20976.81188 </td>
   <td style="text-align:right;"> 557.384778 </td>
   <td style="text-align:right;"> 11535.256 </td>
   <td style="text-align:right;"> 21805.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29738.92241 </td>
   <td style="text-align:right;"> 695.954418 </td>
   <td style="text-align:right;"> 10207.976 </td>
   <td style="text-align:right;"> 21476.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44173.89166 </td>
   <td style="text-align:right;"> 948.774052 </td>
   <td style="text-align:right;"> 7970.196 </td>
   <td style="text-align:right;"> 21493.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27077.13957 </td>
   <td style="text-align:right;"> 636.291569 </td>
   <td style="text-align:right;"> 11426.532 </td>
   <td style="text-align:right;"> 21472.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28022.76559 </td>
   <td style="text-align:right;"> 700.059562 </td>
   <td style="text-align:right;"> 8960.301 </td>
   <td style="text-align:right;"> 21233.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30261.32021 </td>
   <td style="text-align:right;"> 694.986383 </td>
   <td style="text-align:right;"> 11728.431 </td>
   <td style="text-align:right;"> 21470.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25053.17587 </td>
   <td style="text-align:right;"> 634.702518 </td>
   <td style="text-align:right;"> 9530.796 </td>
   <td style="text-align:right;"> 20896.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20355.43823 </td>
   <td style="text-align:right;"> 560.127791 </td>
   <td style="text-align:right;"> 10519.453 </td>
   <td style="text-align:right;"> 20901.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25235.67127 </td>
   <td style="text-align:right;"> 617.573520 </td>
   <td style="text-align:right;"> 11750.123 </td>
   <td style="text-align:right;"> 21713.84 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -49940.96801 </td>
   <td style="text-align:right;"> 1015.343659 </td>
   <td style="text-align:right;"> 8845.390 </td>
   <td style="text-align:right;"> 21942.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24794.78903 </td>
   <td style="text-align:right;"> 639.530596 </td>
   <td style="text-align:right;"> 9240.285 </td>
   <td style="text-align:right;"> 21839.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15089.68445 </td>
   <td style="text-align:right;"> 490.043102 </td>
   <td style="text-align:right;"> 10763.552 </td>
   <td style="text-align:right;"> 20883.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24001.95570 </td>
   <td style="text-align:right;"> 605.907378 </td>
   <td style="text-align:right;"> 10316.551 </td>
   <td style="text-align:right;"> 21778.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30325.47046 </td>
   <td style="text-align:right;"> 707.565844 </td>
   <td style="text-align:right;"> 10908.745 </td>
   <td style="text-align:right;"> 21247.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26360.53742 </td>
   <td style="text-align:right;"> 655.871000 </td>
   <td style="text-align:right;"> 10619.741 </td>
   <td style="text-align:right;"> 21629.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30177.08551 </td>
   <td style="text-align:right;"> 708.398728 </td>
   <td style="text-align:right;"> 10513.591 </td>
   <td style="text-align:right;"> 21004.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32659.48315 </td>
   <td style="text-align:right;"> 743.131665 </td>
   <td style="text-align:right;"> 10011.623 </td>
   <td style="text-align:right;"> 21176.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21569.42473 </td>
   <td style="text-align:right;"> 574.098529 </td>
   <td style="text-align:right;"> 9900.079 </td>
   <td style="text-align:right;"> 21229.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16344.52783 </td>
   <td style="text-align:right;"> 492.014292 </td>
   <td style="text-align:right;"> 11106.772 </td>
   <td style="text-align:right;"> 21138.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32094.95052 </td>
   <td style="text-align:right;"> 733.866329 </td>
   <td style="text-align:right;"> 10654.954 </td>
   <td style="text-align:right;"> 22204.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31855.32144 </td>
   <td style="text-align:right;"> 741.778120 </td>
   <td style="text-align:right;"> 9422.069 </td>
   <td style="text-align:right;"> 21715.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33946.56572 </td>
   <td style="text-align:right;"> 771.217372 </td>
   <td style="text-align:right;"> 10077.355 </td>
   <td style="text-align:right;"> 21540.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25704.72426 </td>
   <td style="text-align:right;"> 647.950036 </td>
   <td style="text-align:right;"> 10681.389 </td>
   <td style="text-align:right;"> 21505.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24801.59069 </td>
   <td style="text-align:right;"> 627.374121 </td>
   <td style="text-align:right;"> 10599.661 </td>
   <td style="text-align:right;"> 21755.94 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25425.47782 </td>
   <td style="text-align:right;"> 656.739006 </td>
   <td style="text-align:right;"> 9987.080 </td>
   <td style="text-align:right;"> 21842.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -48156.49432 </td>
   <td style="text-align:right;"> 978.823089 </td>
   <td style="text-align:right;"> 10071.405 </td>
   <td style="text-align:right;"> 21573.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39122.58714 </td>
   <td style="text-align:right;"> 846.312633 </td>
   <td style="text-align:right;"> 9502.899 </td>
   <td style="text-align:right;"> 21623.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31218.25985 </td>
   <td style="text-align:right;"> 735.196166 </td>
   <td style="text-align:right;"> 9415.076 </td>
   <td style="text-align:right;"> 21514.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28854.12248 </td>
   <td style="text-align:right;"> 698.301678 </td>
   <td style="text-align:right;"> 10732.937 </td>
   <td style="text-align:right;"> 21589.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30978.07636 </td>
   <td style="text-align:right;"> 716.617368 </td>
   <td style="text-align:right;"> 11366.989 </td>
   <td style="text-align:right;"> 21138.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6912.47540 </td>
   <td style="text-align:right;"> 350.297696 </td>
   <td style="text-align:right;"> 12019.872 </td>
   <td style="text-align:right;"> 21314.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29660.44208 </td>
   <td style="text-align:right;"> 695.903864 </td>
   <td style="text-align:right;"> 12203.130 </td>
   <td style="text-align:right;"> 21345.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13533.46557 </td>
   <td style="text-align:right;"> 457.475216 </td>
   <td style="text-align:right;"> 10606.564 </td>
   <td style="text-align:right;"> 21285.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37421.76672 </td>
   <td style="text-align:right;"> 822.219624 </td>
   <td style="text-align:right;"> 10878.007 </td>
   <td style="text-align:right;"> 21424.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23975.76626 </td>
   <td style="text-align:right;"> 621.364961 </td>
   <td style="text-align:right;"> 10814.357 </td>
   <td style="text-align:right;"> 21488.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -56031.80794 </td>
   <td style="text-align:right;"> 1120.956811 </td>
   <td style="text-align:right;"> 7051.640 </td>
   <td style="text-align:right;"> 21594.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -50381.71287 </td>
   <td style="text-align:right;"> 1051.390966 </td>
   <td style="text-align:right;"> 7589.147 </td>
   <td style="text-align:right;"> 21524.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19298.29360 </td>
   <td style="text-align:right;"> 550.635379 </td>
   <td style="text-align:right;"> 10844.711 </td>
   <td style="text-align:right;"> 21257.73 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16869.03188 </td>
   <td style="text-align:right;"> 508.468294 </td>
   <td style="text-align:right;"> 11909.280 </td>
   <td style="text-align:right;"> 21777.43 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24108.86590 </td>
   <td style="text-align:right;"> 618.583370 </td>
   <td style="text-align:right;"> 11602.341 </td>
   <td style="text-align:right;"> 21600.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30666.06063 </td>
   <td style="text-align:right;"> 722.299825 </td>
   <td style="text-align:right;"> 11211.836 </td>
   <td style="text-align:right;"> 21936.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25859.88154 </td>
   <td style="text-align:right;"> 651.021085 </td>
   <td style="text-align:right;"> 10519.197 </td>
   <td style="text-align:right;"> 21715.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39862.27013 </td>
   <td style="text-align:right;"> 877.131257 </td>
   <td style="text-align:right;"> 8118.962 </td>
   <td style="text-align:right;"> 21591.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38466.85980 </td>
   <td style="text-align:right;"> 849.039122 </td>
   <td style="text-align:right;"> 9245.559 </td>
   <td style="text-align:right;"> 21552.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -48881.10971 </td>
   <td style="text-align:right;"> 1004.923797 </td>
   <td style="text-align:right;"> 7936.699 </td>
   <td style="text-align:right;"> 20815.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26785.50787 </td>
   <td style="text-align:right;"> 660.145172 </td>
   <td style="text-align:right;"> 10356.005 </td>
   <td style="text-align:right;"> 21227.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26096.43772 </td>
   <td style="text-align:right;"> 653.293864 </td>
   <td style="text-align:right;"> 10603.877 </td>
   <td style="text-align:right;"> 21259.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17373.73403 </td>
   <td style="text-align:right;"> 511.801669 </td>
   <td style="text-align:right;"> 11229.045 </td>
   <td style="text-align:right;"> 21707.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13853.67285 </td>
   <td style="text-align:right;"> 455.681526 </td>
   <td style="text-align:right;"> 13103.359 </td>
   <td style="text-align:right;"> 21666.84 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8381.96983 </td>
   <td style="text-align:right;"> 388.135237 </td>
   <td style="text-align:right;"> 12059.400 </td>
   <td style="text-align:right;"> 21641.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32906.86982 </td>
   <td style="text-align:right;"> 751.149335 </td>
   <td style="text-align:right;"> 12224.549 </td>
   <td style="text-align:right;"> 21710.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11898.67763 </td>
   <td style="text-align:right;"> 437.442148 </td>
   <td style="text-align:right;"> 11010.933 </td>
   <td style="text-align:right;"> 21134.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39939.62591 </td>
   <td style="text-align:right;"> 858.580906 </td>
   <td style="text-align:right;"> 10463.271 </td>
   <td style="text-align:right;"> 21633.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21578.35047 </td>
   <td style="text-align:right;"> 602.602587 </td>
   <td style="text-align:right;"> 8588.170 </td>
   <td style="text-align:right;"> 21505.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30258.20325 </td>
   <td style="text-align:right;"> 714.245812 </td>
   <td style="text-align:right;"> 9542.282 </td>
   <td style="text-align:right;"> 21134.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -50252.10899 </td>
   <td style="text-align:right;"> 1025.236294 </td>
   <td style="text-align:right;"> 7815.728 </td>
   <td style="text-align:right;"> 21585.73 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46915.91249 </td>
   <td style="text-align:right;"> 983.451014 </td>
   <td style="text-align:right;"> 7670.076 </td>
   <td style="text-align:right;"> 21500.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -49151.73004 </td>
   <td style="text-align:right;"> 1001.113755 </td>
   <td style="text-align:right;"> 8513.663 </td>
   <td style="text-align:right;"> 20975.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -48288.19955 </td>
   <td style="text-align:right;"> 991.891861 </td>
   <td style="text-align:right;"> 7507.004 </td>
   <td style="text-align:right;"> 21783.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -61303.50786 </td>
   <td style="text-align:right;"> 1191.637346 </td>
   <td style="text-align:right;"> 7540.870 </td>
   <td style="text-align:right;"> 21420.73 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35858.61927 </td>
   <td style="text-align:right;"> 811.243271 </td>
   <td style="text-align:right;"> 7813.914 </td>
   <td style="text-align:right;"> 21779.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -47924.28989 </td>
   <td style="text-align:right;"> 989.188970 </td>
   <td style="text-align:right;"> 10274.135 </td>
   <td style="text-align:right;"> 21280.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28702.71301 </td>
   <td style="text-align:right;"> 696.087389 </td>
   <td style="text-align:right;"> 8151.553 </td>
   <td style="text-align:right;"> 21527.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28133.94343 </td>
   <td style="text-align:right;"> 669.705940 </td>
   <td style="text-align:right;"> 13057.428 </td>
   <td style="text-align:right;"> 21553.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27853.86300 </td>
   <td style="text-align:right;"> 680.715331 </td>
   <td style="text-align:right;"> 9852.097 </td>
   <td style="text-align:right;"> 21222.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12907.05342 </td>
   <td style="text-align:right;"> 450.422145 </td>
   <td style="text-align:right;"> 11618.852 </td>
   <td style="text-align:right;"> 21407.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12090.95928 </td>
   <td style="text-align:right;"> 433.311131 </td>
   <td style="text-align:right;"> 12261.672 </td>
   <td style="text-align:right;"> 21068.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7331.42957 </td>
   <td style="text-align:right;"> 365.102301 </td>
   <td style="text-align:right;"> 11485.040 </td>
   <td style="text-align:right;"> 21049.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -3038.61571 </td>
   <td style="text-align:right;"> 289.257157 </td>
   <td style="text-align:right;"> 12439.965 </td>
   <td style="text-align:right;"> 21281.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14839.09538 </td>
   <td style="text-align:right;"> 461.629372 </td>
   <td style="text-align:right;"> 12535.552 </td>
   <td style="text-align:right;"> 20953.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19590.00385 </td>
   <td style="text-align:right;"> 551.610960 </td>
   <td style="text-align:right;"> 11279.303 </td>
   <td style="text-align:right;"> 21111.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26638.43931 </td>
   <td style="text-align:right;"> 660.212881 </td>
   <td style="text-align:right;"> 10344.374 </td>
   <td style="text-align:right;"> 21256.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20418.59399 </td>
   <td style="text-align:right;"> 555.725904 </td>
   <td style="text-align:right;"> 12283.099 </td>
   <td style="text-align:right;"> 21255.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27896.66077 </td>
   <td style="text-align:right;"> 678.307074 </td>
   <td style="text-align:right;"> 9436.498 </td>
   <td style="text-align:right;"> 21145.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24448.99839 </td>
   <td style="text-align:right;"> 626.506401 </td>
   <td style="text-align:right;"> 10495.783 </td>
   <td style="text-align:right;"> 21078.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20927.02071 </td>
   <td style="text-align:right;"> 574.452998 </td>
   <td style="text-align:right;"> 9107.452 </td>
   <td style="text-align:right;"> 22002.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22219.58226 </td>
   <td style="text-align:right;"> 583.096933 </td>
   <td style="text-align:right;"> 12950.708 </td>
   <td style="text-align:right;"> 21079.43 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31187.75861 </td>
   <td style="text-align:right;"> 727.770097 </td>
   <td style="text-align:right;"> 9903.026 </td>
   <td style="text-align:right;"> 21438.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30568.95919 </td>
   <td style="text-align:right;"> 717.339945 </td>
   <td style="text-align:right;"> 9494.912 </td>
   <td style="text-align:right;"> 21498.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22697.27645 </td>
   <td style="text-align:right;"> 594.687936 </td>
   <td style="text-align:right;"> 11516.469 </td>
   <td style="text-align:right;"> 21003.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30683.06861 </td>
   <td style="text-align:right;"> 725.899459 </td>
   <td style="text-align:right;"> 10446.340 </td>
   <td style="text-align:right;"> 21771.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36953.54864 </td>
   <td style="text-align:right;"> 817.349812 </td>
   <td style="text-align:right;"> 9417.050 </td>
   <td style="text-align:right;"> 21002.05 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31711.51866 </td>
   <td style="text-align:right;"> 739.274722 </td>
   <td style="text-align:right;"> 9423.081 </td>
   <td style="text-align:right;"> 21011.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40909.36234 </td>
   <td style="text-align:right;"> 881.574921 </td>
   <td style="text-align:right;"> 9323.442 </td>
   <td style="text-align:right;"> 21433.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30891.69170 </td>
   <td style="text-align:right;"> 721.036823 </td>
   <td style="text-align:right;"> 11997.932 </td>
   <td style="text-align:right;"> 21148.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25241.92588 </td>
   <td style="text-align:right;"> 639.323254 </td>
   <td style="text-align:right;"> 11409.696 </td>
   <td style="text-align:right;"> 21164.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -4846.30390 </td>
   <td style="text-align:right;"> 321.890961 </td>
   <td style="text-align:right;"> 12619.658 </td>
   <td style="text-align:right;"> 20978.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23968.91561 </td>
   <td style="text-align:right;"> 603.776017 </td>
   <td style="text-align:right;"> 11736.552 </td>
   <td style="text-align:right;"> 21256.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12806.82188 </td>
   <td style="text-align:right;"> 441.070548 </td>
   <td style="text-align:right;"> 12788.743 </td>
   <td style="text-align:right;"> 21287.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7146.72853 </td>
   <td style="text-align:right;"> 138.837940 </td>
   <td style="text-align:right;"> 14456.238 </td>
   <td style="text-align:right;"> 21745.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5735.34156 </td>
   <td style="text-align:right;"> 163.721488 </td>
   <td style="text-align:right;"> 14684.125 </td>
   <td style="text-align:right;"> 21481.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -47939.74966 </td>
   <td style="text-align:right;"> 981.133862 </td>
   <td style="text-align:right;"> 9773.238 </td>
   <td style="text-align:right;"> 21311.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7061.96568 </td>
   <td style="text-align:right;"> 363.688872 </td>
   <td style="text-align:right;"> 10841.439 </td>
   <td style="text-align:right;"> 21644.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11680.01990 </td>
   <td style="text-align:right;"> 432.921695 </td>
   <td style="text-align:right;"> 10844.322 </td>
   <td style="text-align:right;"> 21669.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16292.69524 </td>
   <td style="text-align:right;"> 498.685762 </td>
   <td style="text-align:right;"> 11417.423 </td>
   <td style="text-align:right;"> 21442.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25288.94202 </td>
   <td style="text-align:right;"> 636.315093 </td>
   <td style="text-align:right;"> 11225.219 </td>
   <td style="text-align:right;"> 20807.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24601.77712 </td>
   <td style="text-align:right;"> 622.273584 </td>
   <td style="text-align:right;"> 11253.851 </td>
   <td style="text-align:right;"> 21997.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18969.62259 </td>
   <td style="text-align:right;"> 543.184450 </td>
   <td style="text-align:right;"> 10050.546 </td>
   <td style="text-align:right;"> 21154.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25039.90226 </td>
   <td style="text-align:right;"> 618.017902 </td>
   <td style="text-align:right;"> 12169.327 </td>
   <td style="text-align:right;"> 21219.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10554.41247 </td>
   <td style="text-align:right;"> 421.783605 </td>
   <td style="text-align:right;"> 10991.965 </td>
   <td style="text-align:right;"> 21569.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16723.84917 </td>
   <td style="text-align:right;"> 515.707767 </td>
   <td style="text-align:right;"> 11615.601 </td>
   <td style="text-align:right;"> 21268.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6732.03194 </td>
   <td style="text-align:right;"> 338.970849 </td>
   <td style="text-align:right;"> 13029.712 </td>
   <td style="text-align:right;"> 20783.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8046.58661 </td>
   <td style="text-align:right;"> 365.832369 </td>
   <td style="text-align:right;"> 12207.190 </td>
   <td style="text-align:right;"> 21028.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11924.03469 </td>
   <td style="text-align:right;"> 429.447585 </td>
   <td style="text-align:right;"> 12907.961 </td>
   <td style="text-align:right;"> 21815.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4287.63059 </td>
   <td style="text-align:right;"> 190.798742 </td>
   <td style="text-align:right;"> 13265.763 </td>
   <td style="text-align:right;"> 21176.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8338.97174 </td>
   <td style="text-align:right;"> 365.228585 </td>
   <td style="text-align:right;"> 13684.456 </td>
   <td style="text-align:right;"> 21335.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -4510.51810 </td>
   <td style="text-align:right;"> 307.528747 </td>
   <td style="text-align:right;"> 13267.050 </td>
   <td style="text-align:right;"> 21203.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -51812.01144 </td>
   <td style="text-align:right;"> 1058.838092 </td>
   <td style="text-align:right;"> 7264.162 </td>
   <td style="text-align:right;"> 21576.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -52194.67865 </td>
   <td style="text-align:right;"> 1069.018284 </td>
   <td style="text-align:right;"> 6916.159 </td>
   <td style="text-align:right;"> 21584.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -63402.48041 </td>
   <td style="text-align:right;"> 1234.233757 </td>
   <td style="text-align:right;"> 7884.774 </td>
   <td style="text-align:right;"> 21349.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -60304.93967 </td>
   <td style="text-align:right;"> 1186.841288 </td>
   <td style="text-align:right;"> 8580.737 </td>
   <td style="text-align:right;"> 21479.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30428.72835 </td>
   <td style="text-align:right;"> 734.242751 </td>
   <td style="text-align:right;"> 7705.006 </td>
   <td style="text-align:right;"> 22109.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38402.10224 </td>
   <td style="text-align:right;"> 856.106541 </td>
   <td style="text-align:right;"> 7921.222 </td>
   <td style="text-align:right;"> 22142.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43187.25801 </td>
   <td style="text-align:right;"> 930.524713 </td>
   <td style="text-align:right;"> 7724.022 </td>
   <td style="text-align:right;"> 22319.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33692.76053 </td>
   <td style="text-align:right;"> 774.416929 </td>
   <td style="text-align:right;"> 8778.052 </td>
   <td style="text-align:right;"> 22234.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12909.29461 </td>
   <td style="text-align:right;"> 462.202304 </td>
   <td style="text-align:right;"> 8809.302 </td>
   <td style="text-align:right;"> 21942.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17629.30686 </td>
   <td style="text-align:right;"> 533.614408 </td>
   <td style="text-align:right;"> 9254.016 </td>
   <td style="text-align:right;"> 21836.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22845.38777 </td>
   <td style="text-align:right;"> 605.624368 </td>
   <td style="text-align:right;"> 10565.941 </td>
   <td style="text-align:right;"> 21737.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21156.84134 </td>
   <td style="text-align:right;"> 589.688549 </td>
   <td style="text-align:right;"> 9955.517 </td>
   <td style="text-align:right;"> 21331.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31863.50356 </td>
   <td style="text-align:right;"> 741.829367 </td>
   <td style="text-align:right;"> 11765.909 </td>
   <td style="text-align:right;"> 21667.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30969.22669 </td>
   <td style="text-align:right;"> 725.433624 </td>
   <td style="text-align:right;"> 11945.005 </td>
   <td style="text-align:right;"> 21427.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -3591.39598 </td>
   <td style="text-align:right;"> 293.180778 </td>
   <td style="text-align:right;"> 13292.607 </td>
   <td style="text-align:right;"> 21898.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14438.16426 </td>
   <td style="text-align:right;"> 465.875523 </td>
   <td style="text-align:right;"> 11945.773 </td>
   <td style="text-align:right;"> 21809.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21035.08692 </td>
   <td style="text-align:right;"> 564.704400 </td>
   <td style="text-align:right;"> 11724.805 </td>
   <td style="text-align:right;"> 21341.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6644.92020 </td>
   <td style="text-align:right;"> 344.820170 </td>
   <td style="text-align:right;"> 12304.999 </td>
   <td style="text-align:right;"> 21120.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24378.50987 </td>
   <td style="text-align:right;"> 626.067310 </td>
   <td style="text-align:right;"> 11097.076 </td>
   <td style="text-align:right;"> 21733.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30573.21810 </td>
   <td style="text-align:right;"> 723.162290 </td>
   <td style="text-align:right;"> 9268.845 </td>
   <td style="text-align:right;"> 21310.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20499.16800 </td>
   <td style="text-align:right;"> 562.939561 </td>
   <td style="text-align:right;"> 11096.148 </td>
   <td style="text-align:right;"> 21146.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21383.84345 </td>
   <td style="text-align:right;"> 582.024749 </td>
   <td style="text-align:right;"> 11467.910 </td>
   <td style="text-align:right;"> 21080.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26385.01610 </td>
   <td style="text-align:right;"> 660.755869 </td>
   <td style="text-align:right;"> 10913.596 </td>
   <td style="text-align:right;"> 20593.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15848.55544 </td>
   <td style="text-align:right;"> 489.207851 </td>
   <td style="text-align:right;"> 12370.925 </td>
   <td style="text-align:right;"> 20875.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28575.24094 </td>
   <td style="text-align:right;"> 688.491128 </td>
   <td style="text-align:right;"> 9024.344 </td>
   <td style="text-align:right;"> 21519.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17033.31594 </td>
   <td style="text-align:right;"> 511.883447 </td>
   <td style="text-align:right;"> 10381.883 </td>
   <td style="text-align:right;"> 22422.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17459.86841 </td>
   <td style="text-align:right;"> 526.414128 </td>
   <td style="text-align:right;"> 9477.120 </td>
   <td style="text-align:right;"> 20543.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -48134.22394 </td>
   <td style="text-align:right;"> 985.511648 </td>
   <td style="text-align:right;"> 10131.572 </td>
   <td style="text-align:right;"> 21096.73 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46043.25974 </td>
   <td style="text-align:right;"> 956.558480 </td>
   <td style="text-align:right;"> 9500.699 </td>
   <td style="text-align:right;"> 21162.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27748.60766 </td>
   <td style="text-align:right;"> 688.876085 </td>
   <td style="text-align:right;"> 9003.738 </td>
   <td style="text-align:right;"> 21276.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33700.95273 </td>
   <td style="text-align:right;"> 772.136316 </td>
   <td style="text-align:right;"> 9812.496 </td>
   <td style="text-align:right;"> 21459.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18222.93002 </td>
   <td style="text-align:right;"> 521.764116 </td>
   <td style="text-align:right;"> 11545.102 </td>
   <td style="text-align:right;"> 21457.05 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10737.34754 </td>
   <td style="text-align:right;"> 409.772781 </td>
   <td style="text-align:right;"> 12220.512 </td>
   <td style="text-align:right;"> 21626.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7694.23074 </td>
   <td style="text-align:right;"> 378.911665 </td>
   <td style="text-align:right;"> 10191.484 </td>
   <td style="text-align:right;"> 21420.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22992.77248 </td>
   <td style="text-align:right;"> 612.440371 </td>
   <td style="text-align:right;"> 8618.030 </td>
   <td style="text-align:right;"> 21408.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24441.90363 </td>
   <td style="text-align:right;"> 623.841771 </td>
   <td style="text-align:right;"> 10992.872 </td>
   <td style="text-align:right;"> 21287.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29115.61138 </td>
   <td style="text-align:right;"> 701.226410 </td>
   <td style="text-align:right;"> 9906.999 </td>
   <td style="text-align:right;"> 21836.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27322.68875 </td>
   <td style="text-align:right;"> 681.789436 </td>
   <td style="text-align:right;"> 8438.453 </td>
   <td style="text-align:right;"> 21088.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13000.05590 </td>
   <td style="text-align:right;"> 462.377448 </td>
   <td style="text-align:right;"> 9283.611 </td>
   <td style="text-align:right;"> 21723.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18089.43462 </td>
   <td style="text-align:right;"> 532.937427 </td>
   <td style="text-align:right;"> 9415.223 </td>
   <td style="text-align:right;"> 21980.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27324.50589 </td>
   <td style="text-align:right;"> 665.070767 </td>
   <td style="text-align:right;"> 12749.466 </td>
   <td style="text-align:right;"> 21046.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1472.49010 </td>
   <td style="text-align:right;"> 244.246154 </td>
   <td style="text-align:right;"> 11546.367 </td>
   <td style="text-align:right;"> 21447.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27574.26642 </td>
   <td style="text-align:right;"> 654.480798 </td>
   <td style="text-align:right;"> 10895.016 </td>
   <td style="text-align:right;"> 21399.36 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28940.50047 </td>
   <td style="text-align:right;"> 699.933829 </td>
   <td style="text-align:right;"> 9331.634 </td>
   <td style="text-align:right;"> 21359.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26147.42170 </td>
   <td style="text-align:right;"> 654.616717 </td>
   <td style="text-align:right;"> 9475.972 </td>
   <td style="text-align:right;"> 21462.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29943.24607 </td>
   <td style="text-align:right;"> 699.791327 </td>
   <td style="text-align:right;"> 9678.376 </td>
   <td style="text-align:right;"> 21339.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39568.49724 </td>
   <td style="text-align:right;"> 846.540605 </td>
   <td style="text-align:right;"> 9824.880 </td>
   <td style="text-align:right;"> 21091.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41614.74952 </td>
   <td style="text-align:right;"> 893.261365 </td>
   <td style="text-align:right;"> 7767.663 </td>
   <td style="text-align:right;"> 21478.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44875.35363 </td>
   <td style="text-align:right;"> 942.408977 </td>
   <td style="text-align:right;"> 9392.522 </td>
   <td style="text-align:right;"> 20699.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27203.02842 </td>
   <td style="text-align:right;"> 660.697377 </td>
   <td style="text-align:right;"> 9609.035 </td>
   <td style="text-align:right;"> 21227.05 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12753.75684 </td>
   <td style="text-align:right;"> 460.929197 </td>
   <td style="text-align:right;"> 10337.732 </td>
   <td style="text-align:right;"> 21517.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25424.62771 </td>
   <td style="text-align:right;"> 642.799814 </td>
   <td style="text-align:right;"> 11439.722 </td>
   <td style="text-align:right;"> 21369.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31914.96095 </td>
   <td style="text-align:right;"> 736.638929 </td>
   <td style="text-align:right;"> 11456.382 </td>
   <td style="text-align:right;"> 21287.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13266.23708 </td>
   <td style="text-align:right;"> 450.052179 </td>
   <td style="text-align:right;"> 11613.803 </td>
   <td style="text-align:right;"> 21352.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13468.99577 </td>
   <td style="text-align:right;"> 453.576331 </td>
   <td style="text-align:right;"> 12383.049 </td>
   <td style="text-align:right;"> 21317.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6979.18732 </td>
   <td style="text-align:right;"> 133.417051 </td>
   <td style="text-align:right;"> 14594.630 </td>
   <td style="text-align:right;"> 21478.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -2649.18132 </td>
   <td style="text-align:right;"> 292.682922 </td>
   <td style="text-align:right;"> 12952.814 </td>
   <td style="text-align:right;"> 20867.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18745.26103 </td>
   <td style="text-align:right;"> 534.723502 </td>
   <td style="text-align:right;"> 11471.653 </td>
   <td style="text-align:right;"> 21873.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7663.64587 </td>
   <td style="text-align:right;"> 356.476054 </td>
   <td style="text-align:right;"> 12793.310 </td>
   <td style="text-align:right;"> 21524.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41976.74674 </td>
   <td style="text-align:right;"> 892.314469 </td>
   <td style="text-align:right;"> 9518.746 </td>
   <td style="text-align:right;"> 21414.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23927.93067 </td>
   <td style="text-align:right;"> 619.126523 </td>
   <td style="text-align:right;"> 9837.021 </td>
   <td style="text-align:right;"> 21367.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21678.48602 </td>
   <td style="text-align:right;"> 591.358026 </td>
   <td style="text-align:right;"> 11381.861 </td>
   <td style="text-align:right;"> 21749.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5753.52945 </td>
   <td style="text-align:right;"> 362.242549 </td>
   <td style="text-align:right;"> 9396.773 </td>
   <td style="text-align:right;"> 21784.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42141.16146 </td>
   <td style="text-align:right;"> 876.416272 </td>
   <td style="text-align:right;"> 12027.704 </td>
   <td style="text-align:right;"> 21556.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30440.85182 </td>
   <td style="text-align:right;"> 697.483101 </td>
   <td style="text-align:right;"> 12342.214 </td>
   <td style="text-align:right;"> 21800.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29513.15584 </td>
   <td style="text-align:right;"> 712.118508 </td>
   <td style="text-align:right;"> 9007.013 </td>
   <td style="text-align:right;"> 21134.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10262.18009 </td>
   <td style="text-align:right;"> 391.043856 </td>
   <td style="text-align:right;"> 12825.052 </td>
   <td style="text-align:right;"> 21756.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4899.06236 </td>
   <td style="text-align:right;"> 165.452989 </td>
   <td style="text-align:right;"> 13302.048 </td>
   <td style="text-align:right;"> 21383.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23775.92925 </td>
   <td style="text-align:right;"> 610.224534 </td>
   <td style="text-align:right;"> 11834.210 </td>
   <td style="text-align:right;"> 21173.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9622.76597 </td>
   <td style="text-align:right;"> 395.270869 </td>
   <td style="text-align:right;"> 11496.606 </td>
   <td style="text-align:right;"> 21484.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5695.18082 </td>
   <td style="text-align:right;"> 338.592529 </td>
   <td style="text-align:right;"> 10885.248 </td>
   <td style="text-align:right;"> 21305.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15537.47202 </td>
   <td style="text-align:right;"> 493.152741 </td>
   <td style="text-align:right;"> 10254.015 </td>
   <td style="text-align:right;"> 21536.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32424.33076 </td>
   <td style="text-align:right;"> 735.865448 </td>
   <td style="text-align:right;"> 11201.500 </td>
   <td style="text-align:right;"> 21294.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35237.92443 </td>
   <td style="text-align:right;"> 775.709743 </td>
   <td style="text-align:right;"> 11215.051 </td>
   <td style="text-align:right;"> 21313.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -45355.41341 </td>
   <td style="text-align:right;"> 955.141387 </td>
   <td style="text-align:right;"> 6054.067 </td>
   <td style="text-align:right;"> 21528.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5185.87393 </td>
   <td style="text-align:right;"> 182.732630 </td>
   <td style="text-align:right;"> 12956.908 </td>
   <td style="text-align:right;"> 20895.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12483.32999 </td>
   <td style="text-align:right;"> 438.866851 </td>
   <td style="text-align:right;"> 12146.579 </td>
   <td style="text-align:right;"> 21302.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8403.83382 </td>
   <td style="text-align:right;"> 385.215625 </td>
   <td style="text-align:right;"> 10255.468 </td>
   <td style="text-align:right;"> 21438.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30474.33394 </td>
   <td style="text-align:right;"> 720.613866 </td>
   <td style="text-align:right;"> 9564.659 </td>
   <td style="text-align:right;"> 22005.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21962.52991 </td>
   <td style="text-align:right;"> 586.271630 </td>
   <td style="text-align:right;"> 11234.471 </td>
   <td style="text-align:right;"> 20783.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25918.19529 </td>
   <td style="text-align:right;"> 634.501985 </td>
   <td style="text-align:right;"> 9878.389 </td>
   <td style="text-align:right;"> 21928.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27164.20914 </td>
   <td style="text-align:right;"> 658.332064 </td>
   <td style="text-align:right;"> 11279.533 </td>
   <td style="text-align:right;"> 21212.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29822.59371 </td>
   <td style="text-align:right;"> 713.329612 </td>
   <td style="text-align:right;"> 10478.494 </td>
   <td style="text-align:right;"> 21366.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41296.79951 </td>
   <td style="text-align:right;"> 889.504818 </td>
   <td style="text-align:right;"> 8527.803 </td>
   <td style="text-align:right;"> 21329.05 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29804.69775 </td>
   <td style="text-align:right;"> 720.413579 </td>
   <td style="text-align:right;"> 9714.705 </td>
   <td style="text-align:right;"> 21660.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46200.89544 </td>
   <td style="text-align:right;"> 953.280573 </td>
   <td style="text-align:right;"> 8671.428 </td>
   <td style="text-align:right;"> 21212.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 16254.10429 </td>
   <td style="text-align:right;"> -11.889158 </td>
   <td style="text-align:right;"> 15745.181 </td>
   <td style="text-align:right;"> 21915.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27782.90788 </td>
   <td style="text-align:right;"> 676.874799 </td>
   <td style="text-align:right;"> 10705.235 </td>
   <td style="text-align:right;"> 21389.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10234.34401 </td>
   <td style="text-align:right;"> 406.105500 </td>
   <td style="text-align:right;"> 12069.281 </td>
   <td style="text-align:right;"> 21059.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34617.04301 </td>
   <td style="text-align:right;"> 799.204020 </td>
   <td style="text-align:right;"> 9460.173 </td>
   <td style="text-align:right;"> 21306.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9677.69516 </td>
   <td style="text-align:right;"> 396.752942 </td>
   <td style="text-align:right;"> 11684.580 </td>
   <td style="text-align:right;"> 21465.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19379.95087 </td>
   <td style="text-align:right;"> 552.500397 </td>
   <td style="text-align:right;"> 10324.477 </td>
   <td style="text-align:right;"> 21391.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16737.09159 </td>
   <td style="text-align:right;"> 505.390670 </td>
   <td style="text-align:right;"> 11880.251 </td>
   <td style="text-align:right;"> 21258.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19898.36442 </td>
   <td style="text-align:right;"> 550.219300 </td>
   <td style="text-align:right;"> 11490.532 </td>
   <td style="text-align:right;"> 21251.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17770.60141 </td>
   <td style="text-align:right;"> 513.663301 </td>
   <td style="text-align:right;"> 11818.924 </td>
   <td style="text-align:right;"> 21308.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23819.98686 </td>
   <td style="text-align:right;"> 612.759590 </td>
   <td style="text-align:right;"> 11872.170 </td>
   <td style="text-align:right;"> 21535.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19750.52034 </td>
   <td style="text-align:right;"> 565.850850 </td>
   <td style="text-align:right;"> 11245.056 </td>
   <td style="text-align:right;"> 21451.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20780.03830 </td>
   <td style="text-align:right;"> 579.344841 </td>
   <td style="text-align:right;"> 11838.723 </td>
   <td style="text-align:right;"> 21246.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10963.35276 </td>
   <td style="text-align:right;"> 421.770557 </td>
   <td style="text-align:right;"> 12036.584 </td>
   <td style="text-align:right;"> 21864.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29169.72458 </td>
   <td style="text-align:right;"> 691.963125 </td>
   <td style="text-align:right;"> 9595.883 </td>
   <td style="text-align:right;"> 20980.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14717.92983 </td>
   <td style="text-align:right;"> 476.995728 </td>
   <td style="text-align:right;"> 11781.715 </td>
   <td style="text-align:right;"> 21349.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41006.18265 </td>
   <td style="text-align:right;"> 879.083612 </td>
   <td style="text-align:right;"> 9810.162 </td>
   <td style="text-align:right;"> 21316.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17405.82928 </td>
   <td style="text-align:right;"> 516.506211 </td>
   <td style="text-align:right;"> 10433.339 </td>
   <td style="text-align:right;"> 21223.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42279.49629 </td>
   <td style="text-align:right;"> 890.135522 </td>
   <td style="text-align:right;"> 10664.446 </td>
   <td style="text-align:right;"> 21355.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23408.54992 </td>
   <td style="text-align:right;"> 612.267445 </td>
   <td style="text-align:right;"> 9357.359 </td>
   <td style="text-align:right;"> 20891.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32510.27256 </td>
   <td style="text-align:right;"> 751.526884 </td>
   <td style="text-align:right;"> 10749.949 </td>
   <td style="text-align:right;"> 21468.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36055.28289 </td>
   <td style="text-align:right;"> 810.448023 </td>
   <td style="text-align:right;"> 8102.432 </td>
   <td style="text-align:right;"> 21832.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46499.25506 </td>
   <td style="text-align:right;"> 966.954730 </td>
   <td style="text-align:right;"> 9152.362 </td>
   <td style="text-align:right;"> 21480.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -48800.73115 </td>
   <td style="text-align:right;"> 1000.083225 </td>
   <td style="text-align:right;"> 9356.426 </td>
   <td style="text-align:right;"> 21454.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32483.05959 </td>
   <td style="text-align:right;"> 756.695985 </td>
   <td style="text-align:right;"> 7978.617 </td>
   <td style="text-align:right;"> 21720.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -48509.13422 </td>
   <td style="text-align:right;"> 993.221193 </td>
   <td style="text-align:right;"> 8764.299 </td>
   <td style="text-align:right;"> 21291.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23386.17885 </td>
   <td style="text-align:right;"> 602.148724 </td>
   <td style="text-align:right;"> 10716.477 </td>
   <td style="text-align:right;"> 21085.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43159.94260 </td>
   <td style="text-align:right;"> 911.178949 </td>
   <td style="text-align:right;"> 8809.404 </td>
   <td style="text-align:right;"> 21094.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9028.40049 </td>
   <td style="text-align:right;"> 385.762931 </td>
   <td style="text-align:right;"> 13097.823 </td>
   <td style="text-align:right;"> 21669.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39539.83807 </td>
   <td style="text-align:right;"> 860.707526 </td>
   <td style="text-align:right;"> 9493.748 </td>
   <td style="text-align:right;"> 21027.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26888.75785 </td>
   <td style="text-align:right;"> 667.846946 </td>
   <td style="text-align:right;"> 9425.012 </td>
   <td style="text-align:right;"> 21886.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -48190.82461 </td>
   <td style="text-align:right;"> 991.517502 </td>
   <td style="text-align:right;"> 9044.954 </td>
   <td style="text-align:right;"> 21594.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37331.54474 </td>
   <td style="text-align:right;"> 832.092342 </td>
   <td style="text-align:right;"> 8806.596 </td>
   <td style="text-align:right;"> 21527.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14187.47745 </td>
   <td style="text-align:right;"> 477.506474 </td>
   <td style="text-align:right;"> 11040.168 </td>
   <td style="text-align:right;"> 21805.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24125.09025 </td>
   <td style="text-align:right;"> 614.550184 </td>
   <td style="text-align:right;"> 9568.688 </td>
   <td style="text-align:right;"> 21183.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36335.91277 </td>
   <td style="text-align:right;"> 801.761706 </td>
   <td style="text-align:right;"> 8464.266 </td>
   <td style="text-align:right;"> 21468.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17892.66481 </td>
   <td style="text-align:right;"> 541.239757 </td>
   <td style="text-align:right;"> 10714.434 </td>
   <td style="text-align:right;"> 21314.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26396.87416 </td>
   <td style="text-align:right;"> 660.402254 </td>
   <td style="text-align:right;"> 8851.739 </td>
   <td style="text-align:right;"> 21380.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18505.26958 </td>
   <td style="text-align:right;"> 534.337893 </td>
   <td style="text-align:right;"> 9815.944 </td>
   <td style="text-align:right;"> 21483.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33863.67774 </td>
   <td style="text-align:right;"> 773.571909 </td>
   <td style="text-align:right;"> 10068.176 </td>
   <td style="text-align:right;"> 21432.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41522.54552 </td>
   <td style="text-align:right;"> 896.257626 </td>
   <td style="text-align:right;"> 8913.415 </td>
   <td style="text-align:right;"> 21492.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42220.17582 </td>
   <td style="text-align:right;"> 917.644040 </td>
   <td style="text-align:right;"> 8161.266 </td>
   <td style="text-align:right;"> 21500.84 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42220.17582 </td>
   <td style="text-align:right;"> 917.644040 </td>
   <td style="text-align:right;"> 8161.266 </td>
   <td style="text-align:right;"> 21500.84 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43403.90962 </td>
   <td style="text-align:right;"> 935.667927 </td>
   <td style="text-align:right;"> 8950.901 </td>
   <td style="text-align:right;"> 21327.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43504.43913 </td>
   <td style="text-align:right;"> 938.187898 </td>
   <td style="text-align:right;"> 9059.897 </td>
   <td style="text-align:right;"> 21428.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10508.94094 </td>
   <td style="text-align:right;"> 403.115802 </td>
   <td style="text-align:right;"> 13123.930 </td>
   <td style="text-align:right;"> 21285.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17241.76160 </td>
   <td style="text-align:right;"> 503.389002 </td>
   <td style="text-align:right;"> 12112.701 </td>
   <td style="text-align:right;"> 21764.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5625.97014 </td>
   <td style="text-align:right;"> 324.813550 </td>
   <td style="text-align:right;"> 12928.243 </td>
   <td style="text-align:right;"> 21264.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21065.21992 </td>
   <td style="text-align:right;"> 571.624597 </td>
   <td style="text-align:right;"> 12018.494 </td>
   <td style="text-align:right;"> 21677.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14058.80937 </td>
   <td style="text-align:right;"> 485.799294 </td>
   <td style="text-align:right;"> 10461.890 </td>
   <td style="text-align:right;"> 21146.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44891.19276 </td>
   <td style="text-align:right;"> 959.413489 </td>
   <td style="text-align:right;"> 7828.187 </td>
   <td style="text-align:right;"> 21356.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43562.02092 </td>
   <td style="text-align:right;"> 929.411379 </td>
   <td style="text-align:right;"> 7845.774 </td>
   <td style="text-align:right;"> 21849.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43600.08668 </td>
   <td style="text-align:right;"> 926.881383 </td>
   <td style="text-align:right;"> 8183.837 </td>
   <td style="text-align:right;"> 21844.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37698.91932 </td>
   <td style="text-align:right;"> 822.493662 </td>
   <td style="text-align:right;"> 9853.006 </td>
   <td style="text-align:right;"> 21288.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36299.66337 </td>
   <td style="text-align:right;"> 794.310882 </td>
   <td style="text-align:right;"> 10889.853 </td>
   <td style="text-align:right;"> 21214.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29745.84989 </td>
   <td style="text-align:right;"> 696.410658 </td>
   <td style="text-align:right;"> 11772.974 </td>
   <td style="text-align:right;"> 21643.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9487.88391 </td>
   <td style="text-align:right;"> 416.150764 </td>
   <td style="text-align:right;"> 10776.399 </td>
   <td style="text-align:right;"> 21356.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22955.67989 </td>
   <td style="text-align:right;"> 596.027195 </td>
   <td style="text-align:right;"> 10116.494 </td>
   <td style="text-align:right;"> 21604.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20299.35305 </td>
   <td style="text-align:right;"> 554.500668 </td>
   <td style="text-align:right;"> 10229.269 </td>
   <td style="text-align:right;"> 21721.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26844.25992 </td>
   <td style="text-align:right;"> 651.072850 </td>
   <td style="text-align:right;"> 10986.852 </td>
   <td style="text-align:right;"> 22277.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15950.58513 </td>
   <td style="text-align:right;"> 485.662995 </td>
   <td style="text-align:right;"> 11984.847 </td>
   <td style="text-align:right;"> 21587.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16701.75267 </td>
   <td style="text-align:right;"> 509.639244 </td>
   <td style="text-align:right;"> 10621.634 </td>
   <td style="text-align:right;"> 21629.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12685.28971 </td>
   <td style="text-align:right;"> 451.813108 </td>
   <td style="text-align:right;"> 10489.711 </td>
   <td style="text-align:right;"> 22135.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24209.39449 </td>
   <td style="text-align:right;"> 622.622570 </td>
   <td style="text-align:right;"> 11143.217 </td>
   <td style="text-align:right;"> 22095.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15772.10893 </td>
   <td style="text-align:right;"> 497.078533 </td>
   <td style="text-align:right;"> 11227.376 </td>
   <td style="text-align:right;"> 22040.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18129.16954 </td>
   <td style="text-align:right;"> 532.369413 </td>
   <td style="text-align:right;"> 10184.045 </td>
   <td style="text-align:right;"> 22005.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14032.07371 </td>
   <td style="text-align:right;"> 459.182481 </td>
   <td style="text-align:right;"> 13071.013 </td>
   <td style="text-align:right;"> 21555.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17489.48414 </td>
   <td style="text-align:right;"> 515.166064 </td>
   <td style="text-align:right;"> 10966.656 </td>
   <td style="text-align:right;"> 21634.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28575.56821 </td>
   <td style="text-align:right;"> 678.806932 </td>
   <td style="text-align:right;"> 11506.686 </td>
   <td style="text-align:right;"> 21423.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24903.62279 </td>
   <td style="text-align:right;"> 647.829956 </td>
   <td style="text-align:right;"> 9874.709 </td>
   <td style="text-align:right;"> 21935.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28440.40805 </td>
   <td style="text-align:right;"> 700.628891 </td>
   <td style="text-align:right;"> 10054.772 </td>
   <td style="text-align:right;"> 21458.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22067.45236 </td>
   <td style="text-align:right;"> 594.661219 </td>
   <td style="text-align:right;"> 10576.830 </td>
   <td style="text-align:right;"> 21904.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30969.91698 </td>
   <td style="text-align:right;"> 724.293530 </td>
   <td style="text-align:right;"> 10944.809 </td>
   <td style="text-align:right;"> 21336.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39902.64024 </td>
   <td style="text-align:right;"> 860.700462 </td>
   <td style="text-align:right;"> 9811.001 </td>
   <td style="text-align:right;"> 21757.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5619.60674 </td>
   <td style="text-align:right;"> 329.886355 </td>
   <td style="text-align:right;"> 13570.030 </td>
   <td style="text-align:right;"> 21193.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -3155.42829 </td>
   <td style="text-align:right;"> 295.247237 </td>
   <td style="text-align:right;"> 13372.899 </td>
   <td style="text-align:right;"> 21510.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26093.69368 </td>
   <td style="text-align:right;"> 646.499056 </td>
   <td style="text-align:right;"> 10472.750 </td>
   <td style="text-align:right;"> 20770.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38552.33827 </td>
   <td style="text-align:right;"> 840.587102 </td>
   <td style="text-align:right;"> 9664.138 </td>
   <td style="text-align:right;"> 20530.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14263.33834 </td>
   <td style="text-align:right;"> 458.688501 </td>
   <td style="text-align:right;"> 11687.179 </td>
   <td style="text-align:right;"> 21581.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29425.82529 </td>
   <td style="text-align:right;"> 705.269749 </td>
   <td style="text-align:right;"> 11343.118 </td>
   <td style="text-align:right;"> 20767.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28891.45340 </td>
   <td style="text-align:right;"> 703.026726 </td>
   <td style="text-align:right;"> 9191.276 </td>
   <td style="text-align:right;"> 21469.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23497.80205 </td>
   <td style="text-align:right;"> 585.464720 </td>
   <td style="text-align:right;"> 13098.243 </td>
   <td style="text-align:right;"> 21819.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15721.99199 </td>
   <td style="text-align:right;"> 472.136535 </td>
   <td style="text-align:right;"> 12347.372 </td>
   <td style="text-align:right;"> 21834.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -4663.61611 </td>
   <td style="text-align:right;"> 342.756672 </td>
   <td style="text-align:right;"> 12591.567 </td>
   <td style="text-align:right;"> 21927.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27314.11855 </td>
   <td style="text-align:right;"> 661.133911 </td>
   <td style="text-align:right;"> 11580.843 </td>
   <td style="text-align:right;"> 22007.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26675.29595 </td>
   <td style="text-align:right;"> 657.010099 </td>
   <td style="text-align:right;"> 9865.626 </td>
   <td style="text-align:right;"> 21201.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37789.34979 </td>
   <td style="text-align:right;"> 830.782820 </td>
   <td style="text-align:right;"> 9625.418 </td>
   <td style="text-align:right;"> 20936.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -49680.58117 </td>
   <td style="text-align:right;"> 1033.380543 </td>
   <td style="text-align:right;"> 7395.040 </td>
   <td style="text-align:right;"> 21181.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37837.04999 </td>
   <td style="text-align:right;"> 815.811026 </td>
   <td style="text-align:right;"> 8530.946 </td>
   <td style="text-align:right;"> 21304.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39042.73923 </td>
   <td style="text-align:right;"> 829.263602 </td>
   <td style="text-align:right;"> 9104.308 </td>
   <td style="text-align:right;"> 21504.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40686.48889 </td>
   <td style="text-align:right;"> 874.396343 </td>
   <td style="text-align:right;"> 9042.929 </td>
   <td style="text-align:right;"> 21594.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7806.43309 </td>
   <td style="text-align:right;"> 371.385283 </td>
   <td style="text-align:right;"> 11353.355 </td>
   <td style="text-align:right;"> 21258.94 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17894.78542 </td>
   <td style="text-align:right;"> 505.998113 </td>
   <td style="text-align:right;"> 12822.751 </td>
   <td style="text-align:right;"> 21962.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6572.93479 </td>
   <td style="text-align:right;"> 346.779431 </td>
   <td style="text-align:right;"> 11618.632 </td>
   <td style="text-align:right;"> 21456.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15569.13823 </td>
   <td style="text-align:right;"> 489.204531 </td>
   <td style="text-align:right;"> 13576.169 </td>
   <td style="text-align:right;"> 21708.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8360.65877 </td>
   <td style="text-align:right;"> 384.054458 </td>
   <td style="text-align:right;"> 12595.264 </td>
   <td style="text-align:right;"> 21729.24 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18723.72920 </td>
   <td style="text-align:right;"> 530.218637 </td>
   <td style="text-align:right;"> 11946.317 </td>
   <td style="text-align:right;"> 21146.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39400.98290 </td>
   <td style="text-align:right;"> 851.000260 </td>
   <td style="text-align:right;"> 10078.626 </td>
   <td style="text-align:right;"> 20891.05 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21445.27138 </td>
   <td style="text-align:right;"> 587.759449 </td>
   <td style="text-align:right;"> 9998.891 </td>
   <td style="text-align:right;"> 20737.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22180.45640 </td>
   <td style="text-align:right;"> 579.100033 </td>
   <td style="text-align:right;"> 11318.181 </td>
   <td style="text-align:right;"> 21638.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26871.88346 </td>
   <td style="text-align:right;"> 680.869285 </td>
   <td style="text-align:right;"> 9265.343 </td>
   <td style="text-align:right;"> 22102.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40296.05544 </td>
   <td style="text-align:right;"> 856.518193 </td>
   <td style="text-align:right;"> 9824.390 </td>
   <td style="text-align:right;"> 20981.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6364.02597 </td>
   <td style="text-align:right;"> 343.294721 </td>
   <td style="text-align:right;"> 11184.659 </td>
   <td style="text-align:right;"> 21845.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18534.02229 </td>
   <td style="text-align:right;"> 521.332515 </td>
   <td style="text-align:right;"> 11233.803 </td>
   <td style="text-align:right;"> 21458.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18590.53731 </td>
   <td style="text-align:right;"> 515.278455 </td>
   <td style="text-align:right;"> 12585.630 </td>
   <td style="text-align:right;"> 21602.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25022.41056 </td>
   <td style="text-align:right;"> 637.502188 </td>
   <td style="text-align:right;"> 9723.851 </td>
   <td style="text-align:right;"> 21646.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23150.14618 </td>
   <td style="text-align:right;"> 594.475342 </td>
   <td style="text-align:right;"> 12695.384 </td>
   <td style="text-align:right;"> 21692.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25553.89599 </td>
   <td style="text-align:right;"> 628.396955 </td>
   <td style="text-align:right;"> 11681.129 </td>
   <td style="text-align:right;"> 21210.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39951.99778 </td>
   <td style="text-align:right;"> 868.014816 </td>
   <td style="text-align:right;"> 10001.763 </td>
   <td style="text-align:right;"> 21541.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13634.81198 </td>
   <td style="text-align:right;"> 452.746113 </td>
   <td style="text-align:right;"> 11071.653 </td>
   <td style="text-align:right;"> 21787.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27809.06305 </td>
   <td style="text-align:right;"> 689.125978 </td>
   <td style="text-align:right;"> 10091.815 </td>
   <td style="text-align:right;"> 21363.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33340.65256 </td>
   <td style="text-align:right;"> 767.464460 </td>
   <td style="text-align:right;"> 9200.650 </td>
   <td style="text-align:right;"> 21287.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29982.41576 </td>
   <td style="text-align:right;"> 706.136236 </td>
   <td style="text-align:right;"> 10595.444 </td>
   <td style="text-align:right;"> 21667.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28079.55184 </td>
   <td style="text-align:right;"> 677.870156 </td>
   <td style="text-align:right;"> 10231.455 </td>
   <td style="text-align:right;"> 20938.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21032.77398 </td>
   <td style="text-align:right;"> 571.307830 </td>
   <td style="text-align:right;"> 11733.314 </td>
   <td style="text-align:right;"> 21175.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30119.47817 </td>
   <td style="text-align:right;"> 708.786657 </td>
   <td style="text-align:right;"> 10623.125 </td>
   <td style="text-align:right;"> 21413.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26213.35070 </td>
   <td style="text-align:right;"> 637.587470 </td>
   <td style="text-align:right;"> 11294.179 </td>
   <td style="text-align:right;"> 21708.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35005.03627 </td>
   <td style="text-align:right;"> 797.786836 </td>
   <td style="text-align:right;"> 10778.083 </td>
   <td style="text-align:right;"> 20877.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12766.99094 </td>
   <td style="text-align:right;"> 473.472780 </td>
   <td style="text-align:right;"> 9535.374 </td>
   <td style="text-align:right;"> 21026.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33952.98790 </td>
   <td style="text-align:right;"> 761.077000 </td>
   <td style="text-align:right;"> 10399.353 </td>
   <td style="text-align:right;"> 21989.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41910.42690 </td>
   <td style="text-align:right;"> 914.464357 </td>
   <td style="text-align:right;"> 8265.849 </td>
   <td style="text-align:right;"> 21287.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -49853.91078 </td>
   <td style="text-align:right;"> 1008.950059 </td>
   <td style="text-align:right;"> 9141.271 </td>
   <td style="text-align:right;"> 21521.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23462.89764 </td>
   <td style="text-align:right;"> 627.517277 </td>
   <td style="text-align:right;"> 9372.320 </td>
   <td style="text-align:right;"> 21324.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26107.93586 </td>
   <td style="text-align:right;"> 645.547953 </td>
   <td style="text-align:right;"> 11014.420 </td>
   <td style="text-align:right;"> 21238.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30194.65311 </td>
   <td style="text-align:right;"> 712.691199 </td>
   <td style="text-align:right;"> 10869.002 </td>
   <td style="text-align:right;"> 21455.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23278.92196 </td>
   <td style="text-align:right;"> 600.490197 </td>
   <td style="text-align:right;"> 11591.255 </td>
   <td style="text-align:right;"> 21103.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38842.42474 </td>
   <td style="text-align:right;"> 862.360290 </td>
   <td style="text-align:right;"> 7941.430 </td>
   <td style="text-align:right;"> 21477.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12952.39304 </td>
   <td style="text-align:right;"> 424.042668 </td>
   <td style="text-align:right;"> 13367.931 </td>
   <td style="text-align:right;"> 21828.73 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9972.42710 </td>
   <td style="text-align:right;"> 401.034188 </td>
   <td style="text-align:right;"> 12047.494 </td>
   <td style="text-align:right;"> 21593.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37477.68196 </td>
   <td style="text-align:right;"> 831.075236 </td>
   <td style="text-align:right;"> 8725.335 </td>
   <td style="text-align:right;"> 20707.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15974.16203 </td>
   <td style="text-align:right;"> 496.073305 </td>
   <td style="text-align:right;"> 11030.488 </td>
   <td style="text-align:right;"> 22130.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23879.14784 </td>
   <td style="text-align:right;"> 604.365260 </td>
   <td style="text-align:right;"> 12335.104 </td>
   <td style="text-align:right;"> 22218.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24538.51151 </td>
   <td style="text-align:right;"> 621.017075 </td>
   <td style="text-align:right;"> 11868.124 </td>
   <td style="text-align:right;"> 22251.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17701.49817 </td>
   <td style="text-align:right;"> 522.006829 </td>
   <td style="text-align:right;"> 11306.558 </td>
   <td style="text-align:right;"> 21043.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39204.40695 </td>
   <td style="text-align:right;"> 847.874091 </td>
   <td style="text-align:right;"> 9428.941 </td>
   <td style="text-align:right;"> 20867.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20699.98522 </td>
   <td style="text-align:right;"> 569.280625 </td>
   <td style="text-align:right;"> 10685.282 </td>
   <td style="text-align:right;"> 22144.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40006.02398 </td>
   <td style="text-align:right;"> 858.365743 </td>
   <td style="text-align:right;"> 10703.163 </td>
   <td style="text-align:right;"> 21760.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22596.10555 </td>
   <td style="text-align:right;"> 601.838902 </td>
   <td style="text-align:right;"> 9569.626 </td>
   <td style="text-align:right;"> 21569.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11685.26586 </td>
   <td style="text-align:right;"> 424.735114 </td>
   <td style="text-align:right;"> 13184.333 </td>
   <td style="text-align:right;"> 21253.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8547.36191 </td>
   <td style="text-align:right;"> 386.427683 </td>
   <td style="text-align:right;"> 11965.024 </td>
   <td style="text-align:right;"> 21255.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13513.94707 </td>
   <td style="text-align:right;"> 453.985802 </td>
   <td style="text-align:right;"> 13105.266 </td>
   <td style="text-align:right;"> 21249.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18685.79791 </td>
   <td style="text-align:right;"> 525.957775 </td>
   <td style="text-align:right;"> 14129.930 </td>
   <td style="text-align:right;"> 21345.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -2646.51136 </td>
   <td style="text-align:right;"> 285.694130 </td>
   <td style="text-align:right;"> 12790.820 </td>
   <td style="text-align:right;"> 21077.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22064.54218 </td>
   <td style="text-align:right;"> 585.741668 </td>
   <td style="text-align:right;"> 11362.896 </td>
   <td style="text-align:right;"> 21056.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26446.29142 </td>
   <td style="text-align:right;"> 658.546460 </td>
   <td style="text-align:right;"> 10584.512 </td>
   <td style="text-align:right;"> 21461.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19945.27045 </td>
   <td style="text-align:right;"> 553.409100 </td>
   <td style="text-align:right;"> 10950.161 </td>
   <td style="text-align:right;"> 21357.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18818.83469 </td>
   <td style="text-align:right;"> 530.522518 </td>
   <td style="text-align:right;"> 11671.246 </td>
   <td style="text-align:right;"> 21217.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29189.75918 </td>
   <td style="text-align:right;"> 708.037690 </td>
   <td style="text-align:right;"> 9252.953 </td>
   <td style="text-align:right;"> 21727.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20165.86709 </td>
   <td style="text-align:right;"> 546.368101 </td>
   <td style="text-align:right;"> 12386.001 </td>
   <td style="text-align:right;"> 21214.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42822.43476 </td>
   <td style="text-align:right;"> 914.788946 </td>
   <td style="text-align:right;"> 8930.593 </td>
   <td style="text-align:right;"> 21468.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29639.51579 </td>
   <td style="text-align:right;"> 713.384907 </td>
   <td style="text-align:right;"> 9668.612 </td>
   <td style="text-align:right;"> 20737.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23147.53483 </td>
   <td style="text-align:right;"> 595.829806 </td>
   <td style="text-align:right;"> 11349.292 </td>
   <td style="text-align:right;"> 21747.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31701.53406 </td>
   <td style="text-align:right;"> 737.888529 </td>
   <td style="text-align:right;"> 9053.461 </td>
   <td style="text-align:right;"> 21284.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13354.25393 </td>
   <td style="text-align:right;"> 452.288311 </td>
   <td style="text-align:right;"> 11776.437 </td>
   <td style="text-align:right;"> 21798.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11895.11510 </td>
   <td style="text-align:right;"> 414.469095 </td>
   <td style="text-align:right;"> 13670.283 </td>
   <td style="text-align:right;"> 21358.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6366.47943 </td>
   <td style="text-align:right;"> 149.447735 </td>
   <td style="text-align:right;"> 12728.804 </td>
   <td style="text-align:right;"> 21788.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35852.79864 </td>
   <td style="text-align:right;"> 809.274775 </td>
   <td style="text-align:right;"> 10356.974 </td>
   <td style="text-align:right;"> 20708.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31464.32592 </td>
   <td style="text-align:right;"> 725.120159 </td>
   <td style="text-align:right;"> 10417.173 </td>
   <td style="text-align:right;"> 21784.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26707.69495 </td>
   <td style="text-align:right;"> 651.518507 </td>
   <td style="text-align:right;"> 9436.061 </td>
   <td style="text-align:right;"> 21747.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7985.09856 </td>
   <td style="text-align:right;"> 388.027017 </td>
   <td style="text-align:right;"> 10945.003 </td>
   <td style="text-align:right;"> 21204.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12365.98103 </td>
   <td style="text-align:right;"> 448.858624 </td>
   <td style="text-align:right;"> 11548.627 </td>
   <td style="text-align:right;"> 21161.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25404.23607 </td>
   <td style="text-align:right;"> 644.469106 </td>
   <td style="text-align:right;"> 11713.065 </td>
   <td style="text-align:right;"> 21175.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20422.53458 </td>
   <td style="text-align:right;"> 568.334273 </td>
   <td style="text-align:right;"> 9970.595 </td>
   <td style="text-align:right;"> 21706.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20836.09962 </td>
   <td style="text-align:right;"> 573.476658 </td>
   <td style="text-align:right;"> 10658.393 </td>
   <td style="text-align:right;"> 21753.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27569.07599 </td>
   <td style="text-align:right;"> 670.307451 </td>
   <td style="text-align:right;"> 11027.158 </td>
   <td style="text-align:right;"> 21059.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19837.19825 </td>
   <td style="text-align:right;"> 543.780298 </td>
   <td style="text-align:right;"> 11021.569 </td>
   <td style="text-align:right;"> 21621.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23573.69848 </td>
   <td style="text-align:right;"> 605.994303 </td>
   <td style="text-align:right;"> 10715.459 </td>
   <td style="text-align:right;"> 22039.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37855.41853 </td>
   <td style="text-align:right;"> 826.355233 </td>
   <td style="text-align:right;"> 9654.652 </td>
   <td style="text-align:right;"> 21069.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23077.66215 </td>
   <td style="text-align:right;"> 587.793604 </td>
   <td style="text-align:right;"> 10708.410 </td>
   <td style="text-align:right;"> 20744.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19033.86312 </td>
   <td style="text-align:right;"> 515.855994 </td>
   <td style="text-align:right;"> 12956.865 </td>
   <td style="text-align:right;"> 21054.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10104.30336 </td>
   <td style="text-align:right;"> 393.110923 </td>
   <td style="text-align:right;"> 11548.983 </td>
   <td style="text-align:right;"> 21315.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -53632.49080 </td>
   <td style="text-align:right;"> 1093.698164 </td>
   <td style="text-align:right;"> 7122.837 </td>
   <td style="text-align:right;"> 22208.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14947.55040 </td>
   <td style="text-align:right;"> 474.812944 </td>
   <td style="text-align:right;"> 11031.529 </td>
   <td style="text-align:right;"> 20675.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21121.77860 </td>
   <td style="text-align:right;"> 572.756908 </td>
   <td style="text-align:right;"> 10660.462 </td>
   <td style="text-align:right;"> 20871.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13623.91410 </td>
   <td style="text-align:right;"> 451.128971 </td>
   <td style="text-align:right;"> 12782.144 </td>
   <td style="text-align:right;"> 21578.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23827.62353 </td>
   <td style="text-align:right;"> 607.966783 </td>
   <td style="text-align:right;"> 10640.969 </td>
   <td style="text-align:right;"> 21156.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30730.16518 </td>
   <td style="text-align:right;"> 724.851448 </td>
   <td style="text-align:right;"> 10147.827 </td>
   <td style="text-align:right;"> 21425.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39653.22994 </td>
   <td style="text-align:right;"> 856.191510 </td>
   <td style="text-align:right;"> 10167.476 </td>
   <td style="text-align:right;"> 21366.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16149.37662 </td>
   <td style="text-align:right;"> 483.642624 </td>
   <td style="text-align:right;"> 11362.830 </td>
   <td style="text-align:right;"> 21648.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13023.21207 </td>
   <td style="text-align:right;"> 454.460253 </td>
   <td style="text-align:right;"> 13040.181 </td>
   <td style="text-align:right;"> 20854.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26560.83963 </td>
   <td style="text-align:right;"> 658.099586 </td>
   <td style="text-align:right;"> 9723.906 </td>
   <td style="text-align:right;"> 21213.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41970.19126 </td>
   <td style="text-align:right;"> 898.514287 </td>
   <td style="text-align:right;"> 9163.370 </td>
   <td style="text-align:right;"> 21361.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34972.03246 </td>
   <td style="text-align:right;"> 782.191280 </td>
   <td style="text-align:right;"> 10687.315 </td>
   <td style="text-align:right;"> 21614.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23219.13027 </td>
   <td style="text-align:right;"> 592.279056 </td>
   <td style="text-align:right;"> 11500.908 </td>
   <td style="text-align:right;"> 21280.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29083.71597 </td>
   <td style="text-align:right;"> 694.966212 </td>
   <td style="text-align:right;"> 11303.661 </td>
   <td style="text-align:right;"> 21302.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19490.92114 </td>
   <td style="text-align:right;"> 550.774392 </td>
   <td style="text-align:right;"> 11195.328 </td>
   <td style="text-align:right;"> 21078.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13636.75004 </td>
   <td style="text-align:right;"> 460.944181 </td>
   <td style="text-align:right;"> 12429.561 </td>
   <td style="text-align:right;"> 21628.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33231.59698 </td>
   <td style="text-align:right;"> 746.858394 </td>
   <td style="text-align:right;"> 11578.317 </td>
   <td style="text-align:right;"> 21077.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9562.99614 </td>
   <td style="text-align:right;"> 389.636612 </td>
   <td style="text-align:right;"> 10744.969 </td>
   <td style="text-align:right;"> 21236.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6926.45720 </td>
   <td style="text-align:right;"> 351.533528 </td>
   <td style="text-align:right;"> 11152.408 </td>
   <td style="text-align:right;"> 20903.94 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27594.02728 </td>
   <td style="text-align:right;"> 673.446529 </td>
   <td style="text-align:right;"> 10822.496 </td>
   <td style="text-align:right;"> 21234.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12051.66192 </td>
   <td style="text-align:right;"> 425.650796 </td>
   <td style="text-align:right;"> 11940.644 </td>
   <td style="text-align:right;"> 21033.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16324.79206 </td>
   <td style="text-align:right;"> 487.977681 </td>
   <td style="text-align:right;"> 11794.163 </td>
   <td style="text-align:right;"> 20855.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20415.12323 </td>
   <td style="text-align:right;"> 569.438210 </td>
   <td style="text-align:right;"> 11105.741 </td>
   <td style="text-align:right;"> 21719.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41463.36023 </td>
   <td style="text-align:right;"> 893.155283 </td>
   <td style="text-align:right;"> 9091.868 </td>
   <td style="text-align:right;"> 21355.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30476.96455 </td>
   <td style="text-align:right;"> 730.113189 </td>
   <td style="text-align:right;"> 8959.950 </td>
   <td style="text-align:right;"> 20923.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31330.05486 </td>
   <td style="text-align:right;"> 721.343978 </td>
   <td style="text-align:right;"> 11997.088 </td>
   <td style="text-align:right;"> 21699.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29482.82084 </td>
   <td style="text-align:right;"> 697.416022 </td>
   <td style="text-align:right;"> 8688.007 </td>
   <td style="text-align:right;"> 21553.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35484.12782 </td>
   <td style="text-align:right;"> 788.456289 </td>
   <td style="text-align:right;"> 11131.341 </td>
   <td style="text-align:right;"> 21734.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25640.91010 </td>
   <td style="text-align:right;"> 633.349770 </td>
   <td style="text-align:right;"> 11637.783 </td>
   <td style="text-align:right;"> 21348.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31459.72037 </td>
   <td style="text-align:right;"> 723.748282 </td>
   <td style="text-align:right;"> 11077.228 </td>
   <td style="text-align:right;"> 21222.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43476.91167 </td>
   <td style="text-align:right;"> 899.530701 </td>
   <td style="text-align:right;"> 11843.428 </td>
   <td style="text-align:right;"> 21392.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39522.75586 </td>
   <td style="text-align:right;"> 841.558091 </td>
   <td style="text-align:right;"> 10649.755 </td>
   <td style="text-align:right;"> 21458.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17256.44822 </td>
   <td style="text-align:right;"> 516.445019 </td>
   <td style="text-align:right;"> 11971.371 </td>
   <td style="text-align:right;"> 21385.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29723.97572 </td>
   <td style="text-align:right;"> 706.351126 </td>
   <td style="text-align:right;"> 8880.822 </td>
   <td style="text-align:right;"> 20983.94 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21954.57717 </td>
   <td style="text-align:right;"> 583.891298 </td>
   <td style="text-align:right;"> 10312.899 </td>
   <td style="text-align:right;"> 20671.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30012.79255 </td>
   <td style="text-align:right;"> 695.975890 </td>
   <td style="text-align:right;"> 10696.266 </td>
   <td style="text-align:right;"> 21398.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30823.73020 </td>
   <td style="text-align:right;"> 720.464278 </td>
   <td style="text-align:right;"> 9889.811 </td>
   <td style="text-align:right;"> 22465.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30615.80843 </td>
   <td style="text-align:right;"> 730.737582 </td>
   <td style="text-align:right;"> 9301.451 </td>
   <td style="text-align:right;"> 21210.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46329.22686 </td>
   <td style="text-align:right;"> 974.844120 </td>
   <td style="text-align:right;"> 8099.355 </td>
   <td style="text-align:right;"> 21080.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37288.32476 </td>
   <td style="text-align:right;"> 819.784838 </td>
   <td style="text-align:right;"> 9645.968 </td>
   <td style="text-align:right;"> 21985.24 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12763.00571 </td>
   <td style="text-align:right;"> 433.384847 </td>
   <td style="text-align:right;"> 12575.912 </td>
   <td style="text-align:right;"> 21940.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26524.13106 </td>
   <td style="text-align:right;"> 662.738573 </td>
   <td style="text-align:right;"> 10640.580 </td>
   <td style="text-align:right;"> 21013.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33132.60441 </td>
   <td style="text-align:right;"> 746.565596 </td>
   <td style="text-align:right;"> 9695.022 </td>
   <td style="text-align:right;"> 21224.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -54237.48610 </td>
   <td style="text-align:right;"> 1072.318311 </td>
   <td style="text-align:right;"> 9167.498 </td>
   <td style="text-align:right;"> 21067.43 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8290.93511 </td>
   <td style="text-align:right;"> 367.196988 </td>
   <td style="text-align:right;"> 15247.565 </td>
   <td style="text-align:right;"> 21783.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9944.84921 </td>
   <td style="text-align:right;"> 405.414545 </td>
   <td style="text-align:right;"> 12769.317 </td>
   <td style="text-align:right;"> 21543.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21719.68806 </td>
   <td style="text-align:right;"> 580.569366 </td>
   <td style="text-align:right;"> 12738.143 </td>
   <td style="text-align:right;"> 21434.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -56958.37395 </td>
   <td style="text-align:right;"> 1121.542180 </td>
   <td style="text-align:right;"> 8360.873 </td>
   <td style="text-align:right;"> 21365.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24822.96112 </td>
   <td style="text-align:right;"> 649.795793 </td>
   <td style="text-align:right;"> 9311.586 </td>
   <td style="text-align:right;"> 21456.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23302.05511 </td>
   <td style="text-align:right;"> 612.796945 </td>
   <td style="text-align:right;"> 10214.112 </td>
   <td style="text-align:right;"> 21015.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24745.76254 </td>
   <td style="text-align:right;"> 632.303144 </td>
   <td style="text-align:right;"> 9806.087 </td>
   <td style="text-align:right;"> 21393.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29915.29662 </td>
   <td style="text-align:right;"> 695.245481 </td>
   <td style="text-align:right;"> 11105.115 </td>
   <td style="text-align:right;"> 22117.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20023.08659 </td>
   <td style="text-align:right;"> 565.229220 </td>
   <td style="text-align:right;"> 10167.201 </td>
   <td style="text-align:right;"> 21529.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41374.02219 </td>
   <td style="text-align:right;"> 892.570940 </td>
   <td style="text-align:right;"> 9280.292 </td>
   <td style="text-align:right;"> 21800.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39518.71581 </td>
   <td style="text-align:right;"> 853.670254 </td>
   <td style="text-align:right;"> 8021.595 </td>
   <td style="text-align:right;"> 21083.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34629.55141 </td>
   <td style="text-align:right;"> 780.919762 </td>
   <td style="text-align:right;"> 9598.056 </td>
   <td style="text-align:right;"> 21258.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27242.32046 </td>
   <td style="text-align:right;"> 652.209146 </td>
   <td style="text-align:right;"> 11709.103 </td>
   <td style="text-align:right;"> 21084.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37836.79920 </td>
   <td style="text-align:right;"> 823.126574 </td>
   <td style="text-align:right;"> 10804.839 </td>
   <td style="text-align:right;"> 22083.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35440.16593 </td>
   <td style="text-align:right;"> 813.745406 </td>
   <td style="text-align:right;"> 7628.549 </td>
   <td style="text-align:right;"> 21486.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17870.22040 </td>
   <td style="text-align:right;"> 525.444732 </td>
   <td style="text-align:right;"> 10729.404 </td>
   <td style="text-align:right;"> 20927.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25502.85073 </td>
   <td style="text-align:right;"> 636.835093 </td>
   <td style="text-align:right;"> 11579.763 </td>
   <td style="text-align:right;"> 21250.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40043.62136 </td>
   <td style="text-align:right;"> 874.310279 </td>
   <td style="text-align:right;"> 8012.392 </td>
   <td style="text-align:right;"> 21054.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29780.47378 </td>
   <td style="text-align:right;"> 702.610462 </td>
   <td style="text-align:right;"> 10460.201 </td>
   <td style="text-align:right;"> 21828.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32400.92369 </td>
   <td style="text-align:right;"> 749.502250 </td>
   <td style="text-align:right;"> 10022.547 </td>
   <td style="text-align:right;"> 21558.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26789.54263 </td>
   <td style="text-align:right;"> 669.597231 </td>
   <td style="text-align:right;"> 10711.812 </td>
   <td style="text-align:right;"> 21449.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25936.41818 </td>
   <td style="text-align:right;"> 641.241153 </td>
   <td style="text-align:right;"> 12492.589 </td>
   <td style="text-align:right;"> 21348.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20793.80152 </td>
   <td style="text-align:right;"> 558.110029 </td>
   <td style="text-align:right;"> 12412.557 </td>
   <td style="text-align:right;"> 21221.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36178.67898 </td>
   <td style="text-align:right;"> 807.834357 </td>
   <td style="text-align:right;"> 8932.025 </td>
   <td style="text-align:right;"> 21495.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35733.56479 </td>
   <td style="text-align:right;"> 790.687430 </td>
   <td style="text-align:right;"> 9899.934 </td>
   <td style="text-align:right;"> 21621.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14129.03145 </td>
   <td style="text-align:right;"> 466.484304 </td>
   <td style="text-align:right;"> 10493.594 </td>
   <td style="text-align:right;"> 21231.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28341.58687 </td>
   <td style="text-align:right;"> 680.271764 </td>
   <td style="text-align:right;"> 11062.120 </td>
   <td style="text-align:right;"> 21468.73 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34658.13506 </td>
   <td style="text-align:right;"> 778.602826 </td>
   <td style="text-align:right;"> 9286.301 </td>
   <td style="text-align:right;"> 21559.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5368.32871 </td>
   <td style="text-align:right;"> 336.153618 </td>
   <td style="text-align:right;"> 12033.653 </td>
   <td style="text-align:right;"> 21533.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29734.77466 </td>
   <td style="text-align:right;"> 708.114850 </td>
   <td style="text-align:right;"> 9159.244 </td>
   <td style="text-align:right;"> 21250.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -4564.80830 </td>
   <td style="text-align:right;"> 322.600232 </td>
   <td style="text-align:right;"> 12283.072 </td>
   <td style="text-align:right;"> 21645.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37551.23046 </td>
   <td style="text-align:right;"> 835.275035 </td>
   <td style="text-align:right;"> 10295.952 </td>
   <td style="text-align:right;"> 21168.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36154.53346 </td>
   <td style="text-align:right;"> 815.716643 </td>
   <td style="text-align:right;"> 9855.348 </td>
   <td style="text-align:right;"> 21149.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8954.27768 </td>
   <td style="text-align:right;"> 390.499171 </td>
   <td style="text-align:right;"> 11978.366 </td>
   <td style="text-align:right;"> 20726.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38105.87996 </td>
   <td style="text-align:right;"> 843.919453 </td>
   <td style="text-align:right;"> 8678.418 </td>
   <td style="text-align:right;"> 22140.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18497.71639 </td>
   <td style="text-align:right;"> 525.288645 </td>
   <td style="text-align:right;"> 11262.815 </td>
   <td style="text-align:right;"> 20971.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16972.71345 </td>
   <td style="text-align:right;"> 500.050219 </td>
   <td style="text-align:right;"> 12164.371 </td>
   <td style="text-align:right;"> 21710.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23003.29238 </td>
   <td style="text-align:right;"> 608.721425 </td>
   <td style="text-align:right;"> 11797.699 </td>
   <td style="text-align:right;"> 21118.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38695.27466 </td>
   <td style="text-align:right;"> 838.436219 </td>
   <td style="text-align:right;"> 9456.053 </td>
   <td style="text-align:right;"> 21896.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22151.93845 </td>
   <td style="text-align:right;"> 591.498361 </td>
   <td style="text-align:right;"> 10505.825 </td>
   <td style="text-align:right;"> 21523.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23285.04094 </td>
   <td style="text-align:right;"> 603.265390 </td>
   <td style="text-align:right;"> 11816.348 </td>
   <td style="text-align:right;"> 20994.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22296.66859 </td>
   <td style="text-align:right;"> 594.030912 </td>
   <td style="text-align:right;"> 10246.591 </td>
   <td style="text-align:right;"> 21187.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30241.02230 </td>
   <td style="text-align:right;"> 715.119417 </td>
   <td style="text-align:right;"> 9756.230 </td>
   <td style="text-align:right;"> 21332.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13358.25685 </td>
   <td style="text-align:right;"> 478.981421 </td>
   <td style="text-align:right;"> 7960.368 </td>
   <td style="text-align:right;"> 21384.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -45208.68931 </td>
   <td style="text-align:right;"> 948.331440 </td>
   <td style="text-align:right;"> 8760.912 </td>
   <td style="text-align:right;"> 21630.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14527.86651 </td>
   <td style="text-align:right;"> 466.176110 </td>
   <td style="text-align:right;"> 12419.993 </td>
   <td style="text-align:right;"> 21150.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22836.81765 </td>
   <td style="text-align:right;"> 595.828331 </td>
   <td style="text-align:right;"> 11585.562 </td>
   <td style="text-align:right;"> 21569.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12544.18890 </td>
   <td style="text-align:right;"> 454.505164 </td>
   <td style="text-align:right;"> 10993.390 </td>
   <td style="text-align:right;"> 21303.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32130.73532 </td>
   <td style="text-align:right;"> 759.765477 </td>
   <td style="text-align:right;"> 10918.175 </td>
   <td style="text-align:right;"> 21522.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42092.65592 </td>
   <td style="text-align:right;"> 905.193253 </td>
   <td style="text-align:right;"> 8765.664 </td>
   <td style="text-align:right;"> 20801.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23332.92884 </td>
   <td style="text-align:right;"> 612.592995 </td>
   <td style="text-align:right;"> 10536.643 </td>
   <td style="text-align:right;"> 21209.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18933.58383 </td>
   <td style="text-align:right;"> 528.883500 </td>
   <td style="text-align:right;"> 10834.933 </td>
   <td style="text-align:right;"> 21218.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20725.18661 </td>
   <td style="text-align:right;"> 574.603342 </td>
   <td style="text-align:right;"> 11366.271 </td>
   <td style="text-align:right;"> 21360.36 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30806.23751 </td>
   <td style="text-align:right;"> 723.888780 </td>
   <td style="text-align:right;"> 10121.108 </td>
   <td style="text-align:right;"> 21368.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28840.70479 </td>
   <td style="text-align:right;"> 689.385216 </td>
   <td style="text-align:right;"> 11221.596 </td>
   <td style="text-align:right;"> 21181.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41350.68034 </td>
   <td style="text-align:right;"> 884.333653 </td>
   <td style="text-align:right;"> 9524.714 </td>
   <td style="text-align:right;"> 21603.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19785.83810 </td>
   <td style="text-align:right;"> 547.335260 </td>
   <td style="text-align:right;"> 12496.788 </td>
   <td style="text-align:right;"> 20742.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9436.14183 </td>
   <td style="text-align:right;"> 399.194870 </td>
   <td style="text-align:right;"> 11365.250 </td>
   <td style="text-align:right;"> 21952.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34497.38851 </td>
   <td style="text-align:right;"> 784.281526 </td>
   <td style="text-align:right;"> 10444.165 </td>
   <td style="text-align:right;"> 20754.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13278.25573 </td>
   <td style="text-align:right;"> 445.790435 </td>
   <td style="text-align:right;"> 11480.756 </td>
   <td style="text-align:right;"> 21460.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -4014.54772 </td>
   <td style="text-align:right;"> 303.695720 </td>
   <td style="text-align:right;"> 13893.866 </td>
   <td style="text-align:right;"> 21012.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -2058.83195 </td>
   <td style="text-align:right;"> 286.743451 </td>
   <td style="text-align:right;"> 11318.952 </td>
   <td style="text-align:right;"> 21208.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10398.98226 </td>
   <td style="text-align:right;"> 406.439083 </td>
   <td style="text-align:right;"> 11391.485 </td>
   <td style="text-align:right;"> 21249.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37713.76253 </td>
   <td style="text-align:right;"> 816.765243 </td>
   <td style="text-align:right;"> 10671.589 </td>
   <td style="text-align:right;"> 21598.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10663.34166 </td>
   <td style="text-align:right;"> 393.051521 </td>
   <td style="text-align:right;"> 14909.345 </td>
   <td style="text-align:right;"> 21516.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24246.33475 </td>
   <td style="text-align:right;"> 618.989658 </td>
   <td style="text-align:right;"> 9980.143 </td>
   <td style="text-align:right;"> 22015.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24023.17339 </td>
   <td style="text-align:right;"> 616.480882 </td>
   <td style="text-align:right;"> 9821.100 </td>
   <td style="text-align:right;"> 22045.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -48506.72862 </td>
   <td style="text-align:right;"> 980.430718 </td>
   <td style="text-align:right;"> 9557.058 </td>
   <td style="text-align:right;"> 21578.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32702.81631 </td>
   <td style="text-align:right;"> 763.233574 </td>
   <td style="text-align:right;"> 8231.321 </td>
   <td style="text-align:right;"> 20869.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11656.37778 </td>
   <td style="text-align:right;"> 416.150540 </td>
   <td style="text-align:right;"> 12215.628 </td>
   <td style="text-align:right;"> 22325.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9552.33847 </td>
   <td style="text-align:right;"> 379.312581 </td>
   <td style="text-align:right;"> 12336.675 </td>
   <td style="text-align:right;"> 22037.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18170.68913 </td>
   <td style="text-align:right;"> 545.237511 </td>
   <td style="text-align:right;"> 10329.765 </td>
   <td style="text-align:right;"> 20817.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5702.88764 </td>
   <td style="text-align:right;"> 344.270211 </td>
   <td style="text-align:right;"> 14204.140 </td>
   <td style="text-align:right;"> 20862.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8924.56186 </td>
   <td style="text-align:right;"> 390.022855 </td>
   <td style="text-align:right;"> 14941.071 </td>
   <td style="text-align:right;"> 21026.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9325.30800 </td>
   <td style="text-align:right;"> 397.639976 </td>
   <td style="text-align:right;"> 15067.477 </td>
   <td style="text-align:right;"> 21031.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9149.48682 </td>
   <td style="text-align:right;"> 394.415442 </td>
   <td style="text-align:right;"> 15246.638 </td>
   <td style="text-align:right;"> 21131.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7889.44698 </td>
   <td style="text-align:right;"> 133.823669 </td>
   <td style="text-align:right;"> 12445.536 </td>
   <td style="text-align:right;"> 21821.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33962.36344 </td>
   <td style="text-align:right;"> 783.144093 </td>
   <td style="text-align:right;"> 7310.976 </td>
   <td style="text-align:right;"> 20976.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -51451.54928 </td>
   <td style="text-align:right;"> 1036.343513 </td>
   <td style="text-align:right;"> 9749.706 </td>
   <td style="text-align:right;"> 20823.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21006.37916 </td>
   <td style="text-align:right;"> 556.616961 </td>
   <td style="text-align:right;"> 12237.542 </td>
   <td style="text-align:right;"> 21633.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6775.79719 </td>
   <td style="text-align:right;"> 338.183475 </td>
   <td style="text-align:right;"> 12251.818 </td>
   <td style="text-align:right;"> 21845.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -3590.56112 </td>
   <td style="text-align:right;"> 292.524918 </td>
   <td style="text-align:right;"> 14359.228 </td>
   <td style="text-align:right;"> 21096.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8263.63721 </td>
   <td style="text-align:right;"> 370.394011 </td>
   <td style="text-align:right;"> 11345.413 </td>
   <td style="text-align:right;"> 22003.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40021.93081 </td>
   <td style="text-align:right;"> 867.310070 </td>
   <td style="text-align:right;"> 10538.438 </td>
   <td style="text-align:right;"> 20782.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29943.59844 </td>
   <td style="text-align:right;"> 726.380382 </td>
   <td style="text-align:right;"> 8338.269 </td>
   <td style="text-align:right;"> 22454.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27064.16657 </td>
   <td style="text-align:right;"> 666.069218 </td>
   <td style="text-align:right;"> 10306.335 </td>
   <td style="text-align:right;"> 20504.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32902.52796 </td>
   <td style="text-align:right;"> 759.725706 </td>
   <td style="text-align:right;"> 9480.391 </td>
   <td style="text-align:right;"> 22013.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17379.59585 </td>
   <td style="text-align:right;"> 514.772750 </td>
   <td style="text-align:right;"> 11379.544 </td>
   <td style="text-align:right;"> 21053.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8194.03926 </td>
   <td style="text-align:right;"> 359.700943 </td>
   <td style="text-align:right;"> 12611.872 </td>
   <td style="text-align:right;"> 21125.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26715.74136 </td>
   <td style="text-align:right;"> 658.233844 </td>
   <td style="text-align:right;"> 10927.522 </td>
   <td style="text-align:right;"> 21156.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40637.29747 </td>
   <td style="text-align:right;"> 864.907641 </td>
   <td style="text-align:right;"> 10813.135 </td>
   <td style="text-align:right;"> 21021.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37792.83764 </td>
   <td style="text-align:right;"> 821.948768 </td>
   <td style="text-align:right;"> 8899.095 </td>
   <td style="text-align:right;"> 21499.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16513.75549 </td>
   <td style="text-align:right;"> 510.500797 </td>
   <td style="text-align:right;"> 11577.174 </td>
   <td style="text-align:right;"> 20984.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9251.30274 </td>
   <td style="text-align:right;"> 400.949144 </td>
   <td style="text-align:right;"> 12710.821 </td>
   <td style="text-align:right;"> 21096.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19572.22812 </td>
   <td style="text-align:right;"> 552.292457 </td>
   <td style="text-align:right;"> 10649.325 </td>
   <td style="text-align:right;"> 21639.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35190.21537 </td>
   <td style="text-align:right;"> 777.738935 </td>
   <td style="text-align:right;"> 10295.907 </td>
   <td style="text-align:right;"> 21127.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25016.25905 </td>
   <td style="text-align:right;"> 640.112235 </td>
   <td style="text-align:right;"> 11568.849 </td>
   <td style="text-align:right;"> 21634.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26209.14235 </td>
   <td style="text-align:right;"> 659.047303 </td>
   <td style="text-align:right;"> 11456.415 </td>
   <td style="text-align:right;"> 21495.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16298.28450 </td>
   <td style="text-align:right;"> 514.218772 </td>
   <td style="text-align:right;"> 10884.323 </td>
   <td style="text-align:right;"> 21479.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33978.69883 </td>
   <td style="text-align:right;"> 768.017582 </td>
   <td style="text-align:right;"> 9650.782 </td>
   <td style="text-align:right;"> 21148.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29924.46490 </td>
   <td style="text-align:right;"> 703.248493 </td>
   <td style="text-align:right;"> 10189.122 </td>
   <td style="text-align:right;"> 21258.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27453.61493 </td>
   <td style="text-align:right;"> 675.455604 </td>
   <td style="text-align:right;"> 11260.885 </td>
   <td style="text-align:right;"> 21189.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29793.83059 </td>
   <td style="text-align:right;"> 723.760980 </td>
   <td style="text-align:right;"> 8589.412 </td>
   <td style="text-align:right;"> 21755.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27772.86697 </td>
   <td style="text-align:right;"> 691.556589 </td>
   <td style="text-align:right;"> 8584.883 </td>
   <td style="text-align:right;"> 21666.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20753.09901 </td>
   <td style="text-align:right;"> 572.259849 </td>
   <td style="text-align:right;"> 9385.092 </td>
   <td style="text-align:right;"> 21132.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24878.60154 </td>
   <td style="text-align:right;"> 639.713506 </td>
   <td style="text-align:right;"> 11382.589 </td>
   <td style="text-align:right;"> 22388.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20350.66994 </td>
   <td style="text-align:right;"> 570.490962 </td>
   <td style="text-align:right;"> 10497.208 </td>
   <td style="text-align:right;"> 21062.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33244.76658 </td>
   <td style="text-align:right;"> 756.712206 </td>
   <td style="text-align:right;"> 9827.971 </td>
   <td style="text-align:right;"> 21294.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -2054.97460 </td>
   <td style="text-align:right;"> 280.535653 </td>
   <td style="text-align:right;"> 12909.598 </td>
   <td style="text-align:right;"> 21569.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8080.08254 </td>
   <td style="text-align:right;"> 371.942479 </td>
   <td style="text-align:right;"> 12850.727 </td>
   <td style="text-align:right;"> 21508.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31970.53354 </td>
   <td style="text-align:right;"> 736.248911 </td>
   <td style="text-align:right;"> 9911.575 </td>
   <td style="text-align:right;"> 21325.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21347.06819 </td>
   <td style="text-align:right;"> 579.200352 </td>
   <td style="text-align:right;"> 11492.331 </td>
   <td style="text-align:right;"> 21143.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24210.12484 </td>
   <td style="text-align:right;"> 623.436762 </td>
   <td style="text-align:right;"> 11077.375 </td>
   <td style="text-align:right;"> 21323.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38995.16182 </td>
   <td style="text-align:right;"> 856.425347 </td>
   <td style="text-align:right;"> 8224.354 </td>
   <td style="text-align:right;"> 21689.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -52894.02808 </td>
   <td style="text-align:right;"> 1058.595126 </td>
   <td style="text-align:right;"> 9253.208 </td>
   <td style="text-align:right;"> 21000.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18632.18189 </td>
   <td style="text-align:right;"> 521.038848 </td>
   <td style="text-align:right;"> 14201.359 </td>
   <td style="text-align:right;"> 21833.36 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37908.34017 </td>
   <td style="text-align:right;"> 849.961308 </td>
   <td style="text-align:right;"> 7533.318 </td>
   <td style="text-align:right;"> 21302.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -49406.73724 </td>
   <td style="text-align:right;"> 999.298689 </td>
   <td style="text-align:right;"> 9798.893 </td>
   <td style="text-align:right;"> 22071.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11620.70422 </td>
   <td style="text-align:right;"> 428.235382 </td>
   <td style="text-align:right;"> 12383.602 </td>
   <td style="text-align:right;"> 21128.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33830.92242 </td>
   <td style="text-align:right;"> 780.342008 </td>
   <td style="text-align:right;"> 8868.498 </td>
   <td style="text-align:right;"> 21597.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30880.36107 </td>
   <td style="text-align:right;"> 737.265385 </td>
   <td style="text-align:right;"> 8497.597 </td>
   <td style="text-align:right;"> 21652.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12562.86863 </td>
   <td style="text-align:right;"> 435.973780 </td>
   <td style="text-align:right;"> 13484.996 </td>
   <td style="text-align:right;"> 21548.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20548.65795 </td>
   <td style="text-align:right;"> 552.779109 </td>
   <td style="text-align:right;"> 11231.205 </td>
   <td style="text-align:right;"> 20614.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19702.85343 </td>
   <td style="text-align:right;"> 558.543136 </td>
   <td style="text-align:right;"> 11771.583 </td>
   <td style="text-align:right;"> 22017.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25952.11441 </td>
   <td style="text-align:right;"> 655.119115 </td>
   <td style="text-align:right;"> 10290.559 </td>
   <td style="text-align:right;"> 20918.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25819.12212 </td>
   <td style="text-align:right;"> 650.779086 </td>
   <td style="text-align:right;"> 10874.003 </td>
   <td style="text-align:right;"> 21331.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28272.81152 </td>
   <td style="text-align:right;"> 676.203270 </td>
   <td style="text-align:right;"> 10496.166 </td>
   <td style="text-align:right;"> 21365.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28782.38632 </td>
   <td style="text-align:right;"> 683.429653 </td>
   <td style="text-align:right;"> 9829.071 </td>
   <td style="text-align:right;"> 21415.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24322.94482 </td>
   <td style="text-align:right;"> 614.649841 </td>
   <td style="text-align:right;"> 11976.863 </td>
   <td style="text-align:right;"> 21813.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16655.01777 </td>
   <td style="text-align:right;"> 497.472104 </td>
   <td style="text-align:right;"> 12276.037 </td>
   <td style="text-align:right;"> 21087.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34031.57231 </td>
   <td style="text-align:right;"> 773.888035 </td>
   <td style="text-align:right;"> 10234.809 </td>
   <td style="text-align:right;"> 21798.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10904.64873 </td>
   <td style="text-align:right;"> 412.168968 </td>
   <td style="text-align:right;"> 12165.922 </td>
   <td style="text-align:right;"> 21023.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31556.57565 </td>
   <td style="text-align:right;"> 742.632203 </td>
   <td style="text-align:right;"> 9112.082 </td>
   <td style="text-align:right;"> 21571.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35974.08783 </td>
   <td style="text-align:right;"> 822.464652 </td>
   <td style="text-align:right;"> 9693.963 </td>
   <td style="text-align:right;"> 21717.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25972.54590 </td>
   <td style="text-align:right;"> 634.829779 </td>
   <td style="text-align:right;"> 10429.507 </td>
   <td style="text-align:right;"> 21330.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28874.79163 </td>
   <td style="text-align:right;"> 710.411518 </td>
   <td style="text-align:right;"> 9759.875 </td>
   <td style="text-align:right;"> 21490.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16633.30637 </td>
   <td style="text-align:right;"> 490.944619 </td>
   <td style="text-align:right;"> 11801.318 </td>
   <td style="text-align:right;"> 21843.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30512.61286 </td>
   <td style="text-align:right;"> 708.797130 </td>
   <td style="text-align:right;"> 10558.510 </td>
   <td style="text-align:right;"> 21610.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27621.13234 </td>
   <td style="text-align:right;"> 666.003555 </td>
   <td style="text-align:right;"> 9963.697 </td>
   <td style="text-align:right;"> 21188.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27951.66967 </td>
   <td style="text-align:right;"> 693.611918 </td>
   <td style="text-align:right;"> 9949.854 </td>
   <td style="text-align:right;"> 21617.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17098.38115 </td>
   <td style="text-align:right;"> 500.672048 </td>
   <td style="text-align:right;"> 11731.913 </td>
   <td style="text-align:right;"> 21522.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27669.12412 </td>
   <td style="text-align:right;"> 672.275814 </td>
   <td style="text-align:right;"> 10308.130 </td>
   <td style="text-align:right;"> 21970.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27305.66056 </td>
   <td style="text-align:right;"> 668.991038 </td>
   <td style="text-align:right;"> 10473.823 </td>
   <td style="text-align:right;"> 22507.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40654.38543 </td>
   <td style="text-align:right;"> 875.736165 </td>
   <td style="text-align:right;"> 8656.196 </td>
   <td style="text-align:right;"> 21383.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -47236.59807 </td>
   <td style="text-align:right;"> 999.233169 </td>
   <td style="text-align:right;"> 6649.560 </td>
   <td style="text-align:right;"> 21269.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39891.37889 </td>
   <td style="text-align:right;"> 868.566822 </td>
   <td style="text-align:right;"> 9649.342 </td>
   <td style="text-align:right;"> 21379.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7251.49619 </td>
   <td style="text-align:right;"> 363.336401 </td>
   <td style="text-align:right;"> 11866.319 </td>
   <td style="text-align:right;"> 21838.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42096.11687 </td>
   <td style="text-align:right;"> 887.457421 </td>
   <td style="text-align:right;"> 9821.035 </td>
   <td style="text-align:right;"> 21026.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36953.28225 </td>
   <td style="text-align:right;"> 811.488107 </td>
   <td style="text-align:right;"> 9716.050 </td>
   <td style="text-align:right;"> 21150.36 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35243.23916 </td>
   <td style="text-align:right;"> 790.586037 </td>
   <td style="text-align:right;"> 9529.719 </td>
   <td style="text-align:right;"> 21142.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35655.40201 </td>
   <td style="text-align:right;"> 803.440992 </td>
   <td style="text-align:right;"> 8653.961 </td>
   <td style="text-align:right;"> 21710.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43561.92999 </td>
   <td style="text-align:right;"> 908.923283 </td>
   <td style="text-align:right;"> 9422.038 </td>
   <td style="text-align:right;"> 21410.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44543.67834 </td>
   <td style="text-align:right;"> 931.358339 </td>
   <td style="text-align:right;"> 8152.730 </td>
   <td style="text-align:right;"> 21777.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29373.64768 </td>
   <td style="text-align:right;"> 697.889379 </td>
   <td style="text-align:right;"> 10415.203 </td>
   <td style="text-align:right;"> 20830.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27818.14845 </td>
   <td style="text-align:right;"> 687.240399 </td>
   <td style="text-align:right;"> 9981.114 </td>
   <td style="text-align:right;"> 20848.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33906.75629 </td>
   <td style="text-align:right;"> 766.169750 </td>
   <td style="text-align:right;"> 10321.876 </td>
   <td style="text-align:right;"> 21544.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27856.55452 </td>
   <td style="text-align:right;"> 672.362742 </td>
   <td style="text-align:right;"> 9897.313 </td>
   <td style="text-align:right;"> 21627.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41050.74548 </td>
   <td style="text-align:right;"> 879.735686 </td>
   <td style="text-align:right;"> 10030.778 </td>
   <td style="text-align:right;"> 21039.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -4253.28225 </td>
   <td style="text-align:right;"> 314.810827 </td>
   <td style="text-align:right;"> 12284.606 </td>
   <td style="text-align:right;"> 21476.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19866.12924 </td>
   <td style="text-align:right;"> 543.934608 </td>
   <td style="text-align:right;"> 12365.321 </td>
   <td style="text-align:right;"> 20808.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39494.99293 </td>
   <td style="text-align:right;"> 867.220072 </td>
   <td style="text-align:right;"> 8893.137 </td>
   <td style="text-align:right;"> 21060.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36695.18468 </td>
   <td style="text-align:right;"> 828.413986 </td>
   <td style="text-align:right;"> 8012.131 </td>
   <td style="text-align:right;"> 20888.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46471.17050 </td>
   <td style="text-align:right;"> 947.375908 </td>
   <td style="text-align:right;"> 9634.234 </td>
   <td style="text-align:right;"> 21574.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16646.29944 </td>
   <td style="text-align:right;"> 511.330726 </td>
   <td style="text-align:right;"> 10553.499 </td>
   <td style="text-align:right;"> 21537.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35993.82100 </td>
   <td style="text-align:right;"> 805.612567 </td>
   <td style="text-align:right;"> 10325.548 </td>
   <td style="text-align:right;"> 21633.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30676.65227 </td>
   <td style="text-align:right;"> 724.321366 </td>
   <td style="text-align:right;"> 9924.215 </td>
   <td style="text-align:right;"> 21417.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40787.60189 </td>
   <td style="text-align:right;"> 874.652622 </td>
   <td style="text-align:right;"> 9678.926 </td>
   <td style="text-align:right;"> 21059.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34085.83839 </td>
   <td style="text-align:right;"> 782.898755 </td>
   <td style="text-align:right;"> 8596.658 </td>
   <td style="text-align:right;"> 21359.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19096.49910 </td>
   <td style="text-align:right;"> 549.230138 </td>
   <td style="text-align:right;"> 10145.814 </td>
   <td style="text-align:right;"> 21274.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31618.24111 </td>
   <td style="text-align:right;"> 737.565582 </td>
   <td style="text-align:right;"> 10212.659 </td>
   <td style="text-align:right;"> 21201.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29885.38767 </td>
   <td style="text-align:right;"> 702.679211 </td>
   <td style="text-align:right;"> 11139.521 </td>
   <td style="text-align:right;"> 21912.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24473.21532 </td>
   <td style="text-align:right;"> 625.299874 </td>
   <td style="text-align:right;"> 11517.924 </td>
   <td style="text-align:right;"> 20886.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37146.75425 </td>
   <td style="text-align:right;"> 818.285621 </td>
   <td style="text-align:right;"> 9482.513 </td>
   <td style="text-align:right;"> 21837.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41531.44166 </td>
   <td style="text-align:right;"> 896.340783 </td>
   <td style="text-align:right;"> 8238.024 </td>
   <td style="text-align:right;"> 21035.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35607.33896 </td>
   <td style="text-align:right;"> 795.688641 </td>
   <td style="text-align:right;"> 10216.124 </td>
   <td style="text-align:right;"> 21857.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26648.74023 </td>
   <td style="text-align:right;"> 668.118722 </td>
   <td style="text-align:right;"> 9105.042 </td>
   <td style="text-align:right;"> 21781.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29664.89634 </td>
   <td style="text-align:right;"> 691.761217 </td>
   <td style="text-align:right;"> 11072.297 </td>
   <td style="text-align:right;"> 21414.05 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21635.23559 </td>
   <td style="text-align:right;"> 584.575797 </td>
   <td style="text-align:right;"> 9230.656 </td>
   <td style="text-align:right;"> 21686.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10098.86076 </td>
   <td style="text-align:right;"> 405.768796 </td>
   <td style="text-align:right;"> 12906.053 </td>
   <td style="text-align:right;"> 21017.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5453.13215 </td>
   <td style="text-align:right;"> 336.486483 </td>
   <td style="text-align:right;"> 12692.147 </td>
   <td style="text-align:right;"> 21110.73 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24063.35185 </td>
   <td style="text-align:right;"> 633.033303 </td>
   <td style="text-align:right;"> 10373.173 </td>
   <td style="text-align:right;"> 20875.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16505.79588 </td>
   <td style="text-align:right;"> 526.067305 </td>
   <td style="text-align:right;"> 9959.392 </td>
   <td style="text-align:right;"> 20975.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33633.84846 </td>
   <td style="text-align:right;"> 771.638096 </td>
   <td style="text-align:right;"> 10760.622 </td>
   <td style="text-align:right;"> 21022.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34722.65470 </td>
   <td style="text-align:right;"> 794.023567 </td>
   <td style="text-align:right;"> 8386.650 </td>
   <td style="text-align:right;"> 22029.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9236.20252 </td>
   <td style="text-align:right;"> 95.734374 </td>
   <td style="text-align:right;"> 13224.313 </td>
   <td style="text-align:right;"> 20812.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -393.83838 </td>
   <td style="text-align:right;"> 237.827350 </td>
   <td style="text-align:right;"> 14030.534 </td>
   <td style="text-align:right;"> 20807.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30701.48890 </td>
   <td style="text-align:right;"> 717.838953 </td>
   <td style="text-align:right;"> 9930.516 </td>
   <td style="text-align:right;"> 21394.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29368.21488 </td>
   <td style="text-align:right;"> 710.349995 </td>
   <td style="text-align:right;"> 10405.568 </td>
   <td style="text-align:right;"> 21595.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28843.66248 </td>
   <td style="text-align:right;"> 684.265156 </td>
   <td style="text-align:right;"> 10498.711 </td>
   <td style="text-align:right;"> 21330.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33709.45752 </td>
   <td style="text-align:right;"> 768.825198 </td>
   <td style="text-align:right;"> 10115.770 </td>
   <td style="text-align:right;"> 21466.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25581.05185 </td>
   <td style="text-align:right;"> 651.593239 </td>
   <td style="text-align:right;"> 10215.303 </td>
   <td style="text-align:right;"> 20829.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38364.72428 </td>
   <td style="text-align:right;"> 847.146296 </td>
   <td style="text-align:right;"> 9178.023 </td>
   <td style="text-align:right;"> 21246.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18197.71624 </td>
   <td style="text-align:right;"> 507.116114 </td>
   <td style="text-align:right;"> 11933.653 </td>
   <td style="text-align:right;"> 21401.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12604.65313 </td>
   <td style="text-align:right;"> 445.199923 </td>
   <td style="text-align:right;"> 12998.392 </td>
   <td style="text-align:right;"> 22011.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27827.79040 </td>
   <td style="text-align:right;"> 687.049880 </td>
   <td style="text-align:right;"> 9537.901 </td>
   <td style="text-align:right;"> 21523.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38606.70403 </td>
   <td style="text-align:right;"> 846.160159 </td>
   <td style="text-align:right;"> 9626.517 </td>
   <td style="text-align:right;"> 21159.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42588.67151 </td>
   <td style="text-align:right;"> 908.169564 </td>
   <td style="text-align:right;"> 7951.854 </td>
   <td style="text-align:right;"> 22293.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20026.53934 </td>
   <td style="text-align:right;"> 563.584023 </td>
   <td style="text-align:right;"> 11653.951 </td>
   <td style="text-align:right;"> 21316.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15200.80071 </td>
   <td style="text-align:right;"> 464.479528 </td>
   <td style="text-align:right;"> 12469.814 </td>
   <td style="text-align:right;"> 21840.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40647.00073 </td>
   <td style="text-align:right;"> 893.420092 </td>
   <td style="text-align:right;"> 8760.250 </td>
   <td style="text-align:right;"> 21155.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30240.92844 </td>
   <td style="text-align:right;"> 729.407210 </td>
   <td style="text-align:right;"> 10567.386 </td>
   <td style="text-align:right;"> 21016.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31647.21600 </td>
   <td style="text-align:right;"> 749.975468 </td>
   <td style="text-align:right;"> 10431.565 </td>
   <td style="text-align:right;"> 21340.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28674.41729 </td>
   <td style="text-align:right;"> 705.018216 </td>
   <td style="text-align:right;"> 9093.665 </td>
   <td style="text-align:right;"> 21544.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22116.79407 </td>
   <td style="text-align:right;"> 577.449927 </td>
   <td style="text-align:right;"> 12080.758 </td>
   <td style="text-align:right;"> 21642.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26851.37374 </td>
   <td style="text-align:right;"> 650.939690 </td>
   <td style="text-align:right;"> 12231.928 </td>
   <td style="text-align:right;"> 21596.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27359.90443 </td>
   <td style="text-align:right;"> 660.492563 </td>
   <td style="text-align:right;"> 12203.941 </td>
   <td style="text-align:right;"> 21305.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21107.11697 </td>
   <td style="text-align:right;"> 582.400123 </td>
   <td style="text-align:right;"> 10129.510 </td>
   <td style="text-align:right;"> 21349.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46015.69004 </td>
   <td style="text-align:right;"> 958.397674 </td>
   <td style="text-align:right;"> 9159.842 </td>
   <td style="text-align:right;"> 21463.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26309.43569 </td>
   <td style="text-align:right;"> 659.174899 </td>
   <td style="text-align:right;"> 10439.006 </td>
   <td style="text-align:right;"> 21106.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15466.37957 </td>
   <td style="text-align:right;"> 485.929170 </td>
   <td style="text-align:right;"> 12440.648 </td>
   <td style="text-align:right;"> 21428.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11218.93187 </td>
   <td style="text-align:right;"> 410.731538 </td>
   <td style="text-align:right;"> 13391.044 </td>
   <td style="text-align:right;"> 21791.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19313.47909 </td>
   <td style="text-align:right;"> 530.711127 </td>
   <td style="text-align:right;"> 12027.780 </td>
   <td style="text-align:right;"> 21715.84 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24667.13655 </td>
   <td style="text-align:right;"> 635.361546 </td>
   <td style="text-align:right;"> 10158.773 </td>
   <td style="text-align:right;"> 21283.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24120.39844 </td>
   <td style="text-align:right;"> 619.241856 </td>
   <td style="text-align:right;"> 11263.256 </td>
   <td style="text-align:right;"> 21029.24 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19661.83114 </td>
   <td style="text-align:right;"> 566.146187 </td>
   <td style="text-align:right;"> 9330.470 </td>
   <td style="text-align:right;"> 21270.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22867.39783 </td>
   <td style="text-align:right;"> 612.783621 </td>
   <td style="text-align:right;"> 10127.927 </td>
   <td style="text-align:right;"> 21086.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30020.42088 </td>
   <td style="text-align:right;"> 720.161108 </td>
   <td style="text-align:right;"> 10418.263 </td>
   <td style="text-align:right;"> 20987.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20771.81037 </td>
   <td style="text-align:right;"> 576.996906 </td>
   <td style="text-align:right;"> 11619.378 </td>
   <td style="text-align:right;"> 22006.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -1247.16226 </td>
   <td style="text-align:right;"> 270.607401 </td>
   <td style="text-align:right;"> 13286.260 </td>
   <td style="text-align:right;"> 22333.36 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20944.06341 </td>
   <td style="text-align:right;"> 553.853913 </td>
   <td style="text-align:right;"> 11865.389 </td>
   <td style="text-align:right;"> 21290.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15888.39549 </td>
   <td style="text-align:right;"> 512.895483 </td>
   <td style="text-align:right;"> 10913.392 </td>
   <td style="text-align:right;"> 21061.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30334.73340 </td>
   <td style="text-align:right;"> 701.201075 </td>
   <td style="text-align:right;"> 12278.927 </td>
   <td style="text-align:right;"> 22174.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1266.18611 </td>
   <td style="text-align:right;"> 211.389492 </td>
   <td style="text-align:right;"> 11996.420 </td>
   <td style="text-align:right;"> 21196.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9991.16181 </td>
   <td style="text-align:right;"> 381.701701 </td>
   <td style="text-align:right;"> 12190.378 </td>
   <td style="text-align:right;"> 21096.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21798.82806 </td>
   <td style="text-align:right;"> 570.267277 </td>
   <td style="text-align:right;"> 10244.294 </td>
   <td style="text-align:right;"> 21038.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21698.65251 </td>
   <td style="text-align:right;"> 574.359332 </td>
   <td style="text-align:right;"> 9262.719 </td>
   <td style="text-align:right;"> 21001.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30604.14982 </td>
   <td style="text-align:right;"> 695.081965 </td>
   <td style="text-align:right;"> 12094.365 </td>
   <td style="text-align:right;"> 21158.24 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44109.81321 </td>
   <td style="text-align:right;"> 941.229693 </td>
   <td style="text-align:right;"> 6982.400 </td>
   <td style="text-align:right;"> 21648.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18973.62510 </td>
   <td style="text-align:right;"> 533.910418 </td>
   <td style="text-align:right;"> 12293.525 </td>
   <td style="text-align:right;"> 21030.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29429.98862 </td>
   <td style="text-align:right;"> 699.453614 </td>
   <td style="text-align:right;"> 11185.273 </td>
   <td style="text-align:right;"> 20976.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32949.70147 </td>
   <td style="text-align:right;"> 765.779762 </td>
   <td style="text-align:right;"> 8250.824 </td>
   <td style="text-align:right;"> 21311.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40072.38224 </td>
   <td style="text-align:right;"> 862.954616 </td>
   <td style="text-align:right;"> 8905.656 </td>
   <td style="text-align:right;"> 21909.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33566.17330 </td>
   <td style="text-align:right;"> 768.150985 </td>
   <td style="text-align:right;"> 10233.028 </td>
   <td style="text-align:right;"> 21318.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26228.91543 </td>
   <td style="text-align:right;"> 655.579904 </td>
   <td style="text-align:right;"> 11126.367 </td>
   <td style="text-align:right;"> 21419.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37926.53210 </td>
   <td style="text-align:right;"> 824.491715 </td>
   <td style="text-align:right;"> 10323.551 </td>
   <td style="text-align:right;"> 21629.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36536.36354 </td>
   <td style="text-align:right;"> 806.307512 </td>
   <td style="text-align:right;"> 10254.620 </td>
   <td style="text-align:right;"> 21501.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9605.11611 </td>
   <td style="text-align:right;"> 419.702834 </td>
   <td style="text-align:right;"> 9900.188 </td>
   <td style="text-align:right;"> 21258.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10295.30723 </td>
   <td style="text-align:right;"> 433.937545 </td>
   <td style="text-align:right;"> 9624.490 </td>
   <td style="text-align:right;"> 21147.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37009.53813 </td>
   <td style="text-align:right;"> 811.167793 </td>
   <td style="text-align:right;"> 11192.460 </td>
   <td style="text-align:right;"> 21109.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28641.67020 </td>
   <td style="text-align:right;"> 683.580041 </td>
   <td style="text-align:right;"> 11504.956 </td>
   <td style="text-align:right;"> 21419.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27359.93184 </td>
   <td style="text-align:right;"> 662.725380 </td>
   <td style="text-align:right;"> 10181.817 </td>
   <td style="text-align:right;"> 21033.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19700.11373 </td>
   <td style="text-align:right;"> 543.322444 </td>
   <td style="text-align:right;"> 11336.994 </td>
   <td style="text-align:right;"> 21286.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31589.53350 </td>
   <td style="text-align:right;"> 745.141093 </td>
   <td style="text-align:right;"> 9302.389 </td>
   <td style="text-align:right;"> 21661.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27334.66879 </td>
   <td style="text-align:right;"> 681.338230 </td>
   <td style="text-align:right;"> 9576.828 </td>
   <td style="text-align:right;"> 21726.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32356.93971 </td>
   <td style="text-align:right;"> 746.915092 </td>
   <td style="text-align:right;"> 10675.433 </td>
   <td style="text-align:right;"> 21649.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -3251.59586 </td>
   <td style="text-align:right;"> 306.942948 </td>
   <td style="text-align:right;"> 12600.639 </td>
   <td style="text-align:right;"> 21367.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25577.30826 </td>
   <td style="text-align:right;"> 644.539253 </td>
   <td style="text-align:right;"> 10880.045 </td>
   <td style="text-align:right;"> 21322.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36952.22179 </td>
   <td style="text-align:right;"> 818.640826 </td>
   <td style="text-align:right;"> 10838.045 </td>
   <td style="text-align:right;"> 21276.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -52066.14321 </td>
   <td style="text-align:right;"> 1037.999423 </td>
   <td style="text-align:right;"> 9915.228 </td>
   <td style="text-align:right;"> 21798.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36183.35994 </td>
   <td style="text-align:right;"> 795.157368 </td>
   <td style="text-align:right;"> 9745.869 </td>
   <td style="text-align:right;"> 21741.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46303.57686 </td>
   <td style="text-align:right;"> 961.091685 </td>
   <td style="text-align:right;"> 9198.580 </td>
   <td style="text-align:right;"> 21321.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29740.92882 </td>
   <td style="text-align:right;"> 703.453337 </td>
   <td style="text-align:right;"> 10781.046 </td>
   <td style="text-align:right;"> 21359.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17557.12361 </td>
   <td style="text-align:right;"> 518.051383 </td>
   <td style="text-align:right;"> 11048.461 </td>
   <td style="text-align:right;"> 21596.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8424.12644 </td>
   <td style="text-align:right;"> 365.546524 </td>
   <td style="text-align:right;"> 13363.396 </td>
   <td style="text-align:right;"> 21279.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20082.12115 </td>
   <td style="text-align:right;"> 563.233909 </td>
   <td style="text-align:right;"> 10556.551 </td>
   <td style="text-align:right;"> 21249.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20578.95287 </td>
   <td style="text-align:right;"> 591.515294 </td>
   <td style="text-align:right;"> 9817.586 </td>
   <td style="text-align:right;"> 20896.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28058.57858 </td>
   <td style="text-align:right;"> 696.801639 </td>
   <td style="text-align:right;"> 10540.832 </td>
   <td style="text-align:right;"> 21015.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29239.06513 </td>
   <td style="text-align:right;"> 714.292208 </td>
   <td style="text-align:right;"> 10414.409 </td>
   <td style="text-align:right;"> 20837.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23963.10367 </td>
   <td style="text-align:right;"> 602.263079 </td>
   <td style="text-align:right;"> 10743.353 </td>
   <td style="text-align:right;"> 21928.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31226.73927 </td>
   <td style="text-align:right;"> 732.774309 </td>
   <td style="text-align:right;"> 10153.497 </td>
   <td style="text-align:right;"> 21593.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14262.01022 </td>
   <td style="text-align:right;"> 483.429702 </td>
   <td style="text-align:right;"> 10592.330 </td>
   <td style="text-align:right;"> 21463.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20304.43323 </td>
   <td style="text-align:right;"> 575.666266 </td>
   <td style="text-align:right;"> 10307.139 </td>
   <td style="text-align:right;"> 21465.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25756.94236 </td>
   <td style="text-align:right;"> 647.772543 </td>
   <td style="text-align:right;"> 10662.625 </td>
   <td style="text-align:right;"> 21258.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14204.63906 </td>
   <td style="text-align:right;"> 478.237993 </td>
   <td style="text-align:right;"> 10358.588 </td>
   <td style="text-align:right;"> 21302.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28340.22329 </td>
   <td style="text-align:right;"> 671.292999 </td>
   <td style="text-align:right;"> 12307.325 </td>
   <td style="text-align:right;"> 21186.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18299.84530 </td>
   <td style="text-align:right;"> 525.219461 </td>
   <td style="text-align:right;"> 8947.600 </td>
   <td style="text-align:right;"> 21962.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11743.19574 </td>
   <td style="text-align:right;"> 438.716011 </td>
   <td style="text-align:right;"> 11909.060 </td>
   <td style="text-align:right;"> 20907.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8445.58867 </td>
   <td style="text-align:right;"> 381.443325 </td>
   <td style="text-align:right;"> 13131.944 </td>
   <td style="text-align:right;"> 20989.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23428.14318 </td>
   <td style="text-align:right;"> 601.684415 </td>
   <td style="text-align:right;"> 10283.862 </td>
   <td style="text-align:right;"> 21359.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18018.40415 </td>
   <td style="text-align:right;"> 523.844227 </td>
   <td style="text-align:right;"> 10065.867 </td>
   <td style="text-align:right;"> 21414.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28851.02402 </td>
   <td style="text-align:right;"> 699.097114 </td>
   <td style="text-align:right;"> 10294.345 </td>
   <td style="text-align:right;"> 21225.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28775.09454 </td>
   <td style="text-align:right;"> 693.060411 </td>
   <td style="text-align:right;"> 11228.637 </td>
   <td style="text-align:right;"> 21207.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26258.15890 </td>
   <td style="text-align:right;"> 662.163653 </td>
   <td style="text-align:right;"> 9876.374 </td>
   <td style="text-align:right;"> 21570.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19367.48264 </td>
   <td style="text-align:right;"> 542.533414 </td>
   <td style="text-align:right;"> 11041.074 </td>
   <td style="text-align:right;"> 21258.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27753.03256 </td>
   <td style="text-align:right;"> 681.590576 </td>
   <td style="text-align:right;"> 9994.220 </td>
   <td style="text-align:right;"> 21506.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36523.19814 </td>
   <td style="text-align:right;"> 803.379389 </td>
   <td style="text-align:right;"> 9464.005 </td>
   <td style="text-align:right;"> 21826.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36737.40815 </td>
   <td style="text-align:right;"> 820.533466 </td>
   <td style="text-align:right;"> 9558.228 </td>
   <td style="text-align:right;"> 21222.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12112.94502 </td>
   <td style="text-align:right;"> 437.180404 </td>
   <td style="text-align:right;"> 12209.863 </td>
   <td style="text-align:right;"> 21157.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36816.09795 </td>
   <td style="text-align:right;"> 814.161825 </td>
   <td style="text-align:right;"> 9759.541 </td>
   <td style="text-align:right;"> 21611.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32780.44148 </td>
   <td style="text-align:right;"> 766.013974 </td>
   <td style="text-align:right;"> 7933.783 </td>
   <td style="text-align:right;"> 21418.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24319.87808 </td>
   <td style="text-align:right;"> 635.980147 </td>
   <td style="text-align:right;"> 8877.536 </td>
   <td style="text-align:right;"> 21481.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21947.35516 </td>
   <td style="text-align:right;"> 560.049391 </td>
   <td style="text-align:right;"> 13643.937 </td>
   <td style="text-align:right;"> 21992.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15501.04756 </td>
   <td style="text-align:right;"> 470.777065 </td>
   <td style="text-align:right;"> 12819.569 </td>
   <td style="text-align:right;"> 21875.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -4419.02485 </td>
   <td style="text-align:right;"> 310.726297 </td>
   <td style="text-align:right;"> 13090.945 </td>
   <td style="text-align:right;"> 21863.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6361.65104 </td>
   <td style="text-align:right;"> 337.197533 </td>
   <td style="text-align:right;"> 14049.302 </td>
   <td style="text-align:right;"> 21945.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18731.81554 </td>
   <td style="text-align:right;"> 545.338029 </td>
   <td style="text-align:right;"> 10457.228 </td>
   <td style="text-align:right;"> 21430.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15204.33363 </td>
   <td style="text-align:right;"> 492.077454 </td>
   <td style="text-align:right;"> 10428.257 </td>
   <td style="text-align:right;"> 21115.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19707.46641 </td>
   <td style="text-align:right;"> 544.268959 </td>
   <td style="text-align:right;"> 10769.817 </td>
   <td style="text-align:right;"> 21515.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26576.69661 </td>
   <td style="text-align:right;"> 667.788326 </td>
   <td style="text-align:right;"> 10793.645 </td>
   <td style="text-align:right;"> 21295.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27365.91478 </td>
   <td style="text-align:right;"> 668.526771 </td>
   <td style="text-align:right;"> 9641.180 </td>
   <td style="text-align:right;"> 21909.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24107.99185 </td>
   <td style="text-align:right;"> 612.640484 </td>
   <td style="text-align:right;"> 11955.392 </td>
   <td style="text-align:right;"> 21216.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25180.04670 </td>
   <td style="text-align:right;"> 625.214217 </td>
   <td style="text-align:right;"> 9588.065 </td>
   <td style="text-align:right;"> 22074.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29498.14623 </td>
   <td style="text-align:right;"> 687.885235 </td>
   <td style="text-align:right;"> 9794.545 </td>
   <td style="text-align:right;"> 22235.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15556.56851 </td>
   <td style="text-align:right;"> 474.019470 </td>
   <td style="text-align:right;"> 13037.472 </td>
   <td style="text-align:right;"> 21857.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -4321.33016 </td>
   <td style="text-align:right;"> 322.899809 </td>
   <td style="text-align:right;"> 10477.406 </td>
   <td style="text-align:right;"> 21566.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -56322.24035 </td>
   <td style="text-align:right;"> 1120.433816 </td>
   <td style="text-align:right;"> 9573.701 </td>
   <td style="text-align:right;"> 21605.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31608.46884 </td>
   <td style="text-align:right;"> 738.535681 </td>
   <td style="text-align:right;"> 9620.961 </td>
   <td style="text-align:right;"> 22031.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20275.45108 </td>
   <td style="text-align:right;"> 562.087408 </td>
   <td style="text-align:right;"> 11600.369 </td>
   <td style="text-align:right;"> 21364.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26141.31630 </td>
   <td style="text-align:right;"> 672.851497 </td>
   <td style="text-align:right;"> 9195.494 </td>
   <td style="text-align:right;"> 21283.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29185.15373 </td>
   <td style="text-align:right;"> 686.047381 </td>
   <td style="text-align:right;"> 10221.733 </td>
   <td style="text-align:right;"> 21418.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21317.45311 </td>
   <td style="text-align:right;"> 588.678942 </td>
   <td style="text-align:right;"> 10154.599 </td>
   <td style="text-align:right;"> 21958.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32209.72751 </td>
   <td style="text-align:right;"> 731.197322 </td>
   <td style="text-align:right;"> 11945.083 </td>
   <td style="text-align:right;"> 20883.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7861.75937 </td>
   <td style="text-align:right;"> 380.276696 </td>
   <td style="text-align:right;"> 11537.302 </td>
   <td style="text-align:right;"> 22102.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -4336.55711 </td>
   <td style="text-align:right;"> 327.638038 </td>
   <td style="text-align:right;"> 11095.947 </td>
   <td style="text-align:right;"> 22006.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17500.94746 </td>
   <td style="text-align:right;"> 508.313465 </td>
   <td style="text-align:right;"> 13810.489 </td>
   <td style="text-align:right;"> 21864.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -4607.72916 </td>
   <td style="text-align:right;"> 315.669578 </td>
   <td style="text-align:right;"> 13283.377 </td>
   <td style="text-align:right;"> 21768.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7797.85686 </td>
   <td style="text-align:right;"> 382.662754 </td>
   <td style="text-align:right;"> 12809.687 </td>
   <td style="text-align:right;"> 21322.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30747.58270 </td>
   <td style="text-align:right;"> 725.352732 </td>
   <td style="text-align:right;"> 10306.044 </td>
   <td style="text-align:right;"> 21563.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22333.36754 </td>
   <td style="text-align:right;"> 584.372857 </td>
   <td style="text-align:right;"> 10792.707 </td>
   <td style="text-align:right;"> 21529.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35460.02461 </td>
   <td style="text-align:right;"> 795.380036 </td>
   <td style="text-align:right;"> 9806.256 </td>
   <td style="text-align:right;"> 21222.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32078.66054 </td>
   <td style="text-align:right;"> 752.407609 </td>
   <td style="text-align:right;"> 8276.251 </td>
   <td style="text-align:right;"> 21251.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32854.30186 </td>
   <td style="text-align:right;"> 761.758050 </td>
   <td style="text-align:right;"> 8651.074 </td>
   <td style="text-align:right;"> 21346.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9835.84040 </td>
   <td style="text-align:right;"> 403.835942 </td>
   <td style="text-align:right;"> 11940.952 </td>
   <td style="text-align:right;"> 21432.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6408.37260 </td>
   <td style="text-align:right;"> 356.035435 </td>
   <td style="text-align:right;"> 11565.475 </td>
   <td style="text-align:right;"> 21543.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37418.63695 </td>
   <td style="text-align:right;"> 830.665033 </td>
   <td style="text-align:right;"> 9196.091 </td>
   <td style="text-align:right;"> 21447.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9964.72042 </td>
   <td style="text-align:right;"> 404.739807 </td>
   <td style="text-align:right;"> 12033.147 </td>
   <td style="text-align:right;"> 21160.24 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -3032.18085 </td>
   <td style="text-align:right;"> 303.608217 </td>
   <td style="text-align:right;"> 11816.848 </td>
   <td style="text-align:right;"> 21274.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27577.13388 </td>
   <td style="text-align:right;"> 660.265593 </td>
   <td style="text-align:right;"> 11782.828 </td>
   <td style="text-align:right;"> 21113.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29554.65212 </td>
   <td style="text-align:right;"> 699.783798 </td>
   <td style="text-align:right;"> 9613.974 </td>
   <td style="text-align:right;"> 21493.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30598.75062 </td>
   <td style="text-align:right;"> 720.248061 </td>
   <td style="text-align:right;"> 10637.950 </td>
   <td style="text-align:right;"> 21381.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33495.55252 </td>
   <td style="text-align:right;"> 763.272086 </td>
   <td style="text-align:right;"> 10492.570 </td>
   <td style="text-align:right;"> 21063.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32443.61388 </td>
   <td style="text-align:right;"> 750.400831 </td>
   <td style="text-align:right;"> 11324.314 </td>
   <td style="text-align:right;"> 21596.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37715.41598 </td>
   <td style="text-align:right;"> 832.664236 </td>
   <td style="text-align:right;"> 10165.780 </td>
   <td style="text-align:right;"> 21750.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20761.70062 </td>
   <td style="text-align:right;"> 582.135616 </td>
   <td style="text-align:right;"> 10653.223 </td>
   <td style="text-align:right;"> 20668.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17952.53436 </td>
   <td style="text-align:right;"> 524.573305 </td>
   <td style="text-align:right;"> 12399.210 </td>
   <td style="text-align:right;"> 21505.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -53032.48540 </td>
   <td style="text-align:right;"> 1058.424576 </td>
   <td style="text-align:right;"> 9003.577 </td>
   <td style="text-align:right;"> 21196.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -49510.32916 </td>
   <td style="text-align:right;"> 1010.801525 </td>
   <td style="text-align:right;"> 8903.652 </td>
   <td style="text-align:right;"> 21256.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36762.52729 </td>
   <td style="text-align:right;"> 821.729969 </td>
   <td style="text-align:right;"> 8736.093 </td>
   <td style="text-align:right;"> 21242.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -45929.57131 </td>
   <td style="text-align:right;"> 942.545537 </td>
   <td style="text-align:right;"> 8677.074 </td>
   <td style="text-align:right;"> 21233.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29759.36664 </td>
   <td style="text-align:right;"> 693.024950 </td>
   <td style="text-align:right;"> 9841.826 </td>
   <td style="text-align:right;"> 21042.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35190.62778 </td>
   <td style="text-align:right;"> 777.330727 </td>
   <td style="text-align:right;"> 9881.236 </td>
   <td style="text-align:right;"> 21503.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24307.58265 </td>
   <td style="text-align:right;"> 632.212593 </td>
   <td style="text-align:right;"> 11173.639 </td>
   <td style="text-align:right;"> 21294.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30099.81558 </td>
   <td style="text-align:right;"> 711.837981 </td>
   <td style="text-align:right;"> 9360.986 </td>
   <td style="text-align:right;"> 21276.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11000.96630 </td>
   <td style="text-align:right;"> 434.473139 </td>
   <td style="text-align:right;"> 10960.877 </td>
   <td style="text-align:right;"> 21444.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15300.77461 </td>
   <td style="text-align:right;"> 498.455100 </td>
   <td style="text-align:right;"> 10681.578 </td>
   <td style="text-align:right;"> 21422.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16979.48620 </td>
   <td style="text-align:right;"> 510.142508 </td>
   <td style="text-align:right;"> 10003.218 </td>
   <td style="text-align:right;"> 21326.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18223.34326 </td>
   <td style="text-align:right;"> 519.809643 </td>
   <td style="text-align:right;"> 11220.246 </td>
   <td style="text-align:right;"> 21203.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8789.43487 </td>
   <td style="text-align:right;"> 386.643201 </td>
   <td style="text-align:right;"> 12622.520 </td>
   <td style="text-align:right;"> 21168.43 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25877.72181 </td>
   <td style="text-align:right;"> 635.258965 </td>
   <td style="text-align:right;"> 10364.965 </td>
   <td style="text-align:right;"> 21839.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31283.03829 </td>
   <td style="text-align:right;"> 748.967320 </td>
   <td style="text-align:right;"> 9532.737 </td>
   <td style="text-align:right;"> 21153.94 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19061.61782 </td>
   <td style="text-align:right;"> 531.127110 </td>
   <td style="text-align:right;"> 12128.922 </td>
   <td style="text-align:right;"> 21978.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7498.81278 </td>
   <td style="text-align:right;"> 366.438964 </td>
   <td style="text-align:right;"> 12792.988 </td>
   <td style="text-align:right;"> 20865.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12923.16714 </td>
   <td style="text-align:right;"> 440.674526 </td>
   <td style="text-align:right;"> 12297.293 </td>
   <td style="text-align:right;"> 21635.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30726.14066 </td>
   <td style="text-align:right;"> 718.189624 </td>
   <td style="text-align:right;"> 10477.961 </td>
   <td style="text-align:right;"> 20835.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43879.83183 </td>
   <td style="text-align:right;"> 928.388121 </td>
   <td style="text-align:right;"> 8613.144 </td>
   <td style="text-align:right;"> 21964.43 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32698.20688 </td>
   <td style="text-align:right;"> 747.679940 </td>
   <td style="text-align:right;"> 9601.100 </td>
   <td style="text-align:right;"> 21467.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23375.10161 </td>
   <td style="text-align:right;"> 617.031126 </td>
   <td style="text-align:right;"> 10991.873 </td>
   <td style="text-align:right;"> 21335.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32479.79029 </td>
   <td style="text-align:right;"> 758.359672 </td>
   <td style="text-align:right;"> 9456.531 </td>
   <td style="text-align:right;"> 20952.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28959.74960 </td>
   <td style="text-align:right;"> 694.541809 </td>
   <td style="text-align:right;"> 11323.033 </td>
   <td style="text-align:right;"> 20750.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28017.52089 </td>
   <td style="text-align:right;"> 678.048568 </td>
   <td style="text-align:right;"> 9546.145 </td>
   <td style="text-align:right;"> 21451.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20729.63227 </td>
   <td style="text-align:right;"> 575.362073 </td>
   <td style="text-align:right;"> 11102.439 </td>
   <td style="text-align:right;"> 21274.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35649.93069 </td>
   <td style="text-align:right;"> 808.563765 </td>
   <td style="text-align:right;"> 9133.694 </td>
   <td style="text-align:right;"> 21379.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28639.12221 </td>
   <td style="text-align:right;"> 682.191857 </td>
   <td style="text-align:right;"> 10668.461 </td>
   <td style="text-align:right;"> 21396.94 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35197.75041 </td>
   <td style="text-align:right;"> 787.395693 </td>
   <td style="text-align:right;"> 10229.997 </td>
   <td style="text-align:right;"> 20942.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29998.62938 </td>
   <td style="text-align:right;"> 708.090344 </td>
   <td style="text-align:right;"> 9862.944 </td>
   <td style="text-align:right;"> 20421.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19974.32943 </td>
   <td style="text-align:right;"> 547.915592 </td>
   <td style="text-align:right;"> 11566.482 </td>
   <td style="text-align:right;"> 20660.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22049.85420 </td>
   <td style="text-align:right;"> 580.578814 </td>
   <td style="text-align:right;"> 11476.214 </td>
   <td style="text-align:right;"> 20708.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18866.13174 </td>
   <td style="text-align:right;"> 537.314177 </td>
   <td style="text-align:right;"> 12450.588 </td>
   <td style="text-align:right;"> 22062.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19287.78976 </td>
   <td style="text-align:right;"> 537.228420 </td>
   <td style="text-align:right;"> 12456.862 </td>
   <td style="text-align:right;"> 21918.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10524.99573 </td>
   <td style="text-align:right;"> 421.710256 </td>
   <td style="text-align:right;"> 11599.056 </td>
   <td style="text-align:right;"> 21562.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21667.95520 </td>
   <td style="text-align:right;"> 574.702145 </td>
   <td style="text-align:right;"> 11534.268 </td>
   <td style="text-align:right;"> 21405.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14306.09002 </td>
   <td style="text-align:right;"> 455.154867 </td>
   <td style="text-align:right;"> 12702.004 </td>
   <td style="text-align:right;"> 20758.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17455.45956 </td>
   <td style="text-align:right;"> 516.915016 </td>
   <td style="text-align:right;"> 11158.822 </td>
   <td style="text-align:right;"> 21902.05 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34158.68178 </td>
   <td style="text-align:right;"> 777.241780 </td>
   <td style="text-align:right;"> 9126.614 </td>
   <td style="text-align:right;"> 21044.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46064.60996 </td>
   <td style="text-align:right;"> 956.454034 </td>
   <td style="text-align:right;"> 8838.770 </td>
   <td style="text-align:right;"> 20879.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -50676.84969 </td>
   <td style="text-align:right;"> 1035.414517 </td>
   <td style="text-align:right;"> 6619.787 </td>
   <td style="text-align:right;"> 21697.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44767.34159 </td>
   <td style="text-align:right;"> 952.710325 </td>
   <td style="text-align:right;"> 8257.265 </td>
   <td style="text-align:right;"> 21339.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13721.72196 </td>
   <td style="text-align:right;"> 452.476809 </td>
   <td style="text-align:right;"> 11996.625 </td>
   <td style="text-align:right;"> 20808.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21941.15736 </td>
   <td style="text-align:right;"> 569.887696 </td>
   <td style="text-align:right;"> 11460.653 </td>
   <td style="text-align:right;"> 20819.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40785.00320 </td>
   <td style="text-align:right;"> 884.722816 </td>
   <td style="text-align:right;"> 8964.020 </td>
   <td style="text-align:right;"> 21623.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42630.63745 </td>
   <td style="text-align:right;"> 911.422994 </td>
   <td style="text-align:right;"> 8596.424 </td>
   <td style="text-align:right;"> 21532.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39690.45613 </td>
   <td style="text-align:right;"> 866.263211 </td>
   <td style="text-align:right;"> 7860.242 </td>
   <td style="text-align:right;"> 21819.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44433.27574 </td>
   <td style="text-align:right;"> 926.212318 </td>
   <td style="text-align:right;"> 9837.578 </td>
   <td style="text-align:right;"> 22041.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42141.26863 </td>
   <td style="text-align:right;"> 893.475842 </td>
   <td style="text-align:right;"> 9518.442 </td>
   <td style="text-align:right;"> 21926.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18848.59349 </td>
   <td style="text-align:right;"> 533.930154 </td>
   <td style="text-align:right;"> 12358.938 </td>
   <td style="text-align:right;"> 20802.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19604.23363 </td>
   <td style="text-align:right;"> 545.154025 </td>
   <td style="text-align:right;"> 11646.528 </td>
   <td style="text-align:right;"> 22026.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17069.61885 </td>
   <td style="text-align:right;"> 508.421234 </td>
   <td style="text-align:right;"> 11740.007 </td>
   <td style="text-align:right;"> 21598.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23765.55396 </td>
   <td style="text-align:right;"> 602.300003 </td>
   <td style="text-align:right;"> 11174.991 </td>
   <td style="text-align:right;"> 21005.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37380.55993 </td>
   <td style="text-align:right;"> 840.771758 </td>
   <td style="text-align:right;"> 9421.486 </td>
   <td style="text-align:right;"> 21736.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16715.49580 </td>
   <td style="text-align:right;"> 489.981271 </td>
   <td style="text-align:right;"> 11929.773 </td>
   <td style="text-align:right;"> 21441.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34406.40927 </td>
   <td style="text-align:right;"> 794.075075 </td>
   <td style="text-align:right;"> 8623.349 </td>
   <td style="text-align:right;"> 21135.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -52553.04196 </td>
   <td style="text-align:right;"> 1075.019301 </td>
   <td style="text-align:right;"> 7946.677 </td>
   <td style="text-align:right;"> 22318.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40248.82432 </td>
   <td style="text-align:right;"> 886.536583 </td>
   <td style="text-align:right;"> 7927.679 </td>
   <td style="text-align:right;"> 21141.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43786.14486 </td>
   <td style="text-align:right;"> 935.834534 </td>
   <td style="text-align:right;"> 8332.562 </td>
   <td style="text-align:right;"> 21091.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35952.40483 </td>
   <td style="text-align:right;"> 814.798674 </td>
   <td style="text-align:right;"> 9454.567 </td>
   <td style="text-align:right;"> 21681.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9119.22310 </td>
   <td style="text-align:right;"> 396.910757 </td>
   <td style="text-align:right;"> 11970.949 </td>
   <td style="text-align:right;"> 21501.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5334.23010 </td>
   <td style="text-align:right;"> 149.481601 </td>
   <td style="text-align:right;"> 14970.178 </td>
   <td style="text-align:right;"> 21484.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7678.10554 </td>
   <td style="text-align:right;"> 111.620019 </td>
   <td style="text-align:right;"> 15008.865 </td>
   <td style="text-align:right;"> 21410.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5370.80347 </td>
   <td style="text-align:right;"> 163.552375 </td>
   <td style="text-align:right;"> 13747.905 </td>
   <td style="text-align:right;"> 21605.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41066.61689 </td>
   <td style="text-align:right;"> 878.037328 </td>
   <td style="text-align:right;"> 9002.291 </td>
   <td style="text-align:right;"> 21270.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13262.25157 </td>
   <td style="text-align:right;"> 451.954172 </td>
   <td style="text-align:right;"> 11990.173 </td>
   <td style="text-align:right;"> 21467.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20846.86684 </td>
   <td style="text-align:right;"> 561.068016 </td>
   <td style="text-align:right;"> 11432.540 </td>
   <td style="text-align:right;"> 21215.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24970.98296 </td>
   <td style="text-align:right;"> 637.451827 </td>
   <td style="text-align:right;"> 10940.976 </td>
   <td style="text-align:right;"> 21244.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46466.60904 </td>
   <td style="text-align:right;"> 969.674018 </td>
   <td style="text-align:right;"> 7526.095 </td>
   <td style="text-align:right;"> 21612.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43907.06155 </td>
   <td style="text-align:right;"> 926.021526 </td>
   <td style="text-align:right;"> 9529.824 </td>
   <td style="text-align:right;"> 22005.73 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20398.20616 </td>
   <td style="text-align:right;"> 570.735807 </td>
   <td style="text-align:right;"> 11197.377 </td>
   <td style="text-align:right;"> 21075.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15930.13503 </td>
   <td style="text-align:right;"> 499.207473 </td>
   <td style="text-align:right;"> 10901.155 </td>
   <td style="text-align:right;"> 21406.94 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26950.67538 </td>
   <td style="text-align:right;"> 663.574009 </td>
   <td style="text-align:right;"> 10617.175 </td>
   <td style="text-align:right;"> 21207.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34412.22454 </td>
   <td style="text-align:right;"> 786.819358 </td>
   <td style="text-align:right;"> 9509.027 </td>
   <td style="text-align:right;"> 21517.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26000.38268 </td>
   <td style="text-align:right;"> 653.092345 </td>
   <td style="text-align:right;"> 10874.207 </td>
   <td style="text-align:right;"> 21405.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38563.77674 </td>
   <td style="text-align:right;"> 839.724150 </td>
   <td style="text-align:right;"> 10941.873 </td>
   <td style="text-align:right;"> 21727.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32246.40749 </td>
   <td style="text-align:right;"> 725.801827 </td>
   <td style="text-align:right;"> 12929.013 </td>
   <td style="text-align:right;"> 21104.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29211.78651 </td>
   <td style="text-align:right;"> 685.846098 </td>
   <td style="text-align:right;"> 12157.093 </td>
   <td style="text-align:right;"> 21409.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -45856.35222 </td>
   <td style="text-align:right;"> 935.738293 </td>
   <td style="text-align:right;"> 11266.266 </td>
   <td style="text-align:right;"> 21029.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4799.53100 </td>
   <td style="text-align:right;"> 180.845623 </td>
   <td style="text-align:right;"> 11511.253 </td>
   <td style="text-align:right;"> 21746.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38646.45768 </td>
   <td style="text-align:right;"> 832.346829 </td>
   <td style="text-align:right;"> 11959.027 </td>
   <td style="text-align:right;"> 21598.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35431.50692 </td>
   <td style="text-align:right;"> 792.108580 </td>
   <td style="text-align:right;"> 11678.302 </td>
   <td style="text-align:right;"> 21704.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29705.04418 </td>
   <td style="text-align:right;"> 708.460913 </td>
   <td style="text-align:right;"> 8523.304 </td>
   <td style="text-align:right;"> 20946.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -53283.74395 </td>
   <td style="text-align:right;"> 1061.178670 </td>
   <td style="text-align:right;"> 9042.705 </td>
   <td style="text-align:right;"> 20932.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22101.06193 </td>
   <td style="text-align:right;"> 600.121950 </td>
   <td style="text-align:right;"> 9647.926 </td>
   <td style="text-align:right;"> 21227.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25941.66302 </td>
   <td style="text-align:right;"> 639.137246 </td>
   <td style="text-align:right;"> 12281.561 </td>
   <td style="text-align:right;"> 21427.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24011.83696 </td>
   <td style="text-align:right;"> 608.843602 </td>
   <td style="text-align:right;"> 12397.245 </td>
   <td style="text-align:right;"> 21158.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7056.37390 </td>
   <td style="text-align:right;"> 356.088220 </td>
   <td style="text-align:right;"> 11866.389 </td>
   <td style="text-align:right;"> 21424.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14702.67514 </td>
   <td style="text-align:right;"> 462.446793 </td>
   <td style="text-align:right;"> 12516.934 </td>
   <td style="text-align:right;"> 21486.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34609.36944 </td>
   <td style="text-align:right;"> 781.361318 </td>
   <td style="text-align:right;"> 9048.728 </td>
   <td style="text-align:right;"> 21526.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35219.14511 </td>
   <td style="text-align:right;"> 792.429583 </td>
   <td style="text-align:right;"> 8442.232 </td>
   <td style="text-align:right;"> 21902.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17552.17475 </td>
   <td style="text-align:right;"> 523.438497 </td>
   <td style="text-align:right;"> 12114.076 </td>
   <td style="text-align:right;"> 20881.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21218.90586 </td>
   <td style="text-align:right;"> 592.602115 </td>
   <td style="text-align:right;"> 9392.543 </td>
   <td style="text-align:right;"> 20806.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27905.18460 </td>
   <td style="text-align:right;"> 666.550849 </td>
   <td style="text-align:right;"> 11532.925 </td>
   <td style="text-align:right;"> 21367.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13122.49245 </td>
   <td style="text-align:right;"> 434.651348 </td>
   <td style="text-align:right;"> 13374.352 </td>
   <td style="text-align:right;"> 21404.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11043.19393 </td>
   <td style="text-align:right;"> 412.205412 </td>
   <td style="text-align:right;"> 12117.742 </td>
   <td style="text-align:right;"> 21545.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15010.72864 </td>
   <td style="text-align:right;"> 466.563524 </td>
   <td style="text-align:right;"> 13932.990 </td>
   <td style="text-align:right;"> 21480.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24466.93725 </td>
   <td style="text-align:right;"> 640.160180 </td>
   <td style="text-align:right;"> 8682.863 </td>
   <td style="text-align:right;"> 21754.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28496.01266 </td>
   <td style="text-align:right;"> 694.136563 </td>
   <td style="text-align:right;"> 10303.157 </td>
   <td style="text-align:right;"> 21778.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12237.78957 </td>
   <td style="text-align:right;"> 454.024235 </td>
   <td style="text-align:right;"> 12245.752 </td>
   <td style="text-align:right;"> 21138.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16131.18948 </td>
   <td style="text-align:right;"> 510.392356 </td>
   <td style="text-align:right;"> 12485.947 </td>
   <td style="text-align:right;"> 21244.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26671.82110 </td>
   <td style="text-align:right;"> 646.944653 </td>
   <td style="text-align:right;"> 11536.881 </td>
   <td style="text-align:right;"> 21374.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32085.42900 </td>
   <td style="text-align:right;"> 750.958738 </td>
   <td style="text-align:right;"> 10291.430 </td>
   <td style="text-align:right;"> 21375.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20961.98536 </td>
   <td style="text-align:right;"> 591.695337 </td>
   <td style="text-align:right;"> 9557.841 </td>
   <td style="text-align:right;"> 21354.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17513.53501 </td>
   <td style="text-align:right;"> 523.723635 </td>
   <td style="text-align:right;"> 12150.313 </td>
   <td style="text-align:right;"> 21054.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19490.19790 </td>
   <td style="text-align:right;"> 557.625735 </td>
   <td style="text-align:right;"> 11577.908 </td>
   <td style="text-align:right;"> 20931.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17834.39057 </td>
   <td style="text-align:right;"> 539.875098 </td>
   <td style="text-align:right;"> 9555.789 </td>
   <td style="text-align:right;"> 20626.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22859.61381 </td>
   <td style="text-align:right;"> 594.976631 </td>
   <td style="text-align:right;"> 12382.604 </td>
   <td style="text-align:right;"> 21439.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24184.05210 </td>
   <td style="text-align:right;"> 616.828723 </td>
   <td style="text-align:right;"> 12016.645 </td>
   <td style="text-align:right;"> 21754.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41247.54358 </td>
   <td style="text-align:right;"> 866.911945 </td>
   <td style="text-align:right;"> 10777.867 </td>
   <td style="text-align:right;"> 21164.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19488.79440 </td>
   <td style="text-align:right;"> 546.946502 </td>
   <td style="text-align:right;"> 11657.873 </td>
   <td style="text-align:right;"> 21539.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20099.33693 </td>
   <td style="text-align:right;"> 561.440664 </td>
   <td style="text-align:right;"> 9971.242 </td>
   <td style="text-align:right;"> 20946.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14971.07916 </td>
   <td style="text-align:right;"> 481.745971 </td>
   <td style="text-align:right;"> 11209.453 </td>
   <td style="text-align:right;"> 21806.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22691.35654 </td>
   <td style="text-align:right;"> 611.331274 </td>
   <td style="text-align:right;"> 9822.229 </td>
   <td style="text-align:right;"> 20973.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21847.98684 </td>
   <td style="text-align:right;"> 602.013918 </td>
   <td style="text-align:right;"> 9456.225 </td>
   <td style="text-align:right;"> 20970.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28373.49288 </td>
   <td style="text-align:right;"> 668.390981 </td>
   <td style="text-align:right;"> 12250.648 </td>
   <td style="text-align:right;"> 21308.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29400.65515 </td>
   <td style="text-align:right;"> 696.985546 </td>
   <td style="text-align:right;"> 11179.120 </td>
   <td style="text-align:right;"> 21292.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14273.97531 </td>
   <td style="text-align:right;"> 462.841631 </td>
   <td style="text-align:right;"> 12496.962 </td>
   <td style="text-align:right;"> 21448.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29533.13473 </td>
   <td style="text-align:right;"> 702.590541 </td>
   <td style="text-align:right;"> 10876.489 </td>
   <td style="text-align:right;"> 21415.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21056.02168 </td>
   <td style="text-align:right;"> 576.394543 </td>
   <td style="text-align:right;"> 10133.454 </td>
   <td style="text-align:right;"> 21035.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43187.82268 </td>
   <td style="text-align:right;"> 928.979517 </td>
   <td style="text-align:right;"> 7487.734 </td>
   <td style="text-align:right;"> 21899.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31078.74520 </td>
   <td style="text-align:right;"> 723.040878 </td>
   <td style="text-align:right;"> 9752.582 </td>
   <td style="text-align:right;"> 20884.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20051.43929 </td>
   <td style="text-align:right;"> 574.274883 </td>
   <td style="text-align:right;"> 8894.137 </td>
   <td style="text-align:right;"> 21792.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21056.74337 </td>
   <td style="text-align:right;"> 562.359081 </td>
   <td style="text-align:right;"> 11354.748 </td>
   <td style="text-align:right;"> 21500.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23601.74444 </td>
   <td style="text-align:right;"> 619.725021 </td>
   <td style="text-align:right;"> 10382.136 </td>
   <td style="text-align:right;"> 21369.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18160.82981 </td>
   <td style="text-align:right;"> 525.189886 </td>
   <td style="text-align:right;"> 11592.626 </td>
   <td style="text-align:right;"> 21755.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6654.25511 </td>
   <td style="text-align:right;"> 334.716509 </td>
   <td style="text-align:right;"> 13540.932 </td>
   <td style="text-align:right;"> 20928.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15697.31630 </td>
   <td style="text-align:right;"> 479.226415 </td>
   <td style="text-align:right;"> 11471.574 </td>
   <td style="text-align:right;"> 21371.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41808.58032 </td>
   <td style="text-align:right;"> 908.773249 </td>
   <td style="text-align:right;"> 8995.988 </td>
   <td style="text-align:right;"> 21340.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -49337.01561 </td>
   <td style="text-align:right;"> 1026.044438 </td>
   <td style="text-align:right;"> 8706.973 </td>
   <td style="text-align:right;"> 21478.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39040.64801 </td>
   <td style="text-align:right;"> 871.606710 </td>
   <td style="text-align:right;"> 8309.602 </td>
   <td style="text-align:right;"> 22061.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33580.93928 </td>
   <td style="text-align:right;"> 763.642137 </td>
   <td style="text-align:right;"> 10820.578 </td>
   <td style="text-align:right;"> 21187.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13097.98616 </td>
   <td style="text-align:right;"> 448.902093 </td>
   <td style="text-align:right;"> 11085.321 </td>
   <td style="text-align:right;"> 20654.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11181.90793 </td>
   <td style="text-align:right;"> 413.320035 </td>
   <td style="text-align:right;"> 12130.861 </td>
   <td style="text-align:right;"> 20495.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 376.43885 </td>
   <td style="text-align:right;"> 230.874793 </td>
   <td style="text-align:right;"> 13946.751 </td>
   <td style="text-align:right;"> 22279.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 17606.91259 </td>
   <td style="text-align:right;"> -26.444423 </td>
   <td style="text-align:right;"> 15466.706 </td>
   <td style="text-align:right;"> 21866.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19009.77006 </td>
   <td style="text-align:right;"> 534.241928 </td>
   <td style="text-align:right;"> 11785.423 </td>
   <td style="text-align:right;"> 21627.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39855.66252 </td>
   <td style="text-align:right;"> 866.519749 </td>
   <td style="text-align:right;"> 9490.911 </td>
   <td style="text-align:right;"> 21109.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -55798.68013 </td>
   <td style="text-align:right;"> 1115.321874 </td>
   <td style="text-align:right;"> 6309.932 </td>
   <td style="text-align:right;"> 21487.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46008.32656 </td>
   <td style="text-align:right;"> 956.060687 </td>
   <td style="text-align:right;"> 9791.333 </td>
   <td style="text-align:right;"> 21314.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24357.59166 </td>
   <td style="text-align:right;"> 645.661720 </td>
   <td style="text-align:right;"> 9154.445 </td>
   <td style="text-align:right;"> 20420.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26157.93519 </td>
   <td style="text-align:right;"> 668.459131 </td>
   <td style="text-align:right;"> 9726.385 </td>
   <td style="text-align:right;"> 20501.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10119.75054 </td>
   <td style="text-align:right;"> 392.516140 </td>
   <td style="text-align:right;"> 11905.417 </td>
   <td style="text-align:right;"> 22389.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20259.96720 </td>
   <td style="text-align:right;"> 556.026952 </td>
   <td style="text-align:right;"> 10545.496 </td>
   <td style="text-align:right;"> 22235.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20411.45643 </td>
   <td style="text-align:right;"> 557.317632 </td>
   <td style="text-align:right;"> 10825.143 </td>
   <td style="text-align:right;"> 22245.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7697.94532 </td>
   <td style="text-align:right;"> 375.772857 </td>
   <td style="text-align:right;"> 11141.731 </td>
   <td style="text-align:right;"> 20634.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33387.89484 </td>
   <td style="text-align:right;"> 761.167951 </td>
   <td style="text-align:right;"> 11287.399 </td>
   <td style="text-align:right;"> 21542.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10216.14889 </td>
   <td style="text-align:right;"> 410.163206 </td>
   <td style="text-align:right;"> 11841.693 </td>
   <td style="text-align:right;"> 21318.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13100.58397 </td>
   <td style="text-align:right;"> 455.684024 </td>
   <td style="text-align:right;"> 11563.617 </td>
   <td style="text-align:right;"> 21384.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25143.66035 </td>
   <td style="text-align:right;"> 633.443547 </td>
   <td style="text-align:right;"> 11037.822 </td>
   <td style="text-align:right;"> 21792.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28002.70247 </td>
   <td style="text-align:right;"> 680.231967 </td>
   <td style="text-align:right;"> 10735.145 </td>
   <td style="text-align:right;"> 20943.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6879.69891 </td>
   <td style="text-align:right;"> 355.909105 </td>
   <td style="text-align:right;"> 12372.182 </td>
   <td style="text-align:right;"> 21197.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13665.46354 </td>
   <td style="text-align:right;"> 458.542680 </td>
   <td style="text-align:right;"> 11559.977 </td>
   <td style="text-align:right;"> 21701.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23700.59999 </td>
   <td style="text-align:right;"> 603.682617 </td>
   <td style="text-align:right;"> 11912.388 </td>
   <td style="text-align:right;"> 20951.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9088.96334 </td>
   <td style="text-align:right;"> 393.212734 </td>
   <td style="text-align:right;"> 11788.947 </td>
   <td style="text-align:right;"> 21735.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13471.98392 </td>
   <td style="text-align:right;"> 447.585110 </td>
   <td style="text-align:right;"> 12444.627 </td>
   <td style="text-align:right;"> 21054.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10250.47202 </td>
   <td style="text-align:right;"> 432.578709 </td>
   <td style="text-align:right;"> 11957.743 </td>
   <td style="text-align:right;"> 21435.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27204.76233 </td>
   <td style="text-align:right;"> 660.754817 </td>
   <td style="text-align:right;"> 11592.008 </td>
   <td style="text-align:right;"> 21723.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19059.81492 </td>
   <td style="text-align:right;"> 535.961165 </td>
   <td style="text-align:right;"> 10142.470 </td>
   <td style="text-align:right;"> 21626.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42442.33277 </td>
   <td style="text-align:right;"> 903.002984 </td>
   <td style="text-align:right;"> 10344.097 </td>
   <td style="text-align:right;"> 21070.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11726.88324 </td>
   <td style="text-align:right;"> 426.795188 </td>
   <td style="text-align:right;"> 10690.778 </td>
   <td style="text-align:right;"> 21503.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44692.17644 </td>
   <td style="text-align:right;"> 945.094486 </td>
   <td style="text-align:right;"> 8612.843 </td>
   <td style="text-align:right;"> 20994.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -47716.88449 </td>
   <td style="text-align:right;"> 998.558997 </td>
   <td style="text-align:right;"> 8576.245 </td>
   <td style="text-align:right;"> 21777.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41394.26046 </td>
   <td style="text-align:right;"> 904.008588 </td>
   <td style="text-align:right;"> 7550.226 </td>
   <td style="text-align:right;"> 21248.36 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34185.53519 </td>
   <td style="text-align:right;"> 774.065787 </td>
   <td style="text-align:right;"> 10692.515 </td>
   <td style="text-align:right;"> 21118.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10334.95881 </td>
   <td style="text-align:right;"> 420.011380 </td>
   <td style="text-align:right;"> 10300.774 </td>
   <td style="text-align:right;"> 22297.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23691.58640 </td>
   <td style="text-align:right;"> 626.129604 </td>
   <td style="text-align:right;"> 8569.730 </td>
   <td style="text-align:right;"> 21950.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37087.02603 </td>
   <td style="text-align:right;"> 813.720033 </td>
   <td style="text-align:right;"> 10906.255 </td>
   <td style="text-align:right;"> 21700.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28643.60887 </td>
   <td style="text-align:right;"> 697.066139 </td>
   <td style="text-align:right;"> 11825.432 </td>
   <td style="text-align:right;"> 21545.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15846.91285 </td>
   <td style="text-align:right;"> 509.573413 </td>
   <td style="text-align:right;"> 10095.696 </td>
   <td style="text-align:right;"> 21258.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19543.40090 </td>
   <td style="text-align:right;"> 559.698422 </td>
   <td style="text-align:right;"> 10897.051 </td>
   <td style="text-align:right;"> 21262.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19150.72554 </td>
   <td style="text-align:right;"> 549.442833 </td>
   <td style="text-align:right;"> 10859.382 </td>
   <td style="text-align:right;"> 21649.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23552.59183 </td>
   <td style="text-align:right;"> 602.452096 </td>
   <td style="text-align:right;"> 11519.858 </td>
   <td style="text-align:right;"> 21323.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -413.44598 </td>
   <td style="text-align:right;"> 240.250700 </td>
   <td style="text-align:right;"> 13449.988 </td>
   <td style="text-align:right;"> 22155.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -683.24708 </td>
   <td style="text-align:right;"> 252.641790 </td>
   <td style="text-align:right;"> 13167.386 </td>
   <td style="text-align:right;"> 21827.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26676.47446 </td>
   <td style="text-align:right;"> 662.618091 </td>
   <td style="text-align:right;"> 11527.703 </td>
   <td style="text-align:right;"> 21486.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43043.71470 </td>
   <td style="text-align:right;"> 908.250378 </td>
   <td style="text-align:right;"> 7872.705 </td>
   <td style="text-align:right;"> 21230.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37140.89075 </td>
   <td style="text-align:right;"> 820.093300 </td>
   <td style="text-align:right;"> 10629.367 </td>
   <td style="text-align:right;"> 21873.36 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24204.87382 </td>
   <td style="text-align:right;"> 624.509060 </td>
   <td style="text-align:right;"> 9591.336 </td>
   <td style="text-align:right;"> 21516.84 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31977.97025 </td>
   <td style="text-align:right;"> 735.326480 </td>
   <td style="text-align:right;"> 11679.938 </td>
   <td style="text-align:right;"> 21134.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13642.44562 </td>
   <td style="text-align:right;"> 456.254069 </td>
   <td style="text-align:right;"> 10128.004 </td>
   <td style="text-align:right;"> 21307.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -49312.62062 </td>
   <td style="text-align:right;"> 995.949597 </td>
   <td style="text-align:right;"> 10173.376 </td>
   <td style="text-align:right;"> 21822.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23351.32546 </td>
   <td style="text-align:right;"> 618.982762 </td>
   <td style="text-align:right;"> 8210.133 </td>
   <td style="text-align:right;"> 21847.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34868.57737 </td>
   <td style="text-align:right;"> 762.787461 </td>
   <td style="text-align:right;"> 12545.931 </td>
   <td style="text-align:right;"> 21461.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30501.62583 </td>
   <td style="text-align:right;"> 706.940921 </td>
   <td style="text-align:right;"> 10425.090 </td>
   <td style="text-align:right;"> 21712.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28200.09911 </td>
   <td style="text-align:right;"> 691.637595 </td>
   <td style="text-align:right;"> 11030.443 </td>
   <td style="text-align:right;"> 21456.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16316.21808 </td>
   <td style="text-align:right;"> 505.218551 </td>
   <td style="text-align:right;"> 11317.441 </td>
   <td style="text-align:right;"> 20852.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26172.53578 </td>
   <td style="text-align:right;"> 644.161118 </td>
   <td style="text-align:right;"> 10258.598 </td>
   <td style="text-align:right;"> 21640.84 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30023.22793 </td>
   <td style="text-align:right;"> 700.997456 </td>
   <td style="text-align:right;"> 10384.343 </td>
   <td style="text-align:right;"> 21642.24 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38897.91272 </td>
   <td style="text-align:right;"> 850.830630 </td>
   <td style="text-align:right;"> 9388.728 </td>
   <td style="text-align:right;"> 21075.24 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7610.06573 </td>
   <td style="text-align:right;"> 361.123071 </td>
   <td style="text-align:right;"> 12363.426 </td>
   <td style="text-align:right;"> 21662.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15521.57843 </td>
   <td style="text-align:right;"> 471.912764 </td>
   <td style="text-align:right;"> 12424.911 </td>
   <td style="text-align:right;"> 21494.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23689.45639 </td>
   <td style="text-align:right;"> 604.901286 </td>
   <td style="text-align:right;"> 10816.603 </td>
   <td style="text-align:right;"> 21638.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35529.98243 </td>
   <td style="text-align:right;"> 805.469358 </td>
   <td style="text-align:right;"> 9535.170 </td>
   <td style="text-align:right;"> 20990.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32134.35019 </td>
   <td style="text-align:right;"> 732.110247 </td>
   <td style="text-align:right;"> 10988.819 </td>
   <td style="text-align:right;"> 21615.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39225.58244 </td>
   <td style="text-align:right;"> 854.507434 </td>
   <td style="text-align:right;"> 8095.906 </td>
   <td style="text-align:right;"> 21255.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -51152.01387 </td>
   <td style="text-align:right;"> 1036.239973 </td>
   <td style="text-align:right;"> 7880.145 </td>
   <td style="text-align:right;"> 20544.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26130.95339 </td>
   <td style="text-align:right;"> 645.924923 </td>
   <td style="text-align:right;"> 11145.361 </td>
   <td style="text-align:right;"> 21869.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26649.67375 </td>
   <td style="text-align:right;"> 656.290280 </td>
   <td style="text-align:right;"> 9712.980 </td>
   <td style="text-align:right;"> 21530.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17790.95585 </td>
   <td style="text-align:right;"> 527.311643 </td>
   <td style="text-align:right;"> 11165.732 </td>
   <td style="text-align:right;"> 21169.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29192.40014 </td>
   <td style="text-align:right;"> 714.292994 </td>
   <td style="text-align:right;"> 10040.176 </td>
   <td style="text-align:right;"> 21573.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24554.61931 </td>
   <td style="text-align:right;"> 608.060057 </td>
   <td style="text-align:right;"> 11399.252 </td>
   <td style="text-align:right;"> 21046.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25909.57579 </td>
   <td style="text-align:right;"> 659.572173 </td>
   <td style="text-align:right;"> 10127.277 </td>
   <td style="text-align:right;"> 21124.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28314.03265 </td>
   <td style="text-align:right;"> 684.409428 </td>
   <td style="text-align:right;"> 10659.597 </td>
   <td style="text-align:right;"> 21228.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27738.81599 </td>
   <td style="text-align:right;"> 671.060369 </td>
   <td style="text-align:right;"> 11029.192 </td>
   <td style="text-align:right;"> 21600.43 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29418.30050 </td>
   <td style="text-align:right;"> 695.699859 </td>
   <td style="text-align:right;"> 10557.368 </td>
   <td style="text-align:right;"> 21276.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33463.56997 </td>
   <td style="text-align:right;"> 763.210151 </td>
   <td style="text-align:right;"> 9287.083 </td>
   <td style="text-align:right;"> 21530.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30874.05161 </td>
   <td style="text-align:right;"> 724.531827 </td>
   <td style="text-align:right;"> 10983.454 </td>
   <td style="text-align:right;"> 21637.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15729.08633 </td>
   <td style="text-align:right;"> 487.513980 </td>
   <td style="text-align:right;"> 10438.921 </td>
   <td style="text-align:right;"> 21017.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20182.75862 </td>
   <td style="text-align:right;"> 558.114961 </td>
   <td style="text-align:right;"> 10905.326 </td>
   <td style="text-align:right;"> 20746.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21869.18146 </td>
   <td style="text-align:right;"> 574.287193 </td>
   <td style="text-align:right;"> 12000.139 </td>
   <td style="text-align:right;"> 22522.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22584.64643 </td>
   <td style="text-align:right;"> 590.575912 </td>
   <td style="text-align:right;"> 11468.717 </td>
   <td style="text-align:right;"> 22456.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23536.46351 </td>
   <td style="text-align:right;"> 599.923135 </td>
   <td style="text-align:right;"> 11409.250 </td>
   <td style="text-align:right;"> 21482.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40764.02615 </td>
   <td style="text-align:right;"> 886.554881 </td>
   <td style="text-align:right;"> 9357.634 </td>
   <td style="text-align:right;"> 21168.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28999.56428 </td>
   <td style="text-align:right;"> 702.824534 </td>
   <td style="text-align:right;"> 10124.964 </td>
   <td style="text-align:right;"> 21478.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33905.15623 </td>
   <td style="text-align:right;"> 778.262197 </td>
   <td style="text-align:right;"> 9925.323 </td>
   <td style="text-align:right;"> 21313.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38332.58576 </td>
   <td style="text-align:right;"> 848.908207 </td>
   <td style="text-align:right;"> 8676.099 </td>
   <td style="text-align:right;"> 22295.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42327.25941 </td>
   <td style="text-align:right;"> 914.146427 </td>
   <td style="text-align:right;"> 8102.759 </td>
   <td style="text-align:right;"> 22189.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42862.16882 </td>
   <td style="text-align:right;"> 914.159745 </td>
   <td style="text-align:right;"> 9055.844 </td>
   <td style="text-align:right;"> 21617.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13782.46809 </td>
   <td style="text-align:right;"> 456.142093 </td>
   <td style="text-align:right;"> 12144.352 </td>
   <td style="text-align:right;"> 21045.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17752.68851 </td>
   <td style="text-align:right;"> 531.019007 </td>
   <td style="text-align:right;"> 12013.683 </td>
   <td style="text-align:right;"> 21019.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7877.37832 </td>
   <td style="text-align:right;"> 355.002474 </td>
   <td style="text-align:right;"> 13217.213 </td>
   <td style="text-align:right;"> 21718.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17245.78164 </td>
   <td style="text-align:right;"> 506.980775 </td>
   <td style="text-align:right;"> 10953.523 </td>
   <td style="text-align:right;"> 21913.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26348.96172 </td>
   <td style="text-align:right;"> 641.476798 </td>
   <td style="text-align:right;"> 11635.057 </td>
   <td style="text-align:right;"> 21032.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26763.78332 </td>
   <td style="text-align:right;"> 661.926239 </td>
   <td style="text-align:right;"> 11522.494 </td>
   <td style="text-align:right;"> 21664.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -3608.78506 </td>
   <td style="text-align:right;"> 288.748242 </td>
   <td style="text-align:right;"> 13311.287 </td>
   <td style="text-align:right;"> 21473.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9428.42860 </td>
   <td style="text-align:right;"> 393.261123 </td>
   <td style="text-align:right;"> 12435.277 </td>
   <td style="text-align:right;"> 21457.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29624.80288 </td>
   <td style="text-align:right;"> 695.993002 </td>
   <td style="text-align:right;"> 10772.650 </td>
   <td style="text-align:right;"> 21294.24 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13899.15193 </td>
   <td style="text-align:right;"> 446.858835 </td>
   <td style="text-align:right;"> 13393.601 </td>
   <td style="text-align:right;"> 21368.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9695.74746 </td>
   <td style="text-align:right;"> 407.471728 </td>
   <td style="text-align:right;"> 11276.063 </td>
   <td style="text-align:right;"> 21630.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25613.64368 </td>
   <td style="text-align:right;"> 638.848744 </td>
   <td style="text-align:right;"> 11952.920 </td>
   <td style="text-align:right;"> 21598.24 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10282.58062 </td>
   <td style="text-align:right;"> 410.259577 </td>
   <td style="text-align:right;"> 11443.587 </td>
   <td style="text-align:right;"> 21241.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17814.57604 </td>
   <td style="text-align:right;"> 529.045506 </td>
   <td style="text-align:right;"> 10817.497 </td>
   <td style="text-align:right;"> 21099.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22576.36387 </td>
   <td style="text-align:right;"> 602.362742 </td>
   <td style="text-align:right;"> 10741.105 </td>
   <td style="text-align:right;"> 21445.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32964.13826 </td>
   <td style="text-align:right;"> 748.670354 </td>
   <td style="text-align:right;"> 11982.939 </td>
   <td style="text-align:right;"> 21193.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18066.14940 </td>
   <td style="text-align:right;"> 529.084129 </td>
   <td style="text-align:right;"> 12321.162 </td>
   <td style="text-align:right;"> 21251.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35657.79830 </td>
   <td style="text-align:right;"> 787.440947 </td>
   <td style="text-align:right;"> 11830.254 </td>
   <td style="text-align:right;"> 21560.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8612.97660 </td>
   <td style="text-align:right;"> 388.033748 </td>
   <td style="text-align:right;"> 10366.292 </td>
   <td style="text-align:right;"> 21993.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -450.60371 </td>
   <td style="text-align:right;"> 249.524179 </td>
   <td style="text-align:right;"> 13309.066 </td>
   <td style="text-align:right;"> 21419.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10256.21816 </td>
   <td style="text-align:right;"> 410.192369 </td>
   <td style="text-align:right;"> 11860.555 </td>
   <td style="text-align:right;"> 21247.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29252.93907 </td>
   <td style="text-align:right;"> 700.463787 </td>
   <td style="text-align:right;"> 10888.164 </td>
   <td style="text-align:right;"> 20781.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22533.08713 </td>
   <td style="text-align:right;"> 595.665495 </td>
   <td style="text-align:right;"> 10658.157 </td>
   <td style="text-align:right;"> 21390.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30610.70181 </td>
   <td style="text-align:right;"> 721.036358 </td>
   <td style="text-align:right;"> 10709.105 </td>
   <td style="text-align:right;"> 21400.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34294.07104 </td>
   <td style="text-align:right;"> 773.221779 </td>
   <td style="text-align:right;"> 10680.615 </td>
   <td style="text-align:right;"> 21439.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28723.31838 </td>
   <td style="text-align:right;"> 709.143061 </td>
   <td style="text-align:right;"> 8501.321 </td>
   <td style="text-align:right;"> 21401.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21742.20450 </td>
   <td style="text-align:right;"> 570.726181 </td>
   <td style="text-align:right;"> 12436.825 </td>
   <td style="text-align:right;"> 21393.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27989.11606 </td>
   <td style="text-align:right;"> 695.958754 </td>
   <td style="text-align:right;"> 8757.489 </td>
   <td style="text-align:right;"> 21648.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 15660.92868 </td>
   <td style="text-align:right;"> -5.788043 </td>
   <td style="text-align:right;"> 15183.217 </td>
   <td style="text-align:right;"> 21309.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11407.12149 </td>
   <td style="text-align:right;"> 58.925087 </td>
   <td style="text-align:right;"> 15011.737 </td>
   <td style="text-align:right;"> 21203.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38589.14044 </td>
   <td style="text-align:right;"> 851.587077 </td>
   <td style="text-align:right;"> 9286.097 </td>
   <td style="text-align:right;"> 21567.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28339.19001 </td>
   <td style="text-align:right;"> 677.109927 </td>
   <td style="text-align:right;"> 9786.240 </td>
   <td style="text-align:right;"> 21114.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28941.28386 </td>
   <td style="text-align:right;"> 691.601557 </td>
   <td style="text-align:right;"> 10580.127 </td>
   <td style="text-align:right;"> 21041.24 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24631.54882 </td>
   <td style="text-align:right;"> 628.564373 </td>
   <td style="text-align:right;"> 10316.381 </td>
   <td style="text-align:right;"> 21009.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25432.48755 </td>
   <td style="text-align:right;"> 640.383771 </td>
   <td style="text-align:right;"> 11273.941 </td>
   <td style="text-align:right;"> 21293.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44670.38309 </td>
   <td style="text-align:right;"> 948.427572 </td>
   <td style="text-align:right;"> 7569.659 </td>
   <td style="text-align:right;"> 21365.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27789.33948 </td>
   <td style="text-align:right;"> 669.556999 </td>
   <td style="text-align:right;"> 10363.950 </td>
   <td style="text-align:right;"> 21364.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36994.83634 </td>
   <td style="text-align:right;"> 816.546896 </td>
   <td style="text-align:right;"> 9777.263 </td>
   <td style="text-align:right;"> 21412.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19911.81743 </td>
   <td style="text-align:right;"> 552.742692 </td>
   <td style="text-align:right;"> 11928.166 </td>
   <td style="text-align:right;"> 21199.94 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17210.75144 </td>
   <td style="text-align:right;"> 521.251945 </td>
   <td style="text-align:right;"> 11187.914 </td>
   <td style="text-align:right;"> 21563.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28959.24443 </td>
   <td style="text-align:right;"> 688.554483 </td>
   <td style="text-align:right;"> 10885.865 </td>
   <td style="text-align:right;"> 22079.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29074.01325 </td>
   <td style="text-align:right;"> 693.879441 </td>
   <td style="text-align:right;"> 11438.290 </td>
   <td style="text-align:right;"> 21649.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40620.20390 </td>
   <td style="text-align:right;"> 892.353368 </td>
   <td style="text-align:right;"> 7565.938 </td>
   <td style="text-align:right;"> 22188.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28279.83671 </td>
   <td style="text-align:right;"> 682.722571 </td>
   <td style="text-align:right;"> 10383.250 </td>
   <td style="text-align:right;"> 20991.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33139.15528 </td>
   <td style="text-align:right;"> 759.767322 </td>
   <td style="text-align:right;"> 10463.474 </td>
   <td style="text-align:right;"> 21879.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39585.04972 </td>
   <td style="text-align:right;"> 851.618887 </td>
   <td style="text-align:right;"> 10637.463 </td>
   <td style="text-align:right;"> 21482.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43966.98805 </td>
   <td style="text-align:right;"> 920.057765 </td>
   <td style="text-align:right;"> 10320.182 </td>
   <td style="text-align:right;"> 21429.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16237.84378 </td>
   <td style="text-align:right;"> 493.202668 </td>
   <td style="text-align:right;"> 11323.668 </td>
   <td style="text-align:right;"> 21427.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24254.12683 </td>
   <td style="text-align:right;"> 624.094813 </td>
   <td style="text-align:right;"> 11266.515 </td>
   <td style="text-align:right;"> 21400.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9953.54290 </td>
   <td style="text-align:right;"> 420.281638 </td>
   <td style="text-align:right;"> 10459.881 </td>
   <td style="text-align:right;"> 21647.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16365.96455 </td>
   <td style="text-align:right;"> 497.034454 </td>
   <td style="text-align:right;"> 12851.528 </td>
   <td style="text-align:right;"> 21352.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17256.17643 </td>
   <td style="text-align:right;"> 499.997817 </td>
   <td style="text-align:right;"> 11945.799 </td>
   <td style="text-align:right;"> 20954.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18147.03041 </td>
   <td style="text-align:right;"> 531.900801 </td>
   <td style="text-align:right;"> 10831.418 </td>
   <td style="text-align:right;"> 20965.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12768.88985 </td>
   <td style="text-align:right;"> 460.387277 </td>
   <td style="text-align:right;"> 10078.903 </td>
   <td style="text-align:right;"> 20992.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24614.19453 </td>
   <td style="text-align:right;"> 616.881536 </td>
   <td style="text-align:right;"> 12565.657 </td>
   <td style="text-align:right;"> 21470.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21174.32675 </td>
   <td style="text-align:right;"> 575.156179 </td>
   <td style="text-align:right;"> 10539.221 </td>
   <td style="text-align:right;"> 21444.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41577.62752 </td>
   <td style="text-align:right;"> 898.727074 </td>
   <td style="text-align:right;"> 8970.016 </td>
   <td style="text-align:right;"> 21671.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41567.78101 </td>
   <td style="text-align:right;"> 896.138067 </td>
   <td style="text-align:right;"> 9250.221 </td>
   <td style="text-align:right;"> 21702.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42927.91543 </td>
   <td style="text-align:right;"> 915.066216 </td>
   <td style="text-align:right;"> 9942.853 </td>
   <td style="text-align:right;"> 21751.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -49311.34433 </td>
   <td style="text-align:right;"> 1024.342411 </td>
   <td style="text-align:right;"> 6732.745 </td>
   <td style="text-align:right;"> 20880.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24247.20044 </td>
   <td style="text-align:right;"> 634.106723 </td>
   <td style="text-align:right;"> 10414.685 </td>
   <td style="text-align:right;"> 21690.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29916.60546 </td>
   <td style="text-align:right;"> 708.833260 </td>
   <td style="text-align:right;"> 10130.635 </td>
   <td style="text-align:right;"> 21029.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35281.17354 </td>
   <td style="text-align:right;"> 803.001175 </td>
   <td style="text-align:right;"> 7980.383 </td>
   <td style="text-align:right;"> 21611.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25178.84705 </td>
   <td style="text-align:right;"> 640.697491 </td>
   <td style="text-align:right;"> 10121.708 </td>
   <td style="text-align:right;"> 21480.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32091.56249 </td>
   <td style="text-align:right;"> 746.402395 </td>
   <td style="text-align:right;"> 9345.141 </td>
   <td style="text-align:right;"> 21254.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25556.85899 </td>
   <td style="text-align:right;"> 636.868894 </td>
   <td style="text-align:right;"> 12241.859 </td>
   <td style="text-align:right;"> 21654.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31312.16938 </td>
   <td style="text-align:right;"> 721.261244 </td>
   <td style="text-align:right;"> 12506.170 </td>
   <td style="text-align:right;"> 21701.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9686.05734 </td>
   <td style="text-align:right;"> 391.515310 </td>
   <td style="text-align:right;"> 12937.045 </td>
   <td style="text-align:right;"> 21467.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15349.63061 </td>
   <td style="text-align:right;"> 490.421330 </td>
   <td style="text-align:right;"> 11071.494 </td>
   <td style="text-align:right;"> 21123.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30242.32326 </td>
   <td style="text-align:right;"> 723.838725 </td>
   <td style="text-align:right;"> 9302.066 </td>
   <td style="text-align:right;"> 21977.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32678.18193 </td>
   <td style="text-align:right;"> 731.666754 </td>
   <td style="text-align:right;"> 10053.755 </td>
   <td style="text-align:right;"> 20858.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1675.28553 </td>
   <td style="text-align:right;"> 236.935624 </td>
   <td style="text-align:right;"> 13309.049 </td>
   <td style="text-align:right;"> 21890.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13138.82725 </td>
   <td style="text-align:right;"> 461.233669 </td>
   <td style="text-align:right;"> 11136.273 </td>
   <td style="text-align:right;"> 21502.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43497.15649 </td>
   <td style="text-align:right;"> 903.429396 </td>
   <td style="text-align:right;"> 11124.189 </td>
   <td style="text-align:right;"> 21946.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18813.86580 </td>
   <td style="text-align:right;"> 530.380699 </td>
   <td style="text-align:right;"> 12099.895 </td>
   <td style="text-align:right;"> 21556.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13336.51909 </td>
   <td style="text-align:right;"> 452.933129 </td>
   <td style="text-align:right;"> 11460.040 </td>
   <td style="text-align:right;"> 21708.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18557.33796 </td>
   <td style="text-align:right;"> 526.970671 </td>
   <td style="text-align:right;"> 12439.560 </td>
   <td style="text-align:right;"> 21681.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9548.21528 </td>
   <td style="text-align:right;"> 402.885252 </td>
   <td style="text-align:right;"> 11142.740 </td>
   <td style="text-align:right;"> 21266.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13089.26571 </td>
   <td style="text-align:right;"> 467.006601 </td>
   <td style="text-align:right;"> 11887.565 </td>
   <td style="text-align:right;"> 21407.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28716.67603 </td>
   <td style="text-align:right;"> 697.636585 </td>
   <td style="text-align:right;"> 11194.491 </td>
   <td style="text-align:right;"> 21608.36 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10936.15308 </td>
   <td style="text-align:right;"> 415.518230 </td>
   <td style="text-align:right;"> 11708.882 </td>
   <td style="text-align:right;"> 21090.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12150.45796 </td>
   <td style="text-align:right;"> 444.884079 </td>
   <td style="text-align:right;"> 10850.753 </td>
   <td style="text-align:right;"> 22011.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -51710.47295 </td>
   <td style="text-align:right;"> 1050.838577 </td>
   <td style="text-align:right;"> 9016.181 </td>
   <td style="text-align:right;"> 21148.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41262.85588 </td>
   <td style="text-align:right;"> 898.183172 </td>
   <td style="text-align:right;"> 6979.792 </td>
   <td style="text-align:right;"> 21587.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43489.63709 </td>
   <td style="text-align:right;"> 921.551874 </td>
   <td style="text-align:right;"> 9966.606 </td>
   <td style="text-align:right;"> 22163.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26114.79078 </td>
   <td style="text-align:right;"> 660.979470 </td>
   <td style="text-align:right;"> 9116.633 </td>
   <td style="text-align:right;"> 22001.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35625.51516 </td>
   <td style="text-align:right;"> 793.249555 </td>
   <td style="text-align:right;"> 10302.401 </td>
   <td style="text-align:right;"> 22056.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22949.43086 </td>
   <td style="text-align:right;"> 606.465463 </td>
   <td style="text-align:right;"> 11392.836 </td>
   <td style="text-align:right;"> 21144.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15624.99691 </td>
   <td style="text-align:right;"> 485.172935 </td>
   <td style="text-align:right;"> 11900.520 </td>
   <td style="text-align:right;"> 21859.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38568.06771 </td>
   <td style="text-align:right;"> 849.448912 </td>
   <td style="text-align:right;"> 8470.140 </td>
   <td style="text-align:right;"> 20874.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15346.60259 </td>
   <td style="text-align:right;"> 491.575680 </td>
   <td style="text-align:right;"> 11470.860 </td>
   <td style="text-align:right;"> 22065.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31579.21763 </td>
   <td style="text-align:right;"> 741.162825 </td>
   <td style="text-align:right;"> 10308.362 </td>
   <td style="text-align:right;"> 21151.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31221.81861 </td>
   <td style="text-align:right;"> 734.660446 </td>
   <td style="text-align:right;"> 11281.899 </td>
   <td style="text-align:right;"> 21374.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24756.78872 </td>
   <td style="text-align:right;"> 641.369390 </td>
   <td style="text-align:right;"> 10169.486 </td>
   <td style="text-align:right;"> 21352.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46012.08103 </td>
   <td style="text-align:right;"> 949.563634 </td>
   <td style="text-align:right;"> 9166.809 </td>
   <td style="text-align:right;"> 21123.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42245.02392 </td>
   <td style="text-align:right;"> 894.682075 </td>
   <td style="text-align:right;"> 8484.542 </td>
   <td style="text-align:right;"> 21531.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39090.05214 </td>
   <td style="text-align:right;"> 849.139575 </td>
   <td style="text-align:right;"> 7787.901 </td>
   <td style="text-align:right;"> 21182.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -49420.46671 </td>
   <td style="text-align:right;"> 1013.022951 </td>
   <td style="text-align:right;"> 8696.044 </td>
   <td style="text-align:right;"> 21507.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20583.84725 </td>
   <td style="text-align:right;"> 566.130212 </td>
   <td style="text-align:right;"> 11445.137 </td>
   <td style="text-align:right;"> 21367.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26655.17758 </td>
   <td style="text-align:right;"> 663.533832 </td>
   <td style="text-align:right;"> 10045.232 </td>
   <td style="text-align:right;"> 21027.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25259.04407 </td>
   <td style="text-align:right;"> 636.452217 </td>
   <td style="text-align:right;"> 10477.959 </td>
   <td style="text-align:right;"> 21222.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16515.66966 </td>
   <td style="text-align:right;"> 498.374217 </td>
   <td style="text-align:right;"> 11029.407 </td>
   <td style="text-align:right;"> 21238.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34164.94485 </td>
   <td style="text-align:right;"> 779.372553 </td>
   <td style="text-align:right;"> 9196.571 </td>
   <td style="text-align:right;"> 21460.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23071.48107 </td>
   <td style="text-align:right;"> 599.547148 </td>
   <td style="text-align:right;"> 12047.731 </td>
   <td style="text-align:right;"> 21328.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15786.66919 </td>
   <td style="text-align:right;"> 493.595571 </td>
   <td style="text-align:right;"> 11175.034 </td>
   <td style="text-align:right;"> 21092.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14804.96624 </td>
   <td style="text-align:right;"> 479.234086 </td>
   <td style="text-align:right;"> 10750.997 </td>
   <td style="text-align:right;"> 21299.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21577.21753 </td>
   <td style="text-align:right;"> 580.417554 </td>
   <td style="text-align:right;"> 10442.997 </td>
   <td style="text-align:right;"> 21089.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15960.35311 </td>
   <td style="text-align:right;"> 499.408726 </td>
   <td style="text-align:right;"> 10771.349 </td>
   <td style="text-align:right;"> 21829.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9468.33043 </td>
   <td style="text-align:right;"> 387.503251 </td>
   <td style="text-align:right;"> 13728.035 </td>
   <td style="text-align:right;"> 21792.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7337.96056 </td>
   <td style="text-align:right;"> 358.699274 </td>
   <td style="text-align:right;"> 13335.158 </td>
   <td style="text-align:right;"> 21743.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5027.89682 </td>
   <td style="text-align:right;"> 326.682817 </td>
   <td style="text-align:right;"> 12597.969 </td>
   <td style="text-align:right;"> 21543.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19809.61303 </td>
   <td style="text-align:right;"> 549.665282 </td>
   <td style="text-align:right;"> 11391.747 </td>
   <td style="text-align:right;"> 21831.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15121.38498 </td>
   <td style="text-align:right;"> 485.833801 </td>
   <td style="text-align:right;"> 11405.445 </td>
   <td style="text-align:right;"> 21945.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9993.72863 </td>
   <td style="text-align:right;"> 399.034950 </td>
   <td style="text-align:right;"> 12673.251 </td>
   <td style="text-align:right;"> 21348.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24111.09890 </td>
   <td style="text-align:right;"> 622.259585 </td>
   <td style="text-align:right;"> 10784.000 </td>
   <td style="text-align:right;"> 21530.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24659.28209 </td>
   <td style="text-align:right;"> 634.344562 </td>
   <td style="text-align:right;"> 10979.602 </td>
   <td style="text-align:right;"> 21766.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23065.73233 </td>
   <td style="text-align:right;"> 595.297609 </td>
   <td style="text-align:right;"> 10535.802 </td>
   <td style="text-align:right;"> 21663.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26268.68200 </td>
   <td style="text-align:right;"> 653.570320 </td>
   <td style="text-align:right;"> 10944.918 </td>
   <td style="text-align:right;"> 21505.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19566.94381 </td>
   <td style="text-align:right;"> 554.691016 </td>
   <td style="text-align:right;"> 10450.331 </td>
   <td style="text-align:right;"> 21669.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33060.49191 </td>
   <td style="text-align:right;"> 734.049246 </td>
   <td style="text-align:right;"> 11366.383 </td>
   <td style="text-align:right;"> 21846.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29485.19878 </td>
   <td style="text-align:right;"> 691.125312 </td>
   <td style="text-align:right;"> 10519.851 </td>
   <td style="text-align:right;"> 21660.43 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20322.19295 </td>
   <td style="text-align:right;"> 572.297791 </td>
   <td style="text-align:right;"> 10946.979 </td>
   <td style="text-align:right;"> 21241.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23435.94221 </td>
   <td style="text-align:right;"> 610.662490 </td>
   <td style="text-align:right;"> 10998.995 </td>
   <td style="text-align:right;"> 21135.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19700.61560 </td>
   <td style="text-align:right;"> 555.959479 </td>
   <td style="text-align:right;"> 10420.589 </td>
   <td style="text-align:right;"> 21573.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36726.10166 </td>
   <td style="text-align:right;"> 830.172281 </td>
   <td style="text-align:right;"> 9190.904 </td>
   <td style="text-align:right;"> 20784.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40896.53621 </td>
   <td style="text-align:right;"> 887.013653 </td>
   <td style="text-align:right;"> 8868.850 </td>
   <td style="text-align:right;"> 21585.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10201.58729 </td>
   <td style="text-align:right;"> 393.927172 </td>
   <td style="text-align:right;"> 12600.874 </td>
   <td style="text-align:right;"> 21148.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21334.18033 </td>
   <td style="text-align:right;"> 558.018473 </td>
   <td style="text-align:right;"> 13527.219 </td>
   <td style="text-align:right;"> 21536.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -2609.23360 </td>
   <td style="text-align:right;"> 284.715787 </td>
   <td style="text-align:right;"> 12022.594 </td>
   <td style="text-align:right;"> 21074.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31413.97196 </td>
   <td style="text-align:right;"> 720.174709 </td>
   <td style="text-align:right;"> 11051.155 </td>
   <td style="text-align:right;"> 21468.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21358.51953 </td>
   <td style="text-align:right;"> 568.958371 </td>
   <td style="text-align:right;"> 11511.585 </td>
   <td style="text-align:right;"> 20717.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25639.65383 </td>
   <td style="text-align:right;"> 638.404066 </td>
   <td style="text-align:right;"> 12460.041 </td>
   <td style="text-align:right;"> 22156.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10661.28082 </td>
   <td style="text-align:right;"> 412.295207 </td>
   <td style="text-align:right;"> 12229.967 </td>
   <td style="text-align:right;"> 21354.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8214.02614 </td>
   <td style="text-align:right;"> 374.504862 </td>
   <td style="text-align:right;"> 12155.738 </td>
   <td style="text-align:right;"> 21477.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22408.87535 </td>
   <td style="text-align:right;"> 583.380130 </td>
   <td style="text-align:right;"> 11709.523 </td>
   <td style="text-align:right;"> 20814.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12545.07088 </td>
   <td style="text-align:right;"> 442.079880 </td>
   <td style="text-align:right;"> 12028.480 </td>
   <td style="text-align:right;"> 21495.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46130.02244 </td>
   <td style="text-align:right;"> 970.478797 </td>
   <td style="text-align:right;"> 8598.434 </td>
   <td style="text-align:right;"> 21471.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43346.50789 </td>
   <td style="text-align:right;"> 940.001102 </td>
   <td style="text-align:right;"> 8198.160 </td>
   <td style="text-align:right;"> 21975.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16075.01955 </td>
   <td style="text-align:right;"> 479.219009 </td>
   <td style="text-align:right;"> 12707.364 </td>
   <td style="text-align:right;"> 21176.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36562.27270 </td>
   <td style="text-align:right;"> 815.169814 </td>
   <td style="text-align:right;"> 10356.817 </td>
   <td style="text-align:right;"> 21645.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -55859.12222 </td>
   <td style="text-align:right;"> 1110.605730 </td>
   <td style="text-align:right;"> 7692.572 </td>
   <td style="text-align:right;"> 20990.84 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -45170.50318 </td>
   <td style="text-align:right;"> 962.747389 </td>
   <td style="text-align:right;"> 6318.953 </td>
   <td style="text-align:right;"> 21120.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -47479.16679 </td>
   <td style="text-align:right;"> 996.111980 </td>
   <td style="text-align:right;"> 6460.845 </td>
   <td style="text-align:right;"> 20985.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31637.88812 </td>
   <td style="text-align:right;"> 724.543817 </td>
   <td style="text-align:right;"> 11040.038 </td>
   <td style="text-align:right;"> 21755.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21382.62563 </td>
   <td style="text-align:right;"> 579.523293 </td>
   <td style="text-align:right;"> 9525.909 </td>
   <td style="text-align:right;"> 21294.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23725.08596 </td>
   <td style="text-align:right;"> 617.962934 </td>
   <td style="text-align:right;"> 11411.625 </td>
   <td style="text-align:right;"> 21684.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28903.12687 </td>
   <td style="text-align:right;"> 695.811445 </td>
   <td style="text-align:right;"> 10410.936 </td>
   <td style="text-align:right;"> 21443.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -56027.71519 </td>
   <td style="text-align:right;"> 1117.423830 </td>
   <td style="text-align:right;"> 7588.636 </td>
   <td style="text-align:right;"> 21480.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16157.36644 </td>
   <td style="text-align:right;"> 519.047061 </td>
   <td style="text-align:right;"> 10734.273 </td>
   <td style="text-align:right;"> 21562.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36300.85542 </td>
   <td style="text-align:right;"> 823.091321 </td>
   <td style="text-align:right;"> 10181.312 </td>
   <td style="text-align:right;"> 21479.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -2013.93506 </td>
   <td style="text-align:right;"> 285.408141 </td>
   <td style="text-align:right;"> 12045.488 </td>
   <td style="text-align:right;"> 21588.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23182.85500 </td>
   <td style="text-align:right;"> 597.349104 </td>
   <td style="text-align:right;"> 12954.593 </td>
   <td style="text-align:right;"> 20853.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -45450.88765 </td>
   <td style="text-align:right;"> 954.520052 </td>
   <td style="text-align:right;"> 6503.128 </td>
   <td style="text-align:right;"> 21317.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40677.55331 </td>
   <td style="text-align:right;"> 862.209561 </td>
   <td style="text-align:right;"> 10499.115 </td>
   <td style="text-align:right;"> 21348.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40548.72928 </td>
   <td style="text-align:right;"> 867.778024 </td>
   <td style="text-align:right;"> 9491.695 </td>
   <td style="text-align:right;"> 20873.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33699.52452 </td>
   <td style="text-align:right;"> 768.191324 </td>
   <td style="text-align:right;"> 9015.973 </td>
   <td style="text-align:right;"> 21259.94 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17060.60148 </td>
   <td style="text-align:right;"> 508.324290 </td>
   <td style="text-align:right;"> 12051.131 </td>
   <td style="text-align:right;"> 21112.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29356.92493 </td>
   <td style="text-align:right;"> 697.575678 </td>
   <td style="text-align:right;"> 10347.585 </td>
   <td style="text-align:right;"> 21506.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25061.97574 </td>
   <td style="text-align:right;"> 653.949456 </td>
   <td style="text-align:right;"> 7932.207 </td>
   <td style="text-align:right;"> 21474.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10419.39033 </td>
   <td style="text-align:right;"> 415.202613 </td>
   <td style="text-align:right;"> 10416.277 </td>
   <td style="text-align:right;"> 21368.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12972.49669 </td>
   <td style="text-align:right;"> 447.553117 </td>
   <td style="text-align:right;"> 10792.766 </td>
   <td style="text-align:right;"> 21519.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9098.41094 </td>
   <td style="text-align:right;"> 391.430964 </td>
   <td style="text-align:right;"> 11889.343 </td>
   <td style="text-align:right;"> 21045.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27001.67533 </td>
   <td style="text-align:right;"> 656.207999 </td>
   <td style="text-align:right;"> 11137.779 </td>
   <td style="text-align:right;"> 21790.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39014.80841 </td>
   <td style="text-align:right;"> 841.790656 </td>
   <td style="text-align:right;"> 10563.899 </td>
   <td style="text-align:right;"> 21320.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20637.82663 </td>
   <td style="text-align:right;"> 570.271143 </td>
   <td style="text-align:right;"> 9658.889 </td>
   <td style="text-align:right;"> 21330.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46222.25568 </td>
   <td style="text-align:right;"> 952.543659 </td>
   <td style="text-align:right;"> 11150.347 </td>
   <td style="text-align:right;"> 20901.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8611.70363 </td>
   <td style="text-align:right;"> 394.024485 </td>
   <td style="text-align:right;"> 10508.886 </td>
   <td style="text-align:right;"> 21327.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15353.75087 </td>
   <td style="text-align:right;"> 492.748780 </td>
   <td style="text-align:right;"> 10812.307 </td>
   <td style="text-align:right;"> 21332.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18261.76536 </td>
   <td style="text-align:right;"> 537.195262 </td>
   <td style="text-align:right;"> 10590.246 </td>
   <td style="text-align:right;"> 21105.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37040.72828 </td>
   <td style="text-align:right;"> 807.633340 </td>
   <td style="text-align:right;"> 9564.719 </td>
   <td style="text-align:right;"> 21163.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31371.91741 </td>
   <td style="text-align:right;"> 744.997166 </td>
   <td style="text-align:right;"> 9329.323 </td>
   <td style="text-align:right;"> 21052.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30951.68225 </td>
   <td style="text-align:right;"> 725.031400 </td>
   <td style="text-align:right;"> 10612.286 </td>
   <td style="text-align:right;"> 21457.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9554.91500 </td>
   <td style="text-align:right;"> 389.346696 </td>
   <td style="text-align:right;"> 11928.514 </td>
   <td style="text-align:right;"> 21147.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29857.96631 </td>
   <td style="text-align:right;"> 718.630244 </td>
   <td style="text-align:right;"> 9392.417 </td>
   <td style="text-align:right;"> 21349.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37737.23498 </td>
   <td style="text-align:right;"> 813.667143 </td>
   <td style="text-align:right;"> 10857.607 </td>
   <td style="text-align:right;"> 21391.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36707.16381 </td>
   <td style="text-align:right;"> 816.015875 </td>
   <td style="text-align:right;"> 10158.623 </td>
   <td style="text-align:right;"> 21204.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23129.33935 </td>
   <td style="text-align:right;"> 591.074319 </td>
   <td style="text-align:right;"> 12372.248 </td>
   <td style="text-align:right;"> 21608.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30122.94040 </td>
   <td style="text-align:right;"> 711.658415 </td>
   <td style="text-align:right;"> 8835.371 </td>
   <td style="text-align:right;"> 21058.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33560.83426 </td>
   <td style="text-align:right;"> 745.228069 </td>
   <td style="text-align:right;"> 11992.308 </td>
   <td style="text-align:right;"> 21131.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23824.71177 </td>
   <td style="text-align:right;"> 635.511950 </td>
   <td style="text-align:right;"> 9676.195 </td>
   <td style="text-align:right;"> 21620.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -48543.23569 </td>
   <td style="text-align:right;"> 1003.444454 </td>
   <td style="text-align:right;"> 8706.084 </td>
   <td style="text-align:right;"> 21289.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42202.56911 </td>
   <td style="text-align:right;"> 904.203517 </td>
   <td style="text-align:right;"> 9087.771 </td>
   <td style="text-align:right;"> 20965.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29140.03731 </td>
   <td style="text-align:right;"> 692.999549 </td>
   <td style="text-align:right;"> 10142.633 </td>
   <td style="text-align:right;"> 21680.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7470.09682 </td>
   <td style="text-align:right;"> 373.348583 </td>
   <td style="text-align:right;"> 11312.840 </td>
   <td style="text-align:right;"> 21485.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8889.88393 </td>
   <td style="text-align:right;"> 397.291380 </td>
   <td style="text-align:right;"> 10938.969 </td>
   <td style="text-align:right;"> 21415.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32342.56669 </td>
   <td style="text-align:right;"> 746.670432 </td>
   <td style="text-align:right;"> 11234.602 </td>
   <td style="text-align:right;"> 21335.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24681.26200 </td>
   <td style="text-align:right;"> 621.938501 </td>
   <td style="text-align:right;"> 10934.906 </td>
   <td style="text-align:right;"> 21547.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19972.48782 </td>
   <td style="text-align:right;"> 551.997522 </td>
   <td style="text-align:right;"> 10594.539 </td>
   <td style="text-align:right;"> 21503.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19382.39514 </td>
   <td style="text-align:right;"> 539.610881 </td>
   <td style="text-align:right;"> 11535.845 </td>
   <td style="text-align:right;"> 21415.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39315.67380 </td>
   <td style="text-align:right;"> 850.513195 </td>
   <td style="text-align:right;"> 9360.084 </td>
   <td style="text-align:right;"> 21799.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24765.43258 </td>
   <td style="text-align:right;"> 636.681616 </td>
   <td style="text-align:right;"> 9033.307 </td>
   <td style="text-align:right;"> 21624.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24303.24368 </td>
   <td style="text-align:right;"> 630.398455 </td>
   <td style="text-align:right;"> 8893.791 </td>
   <td style="text-align:right;"> 21707.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28124.97780 </td>
   <td style="text-align:right;"> 691.148528 </td>
   <td style="text-align:right;"> 8046.248 </td>
   <td style="text-align:right;"> 21315.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35848.28147 </td>
   <td style="text-align:right;"> 817.977452 </td>
   <td style="text-align:right;"> 7698.905 </td>
   <td style="text-align:right;"> 22123.06 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35355.06021 </td>
   <td style="text-align:right;"> 810.803076 </td>
   <td style="text-align:right;"> 7319.111 </td>
   <td style="text-align:right;"> 22304.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26635.41295 </td>
   <td style="text-align:right;"> 638.192025 </td>
   <td style="text-align:right;"> 12487.812 </td>
   <td style="text-align:right;"> 20812.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -3467.68947 </td>
   <td style="text-align:right;"> 297.607760 </td>
   <td style="text-align:right;"> 12098.956 </td>
   <td style="text-align:right;"> 21953.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46798.87462 </td>
   <td style="text-align:right;"> 977.709873 </td>
   <td style="text-align:right;"> 9268.892 </td>
   <td style="text-align:right;"> 21369.94 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16802.68321 </td>
   <td style="text-align:right;"> 514.935363 </td>
   <td style="text-align:right;"> 10151.745 </td>
   <td style="text-align:right;"> 21193.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24162.33242 </td>
   <td style="text-align:right;"> 618.573293 </td>
   <td style="text-align:right;"> 11016.850 </td>
   <td style="text-align:right;"> 21343.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25481.07799 </td>
   <td style="text-align:right;"> 656.576758 </td>
   <td style="text-align:right;"> 8281.740 </td>
   <td style="text-align:right;"> 21366.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -748.65049 </td>
   <td style="text-align:right;"> 263.835716 </td>
   <td style="text-align:right;"> 11729.316 </td>
   <td style="text-align:right;"> 21562.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44015.26690 </td>
   <td style="text-align:right;"> 942.450687 </td>
   <td style="text-align:right;"> 6808.360 </td>
   <td style="text-align:right;"> 21307.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -1155.05265 </td>
   <td style="text-align:right;"> 266.989044 </td>
   <td style="text-align:right;"> 12335.193 </td>
   <td style="text-align:right;"> 21329.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11198.74250 </td>
   <td style="text-align:right;"> 406.874336 </td>
   <td style="text-align:right;"> 12982.181 </td>
   <td style="text-align:right;"> 21642.36 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5483.07915 </td>
   <td style="text-align:right;"> 168.350622 </td>
   <td style="text-align:right;"> 14052.636 </td>
   <td style="text-align:right;"> 21168.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9931.26053 </td>
   <td style="text-align:right;"> 100.513192 </td>
   <td style="text-align:right;"> 14608.278 </td>
   <td style="text-align:right;"> 21166.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6007.73214 </td>
   <td style="text-align:right;"> 157.810454 </td>
   <td style="text-align:right;"> 14669.070 </td>
   <td style="text-align:right;"> 21328.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35282.77726 </td>
   <td style="text-align:right;"> 793.583760 </td>
   <td style="text-align:right;"> 9371.198 </td>
   <td style="text-align:right;"> 21601.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43466.22090 </td>
   <td style="text-align:right;"> 921.843700 </td>
   <td style="text-align:right;"> 8772.975 </td>
   <td style="text-align:right;"> 21374.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31081.11448 </td>
   <td style="text-align:right;"> 715.168175 </td>
   <td style="text-align:right;"> 11296.638 </td>
   <td style="text-align:right;"> 20796.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29077.52558 </td>
   <td style="text-align:right;"> 703.785161 </td>
   <td style="text-align:right;"> 9625.862 </td>
   <td style="text-align:right;"> 21589.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27250.34018 </td>
   <td style="text-align:right;"> 665.864355 </td>
   <td style="text-align:right;"> 10062.886 </td>
   <td style="text-align:right;"> 21147.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20752.70634 </td>
   <td style="text-align:right;"> 563.727482 </td>
   <td style="text-align:right;"> 11311.315 </td>
   <td style="text-align:right;"> 21265.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23704.23755 </td>
   <td style="text-align:right;"> 607.687997 </td>
   <td style="text-align:right;"> 12341.501 </td>
   <td style="text-align:right;"> 21151.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21150.54587 </td>
   <td style="text-align:right;"> 580.497683 </td>
   <td style="text-align:right;"> 9857.001 </td>
   <td style="text-align:right;"> 21252.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28949.58836 </td>
   <td style="text-align:right;"> 681.830475 </td>
   <td style="text-align:right;"> 10393.292 </td>
   <td style="text-align:right;"> 21574.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22474.25414 </td>
   <td style="text-align:right;"> 595.479117 </td>
   <td style="text-align:right;"> 11094.521 </td>
   <td style="text-align:right;"> 21656.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14140.74442 </td>
   <td style="text-align:right;"> 479.512412 </td>
   <td style="text-align:right;"> 10367.209 </td>
   <td style="text-align:right;"> 21452.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18809.61770 </td>
   <td style="text-align:right;"> 523.192850 </td>
   <td style="text-align:right;"> 13003.594 </td>
   <td style="text-align:right;"> 21361.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5837.06341 </td>
   <td style="text-align:right;"> 339.273843 </td>
   <td style="text-align:right;"> 11197.885 </td>
   <td style="text-align:right;"> 21651.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21110.18034 </td>
   <td style="text-align:right;"> 568.366937 </td>
   <td style="text-align:right;"> 11799.138 </td>
   <td style="text-align:right;"> 21470.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16026.15248 </td>
   <td style="text-align:right;"> 489.425251 </td>
   <td style="text-align:right;"> 11222.330 </td>
   <td style="text-align:right;"> 21640.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6621.20252 </td>
   <td style="text-align:right;"> 353.491272 </td>
   <td style="text-align:right;"> 10796.822 </td>
   <td style="text-align:right;"> 21890.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41267.85987 </td>
   <td style="text-align:right;"> 869.563996 </td>
   <td style="text-align:right;"> 10985.147 </td>
   <td style="text-align:right;"> 21012.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11789.81951 </td>
   <td style="text-align:right;"> 442.028970 </td>
   <td style="text-align:right;"> 10210.324 </td>
   <td style="text-align:right;"> 21632.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25247.43726 </td>
   <td style="text-align:right;"> 633.189243 </td>
   <td style="text-align:right;"> 9797.727 </td>
   <td style="text-align:right;"> 21150.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37681.78035 </td>
   <td style="text-align:right;"> 815.606319 </td>
   <td style="text-align:right;"> 11258.654 </td>
   <td style="text-align:right;"> 21373.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21382.45822 </td>
   <td style="text-align:right;"> 585.914436 </td>
   <td style="text-align:right;"> 9222.273 </td>
   <td style="text-align:right;"> 21508.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26612.38255 </td>
   <td style="text-align:right;"> 654.759944 </td>
   <td style="text-align:right;"> 10336.386 </td>
   <td style="text-align:right;"> 21657.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38310.35178 </td>
   <td style="text-align:right;"> 830.828521 </td>
   <td style="text-align:right;"> 10561.460 </td>
   <td style="text-align:right;"> 20809.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8296.51382 </td>
   <td style="text-align:right;"> 370.837593 </td>
   <td style="text-align:right;"> 11464.333 </td>
   <td style="text-align:right;"> 21096.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38748.10904 </td>
   <td style="text-align:right;"> 858.032423 </td>
   <td style="text-align:right;"> 9407.434 </td>
   <td style="text-align:right;"> 20997.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26564.52248 </td>
   <td style="text-align:right;"> 676.126178 </td>
   <td style="text-align:right;"> 9870.676 </td>
   <td style="text-align:right;"> 21321.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18220.02156 </td>
   <td style="text-align:right;"> 536.258274 </td>
   <td style="text-align:right;"> 11822.895 </td>
   <td style="text-align:right;"> 20948.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24831.38338 </td>
   <td style="text-align:right;"> 648.637944 </td>
   <td style="text-align:right;"> 9962.483 </td>
   <td style="text-align:right;"> 21231.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26943.71291 </td>
   <td style="text-align:right;"> 662.325263 </td>
   <td style="text-align:right;"> 11340.310 </td>
   <td style="text-align:right;"> 21798.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13750.34842 </td>
   <td style="text-align:right;"> 467.162924 </td>
   <td style="text-align:right;"> 11268.444 </td>
   <td style="text-align:right;"> 21514.36 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39089.28256 </td>
   <td style="text-align:right;"> 831.905988 </td>
   <td style="text-align:right;"> 10198.975 </td>
   <td style="text-align:right;"> 21444.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35550.36841 </td>
   <td style="text-align:right;"> 781.304392 </td>
   <td style="text-align:right;"> 10203.783 </td>
   <td style="text-align:right;"> 21495.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20149.77260 </td>
   <td style="text-align:right;"> 566.642747 </td>
   <td style="text-align:right;"> 12414.393 </td>
   <td style="text-align:right;"> 20832.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -3775.17367 </td>
   <td style="text-align:right;"> 312.765457 </td>
   <td style="text-align:right;"> 12087.476 </td>
   <td style="text-align:right;"> 21228.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22874.64521 </td>
   <td style="text-align:right;"> 593.830712 </td>
   <td style="text-align:right;"> 12746.076 </td>
   <td style="text-align:right;"> 21568.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26369.65206 </td>
   <td style="text-align:right;"> 650.361573 </td>
   <td style="text-align:right;"> 10280.964 </td>
   <td style="text-align:right;"> 21636.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29012.81141 </td>
   <td style="text-align:right;"> 678.945324 </td>
   <td style="text-align:right;"> 11196.133 </td>
   <td style="text-align:right;"> 21712.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31481.98675 </td>
   <td style="text-align:right;"> 743.387694 </td>
   <td style="text-align:right;"> 8669.581 </td>
   <td style="text-align:right;"> 21886.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -59251.08871 </td>
   <td style="text-align:right;"> 1159.420010 </td>
   <td style="text-align:right;"> 7770.968 </td>
   <td style="text-align:right;"> 21187.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10060.23416 </td>
   <td style="text-align:right;"> 414.155832 </td>
   <td style="text-align:right;"> 12076.600 </td>
   <td style="text-align:right;"> 21552.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22646.93676 </td>
   <td style="text-align:right;"> 611.002416 </td>
   <td style="text-align:right;"> 11469.332 </td>
   <td style="text-align:right;"> 20778.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19647.11256 </td>
   <td style="text-align:right;"> 558.535750 </td>
   <td style="text-align:right;"> 12429.965 </td>
   <td style="text-align:right;"> 20993.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11974.69913 </td>
   <td style="text-align:right;"> 449.226578 </td>
   <td style="text-align:right;"> 11556.128 </td>
   <td style="text-align:right;"> 20829.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30333.49825 </td>
   <td style="text-align:right;"> 719.100948 </td>
   <td style="text-align:right;"> 9948.767 </td>
   <td style="text-align:right;"> 21620.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23334.76749 </td>
   <td style="text-align:right;"> 607.997829 </td>
   <td style="text-align:right;"> 10625.190 </td>
   <td style="text-align:right;"> 21233.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9736.86559 </td>
   <td style="text-align:right;"> 391.950758 </td>
   <td style="text-align:right;"> 13203.834 </td>
   <td style="text-align:right;"> 21482.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12600.79379 </td>
   <td style="text-align:right;"> 442.363565 </td>
   <td style="text-align:right;"> 11876.875 </td>
   <td style="text-align:right;"> 21517.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26637.91893 </td>
   <td style="text-align:right;"> 673.323741 </td>
   <td style="text-align:right;"> 9917.309 </td>
   <td style="text-align:right;"> 20928.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17215.38811 </td>
   <td style="text-align:right;"> 534.526829 </td>
   <td style="text-align:right;"> 10084.177 </td>
   <td style="text-align:right;"> 21034.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26689.34063 </td>
   <td style="text-align:right;"> 671.002481 </td>
   <td style="text-align:right;"> 10745.639 </td>
   <td style="text-align:right;"> 21338.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31027.36546 </td>
   <td style="text-align:right;"> 745.057276 </td>
   <td style="text-align:right;"> 10068.081 </td>
   <td style="text-align:right;"> 21768.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35890.27703 </td>
   <td style="text-align:right;"> 808.697589 </td>
   <td style="text-align:right;"> 10737.281 </td>
   <td style="text-align:right;"> 21452.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12839.26643 </td>
   <td style="text-align:right;"> 453.111961 </td>
   <td style="text-align:right;"> 10585.937 </td>
   <td style="text-align:right;"> 21134.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33491.19685 </td>
   <td style="text-align:right;"> 750.506299 </td>
   <td style="text-align:right;"> 11362.974 </td>
   <td style="text-align:right;"> 21410.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20603.68358 </td>
   <td style="text-align:right;"> 581.203422 </td>
   <td style="text-align:right;"> 9805.904 </td>
   <td style="text-align:right;"> 21660.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21035.09815 </td>
   <td style="text-align:right;"> 573.261469 </td>
   <td style="text-align:right;"> 9831.398 </td>
   <td style="text-align:right;"> 21446.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13818.22327 </td>
   <td style="text-align:right;"> 444.584812 </td>
   <td style="text-align:right;"> 13818.697 </td>
   <td style="text-align:right;"> 21163.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18219.34236 </td>
   <td style="text-align:right;"> 523.668126 </td>
   <td style="text-align:right;"> 12035.471 </td>
   <td style="text-align:right;"> 21599.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14285.22181 </td>
   <td style="text-align:right;"> 476.862338 </td>
   <td style="text-align:right;"> 10535.483 </td>
   <td style="text-align:right;"> 21561.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21663.48107 </td>
   <td style="text-align:right;"> 579.293492 </td>
   <td style="text-align:right;"> 10029.531 </td>
   <td style="text-align:right;"> 21326.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35700.01309 </td>
   <td style="text-align:right;"> 778.205214 </td>
   <td style="text-align:right;"> 11723.469 </td>
   <td style="text-align:right;"> 21499.24 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34652.23213 </td>
   <td style="text-align:right;"> 768.654965 </td>
   <td style="text-align:right;"> 10336.887 </td>
   <td style="text-align:right;"> 21605.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22746.26855 </td>
   <td style="text-align:right;"> 599.156230 </td>
   <td style="text-align:right;"> 9273.504 </td>
   <td style="text-align:right;"> 21085.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18915.51261 </td>
   <td style="text-align:right;"> 523.688533 </td>
   <td style="text-align:right;"> 13495.881 </td>
   <td style="text-align:right;"> 22280.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6397.24066 </td>
   <td style="text-align:right;"> 350.033931 </td>
   <td style="text-align:right;"> 12628.030 </td>
   <td style="text-align:right;"> 21493.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11887.20103 </td>
   <td style="text-align:right;"> 430.548114 </td>
   <td style="text-align:right;"> 12157.883 </td>
   <td style="text-align:right;"> 21614.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6024.32065 </td>
   <td style="text-align:right;"> 340.292751 </td>
   <td style="text-align:right;"> 11587.351 </td>
   <td style="text-align:right;"> 21887.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25979.62277 </td>
   <td style="text-align:right;"> 646.992207 </td>
   <td style="text-align:right;"> 11314.444 </td>
   <td style="text-align:right;"> 21142.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9311.02330 </td>
   <td style="text-align:right;"> 102.044276 </td>
   <td style="text-align:right;"> 13049.994 </td>
   <td style="text-align:right;"> 21107.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6069.46701 </td>
   <td style="text-align:right;"> 308.495715 </td>
   <td style="text-align:right;"> 15063.899 </td>
   <td style="text-align:right;"> 21748.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43522.49678 </td>
   <td style="text-align:right;"> 936.144820 </td>
   <td style="text-align:right;"> 8887.302 </td>
   <td style="text-align:right;"> 21107.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17276.96075 </td>
   <td style="text-align:right;"> 523.206011 </td>
   <td style="text-align:right;"> 9721.139 </td>
   <td style="text-align:right;"> 21845.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18141.27009 </td>
   <td style="text-align:right;"> 526.365134 </td>
   <td style="text-align:right;"> 10702.294 </td>
   <td style="text-align:right;"> 21956.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27944.29877 </td>
   <td style="text-align:right;"> 667.453670 </td>
   <td style="text-align:right;"> 11359.252 </td>
   <td style="text-align:right;"> 21230.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15401.24365 </td>
   <td style="text-align:right;"> 482.199293 </td>
   <td style="text-align:right;"> 11532.677 </td>
   <td style="text-align:right;"> 21760.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20011.08880 </td>
   <td style="text-align:right;"> 559.702110 </td>
   <td style="text-align:right;"> 10827.425 </td>
   <td style="text-align:right;"> 21052.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38512.93090 </td>
   <td style="text-align:right;"> 833.090090 </td>
   <td style="text-align:right;"> 9564.642 </td>
   <td style="text-align:right;"> 21132.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21578.17970 </td>
   <td style="text-align:right;"> 580.690704 </td>
   <td style="text-align:right;"> 9258.600 </td>
   <td style="text-align:right;"> 21101.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43222.19883 </td>
   <td style="text-align:right;"> 909.260668 </td>
   <td style="text-align:right;"> 9156.021 </td>
   <td style="text-align:right;"> 21470.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -2767.24192 </td>
   <td style="text-align:right;"> 297.520525 </td>
   <td style="text-align:right;"> 12371.959 </td>
   <td style="text-align:right;"> 21763.94 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10049.65681 </td>
   <td style="text-align:right;"> 401.487669 </td>
   <td style="text-align:right;"> 12779.629 </td>
   <td style="text-align:right;"> 21608.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38809.65106 </td>
   <td style="text-align:right;"> 844.634981 </td>
   <td style="text-align:right;"> 9228.739 </td>
   <td style="text-align:right;"> 21213.05 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7404.56891 </td>
   <td style="text-align:right;"> 355.316309 </td>
   <td style="text-align:right;"> 12525.143 </td>
   <td style="text-align:right;"> 21524.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16418.18703 </td>
   <td style="text-align:right;"> 503.341912 </td>
   <td style="text-align:right;"> 12672.430 </td>
   <td style="text-align:right;"> 21325.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12124.39735 </td>
   <td style="text-align:right;"> 444.800116 </td>
   <td style="text-align:right;"> 11924.653 </td>
   <td style="text-align:right;"> 21238.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3131.95237 </td>
   <td style="text-align:right;"> 195.832894 </td>
   <td style="text-align:right;"> 14874.027 </td>
   <td style="text-align:right;"> 21498.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -900.53879 </td>
   <td style="text-align:right;"> 275.507897 </td>
   <td style="text-align:right;"> 12392.315 </td>
   <td style="text-align:right;"> 21817.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17859.00092 </td>
   <td style="text-align:right;"> 515.613686 </td>
   <td style="text-align:right;"> 13446.142 </td>
   <td style="text-align:right;"> 21863.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19673.91267 </td>
   <td style="text-align:right;"> 546.881682 </td>
   <td style="text-align:right;"> 12703.721 </td>
   <td style="text-align:right;"> 21596.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8913.49956 </td>
   <td style="text-align:right;"> 397.213652 </td>
   <td style="text-align:right;"> 11972.914 </td>
   <td style="text-align:right;"> 21268.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41950.45291 </td>
   <td style="text-align:right;"> 873.106995 </td>
   <td style="text-align:right;"> 10614.293 </td>
   <td style="text-align:right;"> 21688.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43236.53861 </td>
   <td style="text-align:right;"> 906.075982 </td>
   <td style="text-align:right;"> 10292.590 </td>
   <td style="text-align:right;"> 21097.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46036.66080 </td>
   <td style="text-align:right;"> 950.722265 </td>
   <td style="text-align:right;"> 9761.550 </td>
   <td style="text-align:right;"> 20889.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -771.18314 </td>
   <td style="text-align:right;"> 254.637049 </td>
   <td style="text-align:right;"> 12257.078 </td>
   <td style="text-align:right;"> 21319.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25973.29765 </td>
   <td style="text-align:right;"> 642.897056 </td>
   <td style="text-align:right;"> 11221.465 </td>
   <td style="text-align:right;"> 21141.26 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33322.70508 </td>
   <td style="text-align:right;"> 745.844800 </td>
   <td style="text-align:right;"> 12081.814 </td>
   <td style="text-align:right;"> 21321.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15798.10607 </td>
   <td style="text-align:right;"> 488.044613 </td>
   <td style="text-align:right;"> 13215.739 </td>
   <td style="text-align:right;"> 21556.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20954.65415 </td>
   <td style="text-align:right;"> 594.629958 </td>
   <td style="text-align:right;"> 9694.194 </td>
   <td style="text-align:right;"> 21961.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26525.46729 </td>
   <td style="text-align:right;"> 680.746578 </td>
   <td style="text-align:right;"> 9999.228 </td>
   <td style="text-align:right;"> 21697.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29269.00845 </td>
   <td style="text-align:right;"> 677.879423 </td>
   <td style="text-align:right;"> 10806.599 </td>
   <td style="text-align:right;"> 21194.36 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9191.69356 </td>
   <td style="text-align:right;"> 389.531481 </td>
   <td style="text-align:right;"> 11507.890 </td>
   <td style="text-align:right;"> 21713.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16564.86963 </td>
   <td style="text-align:right;"> 507.480526 </td>
   <td style="text-align:right;"> 10981.076 </td>
   <td style="text-align:right;"> 21863.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18633.53810 </td>
   <td style="text-align:right;"> 536.281007 </td>
   <td style="text-align:right;"> 10551.263 </td>
   <td style="text-align:right;"> 21643.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46700.40369 </td>
   <td style="text-align:right;"> 966.932096 </td>
   <td style="text-align:right;"> 9008.008 </td>
   <td style="text-align:right;"> 21261.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13567.75089 </td>
   <td style="text-align:right;"> 463.393935 </td>
   <td style="text-align:right;"> 10481.606 </td>
   <td style="text-align:right;"> 21163.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13525.69514 </td>
   <td style="text-align:right;"> 465.640178 </td>
   <td style="text-align:right;"> 10635.475 </td>
   <td style="text-align:right;"> 21056.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15450.97886 </td>
   <td style="text-align:right;"> 495.123436 </td>
   <td style="text-align:right;"> 9920.239 </td>
   <td style="text-align:right;"> 21186.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18739.92400 </td>
   <td style="text-align:right;"> 538.449400 </td>
   <td style="text-align:right;"> 11179.175 </td>
   <td style="text-align:right;"> 21268.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35860.20511 </td>
   <td style="text-align:right;"> 794.623221 </td>
   <td style="text-align:right;"> 9705.238 </td>
   <td style="text-align:right;"> 21552.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27220.04782 </td>
   <td style="text-align:right;"> 676.133343 </td>
   <td style="text-align:right;"> 10140.642 </td>
   <td style="text-align:right;"> 21337.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40400.40622 </td>
   <td style="text-align:right;"> 872.051644 </td>
   <td style="text-align:right;"> 9231.681 </td>
   <td style="text-align:right;"> 21790.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32592.49564 </td>
   <td style="text-align:right;"> 765.337714 </td>
   <td style="text-align:right;"> 9041.272 </td>
   <td style="text-align:right;"> 21688.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32464.29589 </td>
   <td style="text-align:right;"> 767.856743 </td>
   <td style="text-align:right;"> 8290.884 </td>
   <td style="text-align:right;"> 21835.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33325.66459 </td>
   <td style="text-align:right;"> 762.541116 </td>
   <td style="text-align:right;"> 11010.025 </td>
   <td style="text-align:right;"> 21142.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9023.38108 </td>
   <td style="text-align:right;"> 380.485451 </td>
   <td style="text-align:right;"> 10985.855 </td>
   <td style="text-align:right;"> 21751.36 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14209.05960 </td>
   <td style="text-align:right;"> 456.983078 </td>
   <td style="text-align:right;"> 11634.755 </td>
   <td style="text-align:right;"> 21851.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18464.30862 </td>
   <td style="text-align:right;"> 521.897542 </td>
   <td style="text-align:right;"> 10699.041 </td>
   <td style="text-align:right;"> 21814.18 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20565.83936 </td>
   <td style="text-align:right;"> 563.047046 </td>
   <td style="text-align:right;"> 12203.997 </td>
   <td style="text-align:right;"> 21061.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17693.49036 </td>
   <td style="text-align:right;"> 523.965417 </td>
   <td style="text-align:right;"> 11128.544 </td>
   <td style="text-align:right;"> 21654.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -3781.82268 </td>
   <td style="text-align:right;"> 317.710586 </td>
   <td style="text-align:right;"> 10586.934 </td>
   <td style="text-align:right;"> 21496.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -45094.25755 </td>
   <td style="text-align:right;"> 935.614547 </td>
   <td style="text-align:right;"> 11387.548 </td>
   <td style="text-align:right;"> 21596.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44209.10133 </td>
   <td style="text-align:right;"> 922.643026 </td>
   <td style="text-align:right;"> 11203.460 </td>
   <td style="text-align:right;"> 21605.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -50506.77724 </td>
   <td style="text-align:right;"> 1017.117450 </td>
   <td style="text-align:right;"> 10285.316 </td>
   <td style="text-align:right;"> 21086.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22864.41900 </td>
   <td style="text-align:right;"> 582.680328 </td>
   <td style="text-align:right;"> 13788.649 </td>
   <td style="text-align:right;"> 21573.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9296.06074 </td>
   <td style="text-align:right;"> 390.402583 </td>
   <td style="text-align:right;"> 10530.865 </td>
   <td style="text-align:right;"> 22416.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9471.56463 </td>
   <td style="text-align:right;"> 391.221480 </td>
   <td style="text-align:right;"> 11240.048 </td>
   <td style="text-align:right;"> 22354.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18281.15413 </td>
   <td style="text-align:right;"> 528.767364 </td>
   <td style="text-align:right;"> 12160.124 </td>
   <td style="text-align:right;"> 21351.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38745.75562 </td>
   <td style="text-align:right;"> 831.200204 </td>
   <td style="text-align:right;"> 9536.990 </td>
   <td style="text-align:right;"> 21276.25 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6327.17136 </td>
   <td style="text-align:right;"> 355.982977 </td>
   <td style="text-align:right;"> 11906.977 </td>
   <td style="text-align:right;"> 21164.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42013.84040 </td>
   <td style="text-align:right;"> 909.856076 </td>
   <td style="text-align:right;"> 8032.027 </td>
   <td style="text-align:right;"> 21075.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -53781.12045 </td>
   <td style="text-align:right;"> 1061.733025 </td>
   <td style="text-align:right;"> 8567.268 </td>
   <td style="text-align:right;"> 21748.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -48135.40975 </td>
   <td style="text-align:right;"> 1015.832204 </td>
   <td style="text-align:right;"> 6565.580 </td>
   <td style="text-align:right;"> 21804.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12959.83452 </td>
   <td style="text-align:right;"> 440.908378 </td>
   <td style="text-align:right;"> 13854.526 </td>
   <td style="text-align:right;"> 21624.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6363.33841 </td>
   <td style="text-align:right;"> 154.197715 </td>
   <td style="text-align:right;"> 12953.803 </td>
   <td style="text-align:right;"> 20752.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 15084.71213 </td>
   <td style="text-align:right;"> 20.632306 </td>
   <td style="text-align:right;"> 11442.205 </td>
   <td style="text-align:right;"> 21100.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 14978.83445 </td>
   <td style="text-align:right;"> 19.698980 </td>
   <td style="text-align:right;"> 11521.996 </td>
   <td style="text-align:right;"> 21051.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6634.27560 </td>
   <td style="text-align:right;"> 144.253892 </td>
   <td style="text-align:right;"> 11388.483 </td>
   <td style="text-align:right;"> 21021.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29853.67866 </td>
   <td style="text-align:right;"> 702.979821 </td>
   <td style="text-align:right;"> 11516.643 </td>
   <td style="text-align:right;"> 21649.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23688.71897 </td>
   <td style="text-align:right;"> 615.499219 </td>
   <td style="text-align:right;"> 11865.072 </td>
   <td style="text-align:right;"> 21711.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23351.62377 </td>
   <td style="text-align:right;"> 609.004470 </td>
   <td style="text-align:right;"> 12403.516 </td>
   <td style="text-align:right;"> 21798.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -2340.13681 </td>
   <td style="text-align:right;"> 280.522636 </td>
   <td style="text-align:right;"> 11385.774 </td>
   <td style="text-align:right;"> 21438.89 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37193.78602 </td>
   <td style="text-align:right;"> 828.371255 </td>
   <td style="text-align:right;"> 10978.975 </td>
   <td style="text-align:right;"> 21442.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11156.65634 </td>
   <td style="text-align:right;"> 407.765879 </td>
   <td style="text-align:right;"> 11212.930 </td>
   <td style="text-align:right;"> 21622.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33740.61077 </td>
   <td style="text-align:right;"> 762.454826 </td>
   <td style="text-align:right;"> 10920.091 </td>
   <td style="text-align:right;"> 21077.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34853.18801 </td>
   <td style="text-align:right;"> 798.708358 </td>
   <td style="text-align:right;"> 9231.963 </td>
   <td style="text-align:right;"> 21600.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42053.23252 </td>
   <td style="text-align:right;"> 899.208621 </td>
   <td style="text-align:right;"> 8939.077 </td>
   <td style="text-align:right;"> 21592.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16438.68736 </td>
   <td style="text-align:right;"> 498.591942 </td>
   <td style="text-align:right;"> 10905.877 </td>
   <td style="text-align:right;"> 21416.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21255.80227 </td>
   <td style="text-align:right;"> 564.757205 </td>
   <td style="text-align:right;"> 11479.892 </td>
   <td style="text-align:right;"> 21687.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31529.89355 </td>
   <td style="text-align:right;"> 732.153685 </td>
   <td style="text-align:right;"> 12232.297 </td>
   <td style="text-align:right;"> 20994.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25689.25234 </td>
   <td style="text-align:right;"> 661.295869 </td>
   <td style="text-align:right;"> 9992.771 </td>
   <td style="text-align:right;"> 20782.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31517.80827 </td>
   <td style="text-align:right;"> 734.068398 </td>
   <td style="text-align:right;"> 11141.258 </td>
   <td style="text-align:right;"> 21467.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34949.84896 </td>
   <td style="text-align:right;"> 787.461389 </td>
   <td style="text-align:right;"> 8803.343 </td>
   <td style="text-align:right;"> 21070.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15434.93122 </td>
   <td style="text-align:right;"> 479.615137 </td>
   <td style="text-align:right;"> 13043.922 </td>
   <td style="text-align:right;"> 21295.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18830.05658 </td>
   <td style="text-align:right;"> 548.837604 </td>
   <td style="text-align:right;"> 10097.837 </td>
   <td style="text-align:right;"> 21436.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -52414.46467 </td>
   <td style="text-align:right;"> 1053.985990 </td>
   <td style="text-align:right;"> 7643.047 </td>
   <td style="text-align:right;"> 21409.43 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37107.08752 </td>
   <td style="text-align:right;"> 825.702710 </td>
   <td style="text-align:right;"> 9471.535 </td>
   <td style="text-align:right;"> 21074.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28008.07402 </td>
   <td style="text-align:right;"> 678.849189 </td>
   <td style="text-align:right;"> 10009.562 </td>
   <td style="text-align:right;"> 21434.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29531.91778 </td>
   <td style="text-align:right;"> 712.800118 </td>
   <td style="text-align:right;"> 8961.665 </td>
   <td style="text-align:right;"> 21582.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39355.58886 </td>
   <td style="text-align:right;"> 858.701752 </td>
   <td style="text-align:right;"> 10283.837 </td>
   <td style="text-align:right;"> 21434.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35683.45113 </td>
   <td style="text-align:right;"> 782.572650 </td>
   <td style="text-align:right;"> 9673.853 </td>
   <td style="text-align:right;"> 21094.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28317.13617 </td>
   <td style="text-align:right;"> 681.926090 </td>
   <td style="text-align:right;"> 9212.941 </td>
   <td style="text-align:right;"> 21676.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30765.40746 </td>
   <td style="text-align:right;"> 715.081281 </td>
   <td style="text-align:right;"> 10468.453 </td>
   <td style="text-align:right;"> 21508.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33313.35791 </td>
   <td style="text-align:right;"> 778.016382 </td>
   <td style="text-align:right;"> 8494.267 </td>
   <td style="text-align:right;"> 21242.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34873.58393 </td>
   <td style="text-align:right;"> 792.247261 </td>
   <td style="text-align:right;"> 9318.859 </td>
   <td style="text-align:right;"> 21618.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33301.99395 </td>
   <td style="text-align:right;"> 745.493579 </td>
   <td style="text-align:right;"> 11599.710 </td>
   <td style="text-align:right;"> 21204.00 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19584.04659 </td>
   <td style="text-align:right;"> 546.864717 </td>
   <td style="text-align:right;"> 9815.156 </td>
   <td style="text-align:right;"> 21232.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30376.68560 </td>
   <td style="text-align:right;"> 714.704735 </td>
   <td style="text-align:right;"> 10308.581 </td>
   <td style="text-align:right;"> 20778.46 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34304.83609 </td>
   <td style="text-align:right;"> 774.370638 </td>
   <td style="text-align:right;"> 9400.276 </td>
   <td style="text-align:right;"> 21269.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -45323.87339 </td>
   <td style="text-align:right;"> 937.825270 </td>
   <td style="text-align:right;"> 9484.760 </td>
   <td style="text-align:right;"> 21222.23 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 377.70556 </td>
   <td style="text-align:right;"> 241.566794 </td>
   <td style="text-align:right;"> 13447.009 </td>
   <td style="text-align:right;"> 21570.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15288.34555 </td>
   <td style="text-align:right;"> 474.244466 </td>
   <td style="text-align:right;"> 13440.677 </td>
   <td style="text-align:right;"> 21281.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33079.67198 </td>
   <td style="text-align:right;"> 758.079837 </td>
   <td style="text-align:right;"> 9392.584 </td>
   <td style="text-align:right;"> 21438.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32815.59428 </td>
   <td style="text-align:right;"> 759.519274 </td>
   <td style="text-align:right;"> 9968.581 </td>
   <td style="text-align:right;"> 21284.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38963.57240 </td>
   <td style="text-align:right;"> 847.993498 </td>
   <td style="text-align:right;"> 8545.763 </td>
   <td style="text-align:right;"> 21170.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19415.61012 </td>
   <td style="text-align:right;"> 551.476125 </td>
   <td style="text-align:right;"> 11318.567 </td>
   <td style="text-align:right;"> 21218.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6811.32732 </td>
   <td style="text-align:right;"> 341.011398 </td>
   <td style="text-align:right;"> 12497.110 </td>
   <td style="text-align:right;"> 20977.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40745.71431 </td>
   <td style="text-align:right;"> 887.233637 </td>
   <td style="text-align:right;"> 8775.617 </td>
   <td style="text-align:right;"> 21829.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13185.46773 </td>
   <td style="text-align:right;"> 451.142814 </td>
   <td style="text-align:right;"> 11709.872 </td>
   <td style="text-align:right;"> 21462.84 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23209.06730 </td>
   <td style="text-align:right;"> 606.464313 </td>
   <td style="text-align:right;"> 10167.783 </td>
   <td style="text-align:right;"> 20799.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25803.09723 </td>
   <td style="text-align:right;"> 654.863903 </td>
   <td style="text-align:right;"> 9732.746 </td>
   <td style="text-align:right;"> 21583.28 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20421.53934 </td>
   <td style="text-align:right;"> 562.478150 </td>
   <td style="text-align:right;"> 11246.106 </td>
   <td style="text-align:right;"> 21795.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17238.07605 </td>
   <td style="text-align:right;"> 512.917522 </td>
   <td style="text-align:right;"> 12394.531 </td>
   <td style="text-align:right;"> 21165.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23235.00416 </td>
   <td style="text-align:right;"> 595.077808 </td>
   <td style="text-align:right;"> 13726.632 </td>
   <td style="text-align:right;"> 21345.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37482.71190 </td>
   <td style="text-align:right;"> 834.660008 </td>
   <td style="text-align:right;"> 8880.287 </td>
   <td style="text-align:right;"> 21311.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37183.88432 </td>
   <td style="text-align:right;"> 836.646246 </td>
   <td style="text-align:right;"> 10065.969 </td>
   <td style="text-align:right;"> 22142.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38280.70843 </td>
   <td style="text-align:right;"> 840.043578 </td>
   <td style="text-align:right;"> 8595.097 </td>
   <td style="text-align:right;"> 21194.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -1456.34779 </td>
   <td style="text-align:right;"> 277.735720 </td>
   <td style="text-align:right;"> 12683.064 </td>
   <td style="text-align:right;"> 21187.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29746.83064 </td>
   <td style="text-align:right;"> 709.914669 </td>
   <td style="text-align:right;"> 11496.940 </td>
   <td style="text-align:right;"> 21459.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21892.33299 </td>
   <td style="text-align:right;"> 591.311206 </td>
   <td style="text-align:right;"> 11307.596 </td>
   <td style="text-align:right;"> 21554.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11000.82674 </td>
   <td style="text-align:right;"> 403.105184 </td>
   <td style="text-align:right;"> 12194.092 </td>
   <td style="text-align:right;"> 21255.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12878.87227 </td>
   <td style="text-align:right;"> 436.264996 </td>
   <td style="text-align:right;"> 13117.009 </td>
   <td style="text-align:right;"> 21646.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36626.75512 </td>
   <td style="text-align:right;"> 823.795933 </td>
   <td style="text-align:right;"> 9297.907 </td>
   <td style="text-align:right;"> 21250.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34244.53417 </td>
   <td style="text-align:right;"> 779.848455 </td>
   <td style="text-align:right;"> 9156.492 </td>
   <td style="text-align:right;"> 21481.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46773.01876 </td>
   <td style="text-align:right;"> 971.526608 </td>
   <td style="text-align:right;"> 8204.436 </td>
   <td style="text-align:right;"> 21247.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34136.22257 </td>
   <td style="text-align:right;"> 769.276287 </td>
   <td style="text-align:right;"> 9755.878 </td>
   <td style="text-align:right;"> 21502.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20381.28743 </td>
   <td style="text-align:right;"> 564.124225 </td>
   <td style="text-align:right;"> 9487.749 </td>
   <td style="text-align:right;"> 20899.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32510.38130 </td>
   <td style="text-align:right;"> 747.425219 </td>
   <td style="text-align:right;"> 10292.796 </td>
   <td style="text-align:right;"> 20730.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -8664.84396 </td>
   <td style="text-align:right;"> 373.307415 </td>
   <td style="text-align:right;"> 12323.148 </td>
   <td style="text-align:right;"> 21244.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26695.44923 </td>
   <td style="text-align:right;"> 657.689138 </td>
   <td style="text-align:right;"> 12569.517 </td>
   <td style="text-align:right;"> 21675.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28120.06224 </td>
   <td style="text-align:right;"> 679.007513 </td>
   <td style="text-align:right;"> 12349.824 </td>
   <td style="text-align:right;"> 21827.84 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28015.18364 </td>
   <td style="text-align:right;"> 696.986798 </td>
   <td style="text-align:right;"> 9945.913 </td>
   <td style="text-align:right;"> 21828.58 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15780.39401 </td>
   <td style="text-align:right;"> 468.736144 </td>
   <td style="text-align:right;"> 13440.129 </td>
   <td style="text-align:right;"> 21008.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32740.90955 </td>
   <td style="text-align:right;"> 739.744167 </td>
   <td style="text-align:right;"> 10703.594 </td>
   <td style="text-align:right;"> 21009.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23929.26098 </td>
   <td style="text-align:right;"> 622.812548 </td>
   <td style="text-align:right;"> 12026.625 </td>
   <td style="text-align:right;"> 21585.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31957.66630 </td>
   <td style="text-align:right;"> 740.860133 </td>
   <td style="text-align:right;"> 9006.109 </td>
   <td style="text-align:right;"> 21378.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34192.53113 </td>
   <td style="text-align:right;"> 770.659078 </td>
   <td style="text-align:right;"> 9690.505 </td>
   <td style="text-align:right;"> 21366.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19630.53541 </td>
   <td style="text-align:right;"> 564.172272 </td>
   <td style="text-align:right;"> 8269.559 </td>
   <td style="text-align:right;"> 22400.44 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14339.41173 </td>
   <td style="text-align:right;"> 478.111995 </td>
   <td style="text-align:right;"> 9165.719 </td>
   <td style="text-align:right;"> 22179.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42153.40558 </td>
   <td style="text-align:right;"> 896.528778 </td>
   <td style="text-align:right;"> 10686.239 </td>
   <td style="text-align:right;"> 21305.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14667.83244 </td>
   <td style="text-align:right;"> 482.482566 </td>
   <td style="text-align:right;"> 9882.213 </td>
   <td style="text-align:right;"> 21023.52 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5371.93906 </td>
   <td style="text-align:right;"> 333.470373 </td>
   <td style="text-align:right;"> 11176.836 </td>
   <td style="text-align:right;"> 21247.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26821.37896 </td>
   <td style="text-align:right;"> 654.527792 </td>
   <td style="text-align:right;"> 12106.382 </td>
   <td style="text-align:right;"> 20987.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31277.69623 </td>
   <td style="text-align:right;"> 734.034348 </td>
   <td style="text-align:right;"> 8578.585 </td>
   <td style="text-align:right;"> 21477.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26664.85668 </td>
   <td style="text-align:right;"> 648.979893 </td>
   <td style="text-align:right;"> 11768.386 </td>
   <td style="text-align:right;"> 21166.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -47331.26880 </td>
   <td style="text-align:right;"> 977.389324 </td>
   <td style="text-align:right;"> 10279.368 </td>
   <td style="text-align:right;"> 21751.05 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29745.30482 </td>
   <td style="text-align:right;"> 692.424431 </td>
   <td style="text-align:right;"> 12187.117 </td>
   <td style="text-align:right;"> 20795.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10620.08492 </td>
   <td style="text-align:right;"> 420.429698 </td>
   <td style="text-align:right;"> 10364.201 </td>
   <td style="text-align:right;"> 21477.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -45586.76720 </td>
   <td style="text-align:right;"> 946.232269 </td>
   <td style="text-align:right;"> 9974.893 </td>
   <td style="text-align:right;"> 21014.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34209.15797 </td>
   <td style="text-align:right;"> 771.016902 </td>
   <td style="text-align:right;"> 10018.534 </td>
   <td style="text-align:right;"> 20975.12 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41100.05849 </td>
   <td style="text-align:right;"> 883.415499 </td>
   <td style="text-align:right;"> 9442.079 </td>
   <td style="text-align:right;"> 21463.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39046.17953 </td>
   <td style="text-align:right;"> 857.767704 </td>
   <td style="text-align:right;"> 8114.617 </td>
   <td style="text-align:right;"> 21960.94 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25725.60230 </td>
   <td style="text-align:right;"> 643.660920 </td>
   <td style="text-align:right;"> 12645.008 </td>
   <td style="text-align:right;"> 21028.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17436.60833 </td>
   <td style="text-align:right;"> 524.084678 </td>
   <td style="text-align:right;"> 9464.333 </td>
   <td style="text-align:right;"> 21889.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16852.44816 </td>
   <td style="text-align:right;"> 494.222376 </td>
   <td style="text-align:right;"> 11627.321 </td>
   <td style="text-align:right;"> 21197.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38533.88937 </td>
   <td style="text-align:right;"> 848.491835 </td>
   <td style="text-align:right;"> 10110.362 </td>
   <td style="text-align:right;"> 21049.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2308.07068 </td>
   <td style="text-align:right;"> 209.539179 </td>
   <td style="text-align:right;"> 12842.696 </td>
   <td style="text-align:right;"> 21567.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1038.56966 </td>
   <td style="text-align:right;"> 231.081477 </td>
   <td style="text-align:right;"> 12862.435 </td>
   <td style="text-align:right;"> 21533.36 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9979.33869 </td>
   <td style="text-align:right;"> 390.944772 </td>
   <td style="text-align:right;"> 14468.184 </td>
   <td style="text-align:right;"> 21749.77 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9858.47545 </td>
   <td style="text-align:right;"> 388.584205 </td>
   <td style="text-align:right;"> 14665.673 </td>
   <td style="text-align:right;"> 21738.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -66854.42550 </td>
   <td style="text-align:right;"> 1287.643654 </td>
   <td style="text-align:right;"> 4404.877 </td>
   <td style="text-align:right;"> 20777.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6085.45336 </td>
   <td style="text-align:right;"> 159.346141 </td>
   <td style="text-align:right;"> 13102.248 </td>
   <td style="text-align:right;"> 22080.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15233.46190 </td>
   <td style="text-align:right;"> 497.125986 </td>
   <td style="text-align:right;"> 12247.663 </td>
   <td style="text-align:right;"> 22383.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11229.68646 </td>
   <td style="text-align:right;"> 426.013575 </td>
   <td style="text-align:right;"> 12999.836 </td>
   <td style="text-align:right;"> 21372.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6672.79708 </td>
   <td style="text-align:right;"> 363.178099 </td>
   <td style="text-align:right;"> 13020.670 </td>
   <td style="text-align:right;"> 21309.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33296.43007 </td>
   <td style="text-align:right;"> 744.723797 </td>
   <td style="text-align:right;"> 9786.933 </td>
   <td style="text-align:right;"> 21547.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31222.77117 </td>
   <td style="text-align:right;"> 724.655561 </td>
   <td style="text-align:right;"> 9433.760 </td>
   <td style="text-align:right;"> 21269.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27988.26232 </td>
   <td style="text-align:right;"> 679.144763 </td>
   <td style="text-align:right;"> 10057.550 </td>
   <td style="text-align:right;"> 22020.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26123.39375 </td>
   <td style="text-align:right;"> 664.035397 </td>
   <td style="text-align:right;"> 9134.035 </td>
   <td style="text-align:right;"> 21662.14 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40543.80402 </td>
   <td style="text-align:right;"> 874.173280 </td>
   <td style="text-align:right;"> 10683.256 </td>
   <td style="text-align:right;"> 21640.02 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22890.30066 </td>
   <td style="text-align:right;"> 616.373582 </td>
   <td style="text-align:right;"> 9538.557 </td>
   <td style="text-align:right;"> 21253.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32332.44659 </td>
   <td style="text-align:right;"> 746.282091 </td>
   <td style="text-align:right;"> 11129.591 </td>
   <td style="text-align:right;"> 21366.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23366.93439 </td>
   <td style="text-align:right;"> 601.290814 </td>
   <td style="text-align:right;"> 10830.229 </td>
   <td style="text-align:right;"> 21366.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -41847.62988 </td>
   <td style="text-align:right;"> 901.120270 </td>
   <td style="text-align:right;"> 9349.937 </td>
   <td style="text-align:right;"> 21203.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42610.35261 </td>
   <td style="text-align:right;"> 902.907205 </td>
   <td style="text-align:right;"> 8875.500 </td>
   <td style="text-align:right;"> 21610.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20343.00502 </td>
   <td style="text-align:right;"> 549.981800 </td>
   <td style="text-align:right;"> 11586.457 </td>
   <td style="text-align:right;"> 21125.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17375.63239 </td>
   <td style="text-align:right;"> 520.295310 </td>
   <td style="text-align:right;"> 11483.241 </td>
   <td style="text-align:right;"> 21533.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26945.69710 </td>
   <td style="text-align:right;"> 675.090292 </td>
   <td style="text-align:right;"> 9237.171 </td>
   <td style="text-align:right;"> 21375.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40055.96619 </td>
   <td style="text-align:right;"> 863.228226 </td>
   <td style="text-align:right;"> 10053.886 </td>
   <td style="text-align:right;"> 21531.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15800.95893 </td>
   <td style="text-align:right;"> 481.127231 </td>
   <td style="text-align:right;"> 11463.726 </td>
   <td style="text-align:right;"> 21224.84 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15323.90731 </td>
   <td style="text-align:right;"> 487.985530 </td>
   <td style="text-align:right;"> 12261.156 </td>
   <td style="text-align:right;"> 21190.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -5357.15528 </td>
   <td style="text-align:right;"> 328.548351 </td>
   <td style="text-align:right;"> 12924.357 </td>
   <td style="text-align:right;"> 21320.37 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14776.09828 </td>
   <td style="text-align:right;"> 469.214664 </td>
   <td style="text-align:right;"> 11838.535 </td>
   <td style="text-align:right;"> 21275.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40077.73485 </td>
   <td style="text-align:right;"> 872.591361 </td>
   <td style="text-align:right;"> 7929.085 </td>
   <td style="text-align:right;"> 22216.30 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28724.71949 </td>
   <td style="text-align:right;"> 695.248681 </td>
   <td style="text-align:right;"> 10305.649 </td>
   <td style="text-align:right;"> 20723.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30263.45481 </td>
   <td style="text-align:right;"> 720.370788 </td>
   <td style="text-align:right;"> 10248.136 </td>
   <td style="text-align:right;"> 20878.74 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19709.83115 </td>
   <td style="text-align:right;"> 533.160227 </td>
   <td style="text-align:right;"> 11308.080 </td>
   <td style="text-align:right;"> 21383.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21242.14204 </td>
   <td style="text-align:right;"> 577.960075 </td>
   <td style="text-align:right;"> 11484.778 </td>
   <td style="text-align:right;"> 20904.01 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11823.00165 </td>
   <td style="text-align:right;"> 415.151982 </td>
   <td style="text-align:right;"> 12698.951 </td>
   <td style="text-align:right;"> 21971.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39201.76370 </td>
   <td style="text-align:right;"> 853.751102 </td>
   <td style="text-align:right;"> 8966.343 </td>
   <td style="text-align:right;"> 21073.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37850.26303 </td>
   <td style="text-align:right;"> 829.325407 </td>
   <td style="text-align:right;"> 8848.755 </td>
   <td style="text-align:right;"> 22108.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -34567.90705 </td>
   <td style="text-align:right;"> 780.795971 </td>
   <td style="text-align:right;"> 8520.868 </td>
   <td style="text-align:right;"> 22144.75 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16039.73295 </td>
   <td style="text-align:right;"> 499.808376 </td>
   <td style="text-align:right;"> 12792.925 </td>
   <td style="text-align:right;"> 20697.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26571.62651 </td>
   <td style="text-align:right;"> 670.822385 </td>
   <td style="text-align:right;"> 9888.254 </td>
   <td style="text-align:right;"> 22700.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35431.11609 </td>
   <td style="text-align:right;"> 786.680028 </td>
   <td style="text-align:right;"> 9874.276 </td>
   <td style="text-align:right;"> 20181.85 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30715.62971 </td>
   <td style="text-align:right;"> 720.807808 </td>
   <td style="text-align:right;"> 10342.805 </td>
   <td style="text-align:right;"> 20692.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26381.61128 </td>
   <td style="text-align:right;"> 652.554087 </td>
   <td style="text-align:right;"> 10182.734 </td>
   <td style="text-align:right;"> 21969.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26494.26588 </td>
   <td style="text-align:right;"> 651.323910 </td>
   <td style="text-align:right;"> 10244.269 </td>
   <td style="text-align:right;"> 22079.32 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30784.15462 </td>
   <td style="text-align:right;"> 731.553751 </td>
   <td style="text-align:right;"> 9178.220 </td>
   <td style="text-align:right;"> 20424.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30705.09656 </td>
   <td style="text-align:right;"> 722.921726 </td>
   <td style="text-align:right;"> 9514.844 </td>
   <td style="text-align:right;"> 22140.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23284.11381 </td>
   <td style="text-align:right;"> 598.346031 </td>
   <td style="text-align:right;"> 11784.138 </td>
   <td style="text-align:right;"> 21881.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26910.23272 </td>
   <td style="text-align:right;"> 663.893202 </td>
   <td style="text-align:right;"> 11072.441 </td>
   <td style="text-align:right;"> 21606.19 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37155.32184 </td>
   <td style="text-align:right;"> 806.599949 </td>
   <td style="text-align:right;"> 10452.396 </td>
   <td style="text-align:right;"> 21471.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33137.57944 </td>
   <td style="text-align:right;"> 767.016746 </td>
   <td style="text-align:right;"> 8733.651 </td>
   <td style="text-align:right;"> 21676.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29481.60896 </td>
   <td style="text-align:right;"> 712.104318 </td>
   <td style="text-align:right;"> 8942.845 </td>
   <td style="text-align:right;"> 21405.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11913.46326 </td>
   <td style="text-align:right;"> 413.615276 </td>
   <td style="text-align:right;"> 14074.515 </td>
   <td style="text-align:right;"> 21040.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -52676.28537 </td>
   <td style="text-align:right;"> 1058.623963 </td>
   <td style="text-align:right;"> 8561.044 </td>
   <td style="text-align:right;"> 21818.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15728.36659 </td>
   <td style="text-align:right;"> 500.088272 </td>
   <td style="text-align:right;"> 10945.012 </td>
   <td style="text-align:right;"> 20872.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17654.28722 </td>
   <td style="text-align:right;"> 533.338587 </td>
   <td style="text-align:right;"> 10531.582 </td>
   <td style="text-align:right;"> 21003.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -45510.53886 </td>
   <td style="text-align:right;"> 948.085686 </td>
   <td style="text-align:right;"> 8913.729 </td>
   <td style="text-align:right;"> 22097.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30653.90015 </td>
   <td style="text-align:right;"> 749.296155 </td>
   <td style="text-align:right;"> 8495.999 </td>
   <td style="text-align:right;"> 21750.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26664.87020 </td>
   <td style="text-align:right;"> 652.627366 </td>
   <td style="text-align:right;"> 10473.045 </td>
   <td style="text-align:right;"> 21034.36 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28626.70973 </td>
   <td style="text-align:right;"> 682.094533 </td>
   <td style="text-align:right;"> 12455.485 </td>
   <td style="text-align:right;"> 21314.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16757.70651 </td>
   <td style="text-align:right;"> 519.599917 </td>
   <td style="text-align:right;"> 9503.721 </td>
   <td style="text-align:right;"> 21827.84 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35359.90821 </td>
   <td style="text-align:right;"> 765.501084 </td>
   <td style="text-align:right;"> 12094.979 </td>
   <td style="text-align:right;"> 21891.41 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35756.62381 </td>
   <td style="text-align:right;"> 807.151839 </td>
   <td style="text-align:right;"> 7465.702 </td>
   <td style="text-align:right;"> 21250.42 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35581.61764 </td>
   <td style="text-align:right;"> 793.740860 </td>
   <td style="text-align:right;"> 10144.614 </td>
   <td style="text-align:right;"> 21631.94 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36818.27954 </td>
   <td style="text-align:right;"> 822.933470 </td>
   <td style="text-align:right;"> 8663.149 </td>
   <td style="text-align:right;"> 21103.95 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2458.62281 </td>
   <td style="text-align:right;"> 225.406019 </td>
   <td style="text-align:right;"> 11136.514 </td>
   <td style="text-align:right;"> 21405.91 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24282.31656 </td>
   <td style="text-align:right;"> 623.233219 </td>
   <td style="text-align:right;"> 10396.820 </td>
   <td style="text-align:right;"> 21854.96 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27927.47412 </td>
   <td style="text-align:right;"> 670.996253 </td>
   <td style="text-align:right;"> 11706.664 </td>
   <td style="text-align:right;"> 21377.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26834.23225 </td>
   <td style="text-align:right;"> 654.063124 </td>
   <td style="text-align:right;"> 11784.760 </td>
   <td style="text-align:right;"> 21176.78 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9965.23772 </td>
   <td style="text-align:right;"> 404.921354 </td>
   <td style="text-align:right;"> 11529.441 </td>
   <td style="text-align:right;"> 21305.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31783.32573 </td>
   <td style="text-align:right;"> 741.964279 </td>
   <td style="text-align:right;"> 10832.295 </td>
   <td style="text-align:right;"> 21474.69 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21199.23921 </td>
   <td style="text-align:right;"> 581.007402 </td>
   <td style="text-align:right;"> 10552.667 </td>
   <td style="text-align:right;"> 21309.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27693.34413 </td>
   <td style="text-align:right;"> 674.461333 </td>
   <td style="text-align:right;"> 11327.705 </td>
   <td style="text-align:right;"> 21402.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -3311.70363 </td>
   <td style="text-align:right;"> 296.547308 </td>
   <td style="text-align:right;"> 12361.162 </td>
   <td style="text-align:right;"> 21700.73 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7671.02054 </td>
   <td style="text-align:right;"> 362.611997 </td>
   <td style="text-align:right;"> 12340.237 </td>
   <td style="text-align:right;"> 21437.59 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -50128.42074 </td>
   <td style="text-align:right;"> 1029.074765 </td>
   <td style="text-align:right;"> 8046.114 </td>
   <td style="text-align:right;"> 21495.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33016.92928 </td>
   <td style="text-align:right;"> 754.421541 </td>
   <td style="text-align:right;"> 8773.267 </td>
   <td style="text-align:right;"> 21759.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20708.17828 </td>
   <td style="text-align:right;"> 550.917014 </td>
   <td style="text-align:right;"> 12166.597 </td>
   <td style="text-align:right;"> 21477.76 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -6778.65761 </td>
   <td style="text-align:right;"> 353.190847 </td>
   <td style="text-align:right;"> 11082.199 </td>
   <td style="text-align:right;"> 21945.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33413.61273 </td>
   <td style="text-align:right;"> 778.433743 </td>
   <td style="text-align:right;"> 8587.738 </td>
   <td style="text-align:right;"> 20707.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39728.17087 </td>
   <td style="text-align:right;"> 867.826516 </td>
   <td style="text-align:right;"> 10111.953 </td>
   <td style="text-align:right;"> 21339.98 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12621.51802 </td>
   <td style="text-align:right;"> 427.604950 </td>
   <td style="text-align:right;"> 12635.734 </td>
   <td style="text-align:right;"> 22029.08 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -15673.68003 </td>
   <td style="text-align:right;"> 478.872403 </td>
   <td style="text-align:right;"> 12590.161 </td>
   <td style="text-align:right;"> 21941.70 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26327.99831 </td>
   <td style="text-align:right;"> 662.262556 </td>
   <td style="text-align:right;"> 9111.943 </td>
   <td style="text-align:right;"> 20950.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43846.63813 </td>
   <td style="text-align:right;"> 922.977016 </td>
   <td style="text-align:right;"> 9943.684 </td>
   <td style="text-align:right;"> 20743.64 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -3691.34230 </td>
   <td style="text-align:right;"> 304.184597 </td>
   <td style="text-align:right;"> 11658.650 </td>
   <td style="text-align:right;"> 21712.57 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26218.78785 </td>
   <td style="text-align:right;"> 643.297831 </td>
   <td style="text-align:right;"> 11439.386 </td>
   <td style="text-align:right;"> 21989.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -10380.44920 </td>
   <td style="text-align:right;"> 412.946578 </td>
   <td style="text-align:right;"> 11636.813 </td>
   <td style="text-align:right;"> 21451.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -46744.86241 </td>
   <td style="text-align:right;"> 962.737159 </td>
   <td style="text-align:right;"> 9189.661 </td>
   <td style="text-align:right;"> 21900.13 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13659.73827 </td>
   <td style="text-align:right;"> 456.053990 </td>
   <td style="text-align:right;"> 12796.052 </td>
   <td style="text-align:right;"> 21098.45 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23260.16578 </td>
   <td style="text-align:right;"> 606.358325 </td>
   <td style="text-align:right;"> 10380.681 </td>
   <td style="text-align:right;"> 21955.34 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23295.25953 </td>
   <td style="text-align:right;"> 611.441175 </td>
   <td style="text-align:right;"> 10469.887 </td>
   <td style="text-align:right;"> 21628.72 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32345.02165 </td>
   <td style="text-align:right;"> 734.691840 </td>
   <td style="text-align:right;"> 11357.608 </td>
   <td style="text-align:right;"> 21228.61 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28967.05547 </td>
   <td style="text-align:right;"> 691.058369 </td>
   <td style="text-align:right;"> 11078.725 </td>
   <td style="text-align:right;"> 20810.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20518.41576 </td>
   <td style="text-align:right;"> 564.064039 </td>
   <td style="text-align:right;"> 11736.489 </td>
   <td style="text-align:right;"> 21484.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35356.70836 </td>
   <td style="text-align:right;"> 791.933679 </td>
   <td style="text-align:right;"> 10181.794 </td>
   <td style="text-align:right;"> 21444.21 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27535.41235 </td>
   <td style="text-align:right;"> 673.704724 </td>
   <td style="text-align:right;"> 9829.334 </td>
   <td style="text-align:right;"> 21173.43 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -48110.85901 </td>
   <td style="text-align:right;"> 987.254462 </td>
   <td style="text-align:right;"> 8583.781 </td>
   <td style="text-align:right;"> 21584.90 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40409.85937 </td>
   <td style="text-align:right;"> 867.746995 </td>
   <td style="text-align:right;"> 8609.900 </td>
   <td style="text-align:right;"> 20864.49 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29796.82490 </td>
   <td style="text-align:right;"> 705.438525 </td>
   <td style="text-align:right;"> 10065.698 </td>
   <td style="text-align:right;"> 22146.15 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38547.72302 </td>
   <td style="text-align:right;"> 830.976941 </td>
   <td style="text-align:right;"> 10708.259 </td>
   <td style="text-align:right;"> 22235.40 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -37620.15737 </td>
   <td style="text-align:right;"> 841.294927 </td>
   <td style="text-align:right;"> 8744.426 </td>
   <td style="text-align:right;"> 20932.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36507.81388 </td>
   <td style="text-align:right;"> 801.479839 </td>
   <td style="text-align:right;"> 10056.936 </td>
   <td style="text-align:right;"> 21499.39 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -16612.43869 </td>
   <td style="text-align:right;"> 501.132280 </td>
   <td style="text-align:right;"> 11596.585 </td>
   <td style="text-align:right;"> 21874.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27703.62576 </td>
   <td style="text-align:right;"> 679.269733 </td>
   <td style="text-align:right;"> 9478.456 </td>
   <td style="text-align:right;"> 21500.97 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -32487.71988 </td>
   <td style="text-align:right;"> 739.628189 </td>
   <td style="text-align:right;"> 10305.921 </td>
   <td style="text-align:right;"> 21620.11 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13771.98567 </td>
   <td style="text-align:right;"> 448.073308 </td>
   <td style="text-align:right;"> 12433.216 </td>
   <td style="text-align:right;"> 21769.29 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11098.84828 </td>
   <td style="text-align:right;"> 404.145264 </td>
   <td style="text-align:right;"> 11139.009 </td>
   <td style="text-align:right;"> 21460.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -26402.11058 </td>
   <td style="text-align:right;"> 666.178855 </td>
   <td style="text-align:right;"> 10845.268 </td>
   <td style="text-align:right;"> 21209.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20593.51401 </td>
   <td style="text-align:right;"> 552.693094 </td>
   <td style="text-align:right;"> 11205.623 </td>
   <td style="text-align:right;"> 21152.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21389.95109 </td>
   <td style="text-align:right;"> 569.898326 </td>
   <td style="text-align:right;"> 11290.720 </td>
   <td style="text-align:right;"> 21951.62 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40390.45732 </td>
   <td style="text-align:right;"> 871.240043 </td>
   <td style="text-align:right;"> 8846.486 </td>
   <td style="text-align:right;"> 21576.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19735.92997 </td>
   <td style="text-align:right;"> 552.974446 </td>
   <td style="text-align:right;"> 12102.155 </td>
   <td style="text-align:right;"> 21198.35 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -18916.04937 </td>
   <td style="text-align:right;"> 555.519462 </td>
   <td style="text-align:right;"> 9725.508 </td>
   <td style="text-align:right;"> 21343.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21653.89506 </td>
   <td style="text-align:right;"> 598.339094 </td>
   <td style="text-align:right;"> 9481.699 </td>
   <td style="text-align:right;"> 21193.88 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -44536.49460 </td>
   <td style="text-align:right;"> 945.870453 </td>
   <td style="text-align:right;"> 9938.936 </td>
   <td style="text-align:right;"> 21816.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23247.71940 </td>
   <td style="text-align:right;"> 585.186469 </td>
   <td style="text-align:right;"> 12557.434 </td>
   <td style="text-align:right;"> 21090.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21173.98971 </td>
   <td style="text-align:right;"> 550.703144 </td>
   <td style="text-align:right;"> 12990.346 </td>
   <td style="text-align:right;"> 21311.86 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -27585.31697 </td>
   <td style="text-align:right;"> 670.908220 </td>
   <td style="text-align:right;"> 8816.595 </td>
   <td style="text-align:right;"> 21075.68 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -42484.51063 </td>
   <td style="text-align:right;"> 892.803305 </td>
   <td style="text-align:right;"> 11260.863 </td>
   <td style="text-align:right;"> 20839.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39908.69490 </td>
   <td style="text-align:right;"> 864.636092 </td>
   <td style="text-align:right;"> 9616.353 </td>
   <td style="text-align:right;"> 20917.48 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -40044.49843 </td>
   <td style="text-align:right;"> 863.882538 </td>
   <td style="text-align:right;"> 9781.537 </td>
   <td style="text-align:right;"> 21298.33 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21641.33439 </td>
   <td style="text-align:right;"> 587.698255 </td>
   <td style="text-align:right;"> 10939.387 </td>
   <td style="text-align:right;"> 21659.22 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23047.46419 </td>
   <td style="text-align:right;"> 619.989141 </td>
   <td style="text-align:right;"> 10571.997 </td>
   <td style="text-align:right;"> 21236.81 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30460.29225 </td>
   <td style="text-align:right;"> 728.322429 </td>
   <td style="text-align:right;"> 10316.011 </td>
   <td style="text-align:right;"> 21685.83 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -29218.00325 </td>
   <td style="text-align:right;"> 712.515953 </td>
   <td style="text-align:right;"> 10125.828 </td>
   <td style="text-align:right;"> 21737.04 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21548.02808 </td>
   <td style="text-align:right;"> 578.750581 </td>
   <td style="text-align:right;"> 11266.949 </td>
   <td style="text-align:right;"> 21438.17 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21607.10932 </td>
   <td style="text-align:right;"> 587.171567 </td>
   <td style="text-align:right;"> 10066.098 </td>
   <td style="text-align:right;"> 21579.38 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23852.42549 </td>
   <td style="text-align:right;"> 607.575193 </td>
   <td style="text-align:right;"> 11277.308 </td>
   <td style="text-align:right;"> 21801.50 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21593.42882 </td>
   <td style="text-align:right;"> 579.392568 </td>
   <td style="text-align:right;"> 12198.845 </td>
   <td style="text-align:right;"> 20894.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20446.40703 </td>
   <td style="text-align:right;"> 553.351999 </td>
   <td style="text-align:right;"> 13358.808 </td>
   <td style="text-align:right;"> 20895.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21762.90667 </td>
   <td style="text-align:right;"> 575.780830 </td>
   <td style="text-align:right;"> 11848.788 </td>
   <td style="text-align:right;"> 21846.16 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23456.55613 </td>
   <td style="text-align:right;"> 605.096397 </td>
   <td style="text-align:right;"> 11705.483 </td>
   <td style="text-align:right;"> 22019.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -21236.32619 </td>
   <td style="text-align:right;"> 582.882177 </td>
   <td style="text-align:right;"> 10230.611 </td>
   <td style="text-align:right;"> 21533.93 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -24715.59878 </td>
   <td style="text-align:right;"> 629.822742 </td>
   <td style="text-align:right;"> 10570.297 </td>
   <td style="text-align:right;"> 21230.87 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36367.77385 </td>
   <td style="text-align:right;"> 805.325906 </td>
   <td style="text-align:right;"> 9797.755 </td>
   <td style="text-align:right;"> 21184.31 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -39046.63847 </td>
   <td style="text-align:right;"> 844.845129 </td>
   <td style="text-align:right;"> 10038.201 </td>
   <td style="text-align:right;"> 21187.10 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -22779.15942 </td>
   <td style="text-align:right;"> 592.740584 </td>
   <td style="text-align:right;"> 11683.527 </td>
   <td style="text-align:right;"> 21635.99 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23952.72975 </td>
   <td style="text-align:right;"> 627.357333 </td>
   <td style="text-align:right;"> 9939.512 </td>
   <td style="text-align:right;"> 21358.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -20215.17546 </td>
   <td style="text-align:right;"> 553.769462 </td>
   <td style="text-align:right;"> 12669.138 </td>
   <td style="text-align:right;"> 21313.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13655.07245 </td>
   <td style="text-align:right;"> 459.961762 </td>
   <td style="text-align:right;"> 11650.826 </td>
   <td style="text-align:right;"> 22139.63 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -14216.93643 </td>
   <td style="text-align:right;"> 480.820435 </td>
   <td style="text-align:right;"> 11643.366 </td>
   <td style="text-align:right;"> 21489.27 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -28737.68915 </td>
   <td style="text-align:right;"> 696.069794 </td>
   <td style="text-align:right;"> 10230.815 </td>
   <td style="text-align:right;"> 21602.07 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33077.68613 </td>
   <td style="text-align:right;"> 764.209710 </td>
   <td style="text-align:right;"> 9946.490 </td>
   <td style="text-align:right;"> 21184.79 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -35725.08559 </td>
   <td style="text-align:right;"> 812.543409 </td>
   <td style="text-align:right;"> 9064.703 </td>
   <td style="text-align:right;"> 21514.80 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31636.00426 </td>
   <td style="text-align:right;"> 746.750753 </td>
   <td style="text-align:right;"> 9632.268 </td>
   <td style="text-align:right;"> 21326.51 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25934.42205 </td>
   <td style="text-align:right;"> 654.956333 </td>
   <td style="text-align:right;"> 10846.375 </td>
   <td style="text-align:right;"> 21165.54 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -30245.96528 </td>
   <td style="text-align:right;"> 707.795181 </td>
   <td style="text-align:right;"> 10455.645 </td>
   <td style="text-align:right;"> 21148.65 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -36513.44742 </td>
   <td style="text-align:right;"> 798.321971 </td>
   <td style="text-align:right;"> 11217.903 </td>
   <td style="text-align:right;"> 21199.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -33293.18445 </td>
   <td style="text-align:right;"> 752.074927 </td>
   <td style="text-align:right;"> 11355.490 </td>
   <td style="text-align:right;"> 21320.67 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -17754.68587 </td>
   <td style="text-align:right;"> 524.027097 </td>
   <td style="text-align:right;"> 9922.446 </td>
   <td style="text-align:right;"> 21855.92 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -25022.19390 </td>
   <td style="text-align:right;"> 638.912975 </td>
   <td style="text-align:right;"> 9605.145 </td>
   <td style="text-align:right;"> 20933.60 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -38295.78161 </td>
   <td style="text-align:right;"> 831.655337 </td>
   <td style="text-align:right;"> 10355.109 </td>
   <td style="text-align:right;"> 21765.53 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -43341.84329 </td>
   <td style="text-align:right;"> 901.790700 </td>
   <td style="text-align:right;"> 11060.746 </td>
   <td style="text-align:right;"> 21608.71 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7794.36506 </td>
   <td style="text-align:right;"> 376.292470 </td>
   <td style="text-align:right;"> 10352.386 </td>
   <td style="text-align:right;"> 20938.03 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31071.28770 </td>
   <td style="text-align:right;"> 718.119693 </td>
   <td style="text-align:right;"> 10552.207 </td>
   <td style="text-align:right;"> 21608.56 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -12239.19799 </td>
   <td style="text-align:right;"> 447.746358 </td>
   <td style="text-align:right;"> 11729.816 </td>
   <td style="text-align:right;"> 21706.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23241.50443 </td>
   <td style="text-align:right;"> 596.653813 </td>
   <td style="text-align:right;"> 11558.447 </td>
   <td style="text-align:right;"> 21188.20 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -4187.83807 </td>
   <td style="text-align:right;"> 312.414586 </td>
   <td style="text-align:right;"> 13267.724 </td>
   <td style="text-align:right;"> 21061.84 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -11160.19111 </td>
   <td style="text-align:right;"> 419.239257 </td>
   <td style="text-align:right;"> 12771.007 </td>
   <td style="text-align:right;"> 21622.66 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -9815.81408 </td>
   <td style="text-align:right;"> 392.177872 </td>
   <td style="text-align:right;"> 11895.379 </td>
   <td style="text-align:right;"> 21724.82 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -13746.74195 </td>
   <td style="text-align:right;"> 462.174134 </td>
   <td style="text-align:right;"> 12479.494 </td>
   <td style="text-align:right;"> 21789.55 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -19610.36883 </td>
   <td style="text-align:right;"> 545.961149 </td>
   <td style="text-align:right;"> 11117.748 </td>
   <td style="text-align:right;"> 20930.47 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -31926.96068 </td>
   <td style="text-align:right;"> 741.880839 </td>
   <td style="text-align:right;"> 9702.673 </td>
   <td style="text-align:right;"> 21705.73 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -7703.44272 </td>
   <td style="text-align:right;"> 375.603527 </td>
   <td style="text-align:right;"> 10854.917 </td>
   <td style="text-align:right;"> 21260.09 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> -23884.14873 </td>
   <td style="text-align:right;"> 619.535280 </td>
   <td style="text-align:right;"> 9853.537 </td>
   <td style="text-align:right;"> 21349.10 </td>
  </tr>
</tbody>
</table>

</div>




```{.r .distill-force-highlighting-css}
```