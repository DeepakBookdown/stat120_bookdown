# (PART\*) Practice Problems {-}

# Practice Problems 1

## Problem 1

---------------------------------------------------

a. Run the following chunk. Comment on the output.


```r
example_data = data.frame(ID = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
                          Greeting = c(rep("Hello", 5), rep("Goodbye",5)),
                          Male = rep(c(TRUE, FALSE), 5),
                          Weight = runif(n=10, 50, 300))
```


<details>
<summary><red>Click for answer</red></summary>

```r
example_data
```

```
   ID Greeting  Male   Weight
1   1    Hello  TRUE 274.2463
2   2    Hello FALSE 142.2812
3   3    Hello  TRUE 221.5620
4   4    Hello FALSE 228.8303
5   5    Hello  TRUE 270.2057
6   6  Goodbye FALSE 267.0193
7   7  Goodbye  TRUE 164.6848
8   8  Goodbye FALSE 170.3278
9   9  Goodbye  TRUE 109.0457
10 10  Goodbye FALSE 286.0813
```

*Answer:* We see a data frame with four columns, where the first column is an `identifier` for the cases. We have information on the greeting types, whether male or not, and weight on these cases in the remaining columns.
</details>


<br>


b. What is the dimension of the dataset called 'example_data'?

<details>
<summary><red>Click for answer</red></summary>


```r
dim(example_data)
[1] 10  4
nrow(example_data)
[1] 10
ncol(example_data)
[1] 4
```

*Answer:* There are 10 rows and 4 columns.
</details>

<br>

---------------------------------------------------

## Problem 2


a. Read the dataset `EducationLiteracy` from the [Lock5](https://www.lock5stat.com/datapage2e.html) second edition book.

<details>
<summary><red>Click for answer</red></summary>


```r
# read in the data
library(readr)
education_lock5 <- read_csv("https://www.lock5stat.com/datasets2e/EducationLiteracy.csv")
```

</details>

<br>


b. Print the header (i.e. first 6 cases by default) of the dataset in part a.

<details>
<summary><red>Click for answer</red></summary>


```r
head(education_lock5)
```

```
# A tibble: 6 × 3
  Country             EducationExpenditure Literacy
  <chr>                              <dbl>    <dbl>
1 Afghanistan                          3.1     31.7
2 Albania                              3.2     96.8
3 Algeria                              4.3     NA  
4 Andorra                              3.2     NA  
5 Angola                               3.5     70.6
6 Antigua and Barbuda                  2.6     99  
```

</details>

<br>



c. What is the dimension of the dataset in a?


<details>
<summary><red>Click for answer</red></summary>


```r
dim(education_lock5)
```

```
[1] 188   3
```
*Answer:* There are 188 rows and 3 columns.

</details>


<br>


d. What type of variables are `Country`, `EducationExpenditure`, and `Literacy`?

<details>
<summary><red>Click for answer</red></summary>
*Answer:* `Country` is a categorical variable. `EducationExpenditure` and `Literacy` are both quantitative variables.
</details>



<br>



e. If we would like to use education expenditure to predict the literacy rate of each countries, which variable is the explanatory variable and which one is the response?


<details>
<summary><red>Click for answer</red></summary>
*Answer:* The education expenditure is the explanatory variable, and the literacy rate is the response.
</details>


