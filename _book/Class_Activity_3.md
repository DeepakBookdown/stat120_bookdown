# Class Activity 3

## Case Study 1

Consider the following case study:


<bql>
“Swimming with dolphins can certainly be fun, but is it also therapeutic for patients suffering from clinical depression? To investigate this possibility, researchers recruited 30 subjects aged 18-65 with a clinical diagnosis of mild to moderate depression. Subjects were required to discontinue use of any antidepressant drugs or psychotherapy four weeks prior to the experiment, and throughout the experiment. These 30 subjects went to an island off the coast of Honduras, where they were randomly assigned to one of two treatment groups. Both groups engaged in the same amount of swimming and snorkeling each day, but one group (the animal care program) did so in the presence of bottlenose dolphins and the other group (outdoor nature program) did not. At the end of two weeks, each subjects’ level of depression was evaluated, as it had been at the beginning of the study, and it was determined whether they showed substantial improvement (reducing their level of depression) by the end of the study  (Antonioli and Reveley, 2005).”</bql>

Observed data:

<bql>
The researchers found that 10 of 15 subjects in the dolphin therapy group showed substantial improvement, compared to 3 of 15 subjects in the control group.
</bql>


(a). Identify the observational units in this study. 

*Answer:* The observational units in this study are the 30 subjects. 

(b). Classify each variable as categorical or quantitative. 

*Answer:*  The variables in this study can be classified as follows: 
Categorical: Treatment Group (Dolphin and Control)
Quantitative: Age, Level of Depression (Beginning and End of Study) 

(c). Which variable would you regard as explanatory and which as response? 

*Answer:* The explanatory variable would be the Treatment Group and the response variable would be the Level of Depression. 

(d). Is this an observational study or an experiment? Justify your answer.

 *Answer:* This is an experiment because the researchers randomly assigned the subjects to the two treatment groups, and then observed the effect of the treatment (presence of dolphins) on the response variable (level of depression).

(e). Construct a two-way table based on the results of the experiment.

Two-way table:

Dolphin Therapy   | Improved | Not Improved | Total
------------------|----------|--------------|------
Group             | 10       | 5  |  15
Control Group     | 3        | 12 | 15
Total  |   13 |   17 |   30


---------------------------------------------------

## Case Study 2

Consider the following case study:


<bql>
“Researchers want to find out how a new diet affects weight gain among underweight subjects. This experiment only has two treatment conditions, the new diet and the standard diet, hence the matched pairs design can be used. For this study, the researchers recruited 200 subjects which will be grouped into 100 pairs based on shared characteristics such as age, gender, weight, height, lifestyle, and so on.  A 20-year-old female within the weight range of 90-110 pounds and the height range of 60-63 inches will be paired with another 20-year-old female that falls into the same weight and height categories.  Once all 100 pairs are made, a subject from each pair will be randomly assigned into the treatment group (will be administered the new diet for 2 months) while the other subject from the pair will be assigned to the control group (will be assigned to follow the standard diet for two months). At the end of the time time period of 2 months, researchers will measure the total weight gain for each subject.”</bql>

Observed data:

<bql>
The researchers found that 60 of 100 subjects in the new diet group showed substantial improvement, compared to 43 of 100 subjects in the standard diet group.
</bql>


(a). Identify the observational units in this study. 

*Answer:* The observational units in this study are the 200 subjects. 

(b). Classify each variable as categorical or quantitative. 

*Answer:* The variables are: age (quantitative), gender (categorical), weight (quantitative), height (quantitative), lifestyle (categorical), and total weight gain (quantitative). 


(c). Which variable would you regard as explanatory and which as response? 

*Answer:* The explanatory variable is the type of diet (new or standard) and the response variable is the total weight gain.

(d). Is this an observational study or an experiment? Justify your answer.

*Answer:* This is an experiment because the researchers are manipulating the explanatory variables (type of diet) to observe the effects on the response variables (total weight gain).

(e). If it is an experiment, is it randomized comparative experiment or a matched pairs experiment?

*Answer:* This is a matched pairs experiment because each subject is paired with another subject who has similar characteristics and one subject from each pair is randomly assigned to the treatment group and the other to the control group.

(f). Construct a two-way table based on the results of the experiment.

Two-way table:

New Diet |	Standard Diet | 	Total
------------------|----------|--------------
Improvement |	60 | 	43 |	103
No Improvement |	40 |	57 |	97
Total |	100 |	100 |	200

---------------------------------------------------

## (Non-Maize users) installing `ggplot2`

If you are using Rstudio on your **own computer**, you will first need to **install** the package but if you are using the Maize (online) Rstudio (or a lab computer) you do not. If you need to install the package: 

- Click the **Packages** tab on the lower right Rstudio pane.
- Click **Install** and type `ggplot2` into the **Packages** box. 
- Click the **Install** button. You should now see `ggplot2` in the list of packages. 
- You only need to install the package once. After than, you run the `library` command to load the package functions into your current R session.

An alternate way way to install `ggplot2` from the R console is by using the following command:


```r
install.packages("ggplot2", dependencies = TRUE)
```
