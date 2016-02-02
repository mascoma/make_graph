library(dplyr)
library(reshape2)
library(ggplot2)
pn = read.delim("/Users/Xin/Desktop/datagame/winnums-text.csv", header = T, sep = ',')
wb = melt(pn[,4:8])
wb_count = tally(group_by(wb, value), sort = T)
percent = (wb_count[,2]/sum(wb_count[,2]))*100
names(percent) = "weight"
wb_count = cbind(wb_count, percent, group = "wb")
wb_count = as.data.frame(wb_count)

rb = as.data.frame(pn[,9])
names(rb) = "value"
rb_count = tally(group_by(rb, value), sort = T)
percent2 = (rb_count[,2]/sum(rb_count[,2]))*100
names(percent2) = "weight"
rb_count = cbind(rb_count, percent2, group = "rb")
rb_count = as.data.frame(rb_count)
pb_count = rbind(wb_count, rb_count)
dist = sqrt((pb_count[,1])^2 + (pb_count[,2])^2)
pb_count = cbind(pb_count, dist)

g = ggplot(pb_count, aes(x=n, y=value, size = weight)) +
  stat_density2d(alpha = 0.2) +
  geom_point(aes(x = n, y= value, color = weight,shape = group), alpha = 0.2) +
  #scale_colour_gradient(limits = c(1460, 39440),low = "firebrick4", high = "lightgoldenrodyellow")+
  geom_line(aes(x = n, y = value, color = weight), alpha = 0.2)+
  #scale_colour_brewer(palette = "Set1") +
  scale_shape_manual(values = c(15,18))+
  scale_colour_gradientn(colours=c("red","green","purple"))+
  theme(panel.background = element_rect(fill = "black"), 
        axis.text.x = element_text(face = "bold", color ="gray18" , size = 5, angle = 45 ),
        axis.text.y = element_text(face = "bold", color = "gray18", size = 5, angle = 45 ),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank(),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        legend.position = "none") +xlab("") + ylab("")
g
ggsave("/Users/Xin/Documents/data_visulization/lucky_num.png", plot = g, dpi = 600)
