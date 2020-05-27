# 1.cargar librerías
library(NLP)
library(ggplot2)
library(tm)
source('5.crear_matriz.R')

#2. definir variables de control
verbose=FALSE
algorithm="bayes"
prior=1.0
directorio = getwd()

#3. cargar corpus de documentos y lexico
corpus <- read.csv("datos/anexo_19_top_5000_favoritos_german_vargas.csv")
#corpus <- read.csv("datos/prueba.csv")

lexicon <- read.csv2("datos/anexo_12_lexico_ansen_fyrm_v0.04.csv",header = F)

#4. crear matriz y preparara documento de emociones clasificadas
#crear matriz de palabras según corpus
matrix <- create_matrix(corpus$text)
#calcular la cantidad de emociones por categoría
counts <- list(alegria=length(which(lexicon[,3]=="alegria")),tristeza=length(which(lexicon[,3]=="tristeza")),confianza=length(which(lexicon[,3]=="confianza")),aversión=length(which(lexicon[,3]=="aversión")),miedo=length(which(lexicon[,3]=="miedo")),ira=length(which(lexicon[,3]=="ira")),sorpresa=length(which(lexicon[,3]=="sorpresa")), anticipación=length(which(lexicon[,3]=="anticipación")), total=nrow(lexicon))
#crear documento de emociones vacío
documento_emociones_clasificadas <- c()

#5. algoritmo para clasificar la emoción
for (i in 1:nrow(matrix)) {
  if (verbose) print(paste("DOCUMENT",i))
  scores <- list(alegria=0,tristeza=0,confianza=0,aversión=0,miedo=0,ira=0, sorpresa = 0, anticipación = 0)
  doc <- matrix[i,]
  words <- findFreqTerms(doc,lowfreq=1)
  for (word in words) {
    for (key in names(scores)) {
      emotions <- lexicon[which(lexicon[,3]==key),]
      index <- match(word,emotions[,1],nomatch=0)
      if (index > 0) {
        entry <- emotions[index,]
        category <- as.character(entry[[3]])
        count <- counts[[category]]
        score <- 1.0
        if (algorithm=="bayes") score <- abs(log(score*prior/count))
        
        if (verbose) {
          print(paste("WORD:",word,"CAT:",category,"SCORE:",score))
        }
        scores[[category]] <- scores[[category]]+score
      }
    }
  }
  
  if (algorithm=="bayes") {
    for (key in names(scores)) {
      count <- counts[[key]]
      total <- counts[["total"]]
      score <- abs(log(count/total))
      scores[[key]] <- scores[[key]]+score
    }
  } else {
    for (key in names(scores)) {
      scores[[key]] <- scores[[key]]+0.000001
    }
  }
  
  best_fit <- names(scores)[which.max(unlist(scores))]
  ##if (best_fit == "disgust" && as.numeric(unlist(scores[2]))-3.09234 < .01) best_fit <- NA
  documento_emociones_clasificadas <- rbind(documento_emociones_clasificadas,c(scores$alegria,scores$tristeza,scores$confianza,scores$aversión,scores$miedo,scores$ira,scores$sorpresa, scores$anticipación,best_fit))
}

#asignar nombres a las columnas
colnames(documento_emociones_clasificadas) <- c("Alegria","Tristeza","Confianza","Aversion","Miedo","Ira","Sorpresa","Anticipacion","BEST_FIT")

#6. crear el data frame
#obtener la emoción de mayor puntaje para cada mensaje
emoción = documento_emociones_clasificadas[,9]
#sustituir NA's por "Desconocida"
emoción[is.na(emoción)] = "Desconocida"
#crear el data frame - unir textos con resultado de emociones
emociones_df = data.frame(text=corpus, emoción=emoción, stringsAsFactors=FALSE)
#ordenar el data frame
emociones_df = within(emociones_df,emoción <- factor(emoción, levels=names(sort(table(emoción), decreasing=TRUE))))
#exportar el data frame a un archivo plano
write.csv2(emociones_df, file = paste(directorio,"/datos/favoritos_limpios_clasificados_german_vargas.csv", sep=""))

#7. graficar las emociones
ggplot(emociones_df, aes(x=emoción)) + 
  geom_bar(aes(y=..count.., fill=emoción)) + 
  geom_label(aes(label=scales::percent(..count../sum(..count..))),stat="count", size = 3.5) +
  scale_fill_brewer(palette="Spectral") +
  labs(x="Categorías Emocionales", y="Mensajes - Tweets") +
  labs(title = "Análisis de emociones en la red social Twitter - Germán Vargas LLeras", plot.title = element_text(size=12))