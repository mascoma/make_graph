library(reshape2)
library(ggplot2)

varmeth <- read.table("/Users/Xin/Desktop/K_methy_project/oldfiles/varmeth_final_colored.txt", sep="\t", head=T)
head(varmeth)
locuslocation<-vector(mode="character", length = 99)
for (j in 1:99) {
  locuslocation[j]<-paste(varmeth[j, 5],varmeth[j, 2], sep="_")
}
head(locuslocation)
Location <- rep(locuslocation, 4)
Temperature <- c(rep(30, 99),rep(40,99), rep(65, 99), rep(77, 99)) 
TempStatus <- c(varmeth[,18], varmeth[,19], varmeth[,20], varmeth[,21])
Locus_Location<-as.character(Location)
data<- as.data.frame(cbind(Locus_Location, Temperature , TempStatus))
head(data)
Status<- vector(mode="character", length = length(data[, 3]))
for(i in 1: length(data[, 3])){
  if ((as.numeric(data[i, 3]) == 1) || (as.numeric(data[i, 3]) == 4)|| (as.numeric(data[i, 3]) == 5)){
    Status[i] = "Undetermined"
  }
  else if ((as.numeric(data[i, 3]) == 2) || (as.numeric(data[i, 3]) == 3)) {
    Status[i] = "Unmethylated"
  }
  else if ((as.numeric(data[i, 3]) == 6) || (as.numeric(data[i, 3]) == 7)) {
    Status[i] = "Methylated"
  }
}
head(Status)
data= cbind(data, Status)
head(data)

p<-ggplot(data, aes(Temperature, Locus_Location)) + 
  geom_tile(aes(fill = Status), colour = "gray22") + scale_y_discrete(limits = as.character(data[1:99,1])) + 
  scale_fill_manual(values=c("lightcoral", "lemonchiffon4", "lightblue3"))  
  ## could modify colors
p
ggsave("/Users/Xin/Documents/data_visulization/methheatmap.png",width=4, height = 12,plot=p)
