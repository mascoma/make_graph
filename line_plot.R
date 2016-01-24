library(ShortRead)
library(ggplot2)
fq1 = readFastq("/Users/Xin/Desktop/IC_project/input/reads_map_CLC/ICC_DS2_1_CLC_mapped.fq")
alf1 = alphabetFrequency(sread(fq1), as.prob=TRUE, collapse=TRUE)
sum(alf1[c("G", "C")])  #0.6017527
alf1_1 = alphabetFrequency(sread(fq1), as.prob=TRUE)
fq1_GCdist = (alf1_1[,"G"] + alf1_1[,"C"]) *100
fq1_GCdist = as.data.frame(fq1_GCdist)
fq1_GCdist = cbind(fq1_GCdist, "DS2_unpreferred")
colnames(fq1_GCdist) = c("GC", "name") 

fq2 = readFastq("/Users/Xin/Desktop/IC_project/input/reads_map_CLC/ICC_DS2_1_CLC_unmapped.fq")
alf2 = alphabetFrequency(sread(fq2), as.prob=TRUE, collapse=TRUE)
sum(alf2[c("G", "C")])  #0.5418941
alf2_2 = alphabetFrequency(sread(fq2), as.prob=TRUE)
fq2_GCdist = (alf2_2[,"G"] + alf2_2[,"C"]) *100
fq2_GCdist = as.data.frame(fq2_GCdist)
fq2_GCdist = cbind(fq2_GCdist, "DS2_preferred")
colnames(fq2_GCdist) = c("GC", "name") 
fq12 = rbind(fq1_GCdist, fq2_GCdist)

ggplot(fq12, aes(x =GC, colour = name)) + geom_line(stat = "density", size =2) + 
  xlab("GC content (%)") + ylab("Density") + ggtitle("ICC vs DS2-1") + 
  theme(legend.text = element_text(size = 14), text = element_text(size=14)) +
  scale_colour_manual( name = "", values = c("mediumorchid1","rosybrown1"))

ggsave("/Users/Xin/Documents/data_visulization/ICC_DS2_1.png")