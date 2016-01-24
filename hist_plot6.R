# this script is to show the length distribution of the ICC_DS2_unmapped reads, which were assigned and unassigned 
# as well as the length distribution of the entire reads collection
library("Hmisc")
readlen = read.table("/Users/Xin/Desktop/IC_project/output/ICC_DS2_CLC_mapping_output/ICC_DS2_1_unmapped_length.txt", sep = '\t', header = T)

  

readassigned = read.table("/Users/Xin/Desktop/IC_project/output/Jan222016/resource_tables/ICC_DS2_1_unmapped_taxa.csv", sep = ',', header = T)
 


#subgroup1 = readsum[!(rownames(readsum) %in% readgroup1), ] # no hits in diafast
#hist(subgroup1, breaks = (max(subgroup1) - min(subgroup1)), xlab = "length of reads", 
#     ylab = "counts", main = "")
#length(readgroup1) #471118
#length(subgroup1) #1522666

assignedlen = readlen[which(readlen[,"read"] %in% readassigned[, "read"]), ] # no hits in diasens
length(assignedlen[,1])  
unassignedlen = readlen[which(readlen[,"read"] %nin% readassigned[, "read"]), ]
length(unassignedlen[, 1])  
 
full = hist(readlen[, 2], breaks = 60, xlab = "length of reads", 
            ylab = "density", main = "")
g1 = hist(assignedlen[,2], breaks = 30, xlab = "length of reads", 
          ylab = "density", main = "")
g11 = hist(unassignedlen[,2], breaks = 60, xlab = "length of reads", 
           ylab = "density", main = "")

 
color = c(rgb(0,0,0,1/4), rgb(1,0,0,1/4), rgb(0,0,1,1/4))
#color = c(rgb(224, 224, 224, maxColorValue=255), rgb(255,153,153, maxColorValue = 255), rgb(153,255,255, maxColorValue = 255))

png(filename="/Users/Xin/Documents/data_visulization/ICC_DS2_1_unmapped_len.png", width = 1200, height = 800)
par(mar=c(5, 5, 5, 5))
plot(full,col=rgb(0,0,0,1/4), xlim = c(0, 500), xlab = "Length of reads", ylab = "Count", main = "ICC_DS2_1_unmapped", cex.lab = 2, cex.main = 3)
plot(g11,col=rgb(1,0,0,1/4), add = T)
plot(g1, col=rgb(0,0,1,1/4), add = T)
legend("topright",c("Complete", "unassigned", "assigned"), pch = 15, col = color, cex = 2)
dev.off()

 