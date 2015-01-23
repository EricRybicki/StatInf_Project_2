### StatInf_Proj_2.R
library(datasets)
?ToothGrowth
tooth <- ToothGrowth
str(tooth)
summary(tooth)
head(tooth)
table(tooth$supp)

hist(tooth$len[tooth$supp == "VC" ])
hist(tooth$len[tooth$supp == "OJ" ])
plot(tooth$supp, tooth$len)

plot(tooth$supp[tooth$dose == 0.5], tooth$len[tooth$dose == 0.5])
plot(tooth$supp[tooth$dose == 1.0], tooth$len[tooth$dose == 1.0])
plot(tooth$supp[tooth$dose == 2.0], tooth$len[tooth$dose == 2.0])

plot(tooth$dose[tooth$supp == "VC"], tooth$len[tooth$sup == "VC"])
plot(tooth$dose[tooth$supp == "OJ"], tooth$len[tooth$sup == "OJ"])

plot(tooth$len[tooth$supp == "VC"], tooth$dose[tooth$sup == "VC"])
plot(tooth$len[tooth$supp == "OJ"], tooth$dose[tooth$sup == "OJ"])

###
ggplot(tooth, aes(as.factor(dose), len, fill = supp)) + geom_bar(stat="identity") + facet_grid(. ~ supp)
ggplot(tooth, aes(as.factor(dose), len, fill = supp)) + geom_bar(stat="identity", position = "dodge")

###########
g <- ggplot(tooth, aes(as.factor(dose), len, fill = supp))
g <- g + geom_bar(stat="identity", position = "dodge") + theme_bw()
g <- g + scale_fill_manual("Teams",values = c("#ff6666", "#33cc33"), guide = guide_legend(title = "Supplement"))
g <- g + xlab("Dose in milligrams") + ylab("Tooth Length")
g

fit <- lm(len ~ dose + supp, data=ToothGrowth)
confint(fit)

t.test(len ~ supp, data = ToothGrowth)
tooth_0.5_1.0 <- subset(tooth, dose %in% c(0.5, 1.0))
t.test(len ~ supp, tooth_0.5_1.0)
tooth_0.5_2.0 <- subset(tooth, dose %in% c(0.5, 2.0))
t.test(len ~ supp, tooth_0.5_2.0)
tooth_1.0_2.0 <- subset(tooth, dose %in% c(1.0, 2.0))
t.test(len ~ supp, tooth_1.0_2.0)