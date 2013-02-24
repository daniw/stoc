# coding:utf-8     Anweisung an Scite, dieses File mit UTF-8 zu encoden.       

######################
# R-Einfuhrungsübung #
######################

# 1. Visualisierung von Daten und Berechnung von Kenngrössen
#    Das Dataframe d.fuel enthalt ¨ die Daten verschiedener Fahrzeuge aus 
#    einer amerikanischen Untersuchung der 80er-Jahre. Jede Zeile (row) 
#    enthält die Daten eines Fahrzeuges (ein Fahrzeug entspricht einer 
#    Beobachtung).

# 1a) Lesen Sie die Daten ein mit den folgenden R-Befehlen:
#     t.file <- "http://stat.ethz.ch/Teaching/Datasets/NDK/d.fuel.dat"
#     d.fuel <- read.table(t.file,header=T,sep=",")
#     Das Argument sep="," braucht es, weil die Kolonnen im File d.fuel.dat 
#     durch Kommata getrennt sind. Sie können übrigens den Inhalt des Files 
#     d.fuel.dat mit einem Internetbrowser anschauen, indem Sie die obige URL 
#     in Ihren Browser eintippen.

d.fuel <- read.table("d.fuel.dat",header=T,sep=",")

# Anmerkung zur Lösung: 
#   Das File d.fuel.dat wurde heruntergeladen und Arbeitspfad gespeichert. 
#   Daher muss beim Einlesen der Daten kein Pfad angegeben werden. 

# 1b) Betrachten Sie die eingelesenen Daten.
#     Im File d.fuel.dat wurden die Zeilen durchnumeriert und daher steht in 
#     der ersten Spalte die Nummer der Zeile. Die Spalten (columns) enthalten 
#     die folgenden Variablen: 
#       weight: Gewicht in Pounds 
#               (1 Pound = 0.45359 kg)
#       mpg:    Reichweite in Miles Per Gallon 
#               (1 gallon = 3.789 l; 1 mile = 1.6093 km)
#       type:   Autotyp

d.fuel

# 1c) Wählen Sie nur die fünfte Zeile des Dataframe d.fuel aus. Welche Werte 
#     stehen in der fünften Zeile?

d.fuel[5,]

# 1d) Wählen Sie nun die erste bis fünfte Beobachtung des Datensatzes aus.
#     So lässt sich übrigens bei einem unbekannten Datensatz ein schneller 
#     Überblick über die Art des Dataframe gewinnen.

d.fuel[1:5,]

# 1e) Zeigen Sie gleichzeitig die 1. bis 3. und die 57. bis 60. Beobachtung 
#     des Datensatzes an.

d.fuel[c(1:3,57:60),]

# 1f) Berechnen Sie den Mittelwert der Reichweiten aller Autos in Miles/Gallon.

mean(d.fuel[,"mpg"])

# 1g) Berechnen Sie den Mittelwert der Reichweite der Autos 7 bis 22.

mean(d.fuel[7:22,"mpg"])

# 1h) Erzeugen Sie einen neuen Vektor t.kml, der alle Reichweiten in km/l, und 
#     einen Vektor t.kg, der alle Gewichte in kg enthalt. ¨

t.kml <- d.fuel[,"mpg"]*1.6093/3.789
t.kg  <- d.fuel[,"weight"]*0.45359

# 1i) Berechnen Sie den Mittelwert der Reichweiten in km/l und denjenigen der 
#     Fahrzeuggewichte in kg.

mean(t.kml)
mean(t.kg)

# 1j) Zeichnen Sie ein Streudiagramm, welches den Verbrauch pro 100km als 
#     Funktion des Gewichtes in kg darstellt.

t.lkm <- 100/t.kml
plot(t.kg,t.lkm,xlab="Gewicht [kg]",ylab="Verbrauch[l/100km]")

# 1k) Machen Sie eine Stamm-Blatt-Darstellung der Benzinverbräuche pro 100 km. 
#     Bestimmen Sie den minimalen und maximalen Verbrauch.
#     R-Hinweis: stem()

stem(t.lkm)
min(t.lkm)
max(t.lkm)

# 1l) Zeichnen Sie zuerst ein Histogramm des Verbrauchs der Autos (pro 100km) 
#     mit den Defaulteinstellungen und dann ein Histogramm mit 15 Klassen 
#     statt nur 8, einer x-Achse von 0 bis 15 und einem Titel.

hist(t.lkm)
hist(t.lkm,nclass=15,xlim=c(0,15),
     main="Verteilung des Verbrauchs verschiedener Autos",
     xlab="Verbrauch [l/100km]",ylab="Häufigkeit")

# 1m) Zeichnen Sie einen Boxplot der Benzinverbräuche.
#     R-Hinweis: boxplot()

boxplot(t.lkm)

# 1n) Vergleichen Sie die Standardabweichung und den MAD der Benzinverbräuche 
#     miteinander (vgl. Stat. Datenanalyse, Kap. 2.3).
#     R-Hinweis: mad(), sd()

mad(t.lkm)
sd(t.lkm)

# Anmerkung zu Lösung
#   Man könnte mit dem Folgenden Befehl beide Werte miteinander ausgeben. 
#   c(mad(t.lkm),sd(t.lkm))

# 1o) Vergleichen Sie den Mittelwert und den Median der Benzinverbräuche in 
#     l/100km.

mean(t.lkm)
median(t.lkm)

# 2. Korrelationen (R-Funktion: cor())

# 2a) Erzeugen Sie den Vektor t.x mit den Werten -10,-9,...,9,10 und den 
#     Vektor t.x1 mit den Werten 0,1,...,9,10.
#     Erzeugen Sie dann die Vektoren t.y und t.y1, deren Elemente die 
#     Quadratwerte der entsprechenden Elemente von t.x bzw. t.x1 enthalten.

Lösung

# 2b) Zeichnen Sie die Streudiagramme t.y vs. t.x und t.y1 vs t.x1 .

Lösung

# 2c) Berechnen Sie die Korrelationskoeffzienten zwischen t.x und t.y bzw. 
#     zwischen t.x1 und t.y1. Warum sind die beiden Korrelationen so 
#     verschieden (vgl. Stat. Datenanalyse, Abschnitt 3.2.h)?