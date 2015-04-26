# jRamachandran
Smart Phone Data Analysis
## READ_ME. 

This package contains the following Objects

1. READ.ME      ->   This Document 

2. run_analysis.R   ->   The R. Script that anlyses the Activtity data.

2. CODEBOOK.TXT    - >  Describes the data stctrure of the three data sets 
                        produced by the script 
                   

* The Script run_analsis.R  has not parameters.

Downloads the Activity data  from the  following web site
"http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"


Reads the  various data files into memory

Extracts a subset of  Mean and STD  values

Creates Column names and row lables 

Creates a tidy data set ( Narrow format) 
   where each row represent an indivudual observation of a activity or each subject.

Using the Narrow tidy data set creats the following
    1. Activity Mean  data set
    
  This has one row for each Sunbjects each of the 6 Activities.
  A detaild desctiption is in the attaced codebook. 
