---
output:
  pdf_document: default
  html_document: default
---

# Short Report 2


**Short Report 1 Deadline**: Before 10 pm on Wednesday, 02/28/2024.

*Proposal Deadline*: Before 11:59 pm on Friday, 02/23/2024.

#### Here's the link to the proposal google form, [https://forms.gle/HGjMgDmjya6QwZhw9](https://forms.gle/HGjMgDmjya6QwZhw9)

## Introduction

This lab report is an individual assignment. While discussions about the data and R code with classmates are allowed, forming questions and answering them about the data should be done independently. Please follow the [Report Guidelines](https://stat120-winter24.netlify.app/report-guidelines) available on the course helper webpage before starting the report.

## Data Retrieval


```r
library(palmerpenguins)
library(ggplot2)
library(dplyr)
penguins <- penguins %>%  tidyr::drop_na() # drop any missing values
```


## Data Description

Ready to dive into the fascinating world of Antarctic penguins? Our dataset, drawn from the `palmerpenguins` package, offers a detailed look at 333 penguins across 8 variables, capturing the diversity of these creatures across different islands. The data encompasses various measurements like bill length, flipper length, and body mass, along with categorical data on species, sex, and the year of observation. This rich dataset serves as an excellent foundation for exploratory data analysis and hypothesis testing. Let's embark on this analytical journey and uncover the hidden stories of these penguins.


| **Column Name**       | **Description**                                                                 |
|-----------------------|---------------------------------------------------------------------------------|
| species               | A categorical variable denoting penguin species (Adélie, Chinstrap, and Gentoo)               |
| island                | A categorical variable denoting island in Palmer Archipelago, Antarctica (Biscoe, Dream, or Torgersen) |
| bill_length_mm        | A quantitative variable denoting bill length (millimeters)                                     |
| bill_depth_mm         | A  quantitative variable denoting bill depth (millimeters)                                      |
| flipper_length_mm     | A  quantitative variable denoting flipper length (millimeters)                                |
| body_mass_g           | A  quantitative variable denoting body mass (grams)                                           |
| sex                   | A categorical variable denoting penguin sex (female, male)                                    |
| year                  | A  quantitative variable denoting the study year (2007, 2008, or 2009)                        |



## Required Analyses:

Formulate three research questions that pave the way for hypothesis testing using statistical tests such as ANOVA, z-tests, t-tests, Chi-square tests, and linear regression parameter significance tests. Accompany these tests with a confidence interval to quantify key parameters, providing insights into the population based on your findings. Whether differences are statistically significant or not, your analysis will illuminate various aspects of the penguin population. For example, if you find two groups have a statistically significant difference then your CI should quantify how different they are in the population. If you don’t find a statistically significant difference, then you should get a CI for your overall population parameter (not separated by groups if you didn’t find a difference).


### Expectations

- Remember, EDA (Exploratory Data Analysis) is as crucial as finding a p-value. Incorporate basic descriptive statistics and graphs to support all your analyses.

- Highlight any statistically significant findings with detailed EDA, using specific statistics and/or confidence intervals to articulate the relationships between variables.

- Examine the assumptions necessary for your chosen inference methods.

- Be vigilant for outliers in your quantitative data during EDA. Decide whether to include or exclude them based on their influence on your analysis.

- In your introduction, go beyond merely stating the source of your data. Delve into the background information provided with the dataset to enrich your report's context.


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

| Aspect                                        | Excellent: 10                                                                  | Satisfactory: 7                                                                 | Needs work: 5                                                          |
|:----------------------------------------------|:-------------------------------------------------------------------------------|:--------------------------------------------------------------------------------|:----------------------------------------------------------------------|
| **Originality & Engagement in Introduction**  | Introduction captivates with original insights and creative angle, setting a compelling stage for the analysis. | Introduction shows some original elements and creativity but lacks a captivating edge. | Introduction is generic, with no original insights or creative elements. |
| ---                                           | ---                                                                            | ---                                                                              | ---                                                                   |
| **Depth & Integration**                       | Provides a deeply engaging and seamless narrative, integrating various elements of the analysis without disruption. | Adequate integration with occasional disruptions, narrative flow could be improved. | Poor integration with frequent disruptions, narrative flow is unclear. |
| ---                                           | ---                                                                            | ---                                                                              | ---                                                                   |
| **Use of Extra Tools**                        | Demonstrates the adept use of advanced tools not discussed in class, showing a high level of initiative and skill. | Employs additional tools with moderate success; application lacks depth or sophistication. | Utilizes only standard class tools or inadequately applies additional tools. |
| ---                                           | ---                                                                            | ---                                                                              | ---                                                                   |
| **Statistical Jargon & Application**          | Employs a rich vocabulary of statistical jargon correctly, enhancing the academic rigor of the analysis. | Adequate use of statistical terms, though sometimes imprecise or sparingly used. | Limited or incorrect use of statistical jargon, detracting from analytical depth. |
| ---                                           | ---                                                                            | ---                                                                              | ---                                                                   |
| **Originality in Presentation**               | Results are presented with a high degree of originality, showcasing creativity in data representation. | Results are presented in a standard format with some attempts at originality or creative display. | Presentation of results is conventional, with no creative or original elements. |
| ---                                           | ---                                                                            | ---                                                                              | ---                                                                   |
| **Integration of R Summaries**                | Numerical and R summaries are integrated smoothly within the text, supporting the narrative without disrupting it. | Numerical and R summaries are present but occasionally disrupt the essay's flow. | Numerical and R summaries are either disruptive to the narrative or missing. |
| ---                                           | ---                                                                            | ---                                                                              | ---                                                                   |
| **Insight & Innovation**                      | Discussion and conclusion draw highly insightful implications, revealing innovation and a thorough understanding of the topic's broader context. | Provides some insights and considers broader implications, but with limited innovation or depth. | Lacks insightful implications or innovative thoughts, with a narrow focus on the topic. |
| ---                                           | ---                                                                            | ---                                                                              | ---                                                                   |
| **Length and Verbosity**                      | The introduction and conclusion are concise yet comprehensive, with a verbosity that enriches rather than dilutes. | Introduction and conclusion contain some unnecessary verbosity, detracting from their clarity. | The introduction and conclusion are either too verbose, obscuring the main points, or too brief, lacking substance. |
| ---                                           | ---                                                                            | ---                                                                              | ---                                                                   |
| **Submission Promptness**                      | Both the proposal and final report are submitted on time or ahead of schedule, demonstrating good time management and commitment. | The proposal or final report is slightly late, indicating room for improvement in time management, but does not necessitate resubmission. | The proposal or final report is late, suggesting significant issues with time management and may require resubmission. |
| ---                                           | ---                                                                            | ---                                                                              | ---                                                                   |
| **R-code Organization (in **Appendix**)**     | R-code is meticulously organized and selectively commented, demonstrating efficiency and clarity. | R-code is organized with functional comments but lacks the precision and clarity of top submissions. | R-code is disorganized or missing critical elements, indicating a need for further refinement. |


