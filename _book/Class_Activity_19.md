# Class Activity 19

## Example 1: Suppose that we tossed a coin 100 times and noted that it landed on heads 67 times. Following this, we want to test whether the coin is fair, that is, test whether the long-run proportion (probability) of landing on heads or tails is equal to 50%. Conduct a hypothesis test to test this including all the steps.

*Answer:*

$$H_0:  p = 0.5$$
$$H_a: p \neq 0.5$$

The test statistic is:

$$t.s. = z = \frac{\hat{p} - p_0}{\sqrt{p_0(1-p_0)/100}} = 3.4 $$


```r
2*(1 - pnorm(3.4))
```

```
[1] 0.0006738585
```

The p-value is less than 0.05, so at the significance level of $5\%$, we have enough evidence to reject the null and conclude that the coin is unfair.

\vspace*{1in}

## Example 2: We have bags of candy with five flavors in each bag. We collect a random sample of ten bags. Each bag has 100 pieces of candy and five flavors. Use Chi-square goodness of fit test to test if the proportions of the five flavors in each bag are the same. The data table below shows the combined flavor counts from all 10 bags of candy. Fill in the details below:


\begin{tabular}{|c|c|c|c|c|c|} \hline
Flavor & Observed Count (O) & Expected Count (E) & $O-E$ & $(O-E)^2$ & $(O-E)^2/E$ \\  \hline
Apple & 180 & 200 & &  &  \\ \hline 
Lime & 250 & 200 & & &  \\ \hline 
Cherry & 120 & 200 & & & \\ \hline 
Orange & 225 & 200 & & &  \\ \hline 
Grape & 225 & 200 & & & \\ \hline 
\end{tabular}


*Answer:* 


$$H_0: p_1 = p_2 = p_3 = p_4 = p_5$$
$$H_a: \text{at least one $p_i$ not equal}$$


```r
1 - pchisq(52.75, df = 5-1)
```

```
[1] 9.612522e-11
```


