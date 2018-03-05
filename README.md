# Import and wrangling of Texas Academic Performance Reports (TAPR) data for the 2016 - 2017 school year

This R code focuses on the import and wrangling of 2016-2017 TAPR data, with a specific focus on the _all student_, _english language learner (ELL)_, and _economically disadvantaged (low SES)_ sub-groups. The data was pulled from the [Texas Education Agency website](https://rptsvr1.tea.texas.gov/perfreport/tapr/2017/download/DownloadData.html). 

**Files downloaded** 
- Reference Information, Accountability Rating and Special Education Determination Status **(CREF.csv)** 
- STAAR Approaches Grade Level or Above (All Grades), Meets Grade Level, Masters Grade Level **(CAMPSTAAR2.csv)**

Student mobility data was pulled from the [preliminary TAPR dataset](https://rptsvr1.tea.texas.gov/cgi/sas/broker) **(CSTUD.csv)**

## File Structure

**data**
- CREF.csv
- CAMPSTAAR2.csv

**src**
- 01_workspace_setup.R
- 02_data_import.R

**src - under revision**
- approaches_wrangle.csv: uses CAMPSTAAR1, which contains students approaching grade level data
- meets_wrangle.csv: uses CAMPSTAAR2, which contains students meeting grade level data

### Prerequisites

As outlined in the workspace_setup.R file:
```
library(magrittr)
library(here)
library(tidyverse)
library(stringr)
```

## For more information
Please see the associated [blog post](https://medium.com/@kierisi/share-the-code-adventures-in-education-data-wrangling-11f2509272cb)!
