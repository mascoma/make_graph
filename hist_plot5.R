library(data.table)
library(ggplot2)

input <- "/Users/Xin/Desktop/projects/IC_project/output/20160122/ICC_DS2_2_unmapped_genus_graph2.csv"
outputf <- "/Users/Xin/Documents/data_visulization/ICC_DS2_2_unmapped_genus_count.png"
taxa <- read.csv(input, header = T)
Percent <- (taxa[, 2]/sum(taxa[, 2]))*100
taxa <- cbind(taxa, Percent)
h <- ggplot(taxa, aes(x = reorder(taxa, count), y = Percent)) + 
  geom_bar(stat = "identity", fill = "lightblue", colour = "black") + 
  geom_text(aes(label = count), size = 2.5, vjust = -0.3) +   
  theme(axis.text.x = element_text(angle = 75, hjust = 1, size = 8),
        axis.title.y = element_text(size =8),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank(),
        panel.grid.major.x = element_line(colour ="grey60", linetype = "dashed")) +
  xlab("") + ylab("Percent")  
h
ggsave(output, plot = h, width = 10, height = 5)
