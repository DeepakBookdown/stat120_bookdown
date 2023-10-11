
# Practice Problems 2

## Problem 1

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
 [1] 139 114 166 119  43 174   3  75  74 105
```

This tells you the position (row number) of your sampled words. What are your sampled positions? Why are your sampled positions different from other folks in class?

<br>



(b). Get words and lengths

We will *subset* the data set `pop` to obtain only the sampled rows listed in `samp`. We do this using **square bracket notation** `dataset[row number, column number/name]. Run the following command to find your sampled words and sizes:


```r
pop[samp,]
```

```
    position size       word
139      139    7   detract.
114      114    2         we
166      166    6    living,
119      119    3        The
43        43    6    nation,
174      174   10 unfinished
3          3    3        and
75        75    2         as
74        74    5      field
105      105    1          a
```

<br>

c. Compute your sample mean

The word lengths in part (b) are the data for your sample. You can compute your sample mean using a calculator, or using R. Let's try R (you will find it faster!). First save the quantitative variable `size` in a new variable called `mysize`:


```r
mysize <- pop[samp, "size"]
mysize
```

```
 [1]  7  2  6  3  6 10  3  2  5  1
```

Then find the mean of these values:


```r
mean(mysize)
```

```
[1] 4.5
```

How does this sample mean (from a truly random sample) compare to your sample mean from the non-random sample? 

<details>
<summary><red>Click for answer</red></summary>

*Answer:*  The true mean is  4.29. Your two means will likely vary. Since the many non-random samples generally overestimated the population mean length, it is possible (but not guaranteed) that *your* one non-random sample gave a mean length that is greater than the random sample's mean length. 

</details>


