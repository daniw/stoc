# Aufgabe 1
# =========
# Daten
flaech <- c(2.1,2.4,2.8,3.1,4.2,4.9,5.1,6.0,6.4,7.3,10.8,12.5,13.0,13.7,
            14.8,17.6,19.6,23.0,25.0,35.2,39.6)

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
x <- c( 2, 2, 6, 7, 7, 8, 8, 9)
y <- c(11,14,14,16,27,27,27,38)

# a)
sum(x)
sum(x^2)
sum(y)
sum(y^2)
sum(x*y)

# b)
(sum((x - mean(x))^2))/(length(x) - 1)
(sum(x^2) - length(x)*mean(x)^2)/(length(x) - 1)
# sxx berechnet: 
cor(x,x)*sd(x)^2
# vereinfacht: 
sd(x)^2

# c)


# Aufgabe 3
# =========


# Aufgabe 4
# =========

# Daten
versum <- c(4,10,20, 30,40,80,120)
veranz <- c(0,20,160,80,40,88,12)
#sum(c(veranz))
veranzsum <- c(0,20,180,260,300,388,400) # kann vielleicht auch automatisch
                                         # berechnet werden. 

# a)
#hist(veranz,breaks=versum)
plot(versum,veranz,type="s")
plot(versum,veranzsum,type="s")

# b)
# Es können zwischen 20 und 180 Personen mit höchstens 18'000.- versichert 
# sein. 
# Die 20% Personen (80), die am höchsten versichert sind sind mit mindestens 
# 40'000.- versichert. 
median(veranz)
mean(veranz)

#d)
# n-1

# Aufgabe 5
# =========

# a)
geysir <- read.table("http://stat.ethz.ch/Teaching/Datasets/geysir.dat",
header = TRUE) ## Datensatz einlesen
par(mfrow = c(2,2)) ## 4 Grafiken im Grafikfenster
hist(geysir[,"Zeitspanne"])
hist(geysir[,"Zeitspanne"], breaks = 20)
hist(geysir[,"Zeitspanne"], breaks = seq(41, 96, by = 11))
par(mfrow=c(1,1))
# Es gibt zwei Anhäufungen von Zeitspannen. 
# Speziell fällt auf, dass beim letzten Diagramm eine der beiden Anhäufungen 
# verschwindet. Daher ist die letze Darstellung nicht brauchbar. 

# b)
hist(geysir[,"Eruptionsdauer"])
# Es fällt auf, dass ebenfalls zwei Anhäufungen existieren. Um zu klären, ob 
# zwischen der Zeitspanne und der Eruptionsdauer ein Zusammenhang besteht, wird 
# ein Streudiagramm erstellt
plot(geysir[,"Zeitspanne"],geysir[,"Eruptionsdauer"])
# Dabei wird ersichtlich, dass tatsächlich ein Zusammenhang zwischen der 
# Zeitspanne und der Eruptionsdauer besteht. Ein ähnliches Resultat erhält man, 
# wenn die Korrelation zwischen der Zeitspanne und der Eruptionsdauer berechnet 
# wird.   
cor(geysir[,"Zeitspanne"],geysir[,"Eruptionsdauer"])

# Aufgabe 6
# =========

# Daten einlesen
url <- "http://stat.ethz.ch/Teaching/Datasets/klaerschlamm.dat"
schlamm.all <- read.table(url, header = TRUE)
schlamm <- schlamm.all[,-1] ## Labor-Spalte entfernen

# a)
boxplot(schlamm)
summary(schlamm) # arithmetisches Mittel: Mean
                 # Median: Median
# Bei folgenden Proben ist es plausibel, dass die Konzentration unter 400 mg/kg 
# liegt: 
# Pr1
# Pr4
# Pr5
# Pr6
# Pr9

#b)
## Fuer jede Spalte Median berechnen
med <- apply(schlamm, 2, median)
## Median von jeder *Spalte* abziehen
schlamm.centered <- scale(schlamm, scale = FALSE, center = med)
## Boxplot zeichnen. Dazu zuerst data-frame transponieren
boxplot(data.frame(t(schlamm.centered)))

# Um systematische Fehler zu finden wird der Median der einzelnen Labors mit 
# dem Median aller Labors verglichen. 
apply(schlamm.centered, 1, median)
# Um systematische Fehler einfacher erkennen zu können, werden obige Daten 
# geplottet. 
plot(apply(schlamm.centered, 1, median))
# Der Idealfall wird mit einer Linie eingezeichnet. 
abline(a=0,b=0)
# Vor Labor 15 hat einen grossen systematischen Fehler. 
# Die Labore 3, 4, 5 und 11 weisen keinen systematischen Fehler auf. 

# Um Zufallsfehler erkennen zu können wird die Standardabweichung der 
# einzelnen Labore betrachtet. 
apply(schlamm.centered, 1, sd)
# Auch die Standardabweichung wir geplottet. 
plot(apply(schlamm.centered, 1, sd))
abline(a=0,b=0)
# Grosse Zufallsfehler sind bei den Laboren 21 und 15 vorhanden. 

# Qualität der Analysen
par(mfrow=c(2,1))
plot(apply(schlamm.centered, 1, median),ylab="median")
abline(a=0,b=0)
plot(apply(schlamm.centered, 1, sd),ylab="sd")
abline(a=0,b=0)
par(mfrow=c(1,1))
# Die Qualität der Analysen ist bei den Laboren 4 und 5 besonders gut. 
# Bei diesen Laboren trat kein systematischer Fehler auf und der Zufallsfehler 
# war klein. 
