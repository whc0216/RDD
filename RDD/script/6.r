library(tidyverse)  
library(haven)      
library(rdrobust)     

lmb_data <- read_dta("C:\\Users\\13298\\Desktop\\RDD\\data\\lmb-data.dta")

robust <- rdrobust(y=lmb_data$score,
          x=lmb_data$demvoteshare,c=0.5)
print(summary(robust))