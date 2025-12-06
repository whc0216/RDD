library(tidyverse)  
library(haven)      
library(fixest)     

lmb_data <- read_dta("C:\\Users\\13298\\Desktop\\RDD\\data\\lmb-data.dta")

lmb_subset <- lmb_data %>%
  filter(lagdemvoteshare > .48 & lagdemvoteshare < .52)

fe1 <- feols(score ~ lagdemocrat,data = lmb_subset,cluster = ~id) 
fe2 <- feols(score ~ democrat,data = lmb_subset,cluster = ~id)  
fe3 <- feols(democrat ~ lagdemocrat,data = lmb_subset,cluster = ~id)

print(etable(fe1,fe2,fe3))