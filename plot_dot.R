library(ggplot2)
spedist<-read.table("/Users/Xin/Documents/Ratsnake_project/input/spetredist3.txt", header = T)
head(spedist)
ggplot(spedist, aes(x=reorder(name, TT), y=TT)) + geom_point(size = 3)  +  
  theme(axis.text.x = element_text(angle=60, hjust=1), panel.grid.major.y = element_blank()) +
  ylab ("Normalized Triple Distance") + xlab("tree pairs") + ylim(0, 0.08)

ggsave("/Users/Xin/Documents/visulization/spetredist3.png")


