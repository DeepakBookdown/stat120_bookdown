# Class Activity 21


## Example 1: Food poisoning

Suppose in an outbreak, 447 of the 998 individuals who ate beef curry were observed to have food poisoning symptoms. As researchers, suppose we want to test the hypothesis that the probability (long run proportion) of a "random individual who ate beef curry" having food poisoning is 0.1. Conduct an appropriate hypothesis test.

<details><summary><red>Click for answer</red></summary>

*Answer:*The set of hypotheses are:

$\mathrm{H}_0$ : $p_{FP} = 0.1, \qquad p_{NFP} = 0.9$
$\mathrm{H}_{\mathrm{a}} : \text{One proportion is different}$

where $p_{FP}$ is the proportion of people who had food poisoning and $p_{NFP}$ is the proportion who did not have food poisoning. The expected count assuming the null hypothesis is true is $n*p_{FP} = 998*0.1 = 99.8$ and $n*p_{NFP} = 998*0.9 = 898.2$, respectively. The expected count is larger than 5, so we can proceed with the chi-square test. The observed count is 447 and 551 respectively. So, the test statistics can be constructed as

\begin{align*}
\chi^2 = \sum \frac{(O-E)^2}{E} = \frac{(447 - 99.8)^2}{99.8} +   \frac{(551 - 898.2)^2}{898.2}= 1342.105
\end{align*}


```r
(447 - 99.8)^2/99.8 + (551 - 898.2)^2/898.2
```

```
[1] 1342.105
```

The degrees of freedom corresponding to this test is 1. So, the p-value can be calculated to be 0 as:


```r
1 - pchisq(1342.105, df = 1)
```

```
[1] 0
```

We can also do the test in R using the `chisq.test` function. 


```r
chisq.test(x = c(447, 551), p = c(0.1, 0.9))
```

```

	Chi-squared test for given probabilities

data:  c(447, 551)
X-squared = 1342.1, df = 1, p-value < 2.2e-16
```


We reject the null hypothesis $(\chi^2 = 1342.105, df = 1, p-value \approx 0)$. There is a significant evidence that the proportion of individuals who eat beef curry and get sick is not $0.1$ 

</details><br>


## Example 2: Candy flavors

We have bags of candy with five flavors in each bag. We collect a random sample of ten bags. Each bag has 100 pieces of candy and five flavors. Use Chi-square goodness of fit test to test if the proportions of the five flavors in each bag are the same. The data table below shows the combined flavor counts from all 10 bags of candy. Fill in the details below:


<details><summary><red>Click for answer</red></summary>


| Flavor | Observed Count (O) | Expected Count (E) | $O-E$ | $(O-E)^2$ | $(O-E)^2/E$ |
| --- | --- | --- | --- | --- | --- |
| Apple | 180 | 200 | -20 | 400 | 2 |
| Lime | 250 | 200 | 50 | 2500 | 12.5 |
| Cherry | 120 | 200 | -80 | 2500 | 32 |
| Orange | 225 | 200 | 25 | 625 | 3.125 |
| Grape | 225 | 200 | 25 | 625 | 3.125 |

*Answer:* 

$$H_0: p_1 = p_2 = p_3 = p_4 = p_5 = 1/5$$
$$H_a: \text{at least one $p_i$ not equal to 1/5}$$


```r
1 - pchisq(52.75, df = 5-1)
```

```
[1] 9.612522e-11
```


The observed test statistics is:

\begin{align*}
\chi^2 &= \sum_{i=1}^5 \frac{(O_i-E_i)^2}{E_i} = \frac{(180 - 200)^2}{200} + \frac{(250 - 200)^2}{200}\\ & \qquad + \frac{(120 - 200)^2}{200} + \frac{(225 - 200)^2}{200} + \frac{(225 - 200)^2}{200}\\
&=  52.75
\end{align*}



```r
chisq.test(x = c(180, 250, 120, 225, 225), p = rep(1/5,5))
```

```

	Chi-squared test for given probabilities

data:  c(180, 250, 120, 225, 225)
X-squared = 52.75, df = 4, p-value = 9.613e-11
```

We reject the null hypothesis $(\chi^2 = 52.75, df = 4, p-value \approx 0)$. We have significant evidence to claim that at least one proportion of flavors is not the same as others.

</details><br>



