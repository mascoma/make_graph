library(ggplot2)
# dataset include two groups of data defined by "Sample"
ggplot(ICC_ICW, aes(x = reorder(taxa, Percent), y = Percent, fill = Sample)) +
geom_bar(stat = "identity",position = "dodge",  colour = "black") +
scale_fill_brewer(palette = "Pastel1") +
theme(axis.text.x = element_text(angle=75, hjust=1, size = 8),
panel.grid.major.y = element_blank(),
panel.grid.minor.y = element_blank(),
panel.grid.major.x = element_line(colour="grey60", linetype="dashed")) +
xlab("Taxa")
ggsave(output, width = 10, height = 6)
