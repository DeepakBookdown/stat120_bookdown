
# Class Activity 2

## Your Turn 1

This exercise is about finding the average word length in Lincoln's Gettysburg's address.

------------------------------------------
<br>

## Your Turn 2

### Summary of article on [It depends on how you ask!](https://jech.bmj.com/content/75/4/387.abstract)

<details>
<summary><red>Click for answer</red></summary>

*Answer:* 

This study aimed to measure the effects of psychological biases on estimates of compliance with public health guidance regarding COVID-19. Results showed that compliance estimates were reduced when questions were framed negatively and anonymity was increased. Effect sizes were large, with compliance estimates diminishing by up to 17% points and 10% points, respectively. These findings suggest that standard tracking surveys pose questions in ways that lead to higher compliance estimates than alternative approaches.
</details>
<br>

------------------------------------------

## Your Turn 3

### Gettysburg random sample

Let’s take a simple random sample (SRS) of Gettysburg words. The “population” is contained in the
spreadsheet `GettysburgPopulationCounts.csv`. Carefully load this data into R:



```r
pop <- read.csv("https://raw.githubusercontent.com/deepbas/statdatasets/main/GettysbergPopulationCounts.csv")
head(pop)
```

```
  position size  word
1        1    4  Four
2        2    5 score
3        3    3   and
4        4    5 seven
5        5    5 years
6        6    3  ago,
```

The `position` variable enumerates the list of words in the population (address).

(a). Sample

Run the following command to obtain a SRS of 10 words from the 268 that are in the population:


```r
samp <- sample(1:268, size=10)
samp
```

```
 [1]  75 158  28 153  93 263  87  65  31 159
```

This tells you the position (row number) of your sampled words. What are your sampled positions? Why are your sampled positions different from other folks in class?

<br>



(b). Get words and lengths

We will *subset* the data set `pop` to obtain only the sampled rows listed in `samp`. We do this using **square bracket notation** `dataset[row number, column number/name]. Run the following command to find your sampled words and sizes:


```r
pop[samp,]
```

```
    position size  word
75        75    2    as
158      158    4  they
28        28    3   are
153      153    2    it
93        93    2    is
263      263    5 shall
87        87    4  that
65        65    2    We
31        31    3   Now
159      159    3   did
```

<br>

c. Compute your sample mean

The word lengths in part (b) are the data for your sample. You can compute your sample mean using a calculator, or using R. Let's try R (you will find it faster!). First save the quantitative variable `size` in a new variable called `mysize`:


```r
mysize <- pop[samp, "size"]
mysize
```

```
 [1] 2 4 3 2 2 5 4 2 3 3
```

Then find the mean of these values:


```r
mean(mysize)
```

```
[1] 3
```

How does this sample mean (from a truly random sample) compare to your sample mean from the non-random sample? 

<details>
<summary><red>Click for answer</red></summary>

*Answer:*  The true mean is  4.29. Your two means will likely vary. Since the many non-random samples generally overestimated the population mean length, it is possible (but not guaranteed) that *your* one non-random sample gave a mean length that is greater than the random sample's mean length. 

</details>

<br>



### Driving with a Pet on your Lap

Over 30,000 people participated in an online poll on `cnn.com` conducted in April 2012 asking: "Have you ever driven with a pet on your lap"? We see that 34% of the participants answered yes and 66% answered no.

a. Can you conclude that a random sample was used from the description given? Explain.

<details>
<summary><red>Click for answer</red></summary>

*Answer:* No you can't make this conclusion from the info given. In fact, an online poll at a website like `cnn.com` is almost always reporting results from a non-random sample. The people who respond are individuals who visit `cnn.com`, then see the online poll and decide to respond. 
</details>

<br>



b. Explain why it is not appropriate to generalize these results to all drivers, or even to all drivers who visit cnn.com.

<details>
<summary><red>Click for answer</red></summary>

*Answer:* This is a volunteer sample, and volunteer samples are often biased and can't be generalized to *all drivers* (the population).  It is likely that people who have driven with a pet on their lap are more likely to respond to the poll.
</details>
<br>

c. How might we select a sample of people that would give us results that we can generalize to a broader population?

<details>
<summary><red>Click for answer</red></summary>

*Answer:* A random sample of individuals from all U.S. drivers would need to be selected and given the poll question. (There are many ways to do this, the most common being a variation of random digit dialing where phone numbers are randomly selected from known area codes.)
</details>

<br>


d. Is the variable measured in this study quantitative or categorical?

<details>
<summary><red>Click for answer</red></summary>

*Answer:* Categorical (yes or no answer to the question).
</details>

 


