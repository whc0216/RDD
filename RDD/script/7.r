# 只加载必需包，无多余依赖
library(haven)      
library(rddensity)  

# 读取数据（路径和你完全一致）
lmb_data <- read_dta("C:\\Users\\13298\\Desktop\\RDD\\data\\lmb-data.dta")

# 步骤1：McCrary密度检验（仅用c=0.5，无任何错误参数）
density_result <- rddensity(lmb_data$demvoteshare, c = 0.5)
# 输出检验结果（和你之前看到的一致）
summary(density_result)

# 步骤2：绘制密度图（核心修正：用c=0.5，删掉cutpoint！）
rdplotdensity(density_result, lmb_data$demvoteshare)