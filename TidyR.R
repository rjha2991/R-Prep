library(tidyr)
install.packages("tidyr")
library(readxl)
data<-read_excel(file.choose())


# Convert Entries(Cell) to a columns

wide<-spread(data,Subject,Grade)


#Convert column to Entries

long<-gather(wide,Subject,Marks,c(English,Hindi,Maths))


# Separate entries based on comma 
data2<-read_excel(file.choose())

newdata<-separate(data2,Place,c("City1","City2"))

# Reunite them
reunite<-unite(newdata,City_Combined, c(City1,City2),sep=",")
