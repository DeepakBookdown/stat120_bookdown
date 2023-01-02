
# Class Activity 1

## Your Turn 1

---------------------------------------------------

a. Run the following chunk. Comment on the output.


```r
example_data = data.frame(ID = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
                          Greeting = c(rep("Hello", 5), rep("Goodbye",5)),
                          Male = rep(c(TRUE, FALSE), 5),
                          Age = runif(n=10, 20, 60))
```


<details>
<summary><red>Click for answer</red></summary>

```r
example_data
```

```
   ID Greeting  Male      Age
1   1    Hello  TRUE 38.42494
2   2    Hello FALSE 20.50073
3   3    Hello  TRUE 59.98065
4   4    Hello FALSE 59.81283
5   5    Hello  TRUE 31.34406
6   6  Goodbye FALSE 26.71798
7   7  Goodbye  TRUE 56.40279
8   8  Goodbye FALSE 32.44080
9   9  Goodbye  TRUE 53.58755
10 10  Goodbye FALSE 39.53342
```

*Answer:* We see a data frame with four columns, where the first column is an `identifier` for the cases. We have information on the greeting types, gender, and age on these cases in the remaining columns.
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

## Your Turn 2


a. Read the dataset `EducationLiteracy` from the [Lock5](https://www.lock5stat.com/datapage2e.html) second edition book.

<details>
<summary><red>Click for answer</red></summary>


```r
# read in the data
education_lock5 <- read.csv("https://www.lock5stat.com/datasets2e/EducationLiteracy.csv")
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
              Country EducationExpenditure Literacy
1         Afghanistan                  3.1     31.7
2             Albania                  3.2     96.8
3             Algeria                  4.3       NA
4             Andorra                  3.2       NA
5              Angola                  3.5     70.6
6 Antigua and Barbuda                  2.6     99.0
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


---------------------------------------------------------------------

