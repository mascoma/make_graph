library(ggplot2)


BItree_nonclk <-read.table("/Users/Xin/Documents/Ratsnake_project/input/treedistcmp_three_groups/BI_nonclkdist.txt", header = T)  

BItree_ppdist <-read.table("/Users/Xin/Documents/Ratsnake_project/input/treedistcmp_three_groups/BI_ppdist.txt", header = T)  

BItree_rest <-read.table("/Users/Xin/Documents/Ratsnake_project/input/treedistcmp_three_groups/BI_restdist.txt", header = T)  
head(BItree_nonclk)
head(BItree_ppdist)
head(BItree_rest)
nonclkqt<-BItree_nonclk[[5]]
ppdistqt<-BItree_ppdist[[5]]
restqt<-BItree_rest[[5]]
BIdists <- matrix(data =NA, nrow = (length(BItree_nonclk[[5]]) + length(BItree_ppdist[[5]]) + length(BItree_rest[[5]])), ncol = 2)
BIdists[1:length(BItree_nonclk[[5]]), 1] <- 0
BIdists[(length(BItree_nonclk[[5]])+1):(length(BItree_nonclk[[5]]) + length(BItree_ppdist[[5]])), 1] <-1
BIdists[(length(BItree_nonclk[[5]])+length(BItree_ppdist[[5]])+1):(length(BItree_nonclk[[5]])+length(BItree_ppdist[[5]]) + length(BItree_rest[[5]])), 1] <-2
BIdists[1:length(BItree_nonclk[[5]]), 2] <-  nonclkqt
BIdists[(length(BItree_nonclk[[5]])+1):(length(BItree_nonclk[[5]]) + length(BItree_ppdist[[5]])), 2] <-ppdistqt
BIdists[(length(BItree_nonclk[[5]])+length(BItree_ppdist[[5]])+1):(length(BItree_nonclk[[5]])+length(BItree_ppdist[[5]]) + length(BItree_rest[[5]])), 2] <-restqt

BIdists<-as.data.frame(BIdists)
head(BIdists)
tail(BIdists)
colorder <- c( "khaki3", "darkseagreen", "lightpink3")
ggplot(BIdists, aes(x = factor(V1), y = V2)) +  geom_violin() +
  geom_boxplot(width= 0.1, aes(fill=factor(V1))) + 
  scale_color_manual(breaks=colorder, # color scale (for points)
                     values=colorder,
                     labels=c("non-clock","large-variation", "rest"),
                     name="Group") +
  scale_fill_manual(breaks=colorder,  # fill scale (for boxes)
                    values=colorder,
                    labels=c("non-clock","large_variation", "rest"),
                    name="Group") +
  scale_x_discrete( labels=c("non-clock","large_variation", "rest")) + 
  ylab("Normalized Triple Distances") + xlab("")
ggsave("/Users/Xin/Desktop/distcmp.png")
