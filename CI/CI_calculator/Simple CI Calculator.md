<style>
.section .reveal .state-background {
    background: white; }
.section .reveal h1,
.section .reveal p {
    color: blue; }
</style>

Simple CI Calculator
========================================================
author: Ryan Shanley
date: June 17, 2018
font-family: Arial
autosize: true
transition: linear

Purpose
========================================================

- Suppose you are teaching a new student what a confidence interval is.  You want to convey some basic
concepts, for instance that the CI gets smaller as the sample size increases.  Or that the higher
the confidence level, the larger the CI will be.  

- Or maybe you are choosing sample size for an experiment and want to get an idea of how precise
the result will be for various sample sizes.

- Here's a simple interactive app that calculates CIs for a proportion.

Example
========================================================





```r
binconf(x = 8, n = 20, alpha = 0.05)
```

```
 PointEst     Lower     Upper
      0.4 0.2188065 0.6134185
```

Suppose that one observes 8 successes in 20 observations.  The sample proportion is 8/20 = 0.4, and the 95% confidence interval limits are given by the Lower and Upper values in the output of the function binconf.  Note that these are Wilson confidence limits for a binomial probability.  

The App
========================================================

Here's how that calculation can be done using a Shiny app.  Enter the sample proportion and sample size using the sliders on the left.  Then then confidence limits will be output and displayed in the figure on the right.  

<img src="app_screen.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" width="80%" />

Future Development
========================================================

- This could be extended to show confidence intervals for a continuous outcome.
- Another idea is to add input variables to allow calculation of power for a given sample size and proportion.  A visual plot would be a good learning device for demonstrating how power and sample size are related.
