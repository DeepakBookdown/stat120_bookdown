# Class Activity 7


## Your Turn 1


## Example 1: Using Search Engines on the Internet

A 2012 survey of a random sample of 2253 US adults found that 1,329 of them reported using a search engine (such as Google) every day to find information on the Internet.  

### a).  Find the relevant proportion and give the correct notation with it.  

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

### b).  Is your answer to part (a) a parameter or a statistic?  

<details>
<summary><red>Click for answer</red></summary>
*Answer:* Statistic
</details><br>

### c).  Give notation for and define the population parameter that we estimate using the result of part (a).

<details>
<summary><red>Click for answer</red></summary>
*Answer:* p = the proportion of all US adults that would report that they use an Internet search engine every day
</details><br>

## Example 2: Bootstrapping mean

Let's use R to perform bootstrapping and visualize the distribution of the sample mean. We need to load the purrr library to do more effective simulation.  Create a vector X containing the data points:


```r
X <- c(20, 24, 19, 23, 22, 16)
```


### a. Generate 500 bootstrapped samples of the data, calculate the mean for each sample, and store the results in a tibble:


```r
bootstrapped_means <- tibble(
  iteration = 1:500,
  mean = map_dbl(iteration, 
                 ~mean(sample(X, replace = TRUE)))
)
```


### b. Create a dot plot to visualize the distribution of the bootstrapped sample means:


```r
ggplot(bootstrapped_means, aes(x = mean)) +
  geom_dotplot(dotsize = 0.7, 
               stackratio = 0.9, 
               binwidth = .13, 
               color = "gold", 
               fill = "blue") +
  ggtitle("") + xlab("") + ylab("") +
  scale_x_continuous(limits = c(17, 24), 
                     expand = c(0, 0), 
                     breaks = seq(17, 24, 1)) +
  labs(title = "Bootstrap distribution of sample mean")
```

<img src="Class_Activity_7_files/figure-epub3/unnamed-chunk-4-1.png" width="100%" />


*Question:* What does each dot represent?
<details>
<summary><red>Click for answer</red></summary>
*Answer:* One sample mean from the bootstrapped sample.
</details><br>
 *Question:* What is the shape of your sampling distribution?
<details>
<summary><red>Click for answer</red></summary>
*Answer:* Roughly symmetric.
</details><br>
*Question:* Where is your distribution centered?
<details>
<summary><red>Click for answer</red></summary>
*Answer:* About 20.5
</details><br>

*Question:* The distribution should be centered at the original sample mean. Verify it. Do we know the population mean? If not, what does it tell us about the center of this distribution.
<details>
<summary><red>Click for answer</red></summary>
*Answer:* It is close to the original sample mean. We do not know the population mean, so the bootstrap distribution will carry the bias of the original sample mean.


```r
# r-code
mean(bootstrapped_means$mean)
```

```
[1] 20.654
```

```r
mean(X)
```

```
[1] 20.66667
```

</details><br>
*Question:* What is the standard deviation of this distribution? (Hint: use the 95% rule.) 
<details>
<summary><red>Click for answer</red></summary>
*Answer:* About 1.25, it looks like most of the bootstrapped sample means are between 18 to 23 so 2 standard deviations is about 2.5. This makes the SD about 1.25. 
</details><br>
*Question:* The standard deviation of sampling distribution has a separate name. It is called the **Standard Error**. Verify the standard deviation of this distribution using R-code.
<details>
<summary><red>Click for answer</red></summary>
*Answer:* It's close.


```r
# r-code
sd(bootstrapped_means$mean)
```

```
[1] 1.161888
```

</details><br>

## Example 3: Simulation of a Sample Proportion

According to a PEW survey, $66\%$ of U.S. adult citizens casted a ballot in the 2020 election. Suppose we take a random sample of $n=100$ eligible U.S. voters and computed the sample proportion who voted. 



```r
# Call the library
library(ggplot2)
```



```r
# Define parameters
pop.prop <- .66 # Population proportion
n.size <- 100  # sample size
```


### (a) Generate a random sample of size $n= 100$ and plot its sample proportion.


```r
# Generate 1 sample
sample1 <- rbinom(n = 1, size = n.size, p = pop.prop) # R simulates the samples
sample.prop1 <- sample1/n.size #  Proportion = No. of Success / Sample Size
```



```r
# define a data frame
mydata <- data.frame(x = sample.prop1)

# Plot a dot plot of the sample proportion
ggplot(mydata, aes(x = x)) +
   geom_dotplot(dotsize = 0.25,
               stackratio = 0.75,
               binwidth = .025,
               color = "gold",
               fill = "blue") +
  ggtitle("A single sample proportion") +  xlab("Proportion") + ylab("Count")+
  scale_x_continuous(limits = c(0, 1))+ 
  theme(plot.title = element_text(hjust = 0.5))
```

<img src="Class_Activity_7_files/figure-epub3/unnamed-chunk-10-1.png" width="100%" />

### (b) Generate 5 random samples of size $n= 100$ and plot the sample proportions.



```r
# generate 5 random samples of size 100
sample5 <- rbinom(n = 5, size = n.size, p = pop.prop)  
sample.prop5 <- sample5/n.size 

data <- data.frame(x = sample.prop5)

ggplot(data, aes(x = x)) +
   geom_dotplot(dotsize = 0.25,
               stackratio = 0.75,
               binwidth = .025,
               color = "gold",
               fill = "blue") +
  ggtitle("") +  xlab("Proportion") + ylab("Count")+
  scale_x_continuous(limits = c(0, 1))+ 
  theme(plot.title = element_text(hjust = 0.5))
```

<img src="Class_Activity_7_files/figure-epub3/unnamed-chunk-11-1.png" width="100%" />


### (c) Generate 500 random samples of size $n= 100$ and plot the sample proportions.


```r
# Generate 500 samples
set.seed(143)
sample500 <- rbinom(n = 500, size = n.size, p = pop.prop)  
sample.prop500 <- sample500/n.size 

data <- data.frame(x = sample.prop500)

ggplot(data, aes(x = x)) +
  geom_dotplot(dotsize = 0.25,
               stackratio = 0.75,
               binwidth = .025,
               color = "gold",
               fill = "blue") +
  ggtitle("") +  xlab("Proportion") + ylab("Count") +
  scale_x_continuous(limits = c(0, 1))+ 
  theme(plot.title = element_text(hjust = 0.5))
```

<img src="Class_Activity_7_files/figure-epub3/unnamed-chunk-12-1.png" width="100%" />

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
mean(sample.prop500)
```

```
[1] 0.66298
```

</details><br>
*Question:* What is the standard deviation of this distribution? (Hint: use the 95% rule.) 
<details>
<summary><red>Click for answer</red></summary>
*Answer:* About 0.05, it looks like most sample proportions are between 0.55 to 0.75 so 2 standard deviations is about 0.10. This makes the SD about 0.05. 
</details><br>
*Question:* The standard deviation of sampling distribution has a separate name. It is called the **Standard Error**. Verify the standard deviation of this distribution using R-code.
<details>
<summary><red>Click for answer</red></summary>
*Answer:*


```r
# r-code
sd(sample.prop500)
```

```
[1] 0.0494673
```

</details><br>
### (d) Repeat part(c) with sample size 20 instead of 100. Generate 500 samples.


```r
n.size <- 10
pop.prop <- .66 # Population proportion

sample500_size10 <- rbinom(n = 500, size = n.size, p = pop.prop)  
sample.prop500_size10 <- sample500_size10/n.size 

data_size10 <- data.frame(x = sample.prop500_size10)

ggplot(data_size10, aes(x = x)) +
 geom_dotplot(dotsize = 0.25,
               stackratio = 0.75,
               binwidth = .015,
               color = "gold",
               fill = "blue") + 
  ggtitle("") +  xlab("Proportion") + ylab("Count") +
  scale_x_continuous(limits = c(0, 1))+ 
  theme(plot.title = element_text(hjust = 0.5))
```

<img src="Class_Activity_7_files/figure-epub3/unnamed-chunk-15-1.png" width="100%" />


*Question:*  How has the sampling distribution changed? (Shape? Center? Variability?)
<details>
<summary><red>Click for answer</red></summary>
*Answer:* The shape is slightly left skewed, still centered at 0.66 but with more variability that before (SD of about 0.10). This distribution is more discrete looking because there are just a few sample proportions possible with n=20 (e.g. 20/20, 19/20, 18/20, etc). 


```r
mean(sample.prop500_size10)
```

```
[1] 0.6618
```

```r
sd(sample.prop500_size10)
```

```
[1] 0.1415657
```

</details><br>
### (d) Now suppose the population proportion is $p=0.90$ instead of $p=0.66$ in part (e). Keep n.size=10. 


```r
pop.prop.large <- 0.90
n.size <- 10

sample500_size10_large_p <- rbinom(n = 500, size = n.size, p = pop.prop.large)  
sample.prop500_size10_large_p <- sample500_size10_large_p/n.size 

data_size10_large_p <- data.frame(x = sample.prop500_size10_large_p)

ggplot(data_size10_large_p, aes(x = x)) +
 geom_dotplot(dotsize = 0.25,
               stackratio = 0.75,
               binwidth = .015,
               color = "gold",
               fill = "blue") + 
  ggtitle("") +  xlab("Proportion") + ylab("Count") +
  scale_x_continuous(limits = c(0, 1))+ 
  theme(plot.title = element_text(hjust = 0.5))
```

<img src="Class_Activity_7_files/figure-epub3/unnamed-chunk-17-1.png" width="100%" />

*Question:* How has the sampling distribution changed? (Shape? Center? Variability?)
<details>
<summary><red>Click for answer</red></summary>
*Answer:*  The shape is much more left skewed than when p=0.66. Center is around 0.90 and SD is around 0.07. Note that increasing the population proportion closer to 1 results in a decrease in the SD because most samples give proportion near 1.  


```r
mean(sample.prop500_size10_large_p)
```

```
[1] 0.9
```

```r
sd(sample.prop500_size10_large_p)
```

```
[1] 0.09261293
```

</details><br>

