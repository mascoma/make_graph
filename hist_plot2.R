library(ggplot2)

# make plot
input <- "/Users/Xin/Desktop/projects/IC_project/output/index_distribution/DS2-1_R1_N_output.txt"
output <- "/Users/Xin/Documents/data_visulization/indexSeqPos_DS2-1_R1_N.png"
dat1<-read.table(input, sep='\t', header = T)
h<-ggplot(dat1, aes(x = Start))
h <- h + geom_histogram(binwidth = 1, fill = "darkblue", color = "ghostwhite") 
h + xlab("Position") + ggtitle("sample1")
ggsave(output)