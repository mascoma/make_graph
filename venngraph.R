library("VennDiagram")

png(file = "/Users/Xin/Documents/data_visulization/ICC_mapping_DS2_1.png", width = 3000, height = 1500)
venn.plot <- draw.pairwise.venn(area1 = 3718896,area2 = 3220928,cross.area = 2954720,category = c("DS2-1", "ICC"),fill = c("blue", "red"), 
                                alpha = c(0.2, 0.2),lty = "blank",cex = 3, fontface =  "bold", label.col = rep("gray30", 3), cat.col = rep("gray30", 2),cat.fontface =  "bold", 
                                cat.dist = 0.1, cat.cex = 8,cat.pos = c(270, 90), cat.just = list(c(-0.5,0),c(2, 0)))

dev.off()
 