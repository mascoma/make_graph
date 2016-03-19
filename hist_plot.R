library(ggplot2)
inputdir <- "/Users/Xin/Documents/Ratsnake_project/input/dist_sum.csv"
outputdir <- "/Users/Xin/Documents/data_visulization/bs_pp_dist.png"
dist<-read.csv(inputdir, header = T)
head(dist)
g <- ggplot(dist, aes(x = median, fill = type)) +
  geom_histogram(position = "identity", alpha = 0.4, binwidth = 0.005) + 
  scale_fill_discrete(name = "types", breaks = c("bsdist", "ppdist"), 
                      labels = c("type1", "type2")) +
  geom_vline(xintercept = 0.55, color = "coral3", linetype = "longdash") +
  geom_vline(xintercept = 0.42, color = "dodgerblue", linetype = "longdash") + 
  xlab("x") + ylab("y")
ggsave(outputdir, plot = g)