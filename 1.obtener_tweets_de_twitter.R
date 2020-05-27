#Análisis de Sentimiento en Twitter

# 1. cargar librerías
library(twitteR)
library(ROAuth)
library(xlsx)

# 2. Acceder a Twitter 
consumer_Key = "6kcxwMpzlgiMuOrix236wysZa"
consumer_secret = "lZHpIWckxBvnHr9u8AiIlmttTTY1UBwCeisEsKhas4yEiizshb"
access_token = "843659213670940672-AbJ4mSPNLxEnLFtLu7KMqB4DBVnJGNO"
access_secret = "zEE8AlOkhgYZloCb1IdfLuIPk4HA4ayfG8NTBXe2MSjsW"
setup_twitter_oauth(consumer_Key, consumer_secret, access_token, access_secret)

# 3. Definir parámetros de consulta
desde   = '2018-02-16'
hasta   = '2018-02-21'
periodo = "_16_a_21_febrero.xlsx"

# 4. Buscar y descargar Tweets 
#Tweets de Sergio Fajardo - Candidato a Presidencia
criterio_SFajardo = "@sergio_fajardo OR sergio_fajardo exclude:retweets"
ObtieneTweets     = searchTwitter(criterio_SFajardo, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
write.xlsx(tweets, file=paste("Sergio_Fajardo", periodo), sheet = "1")

#Tweets de Claudia López - Fórmula Visepresidencial de Sergio Fajardo
criterio_CLopez = "@ClaudiaLopez OR ClaudiaLopez exclude:retweets"
ObtieneTweets = searchTwitter(criterio_CLopez, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("Claudia_Lopez", periodo), sheet = "1")
write.csv2(tweets, file=paste("Claudia_Lopez", periodo), sep=";")

#Tweets de Germán Vargas - Candidato a Presidencia
criterio_GVargas = "@German_Vargas OR German_Vargas exclude:retweets"
ObtieneTweets = searchTwitter(criterio_GVargas, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("German_Vargas",periodo), sheet = "1")
write.csv2(tweets, file=paste("German_Vargas", periodo), sep=";")

#Tweets de Pinzón Bueno - Fórmula Visepresidencial de Germán Vargas
criterio_PBueno = "@PinzonBueno OR PinzonBueno exclude:retweets"
ObtieneTweets = searchTwitter(criterio_PBueno, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("Pinzon_Bueno", periodo), sheet = "1")
write.csv2(tweets, file=paste("Pinzon_Bueno", periodo), sep=";")

#Tweets de Gustavo Petro - Candidato a Presidencia
criterio_GPetro = "@petrogustavo OR petrogustavo exclude:retweets"
ObtieneTweets = searchTwitter(criterio_GPetro, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("Gustavo_Petro", periodo), sheet = "1")
write.csv2(tweets, file=paste("Gustavo_Petro", periodo), sep=";")

#Tweets de Ángela María Robledo - Fórmula Vicepresidencial de Gustavo Petro
criterio_AMRobledo = "@angelamrobledo OR angelamrobledo exclude:retweets"
ObtieneTweets = searchTwitter(criterio_AMRobledo, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("Angela_Maria_Robledo", periodo), sheet = "1")
write.csv2(tweets, file=paste("Angela_Maria_Robledo", periodo), sep=";")

#Tweets de Humberto de la Calle - Candidato a Presidencia
criterio_HCalle = "@DeLaCalleHum OR DeLaCalleHum exclude:retweets"
ObtieneTweets = searchTwitter(criterio_HCalle, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("Humberto_De_La_Calle", periodo), sheet = "1")
write.csv2(tweets, file=paste("Humberto_De_La_Calle", periodo), sep=";")

#Tweets de Clara López Obregón - Fórmula Vicepresidencial de Humberto de la Calle
criterio_CObregon = "@ClaraLopezObre OR ClaraLopezObre exclude:retweets"
ObtieneTweets = searchTwitter(criterio_CObregon, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("Clara_Lopez_Obregon", periodo), sheet = "1")
write.csv2(tweets, file=paste("Clara_Lopez_Obregon", periodo), sep=";")

#Tweets de Iván Duque - Candidato a Presidencia
criterio_IDuque = "@IvanDuque OR IvanDuque exclude:retweets"
ObtieneTweets = searchTwitter(criterio_IDuque, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
write.xlsx(tweets, file=paste("Ivan_Duque", periodo), sheet = "1")
#write.csv2(tweets, file=paste("Ivan_Duque", periodo), sep=";")

#Tweets de Martha Lucia Ramírez - Fórmula Visepresidencial de Iván Duque
criterio_MLRamirez = "@mluciaramirez OR mluciaramirez exclude:retweets"
ObtieneTweets = searchTwitter(criterio_MLRamirez, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("Marta_Lucia_Ramirez", periodo), sheet = "1")
write.csv2(tweets, file=paste("Marta_Lucia_Ramirez", periodo), sep=";")

#Tweets de Piedad Córdoba - Candidata a la Presidencia
criterio_PCordoba = "@piedadcordoba OR piedadcordoba exclude:retweets"
ObtieneTweets = searchTwitter(criterio_PCordoba, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("Piedad_Cordoba", periodo), sheet = "1")
write.csv2(tweets, file=paste("Piedad_Cordoba", periodo), sep=";")

#Tweets de Jaime Araujo Rentería - Fórmula Visepresidencial de Piedad Córdoba
criterio_JAraujo = "@JaimeAraujoR OR JaimeAraujoR exclude:retweets"
ObtieneTweets = searchTwitter(criterio_JAraujo, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("Jaime_Araujo_Renteria", periodo), sheet = "1")
write.csv2(tweets, file=paste("Jaime_Araujo_Renteria", periodo), sep=";")

#Tweets de Rodrigo Londoño - Candidato Presidencial
criterio_RLondono = "@TimoFARC OR TimoFARC OR Timochenko exclude:retweets"
ObtieneTweets = searchTwitter(criterio_RLondono, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("Rodrigo_Londoño_Timochenko", periodo), sheet = "1")
write.csv2(tweets, file=paste("Rodrigo_Londoño_Timochenko", periodo), sep=";")

#Tweets de Imelda Daza - Fórmula Visepresidencial de Rodrigo Londoño
criterio_IDaza = "@Imeldadaza OR Imeldadaza exclude:retweets"
ObtieneTweets = searchTwitter(criterio_IDaza, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("Imelda_Daza", periodo), sheet = "1")
write.csv2(tweets, file=paste("Imelda_Daza", periodo), sep=";")

#Tweets de la opción Voto en Blanco
criterio_VMorales = "@MoralesViviane OR MoralesViviane exclude:retweets"
ObtieneTweets = searchTwitter(criterio_VMorales, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("Viviane_Morales", periodo), sheet = "1")
write.csv2(tweets, file=paste("Viviane_Morales", periodo), sep=";")

#Tweets de la opción Voto en Blanco
criterio_VBlanco = "@votoenblacocol OR votoenblacocol OR 'Voto en Blanco' exclude:retweets"
ObtieneTweets = searchTwitter(criterio_VBlanco, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("Voto_Blanco", periodo), sheet = "1")
write.csv2(tweets, file=paste("Voto_Blanco", periodo), sep=";")

#Tweets del partido político Compromiso Ciudadano
criterio_CCiudadano = "@compromisociu OR compromisociu exclude:retweets"
ObtieneTweets = searchTwitter(criterio_CCiudadano, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("PartCompromisoCiudadano", periodo), sheet = "1")
write.csv2(tweets, file=paste("PartCompromisoCiudadano", periodo), sep=";")

#Tweets del partido político Alianza Verde
criterio_AVerde = "@PartidoVerdeCoL OR PartidoVerdeCoL exclude:retweets"
ObtieneTweets = searchTwitter(criterio_AVerde, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("PartAlianzaVerde", periodo), sheet = "1")
write.csv2(tweets, file=paste("PartAlianzaVerde", periodo), sep=";")

#Tweets del partido político Polo Democrático
criterio_PDemocratico = "@PoloDemocratico OR PoloDemocratico exclude:retweets"
ObtieneTweets = searchTwitter(criterio_PDemocratico, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("PartPoloDemocratico", periodo), sheet = "1")
write.csv2(tweets, file=paste("PartPoloDemocratico", periodo), sep=";")

#Tweets del partido político Cambio Radical
criterio_CRadical = "@PCambioRadical OR PCambioRadical exclude:retweets"
ObtieneTweets = searchTwitter(criterio_CRadical, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("PartCambioRadical", periodo), sheet = "1")
write.csv2(tweets, file=paste("PartCambioRadical", periodo), sep=";")

#Tweets del partido político Progresistas Colombia
criterio_ProgresistasCol = "@progresistascol OR progresistascol exclude:retweets"
ObtieneTweets = searchTwitter(criterio_ProgresistasCol, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("PartProgresistasCol", periodo), sheet = "1")
write.csv2(tweets, file=paste("PartProgresistasCol", periodo), sep=";")

#Tweets del partido político Liberal
criterio_PLiberal = "@PartidoLiberal OR PartidoLiberal exclude:retweets"
ObtieneTweets = searchTwitter(criterio_PLiberal, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("PartLiberal", periodo), sheet = "1")
write.csv2(tweets, file=paste("PartLiberal", periodo), sep=";")

#Tweets del partido político Centro Democrático
criterio_CDemocratico = "@CeDemocratico OR CeDemocratico exclude:retweets"
ObtieneTweets = searchTwitter(criterio_CDemocratico, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("PartCentroDemocratico", periodo), sheet = "1")
write.csv2(tweets, file=paste("PartCentroDemocratico", periodo), sep=";")

#Tweets del partido Conservador
criterio_PConservador = "@soyconservador OR soyconservador exclude:retweets"
ObtieneTweets = searchTwitter(criterio_PConservador, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("PartConservador", periodo), sheet = "1")
write.csv2(tweets, file=paste("PartConservador", periodo), sep=";")

#Tweets del partido Unidad Nacional
criterio_UNacional = "@partidodelaucol OR partidodelaucol exclude:retweets"
ObtieneTweets = searchTwitter(criterio_UNacional, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("PartDeLaUnidadNacional", periodo), sheet = "1")
write.csv2(tweets, file=paste("PartDeLaUnidadNacional", periodo), sep=";")

#Tweets del partido Opción Ciudadana
criterio_OpCiudadana = "@PartidoOpcion   OR PartidoOpcion   exclude:retweets"
ObtieneTweets = searchTwitter(criterio_OpCiudadana, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("PartOpcionCiudadana", periodo), sheet = "1")
write.csv2(tweets, file=paste("PartOpcionCiudadana", periodo), sep=";")

#Tweets del partido Mira
criterio_PMira = "@MovimientoMIRA OR MovimientoMIRA exclude:retweets"
ObtieneTweets = searchTwitter(criterio_PMira, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("PartMira", periodo), sheet = "1")
write.csv2(tweets, file=paste("PartMira", periodo), sep=";")

#Tweets del partido ASI
criterio_PASI = "@PartidoASI_ OR PartidoASI_ exclude:retweets"
ObtieneTweets = searchTwitter(criterio_PASI, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("PartASI", periodo), sheet = "1")
write.csv2(tweets, file=paste("PartASI", periodo), sep=";")

#Tweets del partido Unión Patriotica
criterio_UPatriotica  = "@UP_Colombia OR UP_Colombia exclude:retweets"
ObtieneTweets = searchTwitter(criterio_UPatriotica, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("PartUnionPatriotica",periodo), sheet = "1")
write.csv2(tweets, file=paste("PartUnionPatriotica", periodo), sep=";")

#Tweets del partido FARC
criterio_PFARC = "@FARC_EPueblo OR FARC_EPueblo exclude:retweets"
ObtieneTweets = searchTwitter(criterio_PFARC, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("PartFARC", periodo), sheet = "1")
write.csv2(tweets, file=paste("PartFARC", periodo), sep=";")

#Tweets del partido AICO
criterio_PAICO = "@PartidoAICO OR PartidoAICO exclude:retweets"
ObtieneTweets = searchTwitter(criterio_PAICO, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("PartAICO", periodo), sheet = "1")
write.csv2(tweets, file=paste("PartAICO", periodo), sep=";")

#Tweets del partido MAIS
criterio_PMAIS = "@MovimientoMAIS OR MovimientoMAIS exclude:retweets"
ObtieneTweets = searchTwitter(criterio_PMAIS, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("PartMAIS", periodo), sheet = "1")
write.csv2(tweets, file=paste("PartMAIS", periodo), sep=";")

#Tweets del HasTag #ColombiaDecide
criterio_htColombiaDecide = "#ColombiaDecide exclude:retweets"
ObtieneTweets = searchTwitter(criterio_htColombiaDecide, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("Hash_Tag_Colombia_Decide", periodo), sheet = "1")
write.csv2(tweets, file=paste("Hash_Tag_Colombia_Decide", periodo), sep=";")

#Tweets del HasTag #ColombiaElige2018
criterio_htColombiaElige2018 = "#ColombiaElige2018 exclude:retweets"
ObtieneTweets = searchTwitter(criterio_htColombiaElige2018, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("Hash_Tag_Colombia_Elige_2018", periodo), sheet = "1")
write.csv2(tweets, file=paste("Hash_Tag_Colombia_Elige_2018", periodo), sep=";")

#Tweets del HasTag #colombiadecide2018
criterio_htColombiaDecide2018 = "#colombiadecide2018 exclude:retweets"
ObtieneTweets = searchTwitter(criterio_htColombiaDecide2018, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("Hash_Tag_Colombia_Decide_2018", periodo), sheet = "1")
write.csv2(tweets, file=paste("Hash_Tag_Colombia_Decide_2018", periodo), sep=";")

#Tweets del HasTag #ColombiaVota
criterio_htColombiaVota = "#ColombiaVota  exclude:retweets"
ObtieneTweets = searchTwitter(criterio_htColombiaVota, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("Hash_Tag_Colombia_Vota", periodo), sheet = "1")
write.csv2(tweets, file=paste("Hash_Tag_Colombia_Vota", periodo), sep=";")

#Tweets del HasTag #NosUnimosONosHundimos 
criterio_nosUnimos = "#NosUnimosONosHundimos exclude:retweets"
ObtieneTweets = searchTwitter(criterio_nosUnimos, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("Hash_Tag_NosUnimos_o_NosUndimos", periodo), sheet = "1")
write.csv2(tweets, file=paste("Hash_Tag_NosUnimos_o_NosUndimos", periodo), sep=";")

#Tweets del HasTag #MejorHablemos 
criterio_mejorHablemos = "#MejorHablemos  exclude:retweets"
ObtieneTweets = searchTwitter(criterio_mejorHablemos, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("Hash_Tag_MejorHablemos", periodo), sheet = "1")
write.csv2(tweets, file=paste("Hash_Tag_MejorHablemos", periodo), sep=";")

#Tweets del HasTag #ConfianzaCiudadana 
criterio_cCiudadana = "#ConfianzaCiudadana  exclude:retweets"
ObtieneTweets = searchTwitter(criterio_cCiudadana, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("Hash_Tag_ConfianzaCiudadana", periodo), sheet = "1")
write.csv2(tweets, file=paste("Hash_Tag_ConfianzaCiudadana", periodo), sep=";")

#Tweets del HasTag #PetroPresidente
criterio_PetroP = "#petropresidente  exclude:retweets"
ObtieneTweets = searchTwitter(criterio_PetroP, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("Hash_Tag_PetroPresidente", periodo), sheet = "1")
write.csv2(tweets, file=paste("Hash_Tag_PetroPresidente", periodo), sep=";")

#Tweets del HasTag #sepuede
criterio_sepuede = "#sepuede exclude:retweets"
ObtieneTweets = searchTwitter(criterio_sepuede, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("Hash_Tag_SePuede", periodo), sheet = "1")
write.csv2(tweets, file=paste("Hash_Tag_SePuede", periodo), sep=";")

#Tweets del HasTag #MejorVargasLleras
criterio_mejorVargas = "#MejorVargasLleras exclude:retweets"
ObtieneTweets = searchTwitter(criterio_mejorVargas, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("Hash_Tag_mejorVargas", periodo), sheet = "1")
write.csv2(tweets, file=paste("Hash_Tag_mejorVargas", periodo), sep=";")

#Tweets del HasTag #DuquePresidente
criterio_DuquePresidente = "#DuquePresidente exclude:retweets"
ObtieneTweets = searchTwitter(criterio_DuquePresidente, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("Hash_Tag_DuquePresidente", periodo), sheet = "1")
write.csv2(tweets, file=paste("Hash_Tag_DuquePresidente", periodo), sep=";")

#Tweets del HasTag #FajardoPresidente
criterio_FajardoPresidente = "#FajardoPresidente exclude:retweets"
ObtieneTweets = searchTwitter(criterio_FajardoPresidente, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("Hash_Tag_FajardoPresidente", periodo), sheet = "1")
write.csv2(tweets, file=paste("Hash_Tag_FajardoPresidente", periodo), sep=";")

#Tweets del HasTag #EleccionesColombia2018 
criterio_EleccionesColombia2018 = "#EleccionesColombia2018 exclude:retweets"
ObtieneTweets = searchTwitter(criterio_EleccionesColombia2018, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("Hash_Tag_EleccionesColombia2018", periodo), sheet = "1")
write.csv2(tweets, file=paste("Hash_Tag_EleccionesColombia2018", periodo), sep=";")

#Tweets del HasTag #ElPaísDeLosJóvenes 
criterio_ElPaisDeLosJovenes = "#ElPaisDeLosJovenes exclude:retweets"
ObtieneTweets = searchTwitter(criterio_ElPaisDeLosJovenes, lang = "es", n = 100000, since=desde, until=hasta)
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file=paste("Hash_Tag_ElPaisDeLosJovenes", periodo), sheet = "1")
write.csv2(tweets, file=paste("Hash_Tag_ElPaisDeLosJovenes", periodo), sep=";")

#Tweets para candidato Fabricio Alvarado de Costa Rica - Elecciones Presidenciales 2018
#criterio_FabricioAlvarado = "@FabriAlvarado7 exclude:retweets"
#ObtieneTweets = searchTwitter(criterio_FabricioAlvarado, lang = "es", n = 100000, since='2018-03-25', until='2018-04-01')
#tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file="FabricioAlvarado_del_25_al_31_marzo.xlsx", sheet = "1")

#Tweets para candidato Carlos Alvarado de Costa Rica - Elecciones Presidenciales 2018
#criterio_CarlosAlvarado = "@CarlosAlvQ exclude:retweets"
#ObtieneTweets = searchTwitter(criterio_CarlosAlvarado, lang = "es", n = 100000, since='2018-03-25', until='2018-04-01')
#tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file="CarlosAlvarado_del_25_al_31_marzo.xlsx", sheet = "1")

#Tweets para candidato Mario Abdo Benítez de Paraguay - Elecciones Presidenciales 2018
#criterio_MarioAbdoBenitez = "@MaritoAbdo exclude:retweets"
#ObtieneTweets = searchTwitter(criterio_MarioAbdoBenitez, lang = "es", n = 100000, since='2018-04-15', until='2018-04-22')
#tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file="MarioAbdoBenitez_del_15_al_21_abril.xlsx", sheet = "1")

#Tweets para candidato Efrain Alegre de Paraguay - Elecciones Presidenciales 2018
#criterio_EfrainAlegre = "@EfrainAlegre exclude:retweets"
#ObtieneTweets = searchTwitter(criterio_EfrainAlegre, lang = "es", n = 100000, since='2018-04-15', until='2018-04-22')
#tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
#write.xlsx(tweets, file="EfrainAlegre_del_15_al_21_abril.xlsx", sheet = "1")

#Tweets para candidato Andrés Manuel López Obrador de México - Elecciones Presidenciales 2018
criterio_Manuel_Lopez_Obrador = "@lopezobrador_ exclude:retweets"
ObtieneTweets = searchTwitter(criterio_Manuel_Lopez_Obrador, lang = "es", n = 50000, since='2018-06-24', until='2018-07-01')
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
periodo = "_24_a_30_jun_2018.csv"
write.csv2(tweets, file=paste("Manuel_Lopez_Obrador_Mexico", periodo), sep=";")

#Tweets para candidato Ricardo Anaya de México - Elecciones Presidenciales 2018
criterio_Ricardo_Anaya = "@RicardoAnayaC exclude:retweets"
ObtieneTweets = searchTwitter(criterio_Ricardo_Anaya, lang = "es", n = 50000, since='2018-06-24', until='2018-07-01')
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
periodo = "_24_a_30_jun_2018.csv"
write.csv2(tweets, file=paste("Ricardo_Anaya_Mexico", periodo), sep=";")

#Tweets para candidato José Antonio Meade de México - Elecciones Presidenciales 2018
criterio_Jose_Antonio_Meade= "@JoseAMeadeK exclude:retweets"
ObtieneTweets = searchTwitter(criterio_Jose_Antonio_Meade, lang = "es", n = 50000, since='2018-06-24', until='2018-07-01')
tweets <- do.call("rbind", lapply(ObtieneTweets, as.data.frame))
periodo = "_24_a_30_jun_2018.csv"
write.csv2(tweets, file=paste("Jose_Antonio_Meade", periodo), sep=";")






