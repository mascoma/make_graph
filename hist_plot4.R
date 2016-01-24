library(data.table)
library(ggplot2)
ICC = read.delim("/Users/Xin/Desktop/IC_project/output/Jan222016/ICC_genus_graph2.csv",stringsAsFactors = F, header = T, sep = ",")
ICC_DS2_1 = read.delim("/Users/Xin/Desktop/IC_project/output/Jan222016/ICC_DS2_1_unmapped_genus_graph2.csv",stringsAsFactors = F, header = T, sep = ",")
head(ICC_DS2_1)
head(ICC)
Sample = "ICC_DS2_1"
ICC_DS2_1_percent = Percent = (ICC_DS2_1[, 2]/78580)*100
ICC_DS2_1 = cbind(ICC_DS2_1, Percent)
ICC_DS2_1 = cbind(ICC_DS2_1, Sample)

Sample = "ICC"
ICC_percent = Percent = (ICC[, 2]/2211826)*100
ICC = cbind(ICC, Percent)
ICC = cbind(ICC, Sample)

head(ICC_DS2_1)
head(ICC)

df1 = ICC_DS2_1[, 3] - ICC[, 3]

ICC = cbind(ICC, df1)
head(ICC)
abundance1= vector("numeric", length(df1))
for (i in 1: length(df1)){
  if (df1[i] > 0) {
    abundance1[i] = df1[i] + 0.1
  }
  if (df1[i] < 0) {
    abundance1[i] = 0.1
  } 
}

 

fill1 = vector("character", length(df1))
for (i in 1: length(df1)){
  if (df1[i] > 0) {
    fill1[i] = "P"
  }
  if (df1[i] < 0) {
    fill1[i] = "N"
  } 
}

 


ggplot(ICC, aes(x = reorder(taxa, df1), y = df1, fill =  fill1)) + 
  geom_bar(stat = "identity",position = "dodge",  colour = "black") + scale_fill_brewer(palette = "Pastel1") +
  geom_text(aes(y= abundance1+ 0.3, label = round(ICC_DS2_1_percent, 1)), size = 2.5 ) + geom_text(aes(y= abundance1 +0.8, label = round(ICC_percent, 1)), size = 2.5 ) +
  scale_fill_manual(values=c("darksalmon","darkseagreen4"), guide=FALSE) + 
  theme(axis.text.x = element_text(angle=75, hjust=1, size = 8),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank(),
        panel.grid.major.x = element_line(colour="grey60", linetype="dashed")) + xlab("") + ylab("Changes of percentage") +
  theme(axis.title.y = element_text(size =8)) 
ggsave("/Users/Xin/Documents/data_visulization/ICC_DS2_1_unmapped_changes.png", width = 10, height = 6)

 