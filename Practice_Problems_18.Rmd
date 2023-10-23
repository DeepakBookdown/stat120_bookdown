# Practice Problems 18



## Problem 1:  Change in gun ownership 

A 2016 study described in The Guardian found that a random sample of US adults in 1994 found a female rate of gun ownership of 9%. A similar random sample in 2015 found the rate of female gun ownership rose to 12%. In the section 3.2 handout, we assumed that the SE for the difference in these two sample proportions is 2%. Show how this SE was computed using the appropriate SE formula from chapter 6. Assume that the sample sizes in both 1994 and 2015 were 500.


<!-- <details><summary><red>Click for answer</red></summary> -->

<!-- *Answer:* -->

<!-- We have a 1994 sample proportion of $\hat{p}_{1994} = 0.09$  and a 2015 sample proportion of $\hat{p}_{2015} = 0.12$ . The SE of the difference in two sample proportions for a confidence interval is given by: -->

<!-- $$SE = \sqrt{\frac{\hat{p}_{1994} (1 - \hat{p}_{1994} )}{n_{1994}} + \frac{\hat{p}_{2015} (1 - \hat{p}_{2015} )}{n_{2015}}} = 0.0194 \approx 0.02 $$ -->
<!-- </details><br> -->


## Problem 2:  Accuracy of Lie Detectors

Participants in a study to evaluate the accuracy of lie detectors were divided into two groups, with one group reading true material and the other group reading false material, while connected to a lie detector.  Both groups received electric shocks to add stress.  The two way table indicates whether the participants were lying or telling the truth and also whether the lie detector indicated they were lying or not.  


|     &nbsp;          | Detector Says Lying | Detector Says Not | Total |
|---------------|--------------------|-------------------|-------|
| Person Lying  | 31                 | 17                | 48    |
| Person Not    | 27                 | 21                | 48    |
| Total         | 58                 | 38                | 96    |

### (a)  Are the conditions met for using the normal distribution?

<!-- <details><summary><red>Click for answer</red></summary> -->

<!-- *Answer:* Yes (all cell counts at least 10) -->
<!-- </details><br> -->

### (b) Find the three sample proportions for the proportion of times the lie detector says the person is lying (the proportion for the lying people, the proportion for the truthful people, and the pooled proportion).

<!-- <details><summary><red>Click for answer</red></summary> -->

<!-- *Answer:* We see that the proportion for the lying people is $\hat{p}_L = \frac{31}{48}= 0.6458$, the proportion for the not lying people is $\hat{p}_N = 0.5625$ , and the pooled proportion for all 96 people is $\hat{p} = \frac{58}{96}= 0.6042$. -->
<!-- </details><br> -->

### (c) Test to see if there is a difference in the proportion of times the lie detector says the person is lying, depending on whether the person is lying or telling the truth.  Show all details of the hypothesis test.
  
<details><summary><red>Click for answer</red></summary>

<!-- *Answer:* -->

<!-- We are testing $H_0:p_L = p_N$   vs   $H_a:p_L \neq p_N$. The test statistic is -->

<!-- $$z = \frac{statistic-null}{SE} = \frac{(\hat{p}_L - \hat{p}_N) - 0}{\sqrt{\frac{\hat{p}(1-\hat{p})}{n_l} + \frac{\hat{p}(1-\hat{p})}{n_N}}} = \frac{0.6458 - 0.5625}{\sqrt{\frac{0.6042(1-0.6042)}{48}} + \frac{0.6042*(1-0.6042)}{48}} = 0.834 $$ -->

<!-- This is a two-tail test, and the area to the right of 0.834 in a normal distribution is 0.202 (1-pnorm(0.834)), so the p-value is  2(0.202) = 0.404. The R command is: 2*(1-pnorm(0.834)) -->


<!-- ```{r} -->
<!-- pL_hat = 31/48 -->
<!-- pN_hat = 27/48 -->
<!-- pooled_p = 58/96 -->
<!-- nL = 48 -->
<!-- nN = 48 -->
<!-- SE = sqrt(pooled_p*(1-pooled_p)*(1/nL + 1/nN)) -->
<!-- z = (pL_hat - pN_hat) / SE -->
<!-- p_value = 2*(1-pnorm(z)) -->
<!-- p_value -->
<!-- ``` -->


<!-- We fail to reject H0 and conclude that there is not enough evidence that a lie detector can tell whether a person is lying or telling the truth.   -->

<!-- </details><br> -->


### (d) Calculate a 95% confidence interval for the difference in proportions of people correctly identified by the lie detector.

<!-- <details><summary><red>Click for answer</red></summary> -->


<!-- ```{r} -->
<!-- conf_level = 0.95 -->
<!-- z_star = qnorm(1-(1-conf_level)/2) -->
<!-- margin_of_error = z_star * SE -->
<!-- CI_lower = (pL_hat - pN_hat) - margin_of_error -->
<!-- CI_upper = (pL_hat - pN_hat) + margin_of_error -->
<!-- CI = c(CI_lower, CI_upper) -->
<!-- CI -->
<!-- ``` -->

<!-- The 95% confidence interval for the difference in proportions is (-0.299, 0.207). Since, the confidence interval includes the null hypothesized value of 0, we do not reject the null hypothesis, and conclude that there is not enough evidence that a lie detector can tell whether a person is lying or telling the truth. -->

<!-- </details><br> -->

## Problem 3:  Smoking and Pregnancy Rate?

Does smoking negatively affect a person’s ability to become pregnant?  A study collected data on 678 women who were trying to get pregnant.  The two-way table shows the proportion who successfully became pregnant during the first cycle trying and smoking status.  


### (a). Find a 90% confidence interval for the difference in proportion of women who get pregnant, between smokers and non-smokers.  Interpret the interval in context.  

|&nbsp;| Smoker | Non-smoker | Total |
| --- | --- | --- | --- |
| Pregnant | 38 | 206 | 244 |
| Not Pregnant | 97 | 337 | 434 |
| Total | 135 | 543 | 678 | 

<!-- <details><summary><red>Click for answer</red></summary> -->

<!-- The conditions are met for using the normal distribution (at least 10 values in each cell of the table).  We see that the proportion of smokers who got pregnant is 38/135 = 0.281 while the proportion of non-smokers who got pregnant is 206/543 = 0.379.  The confidence interval is given by: -->

<!-- $$statistic \pm z^* \cdot SE $$ -->
<!-- $$(\hat{p}_S - \hat{p}_N) \pm z^* \cdot \sqrt{\frac{\hat{p}_S(1- \hat{p}_S)}{n_S} + \frac{\hat{p}_N(1- \hat{p}_N)}{n_N}} $$ -->

<!-- $$(0.281 - 0.379) \pm 1.645\cdot \sqrt{\frac{0.281(1-0.281)}{135} + \frac{0.379(1-0.379)}{543}} $$ -->
<!-- $$-0.098 \pm 0.072 = (-0.170, -0.026) $$ -->
<!-- We are 90% sure that the proportion of smokers who get pregnant in the first cycle is between 0.170 and 0.026 less than the proportion of non-smokers who get pregnant on the first cycle.   Note that if we had subtracted the other way, the interval would have only positive values, but the interpretation would be the same. -->

<!-- </details><br> -->


### (b). Now, repeat the above analysis using the hypothesis test approach.

<!-- <details><summary><red>Click for answer</red></summary> -->

<!-- We are testing $H_0:p_S = p_{NS}$ vs $H_a:p_S \neq p_{NS}$. The test statistic is: -->

<!-- ```{r} -->
<!-- pS_hat = 38/135 -->
<!-- pNS_hat = 206/543 -->
<!-- pooled_p2 = (38+206)/(135+543) -->
<!-- nS = 135 -->
<!-- nNS = 543 -->
<!-- SE2 = sqrt(pooled_p2*(1-pooled_p2)*(1/nS + 1/nNS)) -->
<!-- z2 = (pS_hat - pNS_hat) / SE2 -->
<!-- p_value2 = 2*(pnorm(z2)) -->
<!-- p_value2 -->
<!-- ``` -->

<!-- Based on the p-value, we reject $H_0$ and conclude that there is a difference in the proportion of women who get pregnant between smokers and non-smokers. -->

<!-- </details><br> -->


