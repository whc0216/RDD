library(stats)
library(tidyverse)
library(haven)  

lmb_data <- read_dta("C:\\Users\\13298\\Desktop\\RDD\\data\\lmb-data.dta")

smooth_dem0 <- lmb_data %>%
  filter(democrat == 0) %>%
  select(score,demvoteshare)

smooth_dem0 <- as_tibble(ksmooth(smooth_dem0$demvoteshare,smooth_dem0$score,kernel = "normal", bandwidth = 0.1))  # triangle

smooth_dem1 <- lmb_data %>%
  filter(democrat == 1) %>%
  select(score,demvoteshare) %>%
  na.omit()

smooth_dem1 <- as_tibble(ksmooth(smooth_dem1$demvoteshare,smooth_dem1$score,kernel = "normal", bandwidth = 0.1))

print(ggplot() +
      geom_smooth(aes(x, y), data = smooth_dem0) +
      geom_smooth(aes(x, y), data = smooth_dem1) +
      geom_vline(xintercept = 0.5) )
