
# Class Activity 1


## Your Turn 2

## Summary of article on [It depends on how you ask!](https://jech.bmj.com/content/75/4/387.abstract)

*Answer:* 

This study aimed to measure the effects of psychological biases on estimates of compliance with public health guidance regarding COVID-19. Results showed that compliance estimates were reduced when questions were framed negatively and anonymity was increased. Effect sizes were large, with compliance estimates diminishing by up to 17% points and 10% points, respectively. These findings suggest that standard tracking surveys pose questions in ways that lead to higher compliance estimates than alternative approaches.


------------------------------------------

## Your Turn 3

## Gettysburg random sample

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

a. Sample

Run the following command to obtain a SRS of 10 words from the 268 that are in the population:


```r
samp <- sample(1:268, size=10)
samp
```

```
 [1]  82 182  97  49  79 246 247  35 243  23
```

This tells you the position (row number) of your sampled words. What are your sampled positions? Why are your sampled positions different from other folks in class?

 \vspace*{1in}


b. Get words and lengths

We will *subset* the data set `pop` to obtain only the sampled rows listed in `samp`. We do this using **square bracket notation** `dataset[row number, column number/name]. Run the following command to find your sampled words and sizes:


```r
pop[samp,]
```

```
    position size   word
82        82    3    who
182      182    4   thus
97        97    6 proper
49        49    3    and
79        79    5  place
246      246    1      a
247      247    3    new
35        35    2     in
243      243    3   God,
23        23    3    the
```

What are your sampled words?
 \vspace*{.5in}


c. Compute your sample mean

The word lengths in part (b) are the data for your sample. You can compute your sample mean using a calculator, or using R. Let's try R (you will find it faster!). First save the quantitative variable `size` in a new variable called `mysize`:


```r
mysize <- pop[samp, "size"]
mysize
```

```
 [1] 3 4 6 3 5 1 3 2 3 3
```

Then find the mean of these values:


```r
mean(mysize)
```

```
[1] 3.3
```

How does this sample mean (from a truly random sample) compare to your sample mean from the non-random sample? 

*Answer:*  The true mean is  4.29. Your two means will likely vary. Since the many non-random samples generally overestimated the population mean length, it is possible (but not guaranteed) that *your* one non-random sample gave a mean length that is greater than the random sample's mean length. 
 \vspace*{1in}


## Driving with a Pet on your Lap

Over 30,000 people participated in an online poll on `cnn.com` conducted in April 2012 asking: "Have you ever driven with a pet on your lap"? We see that 34% of the participants answered yes and 66% answered no.

a. Can you conclude that a random sample was used from the description given? Explain.

*Answer:* No you can't make this conclusion from the info given. In fact, an online poll at a website like `cnn.com` is almost always reporting results from a non-random sample. The people who respond are individuals who visit `cnn.com`, then see the online poll and decide to respond. 

 \vspace*{1.5in}


b. Explain why it is not appropriate to generalize these results to all drivers, or even to all drivers who visit cnn.com.

*Answer:* This is a volunteer sample, and volunteer samples are often biased and can't be generalized to *all drivers* (the population).  It is likely that people who have driven with a pet on their lap are more likely to respond to the poll.


c. How might we select a sample of people that would give us results that we can generalize to a broader population?

*Answer:* A random sample of individuals from all U.S. drivers would need to be selected and given the poll question. (There are many ways to do this, the most common being a variation of random digit dialing where phone numbers are randomly selected from known area codes.)

 \vspace*{1in}

d.  Is the variable measured in this study quantitative or categorical?

*Answer:* Categorical (yes or no answer to the question).

 \vspace*{.5in}



