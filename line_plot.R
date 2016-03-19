## GC content plot of ICC and ICW. 

library(ShortRead)
library(ggplot2)

input1 <- "/isi/olga/xin/Halophile_project/input/merged_reads_CLC_fq/ICC_CLC.fastq"
input2 <- "/isi/olga/xin/Halophile_project/input/merged_reads_CLC_fq/ICW_CLC.fastq"
output <- "/isi/olga/xin/Halophile_project/output/20160317/ICC_ICW_GC.png"
fq1 <- readFastq(input1)
alf1 <- alphabetFrequency(sread(fq1), as.prob=TRUE, collapse=TRUE)
sum(alf1[c("G", "C")])  #0.596917
alf1_1 <- alphabetFrequency(sread(fq1), as.prob=TRUE)
fq1_GCdist <- (alf1_1[,"G"] + alf1_1[,"C"]) *100
fq1_GCdist <- as.data.frame(fq1_GCdist)
fq1_GCdist <- cbind(fq1_GCdist, "ICC")
colnames(fq1_GCdist) <- c("GC", "name") 

fq2 = readFastq(input2)
alf2 = alphabetFrequency(sread(fq2), as.prob=TRUE, collapse=TRUE)
sum(alf2[c("G", "C")])  #0.5302504
alf2_2 = alphabetFrequency(sread(fq2), as.prob=TRUE)
fq2_GCdist = (alf2_2[,"G"] + alf2_2[,"C"]) *100
fq2_GCdist = as.data.frame(fq2_GCdist)
fq2_GCdist = cbind(fq2_GCdist, "ICW")
colnames(fq2_GCdist) = c("GC", "name") 
fq12 = rbind(fq1_GCdist, fq2_GCdist)

ggplot(fq12, aes(x =GC, colour = name)) + geom_line(stat = "density", size =2) + 
  xlab("GC content (%)") + ylab("Density") + ggtitle("ICC vs ICW") + 
  theme(legend.text = element_text(size = 14), text = element_text(size=14)) +
  scale_colour_manual( name = "", values = c("mediumorchid1","rosybrown1"))

ggsave(output)