
# Paso 1: Cargar paquetes (ojo, en algunos casos se deben instalar primero las librerías)
library(tidyverse)
library(syuzhet)
library(tidytext)
library("NLP")
library("twitteR")
library("syuzhet")
library("tm")
library("SnowballC")
library("stringi")
library("topicmodels")
library("syuzhet")
library("twitteR")
library("ROAuth")
library("ggplot2")
library("tm")
library("rio")

# Paso 2: Importar datasets
text.df <- tibble(text = str_to_lower(IG_data$Text))

# Paso 3: Analizar sentimientos con NRC
#Español: emotions <- get_nrc_sentiment(text.df$text, lang="spanish")
#Inglés: emotions <- get_nrc_sentiment(text.df$text)

emo_bar <- colSums(emotions)
emo_sum <- data.frame(count=emo_bar, emotion=names(emo_bar))

# Paso 4: Crear una barplot con base en las ocho emociones 
emo_sum<-data.frame(colSums(emotions[,]))

names(emo_sum)<-"Score"
emo_sum<-cbind("sentiment"=rownames(emo_sum),emo_sum)
rownames(emo_sum)<-NULL

ggplot(data=emo_sum,aes(x=sentiment,y=Score))+geom_bar(aes(fill=sentiment),stat = "identity")+
  theme_minimal() +
  theme(legend.position="none")+
  xlab("Emociones")+ylab("n")+ggtitle("Emotion Mining: Emociones manifestadas")+
  scale_x_discrete(labels=c('Enojo','Anticipación','Disgusto','Miedo','Alegría','Negatividad','Positividad','Tristeza','Sorpresa','Confianza'))

#Paso 5: Exportar visualización
ggsave("Análisis_emociones.png", width = 68, height = 38, units = "cm")
