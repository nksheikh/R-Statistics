# Initialize the graphics environment
options(device = "windows")

# Import data
LungCapData = read.table(file.choose(), header = TRUE, sep = "\t", 
                         stringsAsFactors = TRUE) # Import the data

# Get metadata
head(LungCapData)
names(LungCapData)
class(LungCapData$Gender)
levels(LungCapData$Gender)
class(LungCapData$Smoke)
levels(LungCapData$Smoke)

### Create a univariate linear model of age vs lung capacity ###
age_vs_lungcap_model = lm(LungCapData$LungCap ~ LungCapData$Age)
plot(LungCapData$Age, LungCapData$LungCap,
     main = "Age vs. Lung Capacity",
     xlab = "Age (yrs)",
     ylab = "Lung Capacity",
     las = 1)
abline(age_vs_lungcap_model, col = "blue", lwd = 3)
sprintf("The correlation coefficient is: %.3f",
        cor(LungCapData$Age, LungCapData$LungCap))

# Get summary information about the analysis
summary(age_vs_lungcap_model)
attributes(age_vs_lungcap_model)
coef(age_vs_lungcap_model)
confint(age_vs_lungcap_model)
anova(age_vs_lungcap_model)

### Checking linear model assumptions

# ASSUMPTIONS
# 1. Y-values (or errors) are independent
# 2. Y values can be expressed as a linear function of the X variable
# 3. Variation of observations around the regression line (the residual SE) is constant (homoscedasdicity)
# 4. For a given value of X, Y values (or error) are normally distributed
# NOTE: 2,3,4 can all be verified by examining the linear model's residuals

# Plot the diagnostic plots
par(mfrow = c(2,2))
plot(age_vs_lungcap_model)
# Plot 1: X-values vs residuals
# Plot 2: Q-Q plot (normal quantiles vs standardized quantiles)
# Plot 3 and 4: Non-linearities, non-constant variance, etc