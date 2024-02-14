# Practice Problems 17


## Problem 1:  Movie Goers are More Likely to Watch at Home

In a random sample of 500 movie goers in January 2013, 320 of them said they are more likely to wait and watch a new movie in the comfort of their own home.  Compute and interpret a 95% confidence interval for the proportion of movie goers who are more likely to watch a new movie from home.  

<details><summary><red>Click for answer</red></summary>
*Answer:* We see that $\hat{p}=\frac{320}{500}=0.640$ (keep at least 3 decimal spots to ensure accuracy in your SE calculation!) The confidence interval is given by:

$$\text { Statistic }\pm z^{*} S E$$

$$\begin{array}{l}
\hat{p} \pm z^{*} \cdot \sqrt{\frac{\hat{p}(1-\hat{p})}{n}} \\
0.64 \pm 1.96 \cdot \sqrt{\frac{0.64(1-0.64)}{500}} \\
0.64 \pm 0.042\\
(0.598, 0.682)
\end{array}$$

(Make sure to use proportions in your CI, then convert to % at the end if you prefer a percentage interpretation.) We are 95% sure that the proportion of all movie goers who are more likely to wait and watch a new movie at home is between 0.598 and 0.682.
</details><br>


## Problem 2:  Sample Size and Margin of Error for Movie Goers

(a)  What sample size is needed in example 2 if we want a margin of error within ±2%?  (Use the sample proportion from the original sample.)

<details><summary><red>Click for answer</red></summary>

*Answer:*

$$\begin{array}{l}
0.02=z^{*} \sqrt{\frac{\hat{p}(1-\hat{p})}{n}} \\
n=\left(\frac{z^{*}}{0.02}\right)^{2} \hat{p}(1-\hat{p})\\\quad =\left(\frac{1.96}{0.02}\right)^{2} 0.64(1-0.64)=2212.76
\end{array}$$

We need a sample size of at least n = 2,213 to have a margin of error this small.  This is substantially more than the sample size of 500 used in the actual survey.
</details><br>



(b)  What sample size is needed if we want a margin of error within ±2%, and if we use the conservative estimate of p = 0.5?  

<details><summary><red>Click for answer</red></summary>

*Answer:*

$$n=\left(\frac{1.96}{0.02}\right)^{2} 0.5(1-0.5)=2401$$

We need a sample size of at least n = 2,401 to have a margin of error this small.  Notice that if we have less knowledge of the actual proportion, we need a larger sample size to arrive at the same margin of error.
</details><br>



## Problem 3:  Mendel’s green peas?

One of Gregor Mendel’s famous genetic experiments dealt with raising pea plants.  According to Mendel’s genetic theory, under a certain set of conditions the proportion of pea plants that produce smooth green peas should be p=3/16 (0.1875).  A sample of n=556 plants from the experiment had 108 with smooth green peas.  Does this provide evidence of a problem with Mendel’s theory and that the proportion is different from 3/16?  Show all details of the test. 




<details><summary><red>Click for answer</red></summary>

*Answer:* We are testing $H_{0}: p=0.1875$ vs $H_{a}: p \neq 0.1875$ where p represents the proportion of pea plans with smooth green peas. The sample proportion is $\hat{p}=\frac{108}{556}=0.1942$ and the sample size is $n=556$. The test statistic is:

$$z=\frac{\text { Statistic }-\text { Null }}{S E}=\frac{\hat{p}-p_{0}}{\sqrt{\frac{p_{0}\left(1-p_{0}\right)}{n}}}=\frac{0.1942-0.1875}{\sqrt{\frac{0.1875(1-0.1875)}{556}}}=0.405$$

This is a two-tail test, and we see that the area to the right of 0.405 in a normal distribution is 0.343 `(1-pnorm(0.405))`, so the p-value is 2(0.343) = 0.686.The R command is: `2*(1-pnorm(0.405))`

We do not reject H0 and conclude that this sample does not provide evidence that the proportion of smooth green pea plants is different from the 3/16 that Mendel’s theory predicts. (It is worth pointing out that this does not “prove” Mendel’s theory, since we don’t “accept” $H_0$– we just find a lack of sufficient evidence to refute it. )
</details><br>


