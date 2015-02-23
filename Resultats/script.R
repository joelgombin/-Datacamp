library(dplyr)
load("/media/Data/Dropbox/Thèse/données propres/cantonales 1985/CAN851.Rdata")
write.csv2(CAN851, file = "/media/Data/Dropbox/hackathon élections/-Datacamp/Resultats/Cantonales 1985/CAN85CANT1.csv", row.names = FALSE)

CAN852 <- read.csv("/media/Data/Dropbox/Thèse/données propres/cantonales 1985/Can85CanT2.csv", sep = ";", stringsAsFactors = FALSE)
CAN852 <- CAN852 %>%
  mutate(NUCAN = as.character(NUCAN),
         CodeDpt = substr(NUCAN, 1, 1 + (nchar(NUCAN) - 12)),
         CodeDpt = ifelse(nchar(CodeDpt) %in% 1, paste0("0", CodeDpt), CodeDpt),
         CodeCanton = substr(NUCAN, nchar(NUCAN) - 2, nchar(NUCAN) - 1),
         IDCanton = paste0(CodeDpt, CodeCanton))
write.csv2(CAN852, file = "/media/Data/Dropbox/hackathon élections/-Datacamp/Resultats/Cantonales 1985/CAN85CANT2.csv", row.names = FALSE)
save(CAN852, file = "/media/Data/Dropbox/Thèse/données propres/cantonales 1985/CAN852.Rdata")

load("/media/Data/Dropbox/Thèse/données propres/présidentielle 2012/P2012BV.Rdata")
df2012 %>% 
  mutate(CodeBV = as.character(CodeBV)) %>%
  select(CodeBV:Hollande) %>%
  write.csv2(file = "/media/Data/Dropbox/hackathon élections/-Datacamp/Resultats/Presidentielle 2012/Pres2012BVT1.csv", row.names = FALSE)

df2012 %>% 
  mutate(CodeBV = as.character(CodeBV)) %>%
  select(CodeBV:CodeInsee, Inscrits2:Sarkozy2) %>%
  write.csv2(file = "/media/Data/Dropbox/hackathon élections/-Datacamp/Resultats/Presidentielle 2012/Pres2012BVT2.csv", row.names = FALSE)

load("/media/Data/Dropbox/Thèse/données propres/présidentielle 2012/P2012comm.Rdata")
pres2012comm %>%
  select(CodeInsee, Inscrits, Votants, Blancs.et.nuls, `Exprimés`, Joly, LePen, Sarkozy, Mélenchon, Poutou, Arthaud, Cheminade, Bayrou, Dupont.Aignan, Hollande) %>%
  write.csv2(file = "/media/Data/Dropbox/hackathon élections/-Datacamp/Resultats/Presidentielle 2012/Pres2012commT1.csv", row.names = FALSE)

pres2012comm %>%
  select(CodeInsee, Inscrits2, Votants2, Blancs.et.nuls.2, `Exprimés.2`, Hollande2, Sarkozy2) %>%
  write.csv2(file = "/media/Data/Dropbox/hackathon élections/-Datacamp/Resultats/Presidentielle 2012/Pres2012commT2.csv", row.names = FALSE)
