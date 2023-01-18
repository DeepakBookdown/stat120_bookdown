# Class Activity 7


## Your Turn 1

### Parameters and Statistics 
Here are some notations that will be useful for you. Look for the codes to produce this in the associated Rmd file.

&nbsp; | Parameter | Statistic |
---- | ---- | ---- |
Mean | $\mu$ | $\bar{x}$ | 
Proportion | $p$ | $\hat{p}$ |
Std. Dev. | $\sigma$ | $s$ |
Correlation | $\rho$ | $r$ |
Slope | $\beta$ | $b$ |

\vspace*{1in}

### Example 1: Parameters and Statistics

For each of the following, state whether the quantity described is a parameter or a statistic, and give the correct notation.

 (a). Average household income for all houses in the US, using data from the US census
<details>
<summary><red>Click for answer</red></summary>
*Answer:* This is a parameter since the mean is for all houses in the US, and the notation is $\mu$.
</details><br>
<br>

 (b). The proportion of all residents in a county who voted in the last presidential election.
<details>
<summary><red>Click for answer</red></summary>
*Answer:* This is a parameter since we have information on all the residents, and the notation is p.
</details><br>
<br>

 (c). The difference in proportion who have ever smoked cigarettes, between a sample of 500 people who are 60 years old and a sample of 200 people who are 25 years old.    

<details>
<summary><red>Click for answer</red></summary>
*Answer:* We use statistics since the proportions are from samples.  The notation for the difference in sample proportions is $\hat{p}_1 - \hat{p}_2$
</details><br>
<br>

 (d). The correlation between weight and height for 5-year old kids. 
 
<details>
<summary><red>Click for answer</red></summary>
*Answer:* If we are looking at all 5-year old kids it is a parameter, and the notation for correlation is $\rho$.
</details><br>
<br>

 (e). The mean number of extracurricular activities from a random sample of 50 students at your school.
<details>
<summary><red>Click for answer</red></summary>
*Answer:* This is a statistic since the mean is from a sample, and the notation is $\mu$.
</details><br>
<br>

------------------------------------------------------------------------------------

### Example 2: Using Search Engines on the Internet

A 2012 survey of a random sample of 2253 US adults found that 1,329 of them reported using a search engine (such as Google) every day to find information on the Internet.  

 (a).  Find the relevant proportion and give the correct notation with it.  
 
<details>
<summary><red>Click for answer</red></summary>
*Answer:* $\hat{p} = 1329/2253$


```r
p.hat <- 1329/2253
p.hat
```

```
[1] 0.5898802
```
</details><br>
<br>

 b).  Is your answer to part (a) a parameter or a statistic?  

<details>
<summary><red>Click for answer</red></summary>
*Answer:* Statistic
</details><br>

 c).  Give notation for and define the population parameter that we estimate using the result of part (a).

<details>
<summary><red>Click for answer</red></summary>
*Answer:* p = the proportion of all US adults that would report that they use an Internet search engine every day
</details><br>
<br>


---------------------------------------------------------------------------------------------


## Your Turn 2

### Example 3: Simulation of a Sample Proportion

According to a PEW survey, $66\%$ of U.S. adult citizens casted a ballot in the 2020 election. Suppose we take a random sample of $n=100$ eligible U.S. voters and computed the sample proportion who voted. 



```r
# Define parameters
set.seed(123) # set seed for reproducibility
pop.prop <- .66 # Population proportion
n.size <- 100  # sample size
```


(a). Generate a random sample of size $n= 100$ and plot its sample proportion.


```r
# Generate 1 sample
sample1 <- rbinom(n = 1, size = n.size, p = pop.prop) # R simulates the samples
sample.prop1 <- sample1/n.size #  Proportion = No. of Success / Sample Size
```



```r
# Call the library
library(ggplot2)
```



```r
# define a data frame
mydata <- data.frame(x = sample.prop1)

# Plot a dot plot of the sample proportion
ggplot(mydata, aes(x = sample.prop1)) +
  geom_dotplot(dotsize=0.25, stackratio=0.75, binwidth=0.01) +
  ggtitle("A single sample proportion") +  xlab("Proportion") + ylab("Count")+
  scale_x_continuous(limits = c(0.4, 0.9))+
  theme(plot.title = element_text(hjust = 0.5))
```

<img src="Class_Activity_7_files/figure-epub3/unnamed-chunk-5-1.png" width="100%" />

(b). Generate 5 random samples of size $n= 100$ and plot the sample proportions.


```r
# generate 5 random samples of size 100
sample5 <- rbinom(n = 5, size = n.size, p = pop.prop)  
sample.prop5 <- sample5/n.size 

data <- data.frame(x = sample.prop5)

ggplot(data, aes(x = sample.prop5)) +
  geom_dotplot(dotsize=0.25, stackratio=0.9, binwidth=0.01 )+
  ggtitle("") +  xlab("Proportion") + ylab("Count")+
  scale_x_continuous(limits = c(0.4, 0.9))+ 
  theme(plot.title = element_text(hjust = 0.5))
```

<img src="Class_Activity_7_files/figure-epub3/unnamed-chunk-6-1.png" width="100%" />


 (c). Generate 1000 random samples of size $n= 100$ and plot the sample proportions.


```r
# Generate 1000 samples
sample1000 <- rbinom(n = 1000, size = n.size, p = pop.prop)  
sample.prop1000 <- sample1000/n.size 

data <- data.frame(x = sample.prop1000)

ggplot(data, aes(x = sample.prop1000)) +
  geom_dotplot(dotsize=0.25, method = "histodot", stackratio=0.9, binwidth=0.01) +
  ggtitle("") +  xlab("Proportion") + ylab("Count") +
  scale_x_continuous(limits = c(0.4, 0.9))+ 
  theme(plot.title = element_text(hjust = 0.5))
```

<img src="Class_Activity_7_files/figure-epub3/unnamed-chunk-7-1.png" width="100%" />



*Question:* What does each dot represent?

<details>
<summary><red>Click for answer</red></summary>
*Answer:* One sample proportion from a sample of n=100 eligible voters.
</details><br>

*Question:* What is the shape of your sampling distribution?
<details>
<summary><red>Click for answer</red></summary>
*Answer:* Roughly symmetric.
</details><br>

*Question:* Where is your distribution centered?
<details>
<summary><red>Click for answer</red></summary>
*Answer:* About 0.66, which is the population proportion. 
</details><br>

*Question:* The distribution should be centered at the population proportion. Verify that the distribution is centered around the population proportion, $p = 0.66$. 
<details>
<summary><red>Click for answer</red></summary>
*Answer:* 


```r
# r-code
mean(sample.prop1000)
```

```
[1] 0.65962
```
</details><br>


*Question:* What is the standard deviation of this distribution? (Hint: use the 95% rule.) 
<details>
<summary><red>Click for answer</red></summary>
*Answer:* About 0.03, it looks like most sample proportions are between 0.55 to 0.75 so 2 standard deviations is about 0.10. This makes the SD about 0.05. 
</details><br>

*Question:* The standard deviation of sampling distribution has a separate name. It is called the **Standard Error**. Verify the standard deviation of this distribution using R-code.
<details>
<summary><red>Click for answer</red></summary>
*Answer:*


```r
# r-code
sd(sample.prop1000)
```

```
[1] 0.0483176
```
</details><br>

(d). Repeat part(c) with sample size 20 instead of 100. Generate 1000 samples.


```r
# Generate 1000 samples
n.size <- 20

sample1000 <- rbinom(n = 1000, size = n.size, p = pop.prop)  
sample.prop1000 <- sample1000/n.size 

data <- data.frame(x = sample.prop1000)

ggplot(data, aes(x = sample.prop1000)) +
  geom_dotplot(dotsize=0.225, method = "histodot", stackratio=0.8, binwidth=0.01) +
  ggtitle("") +  xlab("Proportion") + ylab("Count") +
  scale_x_continuous(limits = c(0.3, 0.9))+ 
  theme(plot.title = element_text(hjust = 0.5))
```

<img src="Class_Activity_7_files/figure-epub3/unnamed-chunk-10-1.png" width="100%" />


*Question:*  How has the sampling distribution changed? (Shape? Center? Variability?)

<details>
<summary><red>Click for answer</red></summary>
*Answer:* The shape is slightly left skewed, still centered at 0.66 but with more variability that before (SD of about 0.10). This distribution is more discrete looking because there are just a few sample proportions possible with n=20 (e.g. 20/20, 19/20, 18/20, etc). 


```r
mean(sample.prop1000)
```

```
[1] 0.65885
```

```r
sd(sample.prop1000)
```

```
[1] 0.1086093
```
</details><br>

(e). Now suppose the population proportion is $p=0.90$ instead of $p=0.66$ in part (e). Keep n.size=20. 


```r
# Generate 1000 samples

pop.prop <- 0.90
n.size <- 20
n.size <- 20

sample1000 <- rbinom(n = 1000, size = n.size, p = pop.prop)  
sample.prop1000 <- sample1000/n.size 

data <- data.frame(x = sample.prop1000)

ggplot(data, aes(x = sample.prop1000)) +
  geom_dotplot(dotsize=0.21, method = "histodot", stackratio=0.8, binwidth=0.01) +
  ggtitle("") +  xlab("Proportion") + ylab("Count") +
  scale_x_continuous(limits = c(0.4, 0.9))+ 
  theme(plot.title = element_text(hjust = 0.5))
```

<img src="Class_Activity_7_files/figure-epub3/unnamed-chunk-12-1.png" width="100%" />

*Question:* How has the sampling distribution changed? (Shape? Center? Variability?)

<details>
<summary><red>Click for answer</red></summary>
*Answer:*  The shape is much more left skewed than when p=0.66. Center is around 0.90 and SD is around 0.07. Note that increasing the population proportion closer to 1 results in a decrease in the SD because most samples give proportion near 1.  


```r
mean(sample.prop1000)
```

```
[1] 0.9028
```

```r
sd(sample.prop1000)
```

```
[1] 0.06466329
```
</details><br>

--------------------------------------------------------------------------------

### Example 4: Simulation for a Sample Mean

We’ll look at sampling movies from the population of 134 Hollywood movies made in 2011 and measuring their budget (millions of dollars).


```r
# import dataset
library(Lock5Data)
movies <- HollywoodMovies2011
```

(a). What is the population mean of the `Budget`?


```r
# r-code
mean(movies$Budget, na.rm = TRUE)
```

```
[1] 53.48134
```

(b). Generate a random sample of size $n= 10$ and plot the sample proportion.


```r
# define a data frame
n.size <- 10

Budget <- movies$Budget[!is.na(movies$Budget)] # remove NAs

sample1 <- sample(Budget, size = n.size) 
sample.mean1 <- mean(sample1)

mydata <- data.frame(x = sample.mean1)

# Plot a dot plot of the sample proportion
ggplot(mydata, aes(x = sample.mean1)) +
  geom_dotplot(dotsize=1, stackratio=0.9, binwidth=1) +
  ggtitle("A single sample mean") +  xlab("Sample mean") + ylab("Count")+
  scale_x_continuous(limits = c(1,120))+ 
  theme(plot.title = element_text(hjust = 0.5))
```

<img src="Class_Activity_7_files/figure-epub3/unnamed-chunk-16-1.png" width="100%" />


(c). Generate 5 random samples of size $n= 10$ and plot the sample means.


```r
n.size <- 10
n.rep <- 5

Budget <- movies$Budget[!is.na(movies$Budget)] # remove NAs

sample5 <- lapply(1:5, function(i) sample(Budget, size = n.size)) 
sample.mean5 <- lapply(sample5, function(x) mean(x)) 
sample.mean5 <- unlist(sample.mean5)

mydata <- data.frame(x = sample.mean5)

# Plot a dot plot of the sample proportion
ggplot(mydata, aes(x = sample.mean5)) +
  geom_dotplot(dotsize=0.9, stackratio=0.9, binwidth=1) +
  ggtitle("A single sample mean") +  xlab("Sample mean") + ylab("Count")+
  scale_x_continuous(limits = c(1,120))+ 
  theme(plot.title = element_text(hjust = 0.5))
```

<img src="Class_Activity_7_files/figure-epub3/unnamed-chunk-17-1.png" width="100%" />


(d). Generate 1000 random samples of size $n= 10$ and plot the sample means.


```r
# Generate 1000 samples
n.size <- 10
n.rep <- 1000

Budget <- movies$Budget[!is.na(movies$Budget)] # remove NAs

sample1000 <- lapply(1:n.rep, function(i) sample(Budget, size = n.size)) 
sample.mean1000 <- lapply(sample1000, function(x) mean(x)) 
sample.mean1000 <- unlist(sample.mean1000)

mydata <- data.frame(x = sample.mean1000)

# Plot a dot plot of the sample proportion
ggplot(mydata, aes(x = sample.mean1000)) +
  geom_dotplot(dotsize=1, method = "histodot", stackratio=0.9, binwidth=1) +
  ggtitle("A single sample mean") +  xlab("Sample mean") + ylab("Count")+
  scale_x_continuous(limits = c(1,120))+ 
  theme(plot.title = element_text(hjust = 0.5))
```

<img src="Class_Activity_7_files/figure-epub3/unnamed-chunk-18-1.png" width="100%" />


*Question:* What does each dot represent?
<details>
<summary><red>Click for answer</red></summary>
*Answer:* A sample mean budget from a sample of n=10
</details><br>

*Question:* What is the shape of your sampling distribution?
<details>
<summary><red>Click for answer</red></summary>
*Answer:* Slightly right skewed.
</details><br>

*Question:* Where is your distribution centered?
<details>
<summary><red>Click for answer</red></summary>
*Answer:* About $53 million, which is the population mean budget. 


```r
mean(movies$Budget, na.rm = TRUE)
```

```
[1] 53.48134
```
</details><br>


*Question:* The distribution should be centered at the population mean. Verify that the distribution is centered around the population mean, $\mu = 53.48$. 
<details>
<summary><red>Click for answer</red></summary>
*Answer:* It is very close to the population mean.


```r
# r-code
mean(sample.mean1000)
```

```
[1] 53.12677
```
</details><br>

*Question:* What is the standard deviation of this distribution? (Hint: use the 95% rule.) 
<details>
<summary><red>Click for answer</red></summary>
*Answer:* About 15 million. 
</details><br>

*Question:* The standard deviation of sampling distribution has a separate name. It is called the **Standard Error**. Verify the standard deviation of this distribution using R-code.
<details>
<summary><red>Click for answer</red></summary>
*Answer:* It is 14.80 million quite cose to our previous informed guess.


```r
# r-code
sd(sample.mean1000)
```

```
[1] 15.0577
```
</details><br>

(e). Repeat part(d) with sample size 50 instead of 10. Generate 1000 samples.


```r
# Generate 1000 samples
n.size <- 50
n.rep <- 1000

Budget <- movies$Budget[!is.na(movies$Budget)] # remove NAs

sample1000 <- lapply(1:n.rep, function(i) sample(Budget, size = n.size)) 
sample.mean1000 <- lapply(sample1000, function(x) mean(x)) 
sample.mean1000 <- unlist(sample.mean1000)

mydata <- data.frame(x = sample.mean1000)

# Plot a dot plot of the sample proportion
ggplot(mydata, aes(x = sample.mean1000)) +
  geom_dotplot(dotsize=1, method = "histodot", stackratio=0.9, binwidth=1) +
  ggtitle("A single sample mean") +  xlab("Sample mean") + ylab("Count")+
  scale_x_continuous(limits = c(1,120))+
  theme(plot.title = element_text(hjust = 0.5))+
  theme(plot.title = element_text(hjust = 0.5))
```

<img src="Class_Activity_7_files/figure-epub3/unnamed-chunk-22-1.png" width="100%" />


*Question:* Is this sampling distribution more or less symmetric compared to the distribution when $n=10$?

<details>
<summary><red>Click for answer</red></summary>
*Answer:* The distribution is more symmetric with n=50 than when n=10. 
</details><br>

--------------------------------------------------------------------------------

### Example 5: Effect of sample size

Let's investigate the effect of sample size in the sampling distribution using the same setting as in Exercise 1 with $p=0.66$. The following are three sampling distributions corresponding to different sample sizes. 


<img src="Class_Activity_7_files/figure-epub3/unnamed-chunk-23-1.png" width="100%" />


*Question:* What happens if we increase the sample size?

<details>
<summary><red>Click for answer</red></summary>
*Answer:* When we increase the sample size, the variability of the sampling distribution becomes smaller.
</details><br>

*Question:* Estimate the standard error of each and verify your answer to the previous question.

<details>
<summary><red>Click for answer</red></summary>
*Answer:* The standard errors are


```r
sd(data.size.25$x)
```

```
[1] 0.09011439
```

```r
sd(data.size.100$x)
```

```
[1] 0.04093137
```

```r
sd(data.size.400$x)
```

```
[1] 0.02311007
```


As the sample size increases, the variability as measured by the standard error of the sampling distribution does indeed decrease.
</details><br>

---------------------------------------------------------------------------------------------

### Example 6: Bootstrap Sampling


```r
# Movies Example Again!
Budget <- movies$Budget[!is.na(movies$Budget)]

# Bootstrap samples
n.size <- 10
boot.sample1 <- sample(Budget, 10, replace = TRUE) # sampling with replacement

n.rep <- 1000
boot.sample1000 <- lapply(1:n.rep, function(i) sample(Budget, 10, replace = TRUE))
boot.samplemean1000 <- lapply(boot.sample1000, function(x) mean(x))
boot.samplemean1000 <- unlist(boot.samplemean1000)
```



```r
# Plot the bootstrap distribution
mydata <- data.frame(x = boot.samplemean1000)

# Plot a dot plot of the sample proportion
ggplot(mydata, aes(x = boot.samplemean1000)) +
  geom_dotplot(dotsize=0.9, stackratio=0.9, binwidth=1, method = "histodot") +
  ggtitle("Sampling distribution for sample mean") +  xlab("Sample mean") + ylab("Count")+
  scale_x_continuous(limits = c(1,120))+ 
  theme(plot.title = element_text(hjust = 0.5))
```

<img src="Class_Activity_7_files/figure-epub3/unnamed-chunk-26-1.png" width="100%" />

(a). Compare the center/spread/shape of the bootstrap distribution to the distribution computed in Ex. 4 (d). Answer all the questions in Ex. 4(d).

<details>
<summary><red>Click for answer</red></summary>
*Answer:* The shape/center and variability of this bootstrap distribution is very similar to that of Ex 4 (d)


```r
mean(mydata$x)
```

```
[1] 53.23545
```

```r
sd(mydata$x)
```

```
[1] 15.41347
```
</details><br>
