library(ggplot2)
stackbar<-read.csv("/Users/Xin/Desktop/K_methy_project/oldfiles/MethylationRegionsChart.csv", head=T)
head(stackbar)
library(gcookbook) # For the data set
library(plyr)

r <- rgb(251, 106, 74, max=255)
b <- rgb(33, 113, 181, max=255)
y <- rgb(255, 252, 213, max=255)
palette <- c(y,r , b)
# Do a group-wise transform(), splitting on "Date"
stackbar2 <- ddply(stackbar, "Temp", transform, percentage = Num / sum(Num) * 100)
head(stackbar2)
g<-ggplot(stackbar2, aes(factor(x=Temp), y=percentage, fill= Methylation_status)) + geom_bar(stat="identity")+ scale_fill_manual(values = palette) + xlab("Temperature") + ylab("% of methylated GATGC motifs")
g
ggsave("/Users/Xin/Documents/data_visulization/methchart.png",plot=g)