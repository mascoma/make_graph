dist<-read.csv("/Users/Xin/Documents/Ratsnake_project/input/dist_sum.csv", header = T)

head(dist)

ggplot(dist, aes(x=median, fill=type)) +
  geom_histogram(position="identity", alpha=0.4, binwidth = 0.005)+scale_fill_discrete(name="gene-tree type",
                                                                                       breaks=c("bsdist", "ppdist"),
                                                                                       labels=c("BS tree", "PP tree")) +
  geom_vline(xintercept = 0.55, color = "coral3", linetype = "longdash") +
  
  geom_vline(xintercept = 0.42, color = "dodgerblue", linetype = "longdash") + 
  xlab("Normalized tree distances") + ylab("Density")

ggsave("/Users/Xin/Documents/visulization/bs_pp_dist.png")