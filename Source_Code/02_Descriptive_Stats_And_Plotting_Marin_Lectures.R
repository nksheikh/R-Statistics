## DESCRIPTIOVE STATISTICS AND PLOTTING ##

LungCapData = read.table(file.choose(), header = TRUE, sep = "\t", 
                         stringsAsFactors = TRUE) # Import the data

##############
# UNIVARIATE #
##############

# 1. Measures of Central Tendency
mean(LungCapData$LungCap) # Arithmetic mean
mean(LungCapData, trim = 0.10) # Trimmed mean removing top and bottom 10% of observations
median(LungCapData$LungCap) # Median
mode(LungCapData$LungCap) # Mode

# 2. Measures of Dispersion
var(LungCapData$LungCap) # Variance
sd(LungCapData$LungCap) # STD
min(LungCapData$LungCap) #  Min
max(LungCapData$LungCap) # Max
range(LungCapData$LungCap) # Range
quantile(LungCapData$LungCap) # Default quantiles are 0, 25, 50, 75, 100
quantile(LungCapData$LungCap, probs = 0.90) # Specific single quantile
quantile(LungCapData$LungCap, probs = c(0.10, 0.50, 0.90)) # Specific quantiles

# 3. Skewness and Kurtosis
# TBA

# Graphical: Histogram Stem-And-Leaf Plots

# Bar and pie charts good for showing distributions of categorical vars
tabulated_data = table(LungCapData$Gender)
barplot(tabulated_data,
        main = "Title",
        xlab = "Gender",
        ylab = "Frequency",
        las = 1) # Rotate the y-label text
barplot(tabulated_data,
        main = "Title",
        xlab = "Frequency",
        ylab = "Gender",
        las = 1, # Rotate the y-label text
        names.arg = c("Female", "Male"),
        horiz = TRUE) # Axes swapped, labels will need swapping too
pie(tabulated_data,
    main = "Title",
    labels = c("Female", "Male"))

# Boxplots good for summarizing distribution of numeric variables
LungCapData$LungCap
boxplot(LungCapData$LungCap) 
boxplot(LungCapData$LungCap,
        main = "Boxplot",
        ylab = "Lung Capacity",
        las = 1) # Creates boxplot of single variable
boxplot(LungCapData$LungCap[LungCapData$Gender == "female"],
        LungCapData$LungCap[LungCapData$Gender == "male"]) # Grouped boxplot (long)
boxplot(LungCapData$LungCap ~ LungCapData$Gender) # Grouped boxplot (short)
boxplot(LungCapData$LungCap ~ LungCapData$Gender,
        main = "Boxplot",
        ylab = "Lung Capacity",
        ylim = c(0, 16),
        las = 1) # Creates boxplots w/ limits and variable separation

# Histograms good for summarizing distribution of numeric variables
hist(LungCapData$LungCap) # Creates frequency histogram
hist(LungCapData$LungCap, freq = FALSE) # Creates proportions
hist(LungCapData$LungCap, probability = TRUE) # Creates same as above
hist(LungCapData$LungCap, 
     probability = TRUE,
     ylim = c(0, 0.2),
     breaks = 14) # Adjusts breakpoints (n+1 bins)
hist(LungCapData$LungCap, 
     probability = TRUE,
     ylim = c(0, 0.2),
     breaks = seq(0, 16, 2)) # Adjusts breakpoints (n+1 bins)
hist(LungCapData$LungCap, 
     probability = TRUE,
     ylim = c(0, 0.2),
     breaks = seq(0, 16, 2), # Adjusts breakpoints (n+1 bins)
     main = "Title",
     xlab = "Lung capacity",
     las = 1)

# Stem-and-leaf plots are good for summarizing distribution of numeric variables
#  from smaller datasets
femaleLungCap = LungCapData$LungCap[LungCapData$Gender == "female"]
stem(femaleLungCap)
stem(femaleLungCap, scale = 2) # Divides stems into n multiples


################
# MULTIVARIATE #
################

# 1. Cross-tabulations and contingency tables
table(LungCapData$Smoke) # One-factor frequency table
table(LungCapData$Smoke)/length(LungCapData) # One-factor proportion table
table(LungCapData$Smoke, LungCapData$Gender) # 2x2 contingency table

# 2. Quantitative Measures of Dependence
cor(LungCapData$Age, LungCapData$LungCap) # Pearson correlation
cor(LungCapData$Age, LungCapData$LungCap, method = "spearman") # Spearman correlation
cov(LungCapData$Age, LungCapData$LungCap) # Covariance

# 3. Descriptions of conditional distributions

# 4. Scatterplots, grouped-bar charts, mosaic plots, 

## GRAPHICS

# Stacked bar charts, clustered bar charts, and mosaic plots
# good for examining relationship bewteen 2 categorical variables
tabulated_data = table(LungCapData$Smoke, LungCapData$Gender)
barplot(tabulated_data) # Stacked bar chart
barplot(tabulated_data, beside = TRUE) # Clustered bar chart
barplot(tabulated_data,
        beside = TRUE,
        legend.text = c("Non-Smoker", "Smoker"),
        main = "Title",
        xlab = "Gender",
        ylab = "Frequency",
        names.arg = c("Female", "Male"),
        las = 1,
        col = c("red", "green"))
mosaicplot(tabulated_data, # Mosaic Plot
           main = "Mosaic Plot",
           xlab = "Smoking",
           ylab = "Gender",
           las = 1)

# Scatter plots good for examining relationship between 2 numeric variables
cor(LungCapData$Age, LungCapData$Height)
plot(LungCapData$Age, LungCapData$Height,
     main = "Scatter Plot",
     xlab = "Age",
     ylab = "Height",
     las = 1,
     xlim = c(0,25),
     cex = 1, # Plot point size
     pch = 8, # Plotting point type
     col = "red")
abline(lm(LungCapData$Height ~ LungCapData$Age), # Add trend line
       col = "blue")
lines(smooth.spline(LungCapData$Age, LungCapData$Height), # Spline
      lty = 2, # Line type
      lwd = 5) # Line width