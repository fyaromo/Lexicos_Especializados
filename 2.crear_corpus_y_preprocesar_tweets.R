library(dplyr) 
library(tm) #librería text mining

directorio = getwd()
ctweets = read.csv(paste(directorio,"/datos/gv5500.csv", sep=""),sep=";")

corpus_tweets = Corpus(VectorSource(ctweets$text)) #crear corpus de documentos con los tweets

#pasar los textos a minúsculas
corpus_tweets = tm_map(corpus_tweets, tolower) 

#remover las palabras vacías (stopwords): artículos, preposiciones, adverbios, pronombres
#cargar palabras vacías personalizadas
palabras_vacias = read.csv(paste(directorio,"/datos/anexo_8_palabras_vacias.csv", sep=""), header = FALSE)
palabras_vacias = as.character(palabras_vacias$V1)
corpus_tweets = tm_map(corpus_tweets, removeWords, c(palabras_vacias))

#remover todas las palabras que inicien con @
removerArroba <- function(x) {gsub('@\\w+ *', "", x)} 
corpus_tweets <- tm_map(corpus_tweets, content_transformer(removerArroba))

#remover todas las palabras que inicien con #
removerNumeral <- function(x) {gsub('#\\w+ *', "", x)}
corpus_tweets <- tm_map(corpus_tweets, content_transformer(removerNumeral))

#remover todas las direcciones tipo https://....
removerURL <- function(x) {gsub('http\\S*', "", x)}
corpus_tweets <- tm_map(corpus_tweets, content_transformer(removerURL))

#remover todas las palabras que inicien con /
removerBarraInclinada <- function(x) {gsub('\n', "", x)}
corpus_tweets <- tm_map(corpus_tweets, content_transformer(removerBarraInclinada))

#remover signos de puntuación
corpus_tweets = tm_map(corpus_tweets, removePunctuation)

#remover números
corpus_tweets = tm_map(corpus_tweets, removeNumbers)

#remover todas las palabras que inicien con jaj
removerjaj <- function(x) {gsub('jaj\\w+ *', "", x)} 
corpus_tweets <- tm_map(corpus_tweets, content_transformer(removerjaj))

#remover todas las palabras que inicien con eduaub
removereduaub <- function(x) {gsub('eduaub\\w+ *', "", x)}
corpus_tweets <- tm_map(corpus_tweets, content_transformer(removereduaub))

#remover todas las palabras que inicien con zz
removerzz <- function(x) {gsub('zz\\w+ *', "", x)}
corpus_tweets <- tm_map(corpus_tweets, content_transformer(removerzz))

#remover todas las palabras que inicien con edab
removeredab <- function(x) {gsub('edab\\w+ *', "", x)}
corpus_tweets <- tm_map(corpus_tweets, content_transformer(removeredab))

#remover signos de interrogación
removerSI1 <- function(x) {gsub('¿', "", x)}
corpus_tweets <- tm_map(corpus_tweets, content_transformer(removerSI1))
removerSI2 <- function(x) {gsub('?', "", x)}
corpus_tweets <- tm_map(corpus_tweets, content_transformer(removerSI2))

#remover la última palabra (incompleta) que tiene puntos suspensivos
removerPalConPuntos <- function(x) {gsub('…$', "", x)}
corpus_tweets <- tm_map(corpus_tweets, content_transformer(removerPalConPuntos))

#remover los puntos suspensivos que están en solitario
removerTresPuntos <- function(x) {gsub('…', "", x)}
corpus_tweets <- tm_map(corpus_tweets, content_transformer(removerTresPuntos))

#remover comillas
removerComillas1 <- function(x) {gsub('“', "", x)}
corpus_tweets <- tm_map(corpus_tweets, content_transformer(removerComillas1))

#remover comillas
removerComillas2 <- function(x) {gsub('”', "", x)}
corpus_tweets <- tm_map(corpus_tweets, content_transformer(removerComillas2))

#remover comillas
removerComillas3 <- function(x) {gsub('‘', "", x)}
corpus_tweets <- tm_map(corpus_tweets, content_transformer(removerComillas3))

#remover comillas
removerComillas4 <- function(x) {gsub('’', "", x)}
corpus_tweets <- tm_map(corpus_tweets, content_transformer(removerComillas4))

#remover admiración
removerAdmira1 <- function(x) {gsub('¡', "", x)}
corpus_tweets <- tm_map(corpus_tweets, content_transformer(removerAdmira1))

#remover admiración
removerAdmira2 <- function(x) {gsub('!', "", x)}
corpus_tweets <- tm_map(corpus_tweets, content_transformer(removerAdmira2))

#remover menor menor
removerMenorMenor <- function(x) {gsub('«', "", x)}
corpus_tweets <- tm_map(corpus_tweets, content_transformer(removerMenorMenor))

#remover guión
removerGuion <- function(x) {gsub('—', "", x)}
corpus_tweets <- tm_map(corpus_tweets, content_transformer(removerGuion))

#remover espacios (inicio, final), dejar un solo espacio entre palabras
corpus_tweets <- tm_map(corpus_tweets, stripWhitespace)
removerEspacioInicial <- function(x) {gsub('^ ', "", x)}
corpus_tweets <- tm_map(corpus_tweets, content_transformer(removerEspacioInicial))

#guardar los textos limpios
myDf <- data.frame(text = sapply(corpus_tweets, paste, collapse = " "), stringsAsFactors = FALSE)
write.csv2(myDf, file = paste(directorio,"/datos/anexo_19_top_5000_favoritos_german_vargas.csv", sep=""))