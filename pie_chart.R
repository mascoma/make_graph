library(plotrix)
dom = read.table("/Users/Xin/Desktop/IC_project/results_report/pre_report_data_20151027/reads_taxa_tables/dom_level_sum.txt", sep = "\t", header = T)
head(dom)
lbls = dom[, 1]
DS2_1 = (dom[, 2]/sum(dom[, 2]))*100
DS2_2 = (dom[, 3]/sum(dom[, 3]))*100
ICC = (dom[, 4]/sum(dom[, 4]))*100

lbls1 = vector("character", length = 7)
for (i in 1: length(lbls)){
  lbls1[i] = paste(lbls[i]," (", round(DS2_1[i], 2), "%)", sep ="")
}
lbls2 = vector("character", length = 7)
for (i in 1: length(lbls)){
  lbls2[i] = paste(lbls[i]," (", round(DS2_2[i], 2), "%)", sep ="")
}
lbls3 = vector("character", length = 7)
for (i in 1: length(lbls)){
  lbls3[i] = paste(lbls[i]," (", round(ICC[i], 2), "%)", sep ="")
}
png(file = "/Users/Xin/Documents/data_visulization/IC_pie_chart.png", width = 3800, height = 1000)
par(mfrow=c(1,3))
par(mar=c(20, 10, 20, 20))


pie(DS2_1,labels = lbls1,col= topo.colors(7, alpha = 0.5), cex = 3.5)
title(main = "DS2_1", cex.main = 6)
pie(DS2_2,labels = lbls2, col= topo.colors(7, alpha = 0.5),cex = 3.5)
title(main = "DS2_2", cex.main = 6)
pie(ICC,labels = lbls3, col= topo.colors(7, alpha = 0.5),cex = 3.5)
title(main = "ICC", cex.main = 6)
dev.off()
