#Paso 1: Seleccionar columna en la tabla (es decir, variable)
text_unique <- combinado_geotagged_tijuana_centroculturaltijuana$description

#Paso 2: Instalar estos paquetes:
library(NLP)
library(tm)


#Paso 3: Converir a vectores
words.vec <- VectorSource(text_unique)
words.corpus <- Corpus(words.vec)

#Paso 4: Depurar caracteres
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(words.corpus, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")

#Paso 5: Convertir a minúsculas
docs <- tm_map(docs, content_transformer(tolower))

#Paso 6: Quitar números
docs <- tm_map(docs, removeNumbers)

#Paso 7: Quitar stopwords
docs <- tm_map(docs, removeWords, stopwords("english"))
docs <- tm_map(docs, removeWords, stopwords("spanish"))

#Paso 8: Quitar puntuaciones
docs <- tm_map(docs, removePunctuation)

#Paso 9: Quitar espacios en blanco
docs <- tm_map(docs, stripWhitespace)

#Paso 10: Quitar palabras específicas
docs <- tm_map(docs, removeWords, c("tijuana", "mexico", "México"))

#Paso 11: Convertir corpus a data frame
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing = TRUE)
df <- data.frame(word = names(v),freq = v)

#Paso 12: Construir WordCloud
library(RColorBrewer)
library(wordcloud)
display.brewer.all()
set.seed(1234)
wordcloud(words = df$word, freq = df$freq, min.freq = 9,
          max.words = 100, random.order = FALSE, rot.per = 0,
)

#Paso 13: Exportar tabla con palabras frecuentes
#Exportar tabla de Hashtags más frecuentes
library(tidytext)
library(tidyverse)

write.table(df, file="wordcloud_combinadotijuana.csv",sep=",")
