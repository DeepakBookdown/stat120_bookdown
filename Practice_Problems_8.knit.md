# Practice Problems 8

## Problem 1: Textbook Prices

Prices of a random sample of 10 textbooks (rounded to the nearest dollar) are shown:

$$ \$132 \quad \$87 \quad \$185 \quad \$52 \quad \$23 \quad \$147 \quad \$125 \quad \$93 \quad \$85 \quad \$72 $$ 

### (a). What is the sample mean? Verify using r-code.

<!-- <details> -->
<!-- <summary><red>Click for answer</red></summary> -->
<!-- *Answer:*  The sample mean is $\bar{x} = 100.1$ -->

<!-- ```{r} -->
<!-- prices <- c(132,87, 185, 52, 23, 147, 125, 93, 85, 72) -->
<!-- mean(prices) -->
<!-- ``` -->

<!-- </details><br> -->

### (b).  Describe carefully how we could use cards to create one bootstrap statistic from this sample.  Be specific.

<!-- <details> -->
<!-- <summary><red>Click for answer</red></summary> -->
<!-- *Answer:* We use 10 cards and write the 10 sample values on the cards. We then mix them up and draw one and record the value on it and put it back. Mix them up again, draw another, record the value, and put it back. Do this 10 times to get a “with replacement” sample of size 10. Then compute the sample mean of this bootstrap sample.  -->
<!-- </details><br> -->


### (c). We can easily instruct R to do this with a simple code provided below. Will the mean of this resample be same as the original sample? What about the standsrd deviation?































