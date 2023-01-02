
# Class Activity 1

- Try to knit the file at the present stage and see if it compiles.
- You can add `\vspace*{1in}` in the body of this file to produce a vertical space of 1 inches.


## Your Turn 1

---------------------------------------------------

a. Run the following chunk. Comment on the output.


```r
example_data = data.frame(ID = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
                          Greeting = c(rep("Hello", 5), rep("Goodbye",5)),
                          Male = rep(c(TRUE, FALSE), 5),
                          age = runif(n=10, 20,60))
```


<details>
<summary><red>Click for answer</red></summary>

```r
example_data
```

```
   ID Greeting  Male      age
1   1    Hello  TRUE 54.66893
2   2    Hello FALSE 58.41033
3   3    Hello  TRUE 31.06788
4   4    Hello FALSE 38.21240
5   5    Hello  TRUE 52.24467
6   6  Goodbye FALSE 38.58542
7   7  Goodbye  TRUE 39.39323
8   8  Goodbye FALSE 26.77841
9   9  Goodbye  TRUE 47.85333
10 10  Goodbye FALSE 42.40331
```

*Answer:* We see a data frame with four columns, where the first column is an `identifier` for the cases. We have information on the greeting types, gender, and age on these cases in the remaining columns.
</details>


\vspace*{1in}

b. What is the dimension of the dataset called 'example_data'?

<details>
<summary><red>Click for answer</red></summary>


```r
dim(example_data)
```

```
[1] 10  4
```

```r
nrow(example_data)
```

```
[1] 10
```

```r
ncol(example_data)
```

```
[1] 4
```

*Answer:* There are 10 rows and 4 columns.
</details>


\vspace*{1in}


---------------------------------------------------

## Your Turn 2


a. Read the dataset `EducationLiteracy` from the [Lock5](https://www.lock5stat.com/datapage2e.html) second edition book.

<details>
<summary><red>Click for answer</red></summary>


```r
# read in the data
education_lock5 <- read.csv("https://www.lock5stat.com/datasets2e/EducationLiteracy.csv")
```

</details>

\vspace*{1in}


b. Print the header (i.e. first 6 cases by default) of the dataset in part a.

<details>
<summary><red>Click for answer</red></summary>


```r
head(education_lock5)
```

```
              Country EducationExpenditure Literacy
1         Afghanistan                  3.1     31.7
2             Albania                  3.2     96.8
3             Algeria                  4.3       NA
4             Andorra                  3.2       NA
5              Angola                  3.5     70.6
6 Antigua and Barbuda                  2.6     99.0
```

</details>

\vspace*{1in}


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


\vspace*{1in}

d. What type of variables are `Country`, `EducationExpenditure`, and `Literacy`?

<details>
<summary><red>Click for answer</red></summary>
*Answer:* `Country` is a categorical variable. `EducationExpenditure` and `Literacy` are both quantitative variables.
</details>



\vspace*{1in}


e. If we would like to use education expenditure to predict the literacy rate of each countries, which variable is the explanatory variable and which one is the response?


<details>
<summary><red>Click for answer</red></summary>
*Answer:* The education expenditure is the explanatory variable, and the literacy rate is the response.
</details>


---------------------------------------------------------------------

