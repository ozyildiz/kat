setwd("/home/zined/Dropbox/umass/coursework/2017-611/final/results/")
library(plyr)

list1_raw<-read.table("/home/zined/Dropbox/umass/coursework/2017-611/final/results/list1.txt", sep=",", 
                col.names=c("subject","md5","controller","item_no","elem_no","item_type","group","sth","answer","correct","RT"),
                colClasses=c(rep("factor", 8), "character", "factor", "numeric"),
                fill=T, quote = "")

list2_raw<-read.table("/home/zined/Dropbox/umass/coursework/2017-611/final/results/list2.txt", sep=",", 
                col.names=c("subject","md5","controller","item_no","elem_no","item_type","group","sth","answer","correct","RT"),
                colClasses=c(rep("factor", 8), "character", "factor", "numeric"),
                fill=T, quote = "")

ages1=list1_raw[list1_raw$sth=="age",]$answer
ages2=list2_raw[list2_raw$sth=="age",]$answer
ages=append(list2_raw[list2_raw$sth=="age",]$answer, list1_raw[list1_raw$sth=="age",]$answer)

# Add column indicating which list the data comes from
list1_raw$list=as.factor("A")
list2_raw$list=as.factor("B")
# Merge the two data files
l=rbind(list1_raw,list2_raw)
# Remove Turkish characters
l[l$answer=="sanıyor",]$answer="saniyor"
l[l$answer=="düşünüyor",]$answer="dusunuyor"
l[l$answer=="hatırlıyor",]$answer="hatirliyor"
l[l$answer=="özledi",]$answer="ozledi"
l[l$answer=="gördü",]$answer="gordu"
# Columns to keep
keep=c("subject","item_no","item_type","answer","RT","list")
l=subset(l, select=keep)
l$speaker="do"
l[l$item_no%in%c(13,14,15),]$speaker="ikb"
l[l$item_no%in%c(16,17,18),]$speaker="de"
# Subsetting into conditions
# Practice items
lp=subset(l, item_type=="p")
# Experimental items
le=droplevels(subset(l, item_type=="e"))
#le$item_no<-factor(le$item_no,seq(7,18))

#le[le$list=="A",]$item_no=le[le$list=="A",]$item_no+1
#levels(le$item_no)=seq(7,18)
# List of factive sentences per list
fsl1=c(7,9,11,13,15,17)
fsl2=c(8,10,12,14,16,18)
le$condition=NA
le[le$list=="A"&le$item_no%in%fsl1,]$condition="f"
le[le$list=="A"&!(le$item_no%in%fsl1),]$condition="nf"
le[le$list=="B"&le$item_no%in%fsl2,]$condition="f"
le[le$list=="B"&!(le$item_no%in%fsl2),]$condition="nf"
le$vchoice=NA
le[le$answer=="saniyor"|le$answer=="biliyor",]$vchoice="sb"
le[le$answer=="hatirliyor"|le$answer=="dusunuyor",]$vchoice="dh"
le$answer_type=NA
le[le$answer=="biliyor"|le$answer=="hatirliyor",]$answer_type=1
le[le$answer=="dusunuyor"|le$answer=="saniyor",]$answer_type=0

le$item_no=factor(le$item_no,seq(from=7,to=18))

lea=droplevels(subset(le,le$list=="A"))
leb=droplevels(subset(le,le$list=="B"))

lea_r=xtabs(lea$answer_type~lea$item_no)
leb_r=xtabs(leb$answer_type~leb$item_no)

pl=table(seq(1:24))
j=1
k=1
for (i in seq(from=1,to=2*length(lea_r),by=2)){
  pl[i]=lea_r[j]/19
  j=j+1
}
for (i in seq(from=2,to=2*length(leb_r),by=2)){
  pl[i]=leb_r[k]/18
  k=k+1
}

#pl=data.frame(pl)
xa=c("7f","7","8nf","8f","9f","9nf","10nf","10f","11f","11nf","12nf","12f",
     "13f","13nf","14nf","14f","15f","15nf","16nf","16f","17f","17nf","18nf","18f")
plot(pl, xaxt="n", col=c("blue","red","red","blue"))
axis(side=1,at=1:24,labels=xa)

# Fillers
lf=droplevels(subset(l, item_type=="f"))
lf$item_type="poss"
# item numbers 19--24 are possessive examples; from 25--28 attitude report examples
att_exx=c(25,26,27,28)
lf[lf$item_no%in%att_exx,]$item_type="att"
lf$vchoice="go"
lf[lf$answer=="fark etti"|lf$answer=="unuttu",]$vchoice="fu"
lf$answer_type=0
# gordu and fark etti are coded as 1
lf[lf$answer=="gordu"|lf$answer=="fark etti",]$answer_type=1
lf_table=xtabs(lf$answer_type~lf$vchoice+lf$item_type)
lf_table[,1]=lf_table[,1]/(4*35) # Four att report items had farket- vs. unut-
lf_table[1,2]=lf_table[1,2]/35 # 1 possessive item had farket- vs. unut-
lf_table[2,2]=lf_table[2,2]/(5*35) # 5 possessive items had gor- vs. ozle-
# There is a bias for gordu over ozledi and fark etti over unuttu.
# Neg raising items
ln=droplevels(subset(l, item_type=="n"))
# Code: "low negation" as 1
ln$answer_type=0
ln[ln$answer=="Başkanın düşüncesi 'ortak bir karara varmak zor olmayacak' şeklinde."|ln$answer=="Ayşe'nin düşüncesi 'yağmur yağmıyor' şeklinde.",]$answer_type=1
# We could take the mean answer per participant.
ln_wide=xtabs(ln$answer_type~ln$subject+ln$item_no)
ln_wide=xtabs(ln$answer_type~ln$item_no+ln$subject)
# If we toss a fair coin 35 times, what is the probability of observing heads k times?
# Comprehension items
lc=droplevels(subset(l, item_type=="c"))
lc$condition=NA
lc[lc$list=="A"&lc$item_no=="35",]$condition="nf"
lc[lc$list=="A"&lc$item_no=="36",]$condition="f"
lc[lc$list=="B"&lc$item_no=="35",]$condition="f"
lc[lc$list=="B"&lc$item_no=="36",]$condition="nf"
lc$answer_type=0
lc[lc$answer=="Öğretmen Paris'te yaşamış."|lc$answer=="Referandumu yüzde yüzle kazanmış.",]$answer_type=1
# Proportion of factive vs. non-factive responses in each condition, in list A, B and pooled
lca=droplevels(subset(lc,lc$list=="A"))
lca_results=xtabs(lca$answer_type/19~lca$condition)
lcb=droplevels(subset(lc,lc$list=="B"))
lcb_results=xtabs(lcb$answer_type/16~lcb$condition)
lc_results=xtabs(lc$answer_type/35~lc$condition)
# Is there a difference between the two items?
lc_item_results=xtabs(lc$answer_type~lc$item_no+lc$list)
lc_item_results[,1]=lc_item_results[,1]/19
lc_item_results[,2]=lc_item_results[,2]/16
