library(dplyr)
library(tidyr)
library(ggplot2)
library(rpart)
library(rpart.plot)
library(caret)

# Set working directory to the folder containing the CSV file
setwd("c:/Users/mario/OneDrive/Documentos/Universidad/Tercer semestre/Modelamiento/Codigos_en_clase/Unidad_2_Tema_2")
df <- read.csv("credit_score.csv")
glimpse(df)
summary(df)
colnames(df) <- c("Edad","Genero","Ingresos","Educacion","Estado_civil","Hijos","Predio","Puntaje")
df$Genero <- factor(df$Genero)
df$Estado_civil <- factor(df$Estado_civil)
df$Predio <- factor(df$Predio)

library(stringr)
df$Educacion <- str_replace(df$Educacion,"'s Degree","")
df$Educacion <- str_replace(df$Educacion," Diploma","")
df$Educacion <- factor(df$Educacion,levels = c("High School","Associate","Bachelor","Master","Doctorate"))
glimpse(df)
summary(df)

plot(df$Edad,df$Ingresos)
plot(df$Edad,df$Puntaje)
plot(df$Ingresos,df$Puntaje)
df$credit_score <- cut(df$Puntaje,breaks=c(-Inf,70,85,+Inf),labels =c("Slow","Medium","High"),ordered_result = T )


ggplot(df,aes(x=credit_score,y=Ingresos,fill=credit_score))+geom_boxplot()

ggplot(df, aes(x=Ingresos, fill=credit_score))+geom_density(alpha=0.5)


# normalidad
Medium <- df %>% filter(credit_score=="Medium")
shapiro.test(Medium$Edad)
anova <- aov(Edad~credit_score, df)
summary(anova)

#categorica

table(df$Educacion, df$credit_score)
table(df$Estado_civil, df$credit_score)
table(df$Genero, df$credit_score)

install.packages("ggmosaic")
library(ggmosaic)

ggplot(df, aes(x = Genero, fill = credit_score)) +
  geom_bar(position = "fill") +
  ylab("Proportion") +
  scale_y_continuous(labels = scales::percent_format()) +
  labs(fill = "Credit score", x = "Genero", title = "Proportion of credit score by Genero")

ggplot(df, aes(x = Educacion, fill = credit_score)) +
  geom_bar(position = "fill") +
  ylab("Proportion") +
  scale_y_continuous(labels = scales::percent_format()) +
  labs(fill = "Credit score", x = "Educacion", title = "Proportion of credit score by Genero")

chisq.test(df$credit_score, df$Educacion)

##modelo

df$Puntaje <-NULL


indices <- sample(1:nrow(df),120,replace=F)
df_entrena <- df[indices,]
df_valida <- df[-indices,]

library(randomForest)

bosque <- randomForest(credit_score~.,df_entrena)

predic <- predict(bosque,df_valida, type="class")
df_valida$prediccion <- predic

confusionMatrix(df_valida$credit_score, df_valida$prediccion)

varImpPlot(bosque)
