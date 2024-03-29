# Table Formatting

In this worksheet, we will explore various options for outputting and formatting tables in R using the RMarkdown environment.

### Basic Table Formatting with `kable`

The `kable()` function from the knitr package provides a simple way to output tables in RMarkdown.


```r
library(knitr)
kable(mtcars[1:5, 1:5], caption = "A basic table using kable")
```



Table: (\#tab:unnamed-chunk-1)A basic table using kable

|                  |  mpg| cyl| disp|  hp| drat|
|:-----------------|----:|---:|----:|---:|----:|
|Mazda RX4         | 21.0|   6|  160| 110| 3.90|
|Mazda RX4 Wag     | 21.0|   6|  160| 110| 3.90|
|Datsun 710        | 22.8|   4|  108|  93| 3.85|
|Hornet 4 Drive    | 21.4|   6|  258| 110| 3.08|
|Hornet Sportabout | 18.7|   8|  360| 175| 3.15|

We will also use the `Gapminder` dataset for our examples. This dataset contains information about life expectancy, GDP per capita, and population size for various countries and years.Here's an example of how to display the first 10 rows of the `Gapminder` dataset.


```r
data("gapminder", package = "gapminder")
knitr::kable(head(gapminder, 10), caption = "Table 1: First 10 rows of the Gapminder dataset.")
```



Table: (\#tab:unnamed-chunk-2)Table 1: First 10 rows of the Gapminder dataset.

|country     |continent | year| lifeExp|      pop| gdpPercap|
|:-----------|:---------|----:|-------:|--------:|---------:|
|Afghanistan |Asia      | 1952|  28.801|  8425333|  779.4453|
|Afghanistan |Asia      | 1957|  30.332|  9240934|  820.8530|
|Afghanistan |Asia      | 1962|  31.997| 10267083|  853.1007|
|Afghanistan |Asia      | 1967|  34.020| 11537966|  836.1971|
|Afghanistan |Asia      | 1972|  36.088| 13079460|  739.9811|
|Afghanistan |Asia      | 1977|  38.438| 14880372|  786.1134|
|Afghanistan |Asia      | 1982|  39.854| 12881816|  978.0114|
|Afghanistan |Asia      | 1987|  40.822| 13867957|  852.3959|
|Afghanistan |Asia      | 1992|  41.674| 16317921|  649.3414|
|Afghanistan |Asia      | 1997|  41.763| 22227415|  635.3414|

### Formatting Tables with `kableExtra`

To further customize the table appearance, we can use the `kableExtra` package.


```r
#install.packages("kableExtra") 
library(kableExtra)
kable(mtcars[1:5, 1:5], caption = "A formatted table with kableExtra") %>%
  kable_styling("striped", full_width = F)
```

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:unnamed-chunk-3)A formatted table with kableExtra</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> mpg </th>
   <th style="text-align:right;"> cyl </th>
   <th style="text-align:right;"> disp </th>
   <th style="text-align:right;"> hp </th>
   <th style="text-align:right;"> drat </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Mazda RX4 </td>
   <td style="text-align:right;"> 21.0 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 160 </td>
   <td style="text-align:right;"> 110 </td>
   <td style="text-align:right;"> 3.90 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mazda RX4 Wag </td>
   <td style="text-align:right;"> 21.0 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 160 </td>
   <td style="text-align:right;"> 110 </td>
   <td style="text-align:right;"> 3.90 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Datsun 710 </td>
   <td style="text-align:right;"> 22.8 </td>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 108 </td>
   <td style="text-align:right;"> 93 </td>
   <td style="text-align:right;"> 3.85 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Hornet 4 Drive </td>
   <td style="text-align:right;"> 21.4 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 258 </td>
   <td style="text-align:right;"> 110 </td>
   <td style="text-align:right;"> 3.08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Hornet Sportabout </td>
   <td style="text-align:right;"> 18.7 </td>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 360 </td>
   <td style="text-align:right;"> 175 </td>
   <td style="text-align:right;"> 3.15 </td>
  </tr>
</tbody>
</table>


### Customizing column formats

Use the `column_spec()` function from the `kableExtra` package to customize the appearance of individual columns.


```r
gapminder %>%
  head(10) %>%
  knitr::kable(caption = "Table 3: First 10 rows of the Gapminder dataset with custom column formatting.") %>%
  kableExtra::kable_styling("striped", full_width = F) %>%
  kableExtra::column_spec(2, bold = TRUE, color = "red") %>%
  kableExtra::column_spec(4, monospace = TRUE)
```

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:unnamed-chunk-4)Table 3: First 10 rows of the Gapminder dataset with custom column formatting.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> country </th>
   <th style="text-align:left;"> continent </th>
   <th style="text-align:right;"> year </th>
   <th style="text-align:right;"> lifeExp </th>
   <th style="text-align:right;"> pop </th>
   <th style="text-align:right;"> gdpPercap </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Afghanistan </td>
   <td style="text-align:left;font-weight: bold;color: red !important;"> Asia </td>
   <td style="text-align:right;"> 1952 </td>
   <td style="text-align:right;font-family: monospace;"> 28.801 </td>
   <td style="text-align:right;"> 8425333 </td>
   <td style="text-align:right;"> 779.4453 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Afghanistan </td>
   <td style="text-align:left;font-weight: bold;color: red !important;"> Asia </td>
   <td style="text-align:right;"> 1957 </td>
   <td style="text-align:right;font-family: monospace;"> 30.332 </td>
   <td style="text-align:right;"> 9240934 </td>
   <td style="text-align:right;"> 820.8530 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Afghanistan </td>
   <td style="text-align:left;font-weight: bold;color: red !important;"> Asia </td>
   <td style="text-align:right;"> 1962 </td>
   <td style="text-align:right;font-family: monospace;"> 31.997 </td>
   <td style="text-align:right;"> 10267083 </td>
   <td style="text-align:right;"> 853.1007 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Afghanistan </td>
   <td style="text-align:left;font-weight: bold;color: red !important;"> Asia </td>
   <td style="text-align:right;"> 1967 </td>
   <td style="text-align:right;font-family: monospace;"> 34.020 </td>
   <td style="text-align:right;"> 11537966 </td>
   <td style="text-align:right;"> 836.1971 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Afghanistan </td>
   <td style="text-align:left;font-weight: bold;color: red !important;"> Asia </td>
   <td style="text-align:right;"> 1972 </td>
   <td style="text-align:right;font-family: monospace;"> 36.088 </td>
   <td style="text-align:right;"> 13079460 </td>
   <td style="text-align:right;"> 739.9811 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Afghanistan </td>
   <td style="text-align:left;font-weight: bold;color: red !important;"> Asia </td>
   <td style="text-align:right;"> 1977 </td>
   <td style="text-align:right;font-family: monospace;"> 38.438 </td>
   <td style="text-align:right;"> 14880372 </td>
   <td style="text-align:right;"> 786.1134 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Afghanistan </td>
   <td style="text-align:left;font-weight: bold;color: red !important;"> Asia </td>
   <td style="text-align:right;"> 1982 </td>
   <td style="text-align:right;font-family: monospace;"> 39.854 </td>
   <td style="text-align:right;"> 12881816 </td>
   <td style="text-align:right;"> 978.0114 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Afghanistan </td>
   <td style="text-align:left;font-weight: bold;color: red !important;"> Asia </td>
   <td style="text-align:right;"> 1987 </td>
   <td style="text-align:right;font-family: monospace;"> 40.822 </td>
   <td style="text-align:right;"> 13867957 </td>
   <td style="text-align:right;"> 852.3959 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Afghanistan </td>
   <td style="text-align:left;font-weight: bold;color: red !important;"> Asia </td>
   <td style="text-align:right;"> 1992 </td>
   <td style="text-align:right;font-family: monospace;"> 41.674 </td>
   <td style="text-align:right;"> 16317921 </td>
   <td style="text-align:right;"> 649.3414 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Afghanistan </td>
   <td style="text-align:left;font-weight: bold;color: red !important;"> Asia </td>
   <td style="text-align:right;"> 1997 </td>
   <td style="text-align:right;font-family: monospace;"> 41.763 </td>
   <td style="text-align:right;"> 22227415 </td>
   <td style="text-align:right;"> 635.3414 </td>
  </tr>
</tbody>
</table>


### Formatting Tables with flextable

Another option for table formatting is the flextable package.


```r
#install.packages("flextable")
library(flextable)
ft <- flextable(mtcars[1:5, 1:5])
ft <- set_caption(ft, caption = "A table using flextable")
ft
```

```{=html}
<div class="tabwid"><style>.cl-5e2090f8{}.cl-5e158d52{font-family:'DejaVu Sans';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-5e1a24f2{margin:0;text-align:right;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-5e1a4356{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 1.5pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-5e1a4360{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-5e1a436a{width:0.75in;background-color:transparent;vertical-align: middle;border-bottom: 1.5pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table data-quarto-disable-processing='true' class='cl-5e2090f8'>

```

<caption style="display:table-caption;margin:0pt;text-align:center;border-bottom: 0.00pt solid transparent;border-top: 0.00pt solid transparent;border-left: 0.00pt solid transparent;border-right: 0.00pt solid transparent;padding-top:3pt;padding-bottom:3pt;padding-left:3pt;padding-right:3pt;line-height: 1;background-color:transparent;">(\#tab:unnamed-chunk-5)<span>A table using flextable</span></caption>

```{=html}

<thead><tr style="overflow-wrap:break-word;"><th class="cl-5e1a4356"><p class="cl-5e1a24f2"><span class="cl-5e158d52">mpg</span></p></th><th class="cl-5e1a4356"><p class="cl-5e1a24f2"><span class="cl-5e158d52">cyl</span></p></th><th class="cl-5e1a4356"><p class="cl-5e1a24f2"><span class="cl-5e158d52">disp</span></p></th><th class="cl-5e1a4356"><p class="cl-5e1a24f2"><span class="cl-5e158d52">hp</span></p></th><th class="cl-5e1a4356"><p class="cl-5e1a24f2"><span class="cl-5e158d52">drat</span></p></th></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-5e1a4360"><p class="cl-5e1a24f2"><span class="cl-5e158d52">21.0</span></p></td><td class="cl-5e1a4360"><p class="cl-5e1a24f2"><span class="cl-5e158d52">6</span></p></td><td class="cl-5e1a4360"><p class="cl-5e1a24f2"><span class="cl-5e158d52">160</span></p></td><td class="cl-5e1a4360"><p class="cl-5e1a24f2"><span class="cl-5e158d52">110</span></p></td><td class="cl-5e1a4360"><p class="cl-5e1a24f2"><span class="cl-5e158d52">3.90</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-5e1a4360"><p class="cl-5e1a24f2"><span class="cl-5e158d52">21.0</span></p></td><td class="cl-5e1a4360"><p class="cl-5e1a24f2"><span class="cl-5e158d52">6</span></p></td><td class="cl-5e1a4360"><p class="cl-5e1a24f2"><span class="cl-5e158d52">160</span></p></td><td class="cl-5e1a4360"><p class="cl-5e1a24f2"><span class="cl-5e158d52">110</span></p></td><td class="cl-5e1a4360"><p class="cl-5e1a24f2"><span class="cl-5e158d52">3.90</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-5e1a4360"><p class="cl-5e1a24f2"><span class="cl-5e158d52">22.8</span></p></td><td class="cl-5e1a4360"><p class="cl-5e1a24f2"><span class="cl-5e158d52">4</span></p></td><td class="cl-5e1a4360"><p class="cl-5e1a24f2"><span class="cl-5e158d52">108</span></p></td><td class="cl-5e1a4360"><p class="cl-5e1a24f2"><span class="cl-5e158d52">93</span></p></td><td class="cl-5e1a4360"><p class="cl-5e1a24f2"><span class="cl-5e158d52">3.85</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-5e1a4360"><p class="cl-5e1a24f2"><span class="cl-5e158d52">21.4</span></p></td><td class="cl-5e1a4360"><p class="cl-5e1a24f2"><span class="cl-5e158d52">6</span></p></td><td class="cl-5e1a4360"><p class="cl-5e1a24f2"><span class="cl-5e158d52">258</span></p></td><td class="cl-5e1a4360"><p class="cl-5e1a24f2"><span class="cl-5e158d52">110</span></p></td><td class="cl-5e1a4360"><p class="cl-5e1a24f2"><span class="cl-5e158d52">3.08</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-5e1a436a"><p class="cl-5e1a24f2"><span class="cl-5e158d52">18.7</span></p></td><td class="cl-5e1a436a"><p class="cl-5e1a24f2"><span class="cl-5e158d52">8</span></p></td><td class="cl-5e1a436a"><p class="cl-5e1a24f2"><span class="cl-5e158d52">360</span></p></td><td class="cl-5e1a436a"><p class="cl-5e1a24f2"><span class="cl-5e158d52">175</span></p></td><td class="cl-5e1a436a"><p class="cl-5e1a24f2"><span class="cl-5e158d52">3.15</span></p></td></tr></tbody></table></div>
```


### Formatting Tables with gt

The gt package provides another way to create formatted tables in R.













