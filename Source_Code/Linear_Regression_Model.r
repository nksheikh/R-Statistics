# Initialize the graphics environment
options(device = "windows")

# Import data
LungCapData = read.table(file.choose(), header = TRUE, sep = "\t", 
                         stringsAsFactors = TRUE) # Import the data

# Visualize the data
head(LungCapData)

## Create a univariate linear model of age vs lung capacity ##
age_vs_lungcap_model = lm(LungCapData$LungCap ~ LungCapData$Age)
plot(LungCapData$Age, LungCapData$LungCap,
     main = "Age vs. Lung Capacity",
     xlab = "Age (yrs)",
     ylab = "Height (cm)",
     las = 1)
abline(age_vs_lungcap_model, col = "blue")

sprintf("The formula is LUNGCAP = %.3f + %.3f[AGE]", 
        as.numeric(age_vs_lungcap_model$coefficients[1]),
        as.numeric(age_vs_lungcap_model$coefficients[2]))

## Create a multivariate linear model of age and height vs lung capacity ##
age_gender_lungcap_model = lm(LungCapData$LungCap ~ 
                            (LungCapData$Age + LungCapData$Height))
sprintf("The formula is LUNGCAP = %.3f + %.3f[AGE] + %.3f[HEIGHT]", 
        as.numeric(age_gender_lungcap_model$coefficients[1]),
        as.numeric(age_gender_lungcap_model$coefficients[2]),
        as.numeric(age_gender_lungcap_model$coefficients[3]))