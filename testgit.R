#fichier test pour github
#
#
#library(data.table)
library(dplyr)
##library(data.table)
flights <- fread("../DONNEES/flights14.csv")
## 2.
f <- tbl_dt(flights)
## 3.
jfk <- filter(f,origin=="JFK")
## 4.
filter(f,(origin=="JFK")&(month==7))
## 5.
arrange(jfk,month,day,dep_time)
## 6.
arrange(jfk,month,day,desc(dep_time))
## 7.
rm(jfk)
## 8.
names(f)
## 9.
select(f,year)
## 10
select(f,1)
## 11
is.tbl(select(f,1))
## 12.
filter(f,origin=="JFK")%>%
  group_by(month)%>%
  summarise(n())
## 13.
count(filter(f,origin=="JFK"),month)
## 14.
tally(group_by(filter(f,origin=="JFK"),month))
##15.
filter(f,origin=="JFK")%>%
  group_by(month,day)%>%
  summarise(month,n=n())%>%
  group_by(day)%>%
  summarise(moy=mean(n))
## 16.
count(filter(f,origin=="JFK"),month,day)
## 17.
filter(f,origin=="JFK")%>%
  group_by(month,day)%>%
  summarise(n())
## 18.
filter(f,(origin=="LAX")&(dest=="JFK"))%>%
  summarise(n())
## 19.
group_by(f,carrier)%>%
  summarise(mdep_delay=mean(dep_delay),marr_delay=mean(arr_delay))

## 20.
mutate(f,d2=distance^2)
## 21.
transmute(f,d2=distance^2)
## 22
DT = data.table(ID = c("b","b","b","a","a","c"), a = 1:6, b = 7:12, c=13:18)
DT2 = DT[, .(val = paste(a,b,sep=":"))]
## 23.
t1 <- tbl_dt(DT)
t2 <- tbl_dt(DT2)
## 24, 25, 26
## de t1 vers t2
transmute(t1,val= paste(a,b,sep=":"))
## de t2 vers t1 (pour les colonnes a et b seulement)
aa=transmute(t2,blop=str_split(val,":"))
is.data.frame(aa) ## on a perdu la structure, autant y aller franco:
f1 <- function(x) return(as.numeric(x[1]))
f2 <- function(x) return(as.numeric(x[2]))
cbind.data.frame(a=unlist(lapply(aa$blop,f1)),
                 b=unlist(lapply(aa$blop,f2)))
## 27.
do(group_by(f,month),head(.2))
