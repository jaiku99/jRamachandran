# jRamachandran
Smart Phone Data Analysis
## READ_ME.TXT 

This package contains the following Objects

1. READ_ME.TXT      ->   This Document 

2. run_analysis.R   ->   The R. Script that anlyses the Activtity data.

2. CODE_BOOK.TXT    - >  Describes the data stctrure of the three data sets 
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
    2. Subject mean data set 



The three files produced are 
    1.  NarrowData.txt
    2.  SubMean.txt
    3.  ActMean.txt

