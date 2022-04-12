
#CARGAR DATOS

titanic <- read.csv(
  "https://raw.githubusercontent.com/MarioTataje/Administracion-de-la-informacion-Labs/main/lab%202/titanic_data.csv",
  header = TRUE, sep = ","
)

#INSPECCION DE DATOS
View(titanic)
head(titanic, 10)
tail(titanic, 10)
names(titanic)
str(titanic)
summary(titanic$Age)



titanic$Survived <- as.factor(titanic$Survived)
titanic$Pclass <- as.factor(titanic$Pclass)
titanic$Sex <- as.factor(titanic$Sex)
titanic$Embarked <- as.factor(titanic$Embarked)
str(titanic)

#LIMPIEZA DE DATOS

#funcion sin_valor(dataframe) que desliega cuantos valores NA posee cada variable

sin_valor <- function(x){
  sum = 0
  for(i in 1:ncol(x))
  {
    cat("En la columna",colnames(x[i]),"total de valores NA:",colSums(is.na(x[i])),"\n")
  }
}

sin_valor(titanic)

#funcion en_blanco(dataframe) que desliega cuantos valores en blanco posee cada variable
en_blanco <- function(x){
  sum = 0
  for(i in 1:ncol(x))
  {
    cat("En la columna",colnames(x[i]),"total de valores en blanco:",colSums(x[i]==""),"\n")
  }
}

en_blanco(titanic)

#LIMPIEZA DE EMBARKED

titanic$PassengerId[titanic$Embarked == ""]

titanic$Pclass[titanic$PassengerId == "62"]
titanic$Fare[titanic$PassengerId == "62"]


titanic$Pclass[titanic$PassengerId == "830"]
titanic$Fare[titanic$PassengerId == "830"]

library(dplyr)
embark_fare <- titanic%>%filter(PassengerId!=62 & PassengerId!=830)

library(ggplot2)
library(scales)


ggplot(data = embark_fare, aes(x = Embarked, y = Fare, fill = factor(Pclass))) +
  geom_boxplot() +
  geom_hline(aes(yintercept = 80),
             colour = "red", linetype = "dashed", lwd = 2) +
  scale_y_continuous(labels = dollar_format()) +
  theme_bw()

titanic$Embarked[c(62, 830)] <- "C"

#LIMPIEZA DE AGE

#vEMOS LOS VALORES ATIPICOS
hist(titanic$Age)
#VERIFICAMOS LA MEDIA ANTES DE EXCLUIR DATOS ATIPICOS
mean(titanic$Age, na.rm = TRUE)

#EXCLUIMOS VALORES ATIPICOS
clean_ages <- titanic%>%filter(Age < 60)
#VERIFICAMOS LA NUEVA MEDIA
mean(clean_ages$Age, na.rm=TRUE)
#VERIFICAMOS SI LA MEDIANA SE APROXIMA A LA MEDIA
median(clean_ages$Age, na.rm=TRUE)

#REEMPLAZAMOS LOS VALORES NULOS CON LA MEDIANA
titanic$Age[is.na(titanic$Age)] <- 28 

#VERFIFICAMOS LA ACTUALIZACION DE DATOS
sum(is.na(titanic$Age))
View(titanic)

#VIZUALIZACION GRAFICA

#A
table(titanic$Survived)

barplot(table(titanic$Survived), main="Pasajeros en Titanic", names=c("Murieron", "Sobrevivieron"))

prop.table(table(titanic$Survived))

#B

barplot(table(titanic$Pclass), main="Pasajeros de Titanic por Cl
ase", names= c("Primera", "Segunda", "Tercera"))

table(titanic$Sex)

barplot(table(titanic$Sex), main="Pasajeros del Titanic por Gen
ero", names= c("Mujer", "Hombre"))

counts = table(titanic$Survived, titanic$Sex)

#C

barplot(counts, col=c("green","yellow"), legend = c("Murieron", "Sobr
evivieron"), main = "Sobreviviencia de Pasajeros por Genero")


counts1 = table(titanic$Survived, titanic$Pclass)
barplot(counts1, col=c("green","yellow"), legend = c("Murieron","Sobr
evivieron"), main = "Sobreviviencia de Pasajeros por Clase", names= c("
Primera", "Segunda", "Tercera"))

