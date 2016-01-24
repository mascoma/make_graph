library('plotrix')
total = 3220928  
assigned = 2211826  
unassigned = 1009102  
genus= 1741930   
above_genus= 469896   
cellular = 2199641   
virus = 12185   
archaea = 2021856   
bacteria = 138349    
eukaryota = 395  
cellular_root = 39041  
ahs = 1984877  
anhs = 36979    
bhs = 118858   
bnhs = 19491   
ahsgenus = 1612629   
ahsnongenus = 372248   
bhsgenus = 118858   
bhsnongenus = 0  
colors=list(NO='white',total='black',unassigned='gray84',assigned='indianred4',genus='lightsalmon4',above_genus='navajowhite4',
            cellular='lightcoral',virus='dodgerblue4', archaea='lightpink3',bacteria='lightgoldenrod4',eukaryota='hotpink4',
            bhypersaline='lightgoldenrod3',bnonhypersaline='steelblue2',ahypersaline ='rosybrown2', anonhypersaline='lightcyan3', 
            bhsgenus='lightgoldenrod2', bnongenus='dodgerblue2', ahsgenus='lightpink', ahsnongenus='thistle2')
iniR=0.15
par(mar=c(2,2,2,2))
png('/Users/Xin/Documents/data_visulization/ICC_assignment_summary.png', width = 2000, height = 2000)
pie(1, radius=iniR,col=c('white'), border = NA, labels='')
title(main = "ICC reads assignment summary", sub = 'Total reads: 3220928', line = -2, cex.main = 4, cex.sub = 3)
floating.pie(0,0,c(unassigned,  virus, anhs,ahsnongenus,ahsgenus,bhsgenus,bhsnongenus,bnhs, eukaryota, cellular_root), radius=6*iniR, startpos=pi/2, col=as.character(colors[c('NO', 'NO', 'NO','ahsnongenus','ahsgenus','bhsgenus','NO','NO','NO', 'NO')]),border='white')
floating.pie(0,0,c(unassigned,  virus, anhs,ahs,bhs,bnhs, eukaryota, cellular_root), radius=5*iniR, startpos=pi/2, col=as.character(colors[c('NO', 'NO', 'anonhypersaline','ahypersaline','bhypersaline','bnonhypersaline','NO', 'NO')]),border='white')
floating.pie(0,0,c(unassigned,  virus, archaea,bacteria, eukaryota, cellular_root), radius=4*iniR, startpos=pi/2, col=as.character(colors[c('NO', 'NO', 'archaea','bacteria','eukaryota', 'NO')]),border='white')
floating.pie(0,0,c(unassigned,virus,cellular),radius=3*iniR, startpos=pi/2, col=as.character(colors[c('NO', 'virus','cellular')]),border='white')
floating.pie(0,0,c(unassigned, genus, above_genus), radius=2*iniR,startpos=pi/2, col=as.character(colors[c('unassigned','genus', 'above_genus')]), border = 'white')
floating.pie(0,0,c(unassigned, assigned), radius=1.2*iniR,startpos=pi/2, col=as.character(colors[c('unassigned','assigned')]), border = NA)
labelnames=c('Unassigned', 'Assigned', 'Assigned at genus level','Assigned above genus level','Cellular organisms', 'Virus_related', 'Archaea', 'Bacteria', 'Eukaryota', 'Hypersaline bacteria', 'Non-hypersaline bacteria', 'Hypersaline archaea', 'Non-hypersaline archaea', 'Hypersaline bacteria assigned at genus level', 'Hypersaline bacteria assigned above genus level', 'Hypersaline archaea assigned at genus level', 'Hypersaline archaea assigned above genus level')
legend(-1.1,0.9, labelnames, col=as.character(colors[-1:-2]), pch=15,bty='n', pt.cex = 5,cex = 2.5)
dev.off()