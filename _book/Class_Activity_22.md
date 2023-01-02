# Class Activity 22

## Example 1: Cuckoo Eggs

The common cuckoo does not build its own nest: it prefers to lay its eggs in another birds' nest. It is known, since 1892, that the type of cuckoo bird eggs are different between different locations. In a study from 1940, it was shown that cuckoos return to the same nesting area each year, and that they always pick the same bird species to be a "foster parent" for their eggs. Over the years, this has lead to the development of geographically determined subspecies of cuckoos. These subspecies have evolved in such a way that their eggs look as similar as possible as those of their foster parents.

The cuckoo dataset contains information on 120 Cuckoo eggs, obtained from randomly selected "foster" nests. For these eggs, researchers have measured the `length` (in mm) and established the `type` (species) of foster parent. The type column is coded as follows:

- `type=1`: Meadow pipit
- `type=2`: Tree pipit
- `type=3`: Dunnock
- `type=4`: European robin
- `type=5`: White wagtail
- `type=6`: Eurasian wren

The researchers want to test if the type of foster parent has an effect on the average length of the cuckoo eggs. 




### 1(a) The boxplot of the length of the eggs across all the species is shown below. Based on these boxplots, do the assumptions of normality and similar variability appear to be met?

*Answer:*

<img src="Class_Activity_22_files/figure-epub3/unnamed-chunk-2-1.png" width="100%" />


### (1b) Formally verify that the assumptions are valid by using the outputs given.

*Answer:*


```r
Cuckoo %>% 
  ggplot(aes(sample=length)) + geom_qq() + geom_qq_line() + facet_grid(~type) +  theme_bw() 
```

<img src="Class_Activity_22_files/figure-epub3/unnamed-chunk-3-1.png" width="100%" />



```r
library(dplyr)
stat <- Cuckoo %>% group_by(type) %>% summarize(mean(length), sd(length), length(length))
stat <- as.data.frame(stat)
```


### (1c) Fit an ANOVA model to do a formal hypothesis test. Report the test statistics and conclude your hypothesis test.


```r
fit_anova <- aov(length~type, Cuckoo)
summary(fit_anova)
```

```
             Df Sum Sq Mean Sq F value   Pr(>F)    
type          5  41.12   8.223   4.713 0.000602 ***
Residuals   113 197.18   1.745                     
---
Signif. codes:  
0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```


*Answer:*



We found from part 1c that at least one species differ. To find which of the species differ from the rest, we need to construct confidence intervals for the mean length differences between each pair of species.

### (1d)  First, find a 95% confidence interval for the mean cuckoo egg length in `European robin` nests (Type = 4).

*Answer:* 

95 $\%$ confidence interval is:


```r
MSE <- 1.745
stat[4,2] + c(-1,1)*(qt(1-0.05/2, df=113))*sqrt(MSE)/sqrt(stat[4,4])
```

```
[1] 21.92072 23.22928
```

$$22.6 \pm 1.981*\frac{\sqrt{1.745}}{\sqrt{16}}$$
$$= (21.92, 23.23)$$

### (1e) Find a 95% CI for the difference in mean egg length between `European robin`(type = 4) and `Eurasian wren`(type = 6) nests.

*Answer:* 


```r
(stat[4,2] - stat[6,2]) + c(-1,1)* (qt(1-0.05/2, df=113))*
  sqrt(MSE*(1/stat[4,4] + 1/stat[6,4]))
```

```
[1] 0.5044174 2.3855826
```

$$(22.6 - 21.1) \pm 1.981\cdot \sqrt{1.745\left(\frac{1}{16} + \frac{1}{15} \right)}$$
$$= (0.50, 2.39)$$

### (1f) Find a 95% CI for the difference in mean egg length between `Dunnock` (type = 3) and `European robin`(type = 4)  nests.

*Answer:* 


```r
(stat[3,2] - stat[4,2]) + c(-1,1)* (qt(1-0.05/2, df=113))*
  sqrt(MSE*(1/stat[3,4] + 1/stat[4,4]))
```

```
[1] -0.4113351  1.5041922
```

$$(23.1 - 22.6) \pm 1.981\cdot \sqrt{1.745\left(\frac{1}{14} + \frac{1}{16} \right)}$$
$$= (-0.41, 1.50)$$

### (1g) We can use the R function `pairwise.t.test` to analyze which pair of means are significantly different from one another. Using `p.adjust.method = "bonferroni"`, we will see the p-values adjusted for multiple comparison. These adjusted p-values should still be compared with $\alpha = 0.05$ to find any significant differences. 

Based on the R output, which of the pairs are different?


```r
pairwise.t.test(Cuckoo$length, Cuckoo$type, p.adjust.method =  "bonferroni")
```

```

	Pairwise comparisons using t tests with pooled SD 

data:  Cuckoo$length and Cuckoo$type 

  1      2      3      4      5     
2 1.0000 -      -      -      -     
3 1.0000 1.0000 -      -      -     
4 1.0000 1.0000 1.0000 -      -     
5 1.0000 1.0000 1.0000 1.0000 -     
6 0.0097 0.0013 0.0014 0.0436 0.0055

P value adjustment method: bonferroni 
```


*Answer:*



### (1h) Using the library `multcomp` we can construct individual confidence intervals using `Tukey HSD` p-value adjustments. Based on these confidence intervals, which of the pairs are different?


```r
library(multcomp, quietly = TRUE)
fit <- lm(length~type, Cuckoo)
mcp <- glht(fit, linfct = mcp(type = "Tukey"))
summary(mcp)
```

```

	 Simultaneous Tests for General Linear Hypotheses

Multiple Comparisons of Means: Tukey Contrasts


Fit: lm(formula = length ~ type, data = Cuckoo)

Linear Hypotheses:
           Estimate Std. Error t value Pr(>|t|)   
2 - 1 == 0  0.57364    0.39495   1.452  0.68906   
3 - 1 == 0  0.60506    0.40534   1.493  0.66347   
4 - 1 == 0  0.05864    0.38564   0.152  0.99999   
5 - 1 == 0  0.38697    0.39495   0.980  0.92127   
6 - 1 == 0 -1.38636    0.39495  -3.510  0.00807 **
3 - 2 == 0  0.03143    0.49089   0.064  1.00000   
4 - 2 == 0 -0.51500    0.47475  -1.085  0.88349   
5 - 2 == 0 -0.18667    0.48235  -0.387  0.99880   
6 - 2 == 0 -1.96000    0.48235  -4.063  0.00123 **
4 - 3 == 0 -0.54643    0.48342  -1.130  0.86435   
5 - 3 == 0 -0.21810    0.49089  -0.444  0.99768   
6 - 3 == 0 -1.99143    0.49089  -4.057  0.00122 **
5 - 4 == 0  0.32833    0.47475   0.692  0.98196   
6 - 4 == 0 -1.44500    0.47475  -3.044  0.03295 * 
6 - 5 == 0 -1.77333    0.48235  -3.676  0.00467 **
---
Signif. codes:  
0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
(Adjusted p values reported -- single-step method)
```


\vspace*{1in}


## Example 2: Metal Contamination

An environmental studies student working on an independent research project was investigating metal contamination in a local river. The metals can accumulate in organisms that live in the river (known as bioaccumulation). He collected samples of Quagga mussels at three sites in the river and measured the concentration of copper (in micrograms per gram, or mcg/g) in the mussels. His data are summarized in the provided table and plot. He wants to know if there are any significant differences in mean copper concentration among the three sites.  

Site | Mean ($\bar{x}$) | SD ($s$) | $n$
--- | ---- | ---- | ----
1 | 21.34 | 3.092 | 5
2 | 16.60 | 2.687 | 4
3 | 13.16 | 4.274 | 5

#### (a) Assumptions

What do we need to assumption about copper concentrations to use one-way ANOVA to compare means at the three sites?

*Answer:* With such small sample sizes in each group it would be hard to get a good sense of how they are distributed. We will just need to assume that these measurements are approximately normally distributed. 

#### (b) One-way ANOVA hypotheses

State the hypotheses for this test. 

*Answer:* Let $\mu_i$ be the true mean copper concentration at location $i$. Then
$$
H_0: \mu_{1} = \mu_{2} = \mu_{3} 
$$
vs. $H_A:$ at least one mean is different.

#### (c) ANOVA table
Fill in the missing values `A` - `E` from the ANOVA table:

Source | df | SS | MS | F 
---- | ---- | ---- | ---- | ---- 
Groups | `A = 2` | 169.05 | `C = 84.525` | `E = 6.99`
Error | 11 | `B = 132.97` | `D = 12.088` | 
Total | 13 | 302.02 | | 

*Answer:* 

- A: The group degrees of freedom is always the number of groups minus 1. Here we have 3 groups so $A = 3-1=2$.
- B: The group and error sum of squares adds up to the total sum of squares. So we have $B = 302.02 - 169.05 = 132.97$.
- C: Mean square values are always sum of squares divided by degrees of freedom. For groups MS: $C = 169.05/2 = 84.525$
- D: Mean square values are always sum of squares divided by degrees of freedom. For error MS: $D = 132.97/11 = 12.088$

- The F test stat is the ratio of the group MS and error MS: $F = 84.525/12.088 = 6.992$.


```r
302.02 - 169.05
```

```
[1] 132.97
```

```r
169.05/2
```

```
[1] 84.525
```

```r
132.97/11
```

```
[1] 12.08818
```

```r
84.525/12.088
```

```
[1] 6.992472
```


#### (d) p-value

The command `pf(x, df1=, df2=)` gives the area under the F-distribution below the value `x`. Use this command to get the p-value from this one-way ANOVA test. Interpret this value.

*Answer:* The p-value is about 1.1%. If the means are the same at the three sites, we would see sample means this different, or even more different, about 1.1% of the time. 


```r
1-pf(6.992, df1=2, df2=11)
```

```
[1] 0.01097789
```

#### (e) Conclusion
What is your conclusion for this test?

*Answer:* We have some evidence that at least one of the true mean copper concentration at the three sites is differenct from the others. 


#### (f) Confidence interval
Compute a 95% confidence interval for the difference in means between site 1 and 3. Interpret this interval. 

*Answer:* Since we don't have the data, we will have to compute the CI by hand. The degrees of freedom "best guess" (since we aren't letting R approximate it), is $11$. The 95% CI for the difference in true means in site 1 and 3 is :

$$
(21.34 - 13.16)  \pm (2.201)) \sqrt{132.97\left(\dfrac{1}{5} + \dfrac{1}{5}\right)} = 1.63, 14.73
$$

```r
(21.34 - 13.16) + c(-1,1)* qt(1-0.05/2, df = 11)*sqrt(12.088*(1/5+1/5))
```

```
[1]  3.340234 13.019766
```

We are 95% confident that the true mean copper concentration at site 1 is 1.63 to 14.3 mcg/g higher than the true mean concentration at site 3. 


```r
(21.34 - 13.16) 
```

```
[1] 8.18
```

```r
qt(.975, 11)
```

```
[1] 2.200985
```

```r
sqrt(12.088*(1/5+1/5))
```

```
[1] 2.198909
```

```r
(21.34 - 13.16) -  qt(.975, 5-1)*sqrt(12.088*(1/5+1/5))
```

```
[1] 2.07485
```

```r
(21.34 - 13.16) +  qt(.975, 5-1)*sqrt(12.088*(1/5+1/5))
```

```
[1] 14.28515
```




