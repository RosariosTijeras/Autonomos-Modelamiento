library(tidyr)
library(dplyr)
df <- read.csv("Titanic_Dataset1.csv",header=F)
df <- df %>% select(V2,V3,V5,V6,V8,V10)
colnames(df) <- c("Sobreviviente","Clase","Sexo","Edad","Hijos","Precio")
glimpse(df)
summary(df)

df$Sobreviviente <- factor(df$Sobreviviente,levels = c("0","1"),labels = c("NO","Si"))
df$Clase <- factor(df$Clase,levels = c("1","2","3"),labels = c("Primera","Segunda","Tercera"))
df$Sexo <- factor(df$Sexo,levels = c("male","female"),labels = c("Masculino","Femenino"))
summary(df)

df <- na.omit(df)
boxplot(df$Edad)
df <- df %>% filter(df$Edad<90)
boxplot(df$Edad)
table(df$Sobreviviente)
prop.table(table(df$Sobreviviente))
round(prop.table(table(df$Sobreviviente)),2)
table(df$Clase)
table(df$Sexo)
table(df$Sobreviviente,df$Clase)
table(df$Sobreviviente,df$Sexo)
table(df$Sobreviviente,df$Hijos)

library(ggplot2)
ggplot(df,aes(y=Edad,fill=Sobreviviente))+geom_boxplot()
ggplot(df,aes(y=Precio,fill=Sobreviviente))+geom_boxplot()
df$Precio <- NULL

library(gridExtra)
g1 <- ggplot(df,aes(y=Edad,fill=Sobreviviente))+geom_boxplot()
g2 <- ggplot(df,aes(y=Hijos,fill=Sobreviviente))+geom_boxplot()
grid.arrange(g1,g2,nrow=2,ncol=1)

library(rpart)
library(rpart.plot)

arbol <- rpart(Sobreviviente~Clase+Sexo+Edad+Hijos,data=df)
rpart.plot(arbol)

indices <- sample(1:nrow(df),600,replace = F)
df_entrena <- df[indices,]
df_valida <- df[-indices,]

arbol2 <- rpart(Sobreviviente~Clase+Sexo+Edad+Hijos,data=df_entrena)
rpart.plot(arbol2)

predic <- predict(arbol2,df_valida,type = "class")
df_valida$Prediccion <- predic

(sum(diag(table(df_valida$Sobreviviente,df_valida$Prediccion))))/nrow(df_valida)

library(caret)
confusionMatrix(table(df_valida$Sobreviviente,df_valida$Prediccion))