# 1.cargar librerías
library(NLP)
library(ggplot2)
library(tm)
source('5.crear_matriz.R')

#2. definir variables de control
algorithm="bayes"
pstrong=0.5
pweak=1.0
prior=1.0
verbose=TRUE
comneg <- 0
compos <- 0
comneu <- 0
directorio = getwd()
polarity = "strongsubj"

#3. cargar corpus de documentos y lexico
corpus <- read.csv("datos/anexo_19_top_5000_favoritos_german_vargas.csv")
#corpus <- read.csv("datos/prueba.csv")
lexicon <- read.csv2("datos/anexo_12_lexico_ansen_fyrm_v0.04.csv",header = F)

#4. crear matriz y preparara documento de emociones clasificadas
#crear matriz de palabras según corpus
#sink("output.txt")
matrix <- create_matrix(corpus$text)
#calcular la cantidad de polaridades por categoría
counts <- list(positiva=length(which(lexicon[,2]=="positiva")),negativa=length(which(lexicon[,2]=="negativa")),neutral=length(which(lexicon[,2]=="neutral")), total=nrow(lexicon))
#crear documento de polaridades vacío
documento_polaridades_clasificadas <- c()

#5. algoritmo para clasificar la polaridad
for (i in 1:nrow(matrix)) {
	if (verbose) print(paste("DOCUMENT",i))
	scores <- list(positiva=0,negativa=0)
	doc <- matrix[i,]
	words <- findFreqTerms(doc,lowfreq=1)
	negation <- as.integer(0)
		
	for (word in words) {
		index <- match(word,lexicon[,1], nomatch=0)
		if (!is.na(match(word, 'no'))) {
		  negation <-as.integer(negation + 1)
		}
		if (index > 0) {
			entry <- lexicon[index,]
			category <- as.character(entry[[2]])
			count <- counts[[category]]
			score <- pweak
			if (algorithm=="bayes") score <- abs(log(score*prior/count))
			if (verbose) {
        print(paste("WORD:",word,"CAT:",category,"POL:",polarity,"SCORE:",score))
			}
			scores[[category]] <- scores[[category]]+score
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
		
		#best_fit <- names(scores)[which.max(unlist(scores))]
		#   ratio <- (abs(scores$positive/scores$negative))
		#   if (identical(ratio,1)==TRUE) best_fit <- "neutral"
		if (scores$positiva>scores$negativa) 
		{
		  best_fit <- "positiva" 
		  compos <- compos + 1
		}
		else if (scores$positiva<scores$negativa)
		{
		  best_fit <- "negativa" 
		  comneg <- comneg + 1
		}
		
		else if (all(scores$positiva == scores$negativa) == TRUE)
		{
		  best_fit <- "neutral" 
		  comneu <- comneu + 1
		}
		   
		documento_polaridades_clasificadas <- rbind(documento_polaridades_clasificadas,c(scores$positiva,scores$negativa,abs(scores$positiva/scores$negativa),best_fit, negation))
		if (verbose) {
			print(paste("POS:",scores$positiva,"NEG:",scores$negativa,"RATIO:",abs(scores$positiva/scores$negativa)))
			cat("\n")
		}
}
print(paste("Positivos: ",compos,"Negativos: ",comneg,"Neutrales: ",comneu))
cat("\n")
sink()

#asignar nombres a las columnas
colnames(documento_polaridades_clasificadas) <- c("Positivo","Negativo","Positivo/Negativo","BEST_FIT", "Palabras Negativas")

#6. crear el data frame
#obtener la emoción de mayor puntaje para cada mensaje
polaridad = documento_polaridades_clasificadas[,4]
#sustituir NA's por "Desconocida"
polaridad[is.na(polaridad)] = "Desconocida"
#crear el data frame - unir textos con resultado de emociones
polaridades_df = data.frame(text=corpus, polaridad=polaridad, stringsAsFactors=FALSE)
#ordenar el data frame
polaridades_df = within(polaridades_df,polaridad <- factor(polaridad, levels=names(sort(table(polaridad), decreasing=TRUE))))
#exportar el data frame a un archivo plano
write.csv2(polaridades_df, file = paste(directorio,"/datos/favoritos_limpios_clasificados_polaridad_german_vargas.csv", sep=""))

#7. graficar las polaridades
ggplot(polaridades_df, aes(x=polaridad)) + 
  geom_bar(aes(y=..count.., fill=polaridad)) + 
  geom_label(aes(label=scales::percent(..count../sum(..count..))),stat="count", size = 3.5) +
  scale_fill_brewer(palette="Spectral") +
  labs(x="Polaridad", y="Mensajes - Tweets") +
  labs(title = "Análisis de polaridad en la red social Twitter - Germán Vargas LLeras", plot.title = element_text(size=12))
