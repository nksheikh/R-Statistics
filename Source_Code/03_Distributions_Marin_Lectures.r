###########################
## Binomial Distribution ##
###########################

# dbinom - probability density function
dbinom(x = 3, size = 20, prob = 1/6) # Probability 3 successes out 20 w/ 1/6 success rate
dbinom(x = 0:3, size = 20, prob = 1/6) # P(X=0) & P(X=1) & P(X=2) & P(X=3)
sum(dbinom(x = 0:3, size = 20, prob = 1/6)) # P(X=0) | P(X=1) | P(X=2) | P(X=3)

# pbinom - probability distribution function
pbinom(q = 3, size = 20, prob = 1/6, lower.tail = TRUE)

##########################
## Poisson Distribution ##
##########################

# For poisson distributions, rate at which events occur MUST be constant. 
#  One interval CANNOT have higher event rate than another.

lbd = 7
# dpois - probability desnity function
dpois(x = 4, lambda = 7)
dpois(x = 0:4, lambda = 7)
sum(dpois(x = 0:4, lambda = 7))
ppois(q = 4, lambda = 7, lower.tail = TRUE)
ppois(q = 12, lambda = 7, lower.tail = FALSE)

dpois(x = 10, lambda = 12)
ppois(q = 9, lambda = 12, lower.tail = FALSE)
ppois(q = 1, lambda = 12/24, lower.tail = FALSE)

#########################
## Normal Distribution ##
#########################

pnorm(q = 70, mean = 75, sd = 5) # P(X <= 70)
pnorm(q = 70, mean = 75, sd = 5, lower.tail = TRUE) # P(X <= 70)
pnorm(q = 85, mean = 75, sd = 5, lower.tail = FALSE) # P(X >= 85)
pnorm(q = 85, mean = 0, sd = 1, lower.tail = FALSE) # P(Z >= 1)
qnorm(p = 0.25, mean = 75, sd = 5, lower.tail = TRUE) # Find Q1, p is the quantile
x = seq(from = 55, to = 95, by = 0.25)
dnorm(x, mean = 75, sd = 5)
hist(rnorm(n = 1000, mean = 75, sd = 5))

####################
## T Distribution ##
####################

pt(q = 2.3, df = 25, lower.tail = FALSE) # P(t > 2.3, DF of 2.5)

# P(t > 2.3 AND t > 2.3, DF of 2.5)
pt(q = -2.3, df = 25, lower.tail = TRUE) + pt(q = 2.3, df = 25, lower.tail = FALSE)
pt(q = 2.3, df = 25, lower.tail = FALSE) * 2

qt(p = 0.025, df = 25, lower.tail = TRUE) # Find t for 95% confidence