#######################
## ONE SAMPLE T-TEST ##
#######################

# H0: mu < 8
# one-sided 95% confidence intervcal for mu
t.test(LungCapData$LungCap, mu = 8, alternative = "less", conf.level = 0.95)

# H0: mu = 8
# Ha: mu =/= 8
# one-sided 95% confidence intervcal for mu
# TWo-sided, 95% confidence, mu = 0, var.eq = FALSE, paired = FALSE are default in R
t.test(LungCapData$LungCap, mu = 8, alternative = "two.sided", conf.level = 0.95)
t.test(LungCapData$LungCap, mu = 8)

# H0: mu = 8
# Ha: mu =/= 8
# one-sided 99% confidence intervcal for mu
# Two-sided is default in R
t.test(LungCapData$LungCap, mu = 8, conf.level = 0.99)

# Attributes of test can be stored and retrieved
TEST = t.test(LungCapData$LungCap, mu = 8, conf.level = 0.99)
attributes(TEST)
TEST$p.value

#######################
## TWO SAMPLE T-TEST ##
#######################

# H0: mu_nonsmokers = mu_smokers
# Ha: mu_nonsmokers =/= mu_smokers
t.test(LungCapData$LungCap ~ LungCapData$Smoke)

# Levene's test for equality of variances
# H0: var_nonsmokers = var_smokers
# H1: var_nonsmokers =/= var_smokers
leveneTest(LungCapData$LungCap ~ LungCapData$Smoke)

######

# Mann-Whitney U test
# H0: median lun-cap smokers = nonsmokers
# Two sided
wilcox.test(LungCapData$LungCap ~ LungCapData$Smoke,
            mu = 0,
            alternative = "two.sided",
            conf.level = 0.95,
            conf.int = TRUE,
            paired = FALSE,
            exact = TRUE,
            correct = TRUE)
wilcox.test(LungCapData$LungCap ~ LungCapData$Smoke,
            conf.int = TRUE) # All values except conf.int from above are default

###########

# Chi-Square
tabulated_data = table(LungCapData$Gender, LungCapData$Smoke)
test_results = chisq.test(tabulated_data, correct = TRUE)
attributes(test_results)

# Fisher
fisher.test(tabulated_data, conf.int = TRUE, conf.level = 0.99)

############
d = read.table(file.choose(), header=TRUE, sep=",", stringsAsFactors = TRUE)
boxplot(d$weight ~ d$feed, main = "Weight By Feed", xlab = "Feed", ylab = "Weight (g)", las = 1)
mean(d$weight[d$feed == "casein"])
mean(d$weight[d$feed == "meatmeal"])
median(d$weight[d$feed == "casein"])
median(d$weight[d$feed == "meatmeal"])

test.stat1 = abs(diff(with(d, tapply(weight, feed, mean))))
test.stat2 = abs(diff(with(d, tapply(weight, feed, median))))

## BOOTSTRAPPING

set.seed(112358)
n = length(d$feed)
n
B = 10000
variable = d$weight
BootstrapSamples = matrix(sample(variable, size = n * B, replace = TRUE), nrow = n, ncol = B)
dim(BootstrapSamples)

Boot.test.stat1 = rep(0, B)
Boot.test.stat2 = rep(0, B)

for (i in 1:B)
{
  Boot.test.stat1[i] = abs(mean(BootstrapSamples[1:12,i]) - mean(BootstrapSamples[13:23,i]))
  Boot.test.stat2[i] = abs(median(BootstrapSamples[1:12,i]) - median(BootstrapSamples[13:23,i]))
}

round(Boot.test.stat1[1:20], 1)
round(Boot.test.stat2[1:20], 1)

(Boot.test.stat1 >= test.stat1)[1:20]
sum((Boot.test.stat1 >= test.stat1)[1:20])

mean(Boot.test.stat1 >= test.stat1)
mean(Boot.test.stat2 >= test.stat2)