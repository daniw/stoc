# Aufgabe 1
# =========
# Daten
flaech <- c(2.1,2.4,2.8,3.1,4.2,4.9,5.1,6.0,6.4,7.3,10.8,12.5,13.0,13.7,14.8,17.6,19.6,23.0,25.0,35.2,39.6)

# a)
sum(flaech)
sum(flaech^2)

# b)
median(flaech)

# c)
mean(flaech)
sd(flaech)


# Aufgabe 2
# =========
# Daten
x <- c(2,2,6,7,7,8,8,9)
y <- c(11,14,14,16,27,27,27,38)

# a)
sum(x)
sum(x^2)
sum(y)
sum(y^2)
sum(x*y)


# Aufgabe 5
# =========

# a)
geysir <- read.table("http://stat.ethz.ch/Teaching/Datasets/geysir.dat",
header = TRUE) ## Datensatz einlesen
par(mfrow = c(2,2)) ## 4 Grafiken im Grafikfenster
hist(geysir[,"Zeitspanne"])
hist(geysir[,"Zeitspanne"], breaks = 20)
hist(geysir[,"Zeitspanne"], breaks = seq(41, 96, by = 11))
# 

# b)
hist(geysir[,"Eruptionsdauer"])