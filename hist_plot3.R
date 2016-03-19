library(ggplot2)
input1 <- "/isi/olga/xin/Halophile_project/output/20160317/ICW_genus_count.txt"
input2 <- "/isi/olga/xin/Halophile_project/output/20160317/ICC_genus_count.txt"
output <- "/isi/olga/xin/Halophile_project/output/20160317/ICC_ICW_genus.png"
ICW <- read.delim(input1, stringsAsFactors = F, header = F, sep = '\t')
ICC <- read.delim(input2, stringsAsFactors = F, header = F, sep = '\t')
names(ICW) <- c("taxa", "count")
names(ICC) <- c("taxa", "count")

ICC <- ICC[order(ICC$count, decreasing = T),]
ICW <- ICW[order(ICW$count, decreasing = T),]

head(ICW)
head(ICC)

Sample = "ICW"
ICW_percent = Percent = (ICW[, 2]/sum(ICW[,2]))*100
ICW = cbind(ICW, Percent)
ICW = cbind(ICW, Sample)

Sample = "ICC"
ICC_percent = Percent = (ICC[, 2]/sum(ICC[,2]))*100
ICC = cbind(ICC, Percent)
ICC = cbind(ICC, Sample)

head(ICW)
head(ICC)
ICW.short <- ICW[1:36,]
taxalist <- ICW[1:36,1]

Homo.ICC <- ICW[(ICW$taxa == "Homo"), ]
Homo.ICC$count <- 0
Homo.ICC$Percent <- 0 
Homo.ICC$Sample <- "ICC"

Lep.ICC <- ICW[(ICW$taxa == "Leptotrichia"), ]
Lep.ICC$count <- 0
Lep.ICC$Percent <- 0 
Lep.ICC$Sample <- "ICC"

Halola.ICC <- ICW[(ICW$taxa == "Halolamina"), ]
Halola.ICC$count <- 0
Halola.ICC$Percent <- 0 
Halola.ICC$Sample <- "ICC"

Halobe.ICC <- ICW[(ICW$taxa == "Halobellus"), ]
Halobe.ICC$count <- 0
Halobe.ICC$Percent <- 0 
Halobe.ICC$Sample <- "ICC"

Halopl.ICC <- ICW[(ICW$taxa == "Haloplanus"), ]
Halopl.ICC$count <- 0
Halopl.ICC$Percent <- 0 
Halopl.ICC$Sample <- "ICC"

ICC.short <- rbind(ICC[(ICC$taxa %in% taxalist),], Halopl.ICC, Halobe.ICC, 
                   Halola.ICC, Lep.ICC, Homo.ICC)


# taxalist <- c(ICW[1:20, 1], ICW[29, 1]) # check the most abundent taxa
# ICC.short <- ICC[(ICC$taxa %in% taxalist),]
# ICW.short <- ICW[(ICW$taxa %in% taxalist),]
# ICC_ICW <- rbind(ICC.short, ICW.short)
# ICC.short <- ICC[1:40, ]
# ICW.short <- ICW[1:40, ]

ICC_ICW <- rbind(ICC.short, ICW.short)

ggplot(ICC_ICW, aes(x = reorder(taxa, Percent), y = Percent, fill = Sample)) + 
  geom_bar(stat = "identity",position = "dodge",  colour = "black") + 
  scale_fill_brewer(palette = "Pastel1") + 
  theme(axis.text.x = element_text(angle=75, hjust=1, size = 8),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank(),
        panel.grid.major.x = element_line(colour="grey60", linetype="dashed")) + 
  xlab("Taxa")  
ggsave(output, width = 10, height = 6)

