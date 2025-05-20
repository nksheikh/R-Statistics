# Prepare the environment
rm(list = ls())
cat("\f")
options(device = "windows")
set.seed(902890782)

# Install the requisite packages
if(!require("tidyverse")) install.packages("tidyverse")
if(!require("rlang")) install.packages("rlang")

# Create a data frame with data
n = 1E4
x = seq(1,n)
df = data.frame(
  x = x,
  y1 = rnorm(mean = 0, sd = 1E2, n = n),
  y2 = as.factor(rbinom(size = 1, prob = 0.5, n = n)),
  y3 = sample(c("half", "fourth", "fifth", "else"), prob=c(0.5,0.25,0.20,0.05),
              size = n, replace = TRUE)
)

# Plot the graphs - scatterplot, histogram, and bar plot
ggplot(df, aes(x, y1)) + geom_point() + 
  labs(title = "Scatterplot",
       subtitle = "By: Nafiz Sheikh MD",
       caption = "Source: MCG",
       x = "X",
       y = "Y") + 
  theme(plot.title = element_text(hjust = 0.5, size = 18, face = "bold"),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption = element_text(hjust = 0.5))
ggplot(df, aes(y1)) + geom_histogram() + 
  labs(title = "Histogram",
       subtitle = "By: Nafiz Sheikh MD",
       caption = "Source: MCG",
       x = "Independent Variable",
       y = "Frequency") + 
  theme(plot.title = element_text(hjust = 0.5, size = 18, face = "bold"),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption = element_text(hjust = 0.5))
ggplot(df, aes(y2)) + geom_bar() + 
  labs(title = "Bar Plot",
       subtitle = "By: Nafiz Sheikh MD",
       caption = "Source: MCG",
       x = "Independent Variable",
       y = "Frequency") + 
  theme(plot.title = element_text(hjust = 0.5, size = 18, face = "bold"),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption = element_text(hjust = 0.5))
ggplot(df, aes(fct_infreq(y3))) + geom_bar() + 
  labs(title = "Frequency-Ordered Bar Plot",
       subtitle = "By: Nafiz Sheikh MD",
       caption = "Source: MCG",
       x = "Independent Variable",
       y = "Frequency") + 
  theme(plot.title = element_text(hjust = 0.5, size = 18, face = "bold"),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        plot.caption = element_text(hjust = 0.5))