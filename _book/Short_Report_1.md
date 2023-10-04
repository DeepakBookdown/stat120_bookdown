# (PART\*) Short Reports {-}

# Short Report 1


## Due Date

**Proposal Deadline**: Before class on Monday, 10/09/2023.

**Final Report Deadline**: Before Class on Friday, 10/13/2023.

## Introduction

This lab report is an individual assignment. While discussions about the data and R code with classmates are allowed, forming questions and answering them about the data should be done independently. Please follow the [Report Guidelines](https://stat120-fall23.netlify.app/report-guidelines) available on the course helper webpage before starting the report.

## Data Retrieval

Use the dataset `women_labor.csv` for your analysis. You can load the data into your R session using the following code:


```r
women <- read.csv("https://raw.githubusercontent.com/deepbas/stat120datasets/main/women_labor.csv", 
                 sep = ";", header = FALSE, skip = 1)
colnames(women) <- c("No", "Country", "Level.of.development", "European.Union.Membership", "Currency",
                     "Women.Entrepreneurship.Index", "Entrepreneurship.Index", "Inflation.rate",
                     "Female.Labor.Force.Participation.Rate")
```


## Data Description


The dataset named `women` and titled **Women Entrepreneurship and Labor Force**, stored in `women` above serves as a rich compendium, capturing pivotal insights into the landscape of female participation in entrepreneurship across various countries, especially within the OECD. Sourced from the Women Entrepreneurship Index and Global Entrepreneurship Index report of 2015, this comprehensive dataset offers both categorical and quantitative variables.

### Categorical Variables:
- **Country**: Denotes the specific nation to which the data point belongs.
- **Level of Development**: This variable categorizes countries based on their stage of economic growth - whether they are 'Developed' or 'Developing'.
- **European Union Membership**: It indicates whether a country is a member of the European Union or not.
- **Currency**: Specifies the official currency used within the respective country.

### Quantitative Variables:
- **Women Entrepreneurship Index**: This numerical value for the year 2015 mirrors the overall environment that facilitates or impedes women from launching businesses in their country.
- **Entrepreneurship Index**: A numerical metric for the year 2015, reflecting the overall entrepreneurship ecosystem of a country.
- **Inflation Rate**: It provides the inflation rate for the year 2015.
- **Female Labor Force Participation Rate**: This metric from 2015 showcases the percentage of the female working-age population actively participating in the workforce.

The dataset spans a myriad of countries, from established economies like Austria, Belgium, France, and Germany to emerging economies such as Argentina, China, India, and Mexico. Each nation's entry in the dataset sheds light on its respective entrepreneurial conditions, inflationary pressures, and the level of active participation of women in the labor force. 

In essence, this dataset provides a robust foundation for in-depth analyses, especially for those keen on discerning patterns, trends, and disparities across economic, gender, and social dimensions, and leveraging this information to draw meaningful conclusions.


## Required Analyses:

Address the following areas of statistical analysis in your report, ensuring correctness in your analysis and clarity in your written communication:

1. *Categorical Variable Relationship:*

    Investigate the relationship between **two** categorical variables. Your analysis should include a two-way table and a stacked bar graph. Comment on any observed relationships and describe their nature.

2. *Categorical-Quantitative Variable Relationship:*

    Examine the relationship between **one** categorical variables and a quantitative variable. Ensure you provide summary statistics and graphical comparisons of the quantitative variable across each level of your chosen categorical variable/s.

3. *Quantitative Variable Relationship:*

    Explore the relationship between **two** quantitative variables. Your analysis should include summary statistics and graphical comparisons of the quantitative variable for each level of the categorical variables.

4. *Randomized Hypothesis Test:*

    Conduct a randomized hypothesis test to assess the difference in the **mean** of a quantitative variable across two categorical levels. Ensure that you include relevant **R code** and **summary outputs** in an appendix.



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

