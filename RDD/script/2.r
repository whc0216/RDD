library(tidyverse)  
library(haven)      
library(fixest)     

lmb_data <- read_dta("C:\\Users\\13298\\Desktop\\RDD\\data\\lmb-data.dta")

fe1 <- feols(score ~ lagdemocrat,data = lmb_data,cluster = ~id) 
fe2 <- feols(score ~ democrat,data = lmb_data,cluster = ~id)  
fe3 <- feols(democrat ~ lagdemocrat,data = lmb_data,cluster = ~id)

print(etable(fe1,fe2,fe3))