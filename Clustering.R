data1<-read.csv("utility.csv")
#View(data1)
data1$Company<-as.factor(data1$Company)

#Scatter Plot
plot(Fuel.Cost~Sales,data1)
with(data1,text(Fuel.Cost~Sales,labels=Company,pos=4,cex=0.3))

#Normalize
z<-data1[,-c(1)]
m<-apply(z,2,mean)
s<-apply(z,2,sd)
z<-scale(z,m,s)

#Euclidean Distance

distance<-dist(z)
print(distance,digits = 2)

#Cluster Dendogram with complete linkage

hc.c<-hclust(distance)
plot(hc.c,labels = data1$Company)
plot(hc.c,hang=-1)

#Cluster Dendogram with average linkage

hc.a<-hclust(distance,method = "average")
plot(hc.a,hang=-1)


#Cluster Membership

member.c<-cutree(hc.c,3)
member.a<-cutree(hc.a,3)
table(member.c,member.a)

#Cluster Means

aggregate(z,list(member.c),mean)


#Silhoutte Plot

plot(silhouette(cutree(hc.c,3),distance))

#K means Clustering

kc<-kmeans(z,3)
plot(Sales~D.Demand,data1,col=kc$cluster)
