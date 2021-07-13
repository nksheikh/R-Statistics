LungCapData = read.delim(file = "Datasets/LungCapData.txt",
                         header = TRUE,
                         stringsAsFactors = TRUE)

# Brief analysis of the data
names(LungCapData)
class(LungCapData$Gender)
class(LungCapData$Smoke)
levels(LungCapData$Gender)
levels(LungCapData$Smoke)

# Generate 2x2 contingency tale of gender vs smoking
tabulated_data = table(LungCapData$Gender, LungCapData$Smoke)

#  Create a bar plot of the data
barplot(tabulated_data, 
        main = "Gender vs. Smoking", 
        xlab = "Gender", 
        ylab = "Smoking",
        las = 1,
        legend = TRUE,
        beside = TRUE)

# Establish statistical significance using 
#  parametric and non-parametric analyses
parametric_results = chisq.test(tabulated_data, correct = TRUE)
nonparametric_results = fisher.test(tabulated_data, 
                                    conf.int = TRUE, 
                                    conf.level = 0.99)

# Measure of the direction and strength between two categorical variables
#  include odds ratio, relative risk, risk difference
install.packages("epiR")
library("epiR")
epi_results = epi.2by2(tabulated_data, method = "cohort.count", conf.level = 0.95)

############ Correlations and Covariance ############

## EXAMPLE
# Going to explore association between age and lung capacity
plot(LungCapData$Age, LungCapData$LungCap,
     main = "Age vs Lung Capacity",
     xlab = "Age",
     ylab = "Lung Capacity",
     las = 1)

# Pearson's correlation is a parametric measure of the LINEAR association
#  between two numeric variables
cor(LungCapData$Age, LungCapData$LungCap,
    method = "pearson") # Default)
cor.test(LungCapData$Age, LungCapData$LungCap) # Significance testing H0 equal to zero
cor.test(LungCapData$Age, LungCapData$LungCap,
         alt = "greater", conf.level = 0.99) # Significance testing H0 greater than zero
cor(LungCapData[,1:3]) # Correlation pairs between numeric variables

# Spearman's rank correlation is a non-parametric measure of the monotonic
#  association between 2 numeric variables
cor(LungCapData$Age, LungCapData$LungCap, 
    method = "spearman")
cor.test(LungCapData$Age, LungCapData$LungCap, 
         method = "spearman",
         exact = FALSE) # Significance testing
cor(LungCapData[,1:3], method = "spearman") # Correlation pairs between numeric variables

# Kendell's rank correlation is a non-parametric measure of association,
#  based on concordance/discordance of x/y pairs
cor(LungCapData$Age, LungCapData$LungCap, method = "spearman")

# Covariance
cov(LungCapData$Age, LungCapData$LungCap)
pairs(LungCapData) # Generate visual pairs plots (good for assessing prior assoc's)
pairs(LungCapData[,1:3])
cov(LungCapData[,1:3]) # Covariance of pairs between numeric variables

