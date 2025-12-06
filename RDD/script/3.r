library(tidyverse)  
library(haven)      
library(fixest)     

lmb_data <- read_dta("C:\\Users\\13298\\Desktop\\RDD\\data\\lmb-data.dta")

lmb_subset <- lmb_data %>%
  mutate(demvoteshare_c=demvoteshare-0.5,demvoteshare_sq=demvoteshare_c^2)

fe1 <- feols(score ~ lagdemocrat+demvoteshare_c,data = lmb_subset,cluster = ~id) 
fe2 <- feols(score ~ democrat+demvoteshare_c,data = lmb_subset,cluster = ~id)  
fe3 <- feols(democrat ~ lagdemocrat+demvoteshare_c,data = lmb_subset,cluster = ~id)

print(etable(fe1,fe2,fe3))

fe4 <- feols(score ~ lagdemocrat*demvoteshare_c,data = lmb_subset,cluster = ~id) 
fe5 <- feols(score ~ democrat*demvoteshare_c,data = lmb_subset,cluster = ~id)  
fe6 <- feols(democrat ~ lagdemocrat*demvoteshare_c,data = lmb_subset,cluster = ~id)

print(etable(fe4,fe5,fe6))

fe7 <- feols(score ~ lagdemocrat*demvoteshare_c+lagdemocrat*demvoteshare_sq,data = lmb_subset,cluster = ~id) 
fe8 <- feols(score ~ democrat*demvoteshare_c+lagdemocrat*demvoteshare_sq,data = lmb_subset,cluster = ~id)  
fe9 <- feols(democrat ~ lagdemocrat*demvoteshare_c+lagdemocrat*demvoteshare_sq,data = lmb_subset,cluster = ~id)

print(etable(fe7,fe8,fe9))

lmb_subset_filter <- lmb_data %>%
  filter(lagdemvoteshare > .48 & lagdemvoteshare < .52)%>%
  mutate(demvoteshare_c=demvoteshare-0.5,demvoteshare_sq=demvoteshare_c^2)

fe10 <- feols(score ~ lagdemocrat*demvoteshare_c+lagdemocrat*demvoteshare_sq,data = lmb_subset_filter,cluster = ~id) 
fe11 <- feols(score ~ democrat*demvoteshare_c+lagdemocrat*demvoteshare_sq,data = lmb_subset_filter,cluster = ~id)  
fe12 <- feols(democrat ~ lagdemocrat*demvoteshare_c+lagdemocrat*demvoteshare_sq,data = lmb_subset_filter,cluster = ~id)

print(etable(fe10,fe11,fe12))

lmb_subset_filter <- lmb_data %>%
  filter(lagdemvoteshare > .45 & lagdemvoteshare < .55)%>%
  mutate(demvoteshare_c=demvoteshare-0.5,demvoteshare_sq=demvoteshare_c^2)

fe13 <- feols(score ~ lagdemocrat*demvoteshare_c+lagdemocrat*demvoteshare_sq,data = lmb_subset_filter,cluster = ~id) 
fe14 <- feols(score ~ democrat*demvoteshare_c+lagdemocrat*demvoteshare_sq,data = lmb_subset_filter,cluster = ~id)  
fe15 <- feols(democrat ~ lagdemocrat*demvoteshare_c+lagdemocrat*demvoteshare_sq,data = lmb_subset_filter,cluster = ~id)

print(etable(fe13,fe14,fe15))