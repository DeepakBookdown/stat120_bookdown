# Class Activity 5

## Your Turn 1

### Hollywood Movies Domestic Gross 

The  dataset `HollywoodMovies2011` provides information on 136 movies that came out of Hollywood in 2011. We will look at the variable `DomesticGross`, which gives US domestic gross income for a movie from all viewers (in millions of dollars). 


```r
movies <- read.csv("https://raw.githubusercontent.com/deepbas/statdatasets/main/HollywoodMovies2011.csv")
```



```r
hist(movies$DomesticGross, main="Distribution of Domestic Gross")
```

<img src="Class_Activity_5_files/figure-epub3/unnamed-chunk-2-1.png" width="100%" />

 (a). Describe the shape of the distribution.

<details>
<summary><red>Click for answer</red></summary>
*Answer:* Skewed to the right
</details>
<br>

 (b).	Do there appear to be any outliers?  If so, which values?

<details>
<summary><red>Click for answer</red></summary>
*Answer:* Yes, it looks like there are a few high outliers above 300 million.
</details>
<br>

 (c). Finding outliers

We can find the row numbers of cases (movies) that have `DomesticGross` greater than 300 (300 million dollars):


```r
which(movies$DomesticGross > 300)
```

```
[1]  4 14
```

Run the `which` command to verify that rows 4 and 14. Then find out which movies these are by subsetting the data frame:


```r
movies[c(4,14), ]
```

```
                                         Movie
4  Harry Potter and the Deathly Hallows Part 2
14              Transformers: Dark of the Moon
            LeadStudio RottenTomatoes AudienceScore   Story
4          Warner Bros             96            92 Rivalry
14 DreamWorks Pictures             35            67   Quest
     Genre TheatersOpenWeek BOAverageOpenWeek DomesticGross
4  Fantasy             4375             38672        381.01
14  Action             4088             23937        352.39
   ForeignGross WorldGross Budget Profitability
4        947.10   1328.111    125     10.624888
14       770.81   1123.195    195      5.759974
   OpeningWeekend
4          169.19
14          97.85
```

Note that the `c(4,14)` part of this command creates a **vector** of the numbers 4 and 14 (the `c` stands for combine). Which movies are the outliers?

<details>
<summary><red>Click for answer</red></summary>
*Answer:*  Harry Potter and the Deathly Hallows Part 2 and Transformers: Dark of the Moon.
</details>
<br>

 (d).	Use the histogram to answer: Is the median less than 100 million, about 100 million, above 100 million? 

<details>
<summary><red>Click for answer</red></summary>
*Answer:* It is the point with half the data to the left and half to the right. The median is less than 100
since 100 roughly 110 (80 + 30) cases below it which is well over half the movies in the data set.
</details>
<br>

 (e).	Do you expect the mean to be greater than or less than the median.  Explain.

<details>
<summary><red>Click for answer</red></summary>
*Answer:* Because the distribution is skewed to the right, we expect the mean to be larger than the median.
The large outliers will pull the mean up and won’t have much effect on the median.
</details>
<br>

 (f). Computing the mean and median

You can get the mean and median a number of ways. Run these three commands:


```r
mean(movies$DomesticGross)
```

```
[1] NA
```

```r
median(movies$DomesticGross)
```

```
[1] NA
```

```r
summary(movies$DomesticGross)
```

```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
   0.02   19.03   37.35   63.22   80.46  381.01       2 
```

What does `NA` stand for? How many movies have missing `DomesticGross`? You can subset the data to show you which cases have `NA` values for `DomesticGross`:


```r
movies[is.na(movies$DomesticGross), ]
```

```
                              Movie LeadStudio
134                            Hugo  Paramount
136 Never Back Down 2: The Beatdown       Sony
    RottenTomatoes AudienceScore   Story     Genre
134             93            84         Adventure
136             NA            44 Rivalry    Action
    TheatersOpenWeek BOAverageOpenWeek DomesticGross
134             1277              8899            NA
136               NA                NA            NA
    ForeignGross WorldGross Budget Profitability
134           NA         NA     NA            NA
136           NA         NA      3             0
    OpeningWeekend
134          11.36
136           8.60
```

<details>
<summary><red>Click for answer</red></summary>
*Answer:* The `NA` value stands for “Not Available” which is used to code missing values. We can inspect the data frame and see that Hugo and Never Back Down 2 are the two movies that do not have domestic
gross values.
</details>
<br>

 (g). Missing data

There are some commands in R that "fail" as a default when missing data (`NA`) are present (`mean`, `median` and `sd` are examples). We can easily turn off this failure feature with the argument `na.rm=TRUE`


```r
mean(movies$DomesticGross, na.rm=TRUE)
```

```
[1] 63.22276
```

```r
median(movies$DomesticGross, na.rm=TRUE)
```

```
[1] 37.355
```
<br>


 (h). Stats without outliers

There are a number of ways to "remove" outliers from an analysis. Here we use the square bracket `[]` notation along with a minus `-` to remove row 4 (Harry Potter) from the variable `DomesticGross` before our summary stat calculations:


```r
summary(movies$DomesticGross[-4])
```

```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
   0.02   18.88   37.30   60.83   80.36  352.39       2 
```

Why does the mean change more than the median when this case is removed? (compare (g) and (h) mean and median values)

<details>
<summary><red>Click for answer</red></summary>
*Answer:* Both values go down after removing the highest grossing movie of the year, but the drop in the mean is more substantial. The mean drops by almost 4% when Harry Potter is removed while the median only drops by about 0.1%.


```r
100*(60.83 - 63.22276)/63.22276 # percent change in the mean
```

```
[1] -3.78465
```

```r
100*(37.30 - 37.355)/37.355 # percent change in the median
```

```
[1] -0.147236
```
</details>
<br>

 (i). Computing standard deviation

The standard deviation command is `sd`. We need to add the `na.rm` argument to obtain the SD for `DomesticGross`:


```r
sd(movies$DomesticGross, na.rm=TRUE)
```

```
[1] 69.41799
```

Look again at the distribution of `DomesticGross` shown in the histogram. Why is SD (variation around the mean) an inadequate measure of variation for this type of distribution?

<details>
<summary><red>Click for answer</red></summary>
*Answer:* The is much more variation (spread) to the data above the mean than below it. Because the distribution is strongly skewed right, we can't use one measure of variation when describing how `DomesticGross` values vary around some central value (like a mean).
</details>
<br>

(j). Stats by `Genre`

The `tapply(y, x, stat)` command gives the `stat` value of `y` for each level of `x`. Here we get the `summary` of `DomesticGross` for each type of `Genre`:


```r
tapply(movies$DomesticGross, movies$Genre, summary)
```

```
$Action
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
   0.54   24.96   40.26   91.02  161.53  352.39       1 

$Adventure
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
     NA      NA      NA     NaN      NA      NA       1 

$Animation
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  21.39   51.41  115.67  104.62  142.86  191.45 

$Comedy
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   5.79   23.21   37.41   56.51   69.75  254.46 

$Drama
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   0.38    4.40   13.30   32.37   51.16  169.22 

$Fantasy
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   1.32   96.24  191.16  191.16  286.09  381.01 

$Horror
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   0.02   17.69   24.05   34.87   38.18  127.00 

$Romance
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   0.03   18.51   39.05   61.40   70.26  260.80 

$Thriller
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   0.02   31.18   40.49   41.44   62.50   79.25 
```

- Which movies genre has the highest median domestic gross?
- Why are there no summary stats for the adventure genre? 

<details>
<summary><red>Click for answer</red></summary>
*Answer:* To help answer these questions you really should explore the number of movies in each genrewith the table command.

- The fantasy genre has the highest median domestic gross ($\$381$ million). But note that only two movies have this classification in 2011. The action genre was second highest at $\$352$ million and there were 12 movies in this category.

- The adventure genre only has one movie (Hugo) and this movie is also missing a value for `DomesticGross`!


```r
table(movies$Genre)
```

```

   Action Adventure Animation    Comedy     Drama   Fantasy 
       32         1        12        27        21         2 
   Horror   Romance  Thriller 
       17        11        13 
```


```r
which(movies$Genre == "Adventure")
```

```
[1] 134
```


```r
movies[134, ]
```

```
    Movie LeadStudio RottenTomatoes AudienceScore Story
134  Hugo  Paramount             93            84      
        Genre TheatersOpenWeek BOAverageOpenWeek
134 Adventure             1277              8899
    DomesticGross ForeignGross WorldGross Budget
134            NA           NA         NA     NA
    Profitability OpeningWeekend
134            NA          11.36
```
</details>
<br>

(k).	Extra: Histogram of `DomesticGross` by `Genre`

(Not in Lab Manual) The `ggplot2` package allows you to create histograms separated by a categorical variable using the `facet_wrap` command. Assuming that `ggplot2` is already installed, all you need to do is load it with `library` then create your graph: 


```r
library(ggplot2)
ggplot(movies, aes(x=DomesticGross)) + 
  geom_histogram() + 
  facet_wrap(~Genre)
```

<img src="Class_Activity_5_files/figure-epub3/unnamed-chunk-15-1.png" width="100%" />

Which genre has the most variability in domestic gross?

<details>
<summary><red>Click for answer</red></summary>
*Answer:* The action genre has the largest range of values.
</details>
<br>

---------------------------------------------------

## Your turn 2

### Example 2: Sleep

This histogram shows the distribution of hours or sleep per night for a large sample of students. 


```r
sleep <- read.csv("https://raw.githubusercontent.com/deepbas/statdatasets/main/SleepStudy.csv")
hist(sleep$AverageSleep, main="Distribution of Sleep Hours")
```

<img src="Class_Activity_5_files/figure-epub3/unnamed-chunk-16-1.png" width="100%" />

 (a).  Estimate the average hours of sleep per night.

<details>
<summary><red>Click for answer</red></summary>
*Answer:* The mean is around 8 hours
</details>
<br>

 (b).	Use the 95% rule to estimate the standard deviation for this data.

<details>
<summary><red>Click for answer</red></summary>
*Answer:* Most of the data is between about 6 and 10, with a mean around 8 (due to the roughly symmetric distribution). So two standard deviations is about 2 hours of sleep, making one standard deviation about 1 hours of sleep.

Let's check the rule. Here are the actual mean and SD:


```r
mean(sleep$AverageSleep)
```

```
[1] 7.965929
```



```r
sd(sleep$AverageSleep)
```

```
[1] 0.9648396
```
</details>
<br>

## Example 3: Z-scores for Test Scores

The ACT test has a population mean of 21 and standard deviation of 5.  The SAT has a population mean of 1500 and a standard deviation of 325.  You earned 28 on the ACT and 2100 on the SAT. 

 (a).  Which test did you do better on? 

<details>
<summary><red>Click for answer</red></summary>
*Answer:*

- ACT: The z-score for the score of 28 is $z = (28 - 21)/5 = 1.4.$
- SAT: The z-score for the score of 2100 is $z = (2100 - 1500)/325 = 1.85.$
- The SAT score is 1.85 standard deviations above average while the ACT score is only 1.4 standard deviations above. You did better on the SAT.
</details>
<br>

 (b).	For each test, find the interval that is likely to contain about 95% of all test scores. 

<details>
<summary><red>Click for answer</red></summary>
*Answer:*

- ACT: Two standard deviations is $2(5) = 10.$ About 95% of ACT scores are between $28 - 10 = 13$ and $28 + 10 = 38.$ This claim assumes that ACT scores follow a bell-shaped distribution.

- SAT: Two standard deviations is $2(325) = 650.$ About 95% of SAT scores are between $1500 - 650 = 850$ and $1500 + 650 = 2150$. This claim assumes that SAT scores follow a bell-shaped distribution.
</details>
<br>

------------------------------------

## Example 4: 5 number summaries

For each five number summary below, indicate whether the data appear to be symmetric, skewed to the right, or skewed to the left.

 (a).  (2, 10, 15, 20, 69)


```r
my_vector1 <- c(1, 10, 15, 20, 69)
summary(my_vector1)
```

```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
      1      10      15      23      20      69 
```

<details>
<summary><red>Click for answer</red></summary>
*Answer:* Skewed right. It has a longer right tail than left since $max - Q3 >> Q1 - min$
</details>
<br>

 (b).	(10, 57, 85, 88, 93)


```r
my_vector2 <- c(10, 57, 85, 88, 93)
summary(my_vector2)
```

```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   10.0    57.0    85.0    66.6    88.0    93.0 
```

<details>
<summary><red>Click for answer</red></summary>
*Answer:* Skewed left since mean is less than median.
</details>
<br>

 (c).	(200, 300, 400, 500, 600)



```r
my_vector3 <- c(200, 300, 400, 500, 600)
summary(my_vector3)
```

```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    200     300     400     400     500     600 
```

<details>
<summary><red>Click for answer</red></summary>
*Answer:* Symmetric since mean is same as median.
</details>
<br>

## Example 5:  Hot dog

This boxplot shows the number of hot dogs eaten by the winners of Nathan's Famous hot dog eating contests from 2002-2011. 


```r
hotdogs <- read.csv("https://raw.githubusercontent.com/deepbas/statdatasets/main/HotDogs.csv")
boxplot(hotdogs$HotDogs, xlab="Number of Hot Dogs Consumed", horizontal=T)
```

<img src="Class_Activity_5_files/figure-epub3/unnamed-chunk-22-1.png" width="100%" />

 (a).  Use the boxplot to estimate the 5 number summary and IQR for this data. 


```r
boxplot(hotdogs$HotDogs, xlab="Number of Hot Dogs Consumed", horizontal=T)
```

<img src="Class_Activity_5_files/figure-epub3/unnamed-chunk-23-1.png" width="100%" />

<details>
<summary><red>Click for answer</red></summary>
*Answer:* min = 45, Q1 = 50, m = 54, Q3 = 62, max = 67. IQR is about 62-50 or 12 hotdogs
</details>
<br>

 (b). Computing 5 number summaries

R doesn't have '5 number summary' command, but `summary` gives you a "6" number summary by adding the mean to the 5 number summary. You can also use `IQR` to get the IQR:


```r
summary(hotdogs$HotDogs)
```

```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  45.00   54.00   60.00   58.64   65.00   69.00 
```

```r
IQR(hotdogs$HotDogs)
```

```
[1] 11
```

How close were your guesses from the boxplot to the values given by this command?

<details>
<summary><red>Click for answer</red></summary>
(Answers will vary) Within one hotdog of the R values.
</details>
<br>


 (c).	Use the boxplot outlier rule to verify that there are no outliers in this data.

<details>
<summary><red>Click for answer</red></summary>
*Answer:* 

- $1.5IQR = 18$ hotdogs.
- Lower fence: $Q1 - 1.5 IQR = 50 - 18 = 32 < min$ so there are no low outliers.
- Upper fence: $Q3 + 1.5 IQR = 62 + 18 = 80 > max$ so there are no high outliers.
</details>
<br>

## Examples 6: Hollywood Movies World Gross revisited

Let's revist the `WorldGross` analysis from the Hollywood movies data set:


```r
movies <- read.csv("https://raw.githubusercontent.com/deepbas/statdatasets/main/HollywoodMovies2011.csv")
```

 (a). Draw a boxplot of `WorldGross`. 


```r
boxplot(movies$WorldGross)
```

<img src="Class_Activity_5_files/figure-epub3/unnamed-chunk-26-1.png" width="100%" />

How many movies are identified as outliers for world gross? 

<details>
<summary><red>Click for answer</red></summary>
*Answer:* Just using the boxplot, there looks to be about 10 movies that are high outliers
</details>
<br>

 (b). Calculating boxplot values

Use the boxplot outlier rule to find the "fence" (cutoff) between an outlier and non-outlier for `WorldGross`. Then determine the value (of `WorldGross`) that the upper "whisker" (non-outlier) extends to. 


```r
summary(movies$WorldGross)
```

```
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
   0.025   30.706   76.659  150.742  173.691 1328.111 
    NA's 
       2 
```

```r
IQR(movies$WorldGross, na.rm = TRUE)
```

```
[1] 142.985
```


<details>
<summary><red>Click for answer</red></summary>
- $1.5IQR = 1.5(142.985) = 214.48$ hundred million dollars

- Lower fence: $Q1 - 1.5IQR = 30.710 - 214.48 = -183.8 < min$ so there are no low outliers.

- Upper fence: $Q3 + 1.5IQR = 173.7 + 214.48 = 388.18 < max$ so there are high outliers.

- The upper whisker extends to the largest movie value that is below the fence of 388.18. You could look at the data spreadsheet and find which movie comes closest to this fence, but a quicker way is to use R. First we can use which to find out the row numbers of the movies with less than 388.18 in WorldGross. Then use this set to find out the max of the WorldGross within this group of movies, which turns out to be 368.404 hundred million dollars.


```r
1.5*IQR(movies$WorldGross, na.rm = TRUE)
[1] 214.4775
30.710 - 214.48
[1] -183.77
173.7 + 214.48
[1] 388.18
```



```r
notoutliers <- which(movies$WorldGross < 388.18)
max(movies$WorldGross[notoutliers])
[1] 368.404
which(movies$WorldGross == 368.404)
[1] 49
movies[49,]
                                Movie LeadStudio
49 Captain America: The First Avenger     Disney
   RottenTomatoes AudienceScore         Story  Genre
49             78            75 Metamorphosis Action
   TheatersOpenWeek BOAverageOpenWeek DomesticGross
49             3715             17512        176.65
   ForeignGross WorldGross Budget Profitability
49       191.75    368.404    140      2.631457
   OpeningWeekend
49          65.06
```
</details>
<br>

 (c). Side-by-side boxplot

We can compare boxplots of `WorldGross` across `Genre` categories:


```r
boxplot(WorldGross ~ Genre, data=movies)
```

<img src="Class_Activity_5_files/figure-epub3/unnamed-chunk-30-1.png" width="100%" />

- What does this type of graph illustrate well about the relationship between `WorldGross` and `Genre`?

<details>
<summary><red>Click for answer</red></summary>
*Answer:* Does a good job comparing median values and extremes
</details>

- What does this type of graph not illustrate well about the relationship between `WorldGross` and `Genre`?

<details>
<summary><red>Click for answer</red></summary>
*Answer:* It doesn't illustrate sample sizes well, e.g. the fantacy genre only has 2 movies in it
</details>

- What is one issue with the default version of this graph?

<details>
<summary><red>Click for answer</red></summary>
*Answer:*  The genre labels are not all present.
</details>
<br>

 (d). Improving the default boxplot

There are many values in `Genre` for this data and their values (levels) have longer names. This can cause issues when using these names to label graphs, like the x-axis in your boxplot. The are many (many, many) ways to modify graphs in R. Here is one way to change the label orientation on your x-axis. 


```r
boxplot(WorldGross ~ Genre, data=movies, las=2)
```

<img src="Class_Activity_5_files/figure-epub3/unnamed-chunk-31-1.png" width="100%" />

The `las` arguments let's you change the orientation of the axis labels relative to the axis. The value of 2 makes the labels perpendicular to the axis.

<br>


## Example 8:  Ants on a Sandwich

The number of ants climbing on a piece of a peanut butter sandwich left on the ground near an anthill for a few minutes was measured 7 different times and the results are:
                        $43, 59, 22, 25, 36, 47,  19$
	
 (a).	Calculate the mean number of ants.  

<details>
<summary><red>Click for answer</red></summary>
*Answer:* $\bar{x} = 35.857$
</details>
<br>

 (b).	Calculate the median number of ants.

<details>
<summary><red>Click for answer</red></summary>
*Answer:* Order data then find middle value: $19, 22, 25, 36, 43, 47, 59$. Then $m = 36$
</details>
<br>

 (c).	Calculate the quartiles for the number of ants.

<details>
<summary><red>Click for answer</red></summary>
*Answer:* Since $m = 36$, the first quartile will be the median of $19, 22, 25: Q1 = 22.$ The third quartile will be the median of $43, 47, 59: Q3 = 47.$
</details>
