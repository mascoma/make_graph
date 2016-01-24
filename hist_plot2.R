library(ggplot2)

# make plot

dat1<-read.table("/Users/Xin/Desktop/IC_project/output/index_distribution/DS2-1_R1_N_output.txt", sep='\t', header = T)
h<-ggplot(dat1, aes(x = Start))
h <- h + geom_histogram(binwidth = 1, fill = "darkblue", color = "ghostwhite") 
h + xlab("Position") + ggtitle("N703 seq in DS2-1_R1 (counts 5084)")
ggsave("/Users/Xin/Documents/data_visulization/indexSeqPos_DS2-1_R1_N.png")