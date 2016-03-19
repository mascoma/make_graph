library(ggplot2)
library(gcookbook) # For the data set
library(plyr)
input <- "/Users/Xin/Desktop/projects/K_methy_project/oldfiles/MethylationRegionsChart.csv"
output <- "/Users/Xin/Documents/data_visulization/methchart.png"
stackbar <- read.csv(input, head=T)
head(stackbar)


r <- rgb(251, 106, 74, max=255)
b <- rgb(33, 113, 181, max=255)
y <- rgb(255, 252, 213, max=255)
palette <- c(y, r , b)
# Do a group-wise transform(), splitting on "Date"
stackbar2 <- ddply(stackbar, "Temp", transform, percentage = Num/sum(Num)*100)
head(stackbar2)
g<-ggplot(stackbar2, aes(factor(x = Temp), y = percentage, 
                         fill = Methylation_status)) + 
  geom_bar(stat = "identity") + scale_fill_manual(values = palette) + 
  xlab("Temp") + ylab("percent")
g
ggsave(output ,plot=g)
