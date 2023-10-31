---
output:
  pdf_document: default
  html_document: default
---

# Short Report 2


## Due Date

**Proposal Due**: Before 5 pm, Tuesday, 10/31/2023

**Final Report Deadline**: Before 5 pm on Wednesday, 11/08/2023.

## Introduction

This lab report is an individual assignment. While discussions about the data and R code with classmates are allowed, forming questions and answering them about the data should be done independently. Please follow the [Report Guidelines](https://stat120-fall23.netlify.app/report-guidelines) available on the course helper webpage before starting the report.

## Data Retrieval


```r
cocoa <- read.csv("https://raw.githubusercontent.com/deepbas/stat120datasets/main/cocoa.csv")
dplyr::glimpse(cocoa)  # glimpse of the data
```

```
Rows: 2,443
Columns: 7
$ X                      <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, …
$ company_location       <chr> "U.S.A.", "U.S.A.", "U.S.A.…
$ review_date            <int> 2019, 2019, 2019, 2021, 202…
$ country_of_bean_origin <chr> "Tanzania", "Dominican Repu…
$ cocoa_percent          <dbl> 76, 76, 76, 68, 72, 80, 68,…
$ no_ingredients         <int> 3, 3, 3, 3, 3, 3, 3, 4, 4, …
$ rating                 <dbl> 3.25, 3.50, 3.75, 3.00, 3.0…
```


### Description of the data 

Are you intrigued by the analysis of 2,443 chocolate bars primarily focusing on dark chocolate? Our data set offers insights ranging from the years 2019 to 2021. Each rating in this dataset reflects the experience of tasting a specific batch of a chocolate bar. The original data is from [Kaggle (click here!)](https://www.kaggle.com/datasets/rtatman/chocolate-bar-ratings). Let's delve into the variables and what each represents:


| **Column Name**                          | **Description**                                                                                     |
|----------------------------------------------------------|---------------------------------------------------------------------------|
| `company_location`                       | Location of the bar manufacturer                                                                     |
| `review_date`                            | From 2019 to 2021                                                                                    |
| `country_of_bean_origin`                 | Country where the cacao beans originated                                                             |
| `cocoa_percent`                          | Percentage of cocoa in the bar                                                                       |
| `no_ingredients`                         | Number of different ingredients in the bar                                                           |
| `rating`                                 | 1.0-1.9 Unpleasant, 2.0-2.9 Disappointing, 3.0-3.49 Recommended, 3.5-3.9 Highly Recommended, 4.0-5.0 Outstanding |



### Required Inference

Formulate a single research question and address it by conducting one hypothesis test. Utilize both randomization methods, specifically the `permTest()` function and its variants in `CarletonStats` R package, or `StatKey`, and the theoretical models discussed in class (such as ANOVA, z-tests, t-tests, Chi-square tests, or slope t-tests.) to investigate your question. For each of these two approaches—randomization and theoretical—include at least one corresponding confidence interval. Should the test indicate a statistically significant difference between groups, the confidence interval should quantify the magnitude of this difference within the population. If no significant difference is detected, the confidence interval should provide an estimate for the overall population parameter, without differentiating by group.

### General Expectations

In your analysis, place equal importance on Exploratory Data Analysis (EDA) and p-values. Begin by incorporating basic descriptive graphs and statistics that underpin the data used in all your tests. These should align with and support your inference outcomes. If your results indicate statistical significance, further illustrate the relationship between the variables using EDA. Use specific summary statistics and/or confidence intervals to quantify any observed associations. Always assess the assumptions underlying your chosen inference methods. Be vigilant for outliers, particularly in quantitative variables. Should you encounter an extreme response or obvious error, remove it from your dataset and re-run your test and confidence interval. If the outlier is genuine, compare the results with and without it to gauge its influence on your conclusions.


## Submission Details

Submit your report as a single PDF file to Gradescope. Ensure that your `R-code` is included only in the appendix and not in the main body of your report. While including plots and numerical summaries in the main content is acceptable, the R code that generates them should be hidden.

### To hide the R code in your report:

- Use the chunk option `echo = FALSE` to prevent the code from displaying but still execute it. This is ideal for hiding the code but showing the output (e.g., plots or summaries).


- Alternatively, you can use `include = FALSE` to both hide the code and prevent its output from being shown in the document. This is useful if you want to execute some preparatory code without showing any results in the report.

In RStudio's R Markdown, insert a new R chunk with `Ctrl + Alt + I` or `Cmd + Option + I`. Choose the appropriate chunk option based on your specific needs for each section of your report.   For example, to hide code but execute it, use the chunk header `{r echo=FALSE}`.


## Report Structure

In statistics, experts often share their work through articles in magazines (called journals) or books. The main type of article is called a 'primary paper'. It's like a story of what the researcher did, how they did it, and what they found out. Since working with data (or 'data analysis') is a big part of statistics, it's important for students, even in beginner classes, to learn how to write in this style. 

### Abstract

This short section (about 5% of your paper's length) should quickly summarize your work. It should cover the reason for your analysis, the main question you're addressing, the statistical methods you used, your findings, and what you believe these findings mean. Essentially, by reading just the abstract, someone should grasp the essence of your entire paper.


### Introduction

Start by setting the scene for your analysis: provide some background and mention previous related studies, if available. Clearly state the main focus or objective of your data analysis. Explain why this focus is important or interesting. Briefly outline the methods or approaches you took, highlighting if you conducted an experimental or observational study.

### Methods

Detail the techniques you used both to gather and analyze your data. The description should be clear enough that someone else could replicate your analysis. Specify how the data was collected, the statistical tests performed, and any relevant setups. While you can reference the manual for in-depth statistical test details, avoid including complex mathematical formulas. Write in the past tense, describing the entire analysis approach as though you conducted it independently. The aim is to provide a concise overview of your analysis method, not a step-by-step breakdown.

### Results

This section should present the main findings from your data analysis. Describe the key patterns, trends, and notable differences you observed. While visuals like charts and graphs will illustrate your results, it's essential to explain them verbally too. State the primary data trends and support them with statistical outcomes in brackets. Direct the reader to any relevant figures or tables. Remember, this section is for presenting findings only; interpretations and broader implications should be reserved for the following Discussion section.

### Discussion and Conclusion

Start by recapping your main findings and linking them to your initial questions and hypotheses. Examine your results in the context of existing knowledge and research. Delve into broader implications, and consider how your results fit into a larger landscape. Address potential issues in your analysis like violation of assumptions, outliers, bias, and other errors that could impact the validity of your conclusions. Reflect on any ethical constraints tied to your study and their potential influence.


\newpage

## Grading Rubric

**Introduction**

| Topic             | Excellent: 10 | Satisfactory: 7 | Needs work: 5 |
|-------------------|---------------|-----------------|---------------|
| Data introduction | Clearly and concisely describes the data set, and why it is of interest. Clearly establishes the story (i.e. set of questions) that will be introduced. | Introduction and story outlined, but could be clearer or more engaging. | Context and motivation is lacking; story unclear. |
| Background & Relevance | Comprehensive context and background provided with clear relevance to the topic. | Adequate context given, some relevance noted but could be enhanced. | Limited or no context and relevance provided. |

**Methods**

| Topic             | Excellent: 10 | Satisfactory: 7 | Needs work: 5 |
|-------------------|---------------|-----------------|---------------|
| Clarity | Methods are detailed, replicable, and transparently described. | Methods are described but may lack some clarity or detail. | Methods are unclear or insufficiently described. |
| Statistical Approach | Appropriate statistical tests and approaches are clearly outlined and justified. | Mostly appropriate methods used with some justification. | Choice of methods is unclear or inappropriate. |

**Results**

| Topic             | Excellent: 10 | Satisfactory: 7 | Needs work: 5 |
|-------------------|---------------|-----------------|---------------|
| Clarity & Depth | Results are clearly explained in an engaging way. The questions posed are clearly answered. Potential limitations are outlined. | Results are explained and the questions posed are answered. | Results are not completely explained and/or questions are left unanswered. |
| Use of Figures & Tables | Effective and clear use of figures and tables to represent results. | Adequate use of figures and tables but may lack some clarity. | Insufficient or confusing use of figures and tables. |

**Discussion and Conclusion**

| Topic             | Excellent: 10 | Satisfactory: 7 | Needs work: 5 |
|-------------------|---------------|-----------------|---------------|
| Logic | Discussion and conclusion are based on sound evidence from statistical analyses and make adequate use of statistical jargon. | There are a few jumps in logic but the conclusion is mostly correct and uses sufficient statistical jargon. | The conclusion deviates from the main discussion, and the problem statements are not addressed with minimal use of statistical jargon. |
| Broader Implications | Draws insightful implications from the results, considering a wider context. | Draws some implications but lacks depth or breadth. | Limited or no discussion of broader implications. |



**Organization**

| Topic                             | Excellent: 10 | Satisfactory: 7 | Needs work: 5 |
|-----------------------------------|---------------|-----------------|---------------|
| Content Readability               | Good sequence of analyses and transitions consisting of effective organization.  Introduction and conclusion are clear and somewhat related to the whole. | Sequence and transitions are fairly clear but the overall structure could be improved. Introduction and conclusion are fairly clear but lacks some coherence. | unclear or haphazard organization  |
| R-code Organization (in **Appendix!**) | R-code is properly presented in order of implementation and commented sparsely | R-code is presented to get the job done but could be better formatted or organized| lacks important R-codes or R-code completely missing|

