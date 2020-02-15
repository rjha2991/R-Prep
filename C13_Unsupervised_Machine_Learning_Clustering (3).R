setwd ("D:/IMT Ghaziabad/Course Related (PGDM)/Introduction to R in Business Application/R-codes")

#Lesson13_Unsupervised Machine Learning_ clustering 

# Unsupervised Machine Learning Technique - k-mean Cluster Analysis 

# step1 : plot the existing species
getwd()
infy=read.csv("Infy.csv")
View(infy)
dim(Infy)
str(Infy)

library(ggplot2)
ggplot(iris, aes(Petal.Length, Petal.Width, color = Species)) + geom_point()

# step2 : create new clusters using k-mean clustering and plot them 

set.seed(20)
?kmeans
irisCluster <- kmeans(infy[, c(3,13)], 3, nstart = 20)
irisCluster
str(irisCluster)

ggplot(iris, aes(Petal.Length, Petal.Width, color = irisCluster$cluster)) + geom_point()


# step3 : check how accurately new clusters group the cases 

table(irisCluster$cluster, iris$Species)


# Unsupervised Machine Learning Technique - hierarchical Cluster Analysis 

# step 1: the same 
# step2 : create new clusters using hierarchical clustering 


clusters <- hclust(dist(iris[, 3:4])) # By default, the complete linkage method is used.
plot(clusters)

clusterCut <- cutree(clusters, 3) # this is not cutting the tree (?)
clusterCut
plot(clusters)

# step3 : check how accurately new clusters group the cases

table(clusterCut, iris$Species)

# We can see from the figure that the best choices for 
# total number of clusters are either 3 or 4



# Step 4: Let us see if we can make it better by using a different linkage method. 
# This time, we will use the mean linkage method:
  
clusters <- hclust(dist(iris[, 3:4]), method = 'average')
plot(clusters)

clusterCut <- cutree(clusters, 3)
table(clusterCut, iris$Species)

# let's try 4 clusters 

clusters <- hclust(dist(iris[, 3:4]), method = 'average')
plot(clusters)

clusterCut <- cutree(clusters, 4)
table(clusterCut, iris$Species) # distribution of elements suggest that 4-cluster
# not a solution. 

#===========================================================================


# Let's run a PCA on IRIS dataset

data(iris)
head(iris, 3)

# We will apply PCA to the four continuous variables and use the 
# categorical variable to visualize the PCs later. Notice that in the following
# code we apply a log transformation to the continuous variables 
# and set center and scale equal to TRUE in the call to prcomp to standardize 
# the variables prior to the application of PCA.

# log transform 
iris_log <- log(iris[, 1:4])
iris_species <- iris[, 5]

# apply PCA - scale = TRUE is highly advisable, the default is FALSE. 
iris_pca <- prcomp(Iris_log, center = TRUE, scale = TRUE)

# print method
print(iris_pca)

# Analyzing the results

# The function prcomp stands for principal component. 
# The print method returns the standard deviation of each of the four PCs, 
# and their rotation (or loadings), which are the coefficients of the linear 
# combinations of the continuous variables.

# plot method
plot(iris_pca, type = "l")

# The plot method returns a plot of the variances (y-axis) associated 
# with the PCs (x-axis). The Figure below is useful to decide how many PCs
# to retain for further analysis. In this simple case with only 4 PCs 
# this is not a hard task and we can see that the first two PCs explain most 
# of the variability in the data.

# summary method
summary(iris_pca)

# We can see there that the first two PCs accounts for more than {95\%} 
# of the variance of the data.

# Let's predict PCs on last 2 obseravtions using tail()function 
predict(iris_pca, newdata=tail(iris_log, 2))

# plot the PCAs

install.packages("devtools")
library(devtools)
install_github("ggbiplot", "vqv")

library(ggbiplot)
g <- ggbiplot(iris_pca, obs.scale = 1, var.scale = 1,groups = iris_species, 
              ellipse = TRUE,circle = TRUE)
g <- g + scale_color_discrete(name = '')
g <- g + theme(legend.direction = 'horizontal', 
               legend.position = 'top')
print(g)

