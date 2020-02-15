require(stringr)
name<-c("apple","banana","mango","apple")
toupper(words1)
str_to_title(words1)
dataset1<-data(mtcars)
data(iris)
head(iris)
head(mtcars)
str(mtcars)
roll<-c(1:3)
roll
df3<-data.frame(name,roll)
sample1<-"dkfd. djfkd jflkad. fdjlnj. jfda flja
faljfl ajflka. flakfa flald fd fd dfddsd
fadfdsf
fdsafd
efdddd
fdsaf
f
adfad"
str_count(sample1,boundary("sentence"))
?str_count()
str_count(sample1,"fd")
grep("apple",name)
?grep()
getwd()
data1<-read.csv("Data1.csv")
View(data1)
require(stringr)
str_to_title(data1$name)
library(dplyr)
abc<-data1 %>%
filter(str_detect(data1$name,"Aamer"))
View(abc) 
str(flights)
library(hflights)            
install.packages("hflights")
flights<-tbl_df(hflights)
flights
filter(flights,Year==2011,DayofMonth==1)
filter(flights,DayofMonth==1 | DayofMonth==2)
filter(flights,UniqueCarrier %in% c("AA","UA"))
head(flights)
flights%>%
select(Year,DayofMonth,FlightNum,AirTime)%>%
  filter(Year==2011,AirTime>60)
flights%>%
  select(Year,DayofMonth,FlightNum,AirTime)%>%
  arrange(AirTime)#desc for descending

flights<-flights%>%
  filter(Year==2011)%>%
select(Year,FlightNum,AirTime)%>%
  mutate(NewTime=AirTime-60)
flights
flights %>%
group_by(Dest) %>%
  summarise(avg_delay=mean(ArrDelay,na.rm = TRUE))

flights%>%
  group_by(UniqueCarrier)%>%
summarise_each(funs(mean),Cancelled,Diverted)

flights%>%
  group_by(Month,DayofMonth)%>%
  summarise(Flight_Count=n())%>%
arrange(desc(Flight_Count))

flights%>%
  group_by(Dest)%>%
  summarise(Flight_Count=n(),Plane_Count=n_distinct(TailNum))%>%
arrange(desc(Flight_Count))

flights%>%
  group_by(UniqueCarrier)%>%
  select(Month,DayofMonth,UniqueCarrier,DepDelay)%>%
  filter(min_rank(desc(DepDelay))<=2)