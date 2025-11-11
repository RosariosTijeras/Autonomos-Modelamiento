library(dplyr)
library(tidyr)

df <- iris
glimpse(df)
df <- df %>% select(-Species)

plot(df)
plot(df$Petal.Length, df$Petal.Width)

subdata <- df %>% select(Petal.Length, Petal.Width)
cluster <- kmeans(subdata, centers = 3)
cluster

as.numeric(cluster$betweenss/(as.numeric(cluster$betweenss) + as.numeric(cluster$tot.withinss)))
subdata$grupo <- cluster$cluster

plot(subdata$Petal.Length, subdata$Petal.Width, col = factor(subdata$grupo))

z <- numeric(5)
for (k in 2:6) {

    cluster <- kmeans(df, centers = k)
    #z[k - 1] <- as.numeric(cluster$betweenss/(as.numeric(cluster$betweenss) + as.numeric(cluster$tot.withinss)))
    z[k - 1] <- cluster$tot.withinss
}

plot(2:6, z, type = "b")
