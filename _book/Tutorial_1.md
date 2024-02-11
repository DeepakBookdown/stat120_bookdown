# (PART\*) R Tutorials {-}

# Tutorial 1: Embark on Your Data Journey 


## Introduction

This tutorial introduces basic arithmetic operations, data types, and data manipulation functions in R.

---

## [Basic Arithmetic in R](#basic-arithmetic-in-r)
Arithmetic operations in R are straightforward, and the results are immediately displayed in the console.


```r
2 + 3  # Addition
```

```
[1] 5
```

```r
5 - 2  # Subtraction
```

```
[1] 3
```

```r
2 * 3  # Multiplication
```

```
[1] 6
```

```r
6 / 2  # Division
```

```
[1] 3
```


However, to make these results accessible and manipulable for future use, you can store them in variables.


```r
# Performing operations and storing results in variables
addition_result <- 2 + 3  # Addition
subtraction_result <- 5 - 2  # Subtraction
multiplication_result <- 2 * 3  # Multiplication
division_result <- 6 / 2  # Division
```


Now you can use these variables later in your code


```r
addition_result
```

```
[1] 5
```


## Data Types: Vector and DataFrame

### Vector

A vector is a 1D array in R. You can create a vector using the `c()` function.


```r
x <- c(1, 2, 3)
x
```

```
[1] 1 2 3
```

#### Using Sequencing

You can also create a vector by using sequences. For example, the following code will create a vector containing numbers from 1 to 10.



```r
y <- 1:10
y
```

```
 [1]  1  2  3  4  5  6  7  8  9 10
```


### DataFrame

A DataFrame is a 2D table in R. You can create a DataFrame using the `data.frame()` function.


```r
df <- data.frame(Name = c("Alice", "Bob"), Age = c(25, 30))
df
```

```
   Name Age
1 Alice  25
2   Bob  30
```


### Creating a Simple Dataset

You can create a simple dataset as follows:


```r
dataset <- data.frame(ID = 1:5, Score = c(90, 85, 88, 92, 89))
dataset
```

```
  ID Score
1  1    90
2  2    85
3  3    88
4  4    92
5  5    89
```

### Using `sample()` Function

To generate random combinations from a vector, use the `sample()` function.


```r
sample(x = 1:10, size = 10, replace = FALSE)
```

```
 [1]  7  4  3  1  8  6 10  9  5  2
```

### Using `head()` Function


```r
head(dataset)
```

```
  ID Score
1  1    90
2  2    85
3  3    88
4  4    92
5  5    89
```

## Vector and Data Indexing Using `[]`

### Vector Indexing

You can index a vector using square brackets `[]`.


```r
x[2]  # Access the 2nd element of vector x
```

```
[1] 2
```

### DataFrame Indexing

You can index a DataFrame using square brackets `[]`.


```r
dataset[1,]  # Access the 1st row
```

```
  ID Score
1  1    90
```

```r
dataset[,1]  # Access the 1st column
```

```
[1] 1 2 3 4 5
```

## Reading Data from a URL

To read data from a URL, you can use the `read.csv()` function, or `read_csv()` function from `readr` package.


```r
url <- "https://www.lock5stat.com/datasets2e/EducationLiteracy.csv"
data_from_url <- read.csv(url)
```

### Inspecting the Data

To get the first 6 rows of the data, use the following:


```r
head(data_from_url)
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

To get the dimensions of the data, use the following:


```r
dim(data_from_url)
```

```
[1] 188   3
```

## Conclusion

This tutorial covered basic arithmetic, data types, and data manipulation functions in R.
