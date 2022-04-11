x <- 10
x
x <- 5
x
5 -> x
x
edad <- c(15, 12, 27, 55, 63, 63, 24, 21, 70)
table(edad)
a <- c(4,3,5)
b <- c(1.1, 4.67, 5.1, 6.8)
letras <- c("hombre", "mujer", "no sabe/no responde")
genero <- c(1,1,2,1,2,2,1,2)
ingreso <- c(100000, 300000, 500000, 340000, 300000, 500000, 650000, 410000, 750000)
acuerdo <- c(1,1,3,2,4,1,5,3,2)
aborto <- data.frame(genero, ingreso, acuerdo)
aborto <- data.frame(genero, ingreso, acuerdo)
genero <- c(1,1,2,1,2,2,2,1,2)
aborto <- data.frame(genero, ingreso, acuerdo)
aborto
View(aborto)
save(aborto, file="aborto.RData")
remove(aborto)
rm(list = ls())