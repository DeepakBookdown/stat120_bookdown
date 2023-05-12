# Class Activity 13

## Example 1: Effect of Exercise on Heart Rate

In a study, 30 participants were randomly assigned to engage in either aerobic exercise or resistance training (15 in each group). Their resting heart rate was measured before and after a 6-week exercise program. We want to test if there is a difference in the mean decrease in resting heart rate between aerobic exercise and resistance training. The hypotheses are:

$$H_0: \mu_A-\mu_R=0 \quad\quad H_A: \mu_A-\mu_R \neq 0$$

The sample mean difference is $\bar{x}_A - \bar{x}_R = 6.2$. We want to know if this difference in sample means is statistically significant.


### (a) Randomization Distribution

Describe how you could generate a randomization distribution for $\bar{x}_A - \bar{x}_R$ that is consistent with $H_0: \mu_A - \mu_R = 0$.

<details><summary><red>Click for answer</red></summary>
*Answer:* To generate a randomization distribution for the sample mean difference, we would randomly reassign the treatment (aerobic exercise or resistance training) to the study participants. Under the null hypothesis, the mean decrease in resting heart rate would be the same under either treatment. For each reassignment, we would compute the sample mean difference and plot it in the dotplot.

</details><br>

### (b) Calculating the p-value

Using a statistical software, generate a randomization distribution for the difference in means and calculate the p-value for the two-tailed test. Is the observed difference of 6.2 bpm statistically significant?

<details><summary><red>Click for answer</red></summary>
*Answer:* We can use the `permTest` function from the `CarletonStats` package to generate a randomization distribution for the difference in means and calculate the p-value for the two-tailed test. We can compare the p-value of $2e^{-4}$ to a chosen significance level (e.g., 0.05) to determine if the observed difference of 6.2 bpm is statistically significant. Since the p-value is less than the significance level, the observed difference is statistically significant.



```r
library(CarletonStats)
library(readr)
exercise <- read_csv("https://raw.githubusercontent.com/deepbas/statdatasets/main/exercise.csv")
permTest(Decrease_in_Resting_Heart_Rate~Group, data= exercise)
```

<img src="Class_Activity_13_files/figure-epub3/unnamed-chunk-1-1.png" width="100%" />

```

	** Permutation test **

 Permutation test with alternative: two.sided 
 Observed statistic
  Aerobic_Exercise :  9.2 	 Resistance_Training :  3 
 Observed difference: 6.2 

 Mean of permutation distribution: -0.00742 
 Standard error of permutation distribution: 1.18736 
 P-value:  2e-04 

	*-------------*
```




</details><br>

### (c) Interpretation and Conclusion

Interpret the p-value and state your conclusion regarding the difference in mean decrease in resting heart rate between aerobic exercise and resistance training.

<details><summary><red>Click for answer</red></summary>
*Answer:* Since the p-value is less than the significance level, it means that the observed difference of 6.2 bpm is highly unlikely to occur just by random chance under the null hypothesis. In this case, we would reject the null hypothesis and conclude that there is a statistically significant difference in the mean decrease in resting heart rate between aerobic exercise and resistance training.

</details><br>

## Example 2: Job Interview Success

A study investigated the success rate of job applicants who used a career coaching service (CCS) compared to those who didn't (NCCS). Out of 120 applicants, 60 used the CCS and 60 did not. We want to test if there is a difference in the proportion of successful applicants between CCS and NCCS groups. out of the 60 applicants who used the career coaching service (CCS), 42 were successful and 18 were unsuccessful. Out of the 60 applicants who did not use the career coaching service (NCCS), 30 were successful and 30 were unsuccessful. The hypotheses are:

$$H_0: p_{C C S}-p_{N C C S}=0 H_A: p_{C C S}-p_{N C C S} \neq 0$$
The sample proportion difference is $\hat{p}{CCS} - \hat{p}{NCCS} = 0.20$. We want to know if this difference in sample proportions is statistically significant.


(a) Randomization Distribution
Describe how you could generate a randomization distribution for $\hat{p}_{CCS} - \hat{p}_{NCCS}$ that is consistent with $H_0: p_{CCS} - p_{NCCS} = 0$.

<details><summary><red>Click for answer</red></summary>
*Answer:* To generate a randomization distribution for the sample proportion difference, we would randomly reassign the group (CCS or NCCS) to the job applicants. Under the null hypothesis, the proportion of successful applicants would be the same for both groups. For each reassignment, we would compute the sample proportion difference and plot it in the dotplot.

</details><br>

(b) Calculating the p-value

Using a statistical software, generate a randomization distribution for the difference in proportions and calculate the p-value for the two-tailed test. Is the observed difference of 0.20 statistically significant?

<details><summary><red>Click for answer</red></summary>
*Answer:* Using *Statkey* to generate a randomization distribution for the difference in proportions and observing the p-value for the two-tailed test, we can compare the p-value to a chosen significance level (e.g., 0.05) to determine if the observed difference of 0.20 is statistically significant. If the p-value is less than the significance level, the observed difference is statistically significant; otherwise, it is not. The p-value based on this randomization distribution under null hypothesis is $2 \times 0.018 = 0.036$. So, the observed difference of 0.020 is statistically significant.

<center>
<img src="data/teaching_methods.png" width="140%" height="120%"><br>
</center>

</details><br>

(c) Interpretation and Conclusion
Interpret the p-value and state your conclusion regarding the difference in the proportion of successful job applicants between CCS and NCCS groups.

<details><summary><red>Click for answer</red></summary>
*Answer:* Since the p-value is less than the significance level, it means that the observed difference of 0.20 would occur with low chance under the null hypothesis. In this case, we would reject the null hypothesis and conclude that there is a statistically significant difference in the proportion of successful job applicants between CCS and NCCS groups. 

</details><br>

## Example 3: New Teaching Method Effectiveness

A school is testing a new teaching method for math. They randomly assign 40 students to either the new method (NM) or the traditional method (TM), 20 in each group. After 3 months, the students take a standardized math test. We want to test if there is a difference in the mean test scores between NM and TM groups. The hypotheses are:


$$H_0: \mu_{N M}-\mu_{T M}=0 \mathrm{H}_A: \mu_{NM} - \mu_{TM} \neq 0$$
The sample mean difference is $\bar{x}_{NM} - \bar{x}_{TM} = 8.9$. We want to know if this difference in sample means is statistically significant.

### (a) Randomization Distribution

Describe how you could generate a randomization distribution for $\bar{x}_{NM} - \bar{x}_{TM}$ that is consistent with $H_0: \mu_{NM} - \mu_{TM} = 0$.

<details><summary><red>Click for answer</red></summary>
*Answer:* To generate a randomization distribution for the sample proportion difference, we would randomly reassign the teaching method (new or traditional) to the classes. Under the null hypothesis, the proportion of students passing would be the same under either teaching method. For each reassignment, we would compute the sample proportion difference and plot it in the dotplot.

</details><br>

#### (b) Calculating the p-value

Using a statistical software, generate a randomization distribution for the difference in means and calculate the p-value for the two-tailed test. Is the observed difference of 8.9 points statistically significant?

<details><summary><red>Click for answer</red></summary>
*Answer:* The p-value is the proportion of resamples that have a difference of 8.9 or above. Depending on the generated randomization distribution, the p-value is 0.0002. This means is interpreted in terms of how likely it is to observe a difference of 8.9 or greater under the null hypothesis, which is 0.02%.



```r
teaching <- read_csv("https://raw.githubusercontent.com/deepbas/statdatasets/main/teaching_method.csv")
permTest(Math_Test_Score~Group, data= teaching)
```

<img src="Class_Activity_13_files/figure-epub3/unnamed-chunk-2-1.png" width="100%" />

```

	** Permutation test **

 Permutation test with alternative: two.sided 
 Observed statistic
  New_Method :  91.05 	 Traditional_Method :  82.15 
 Observed difference: 8.9 

 Mean of permutation distribution: 0.00138 
 Standard error of permutation distribution: 1.72573 
 P-value:  2e-04 

	*-------------*
```

</details><br>

#### (c) Interpretation and Conclusion

Interpret the p-value and state your conclusion regarding the difference in the mean test scores between the new teaching method and the traditional teaching method groups.

<details><summary><red>Click for answer</red></summary>
*Answer:* Since the p-value is less than the chosen significance level (e.g., 0.05), the results are statistically significant, and we would reject the null hypothesis in favor of the alternative. This would indicate that there is evidence suggesting the new teaching method is more effective than the traditional method. 


</details><br>

## Example 4: Type I and Type II Error Rates

Consider the previous example of a new teaching method compared to a traditional teaching method. Suppose that the school administration wants to minimize the chances of making Type I and Type II errors when deciding whether to adopt the new teaching method.

### (a) Type I Error

Explain what a Type I error is in the context of this example, and describe the consequences of making such an error.

<details><summary><red>Click for answer</red></summary>
*Answer:* A Type I error occurs when we reject the null hypothesis when it's actually true. In this context, it means that we conclude the new teaching method is more effective than the traditional method when, in reality, there is no difference. The consequences of making a Type I error could include investing time and resources into a new teaching method that isn't actually more effective, leading to inefficient allocation of resources.

</details><br>

### (b) Type II Error

Explain what a Type II error is in the context of this example, and describe the consequences of making such an error.

<details><summary><red>Click for answer</red></summary>
*Answer:* A Type II error occurs when we fail to reject the null hypothesis when it's actually false. In this context, it means that we conclude that there is no difference between the new teaching method and the traditional method when, in reality, the new method is more effective. The consequences of making a Type II error could include missing out on the opportunity to improve students' learning outcomes by not adopting the more effective teaching method.

</details><br>

### (c) Adjusting the Significance Level

If the school administration believes that making a Type I error is much worse than making a Type II error, what adjustments could be made to the significance level to account for this? Explain your reasoning.

<details><summary><red>Click for answer</red></summary>
*Answer:* To decrease the chance of making a Type I error, the school administration could choose a smaller significance level, such as 0.01 instead of the typical 0.05. By using a smaller significance level, we require stronger evidence (smaller p-value) to reject the null hypothesis, thus reducing the probability of making a Type I error.

</details><br>

### (d) Factors Influencing Type II Error Rate

List the factors that influence the probability of making a Type II error and briefly describe how they affect the error rate in this context.

<details><summary><red>Click for answer</red></summary>
Answer: Factors that influence the probability of making a Type II error include:

*Effect size:* The true difference between the new teaching method and the traditional method. A larger effect size makes it easier to detect a difference, reducing the Type II error rate.

*Sample size:* The number of students involved in the study. A larger sample size increases the power of the test, making it more likely to detect a true difference and reducing the Type II error rate.

*Variability:* The amount of variation in the students' learning outcomes. Higher variability makes it more difficult to detect a true difference, increasing the Type II error rate.

*Significance level:* The chosen significance level (alpha) also affects the Type II error rate. A larger significance level (e.g., 0.10) decreases the Type II error rate but increases the Type I error rate.

</details><br>

### (e) Balancing Error Rates

Discuss how the school administration could balance the Type I and Type II error rates when evaluating the effectiveness of the new teaching method. What factors should they consider?

<details><summary><red>Click for answer</red></summary>
*Answer:* Balancing the Type I and Type II error rates involves considering the consequences of each type of error and the desired level of confidence in the results. The administration should weigh the risks and benefits of adopting a new teaching method versus maintaining the traditional method. They should also consider factors such as the cost and feasibility of implementing the new method, as well as the potential impact on student learning outcomes. Ultimately, the administration should choose a significance level and sample size that balance the risks associated with Type I and Type II errors while taking into account practical constraints and priorities.

</details><br>
