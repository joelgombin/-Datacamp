library(dplyr)
load("/media/Data/Dropbox/Thèse/données propres/cantonales 1985/CAN851.Rdata")
write.csv2(CAN851, file = "/media/Data/Dropbox/hackathon élections/-Datacamp/Resultats/Cantonales 1985", row.names = FALSE)

CAN852 <- read.csv("/media/Data/Dropbox/Thèse/données propres/cantonales 1985/Can85CanT2.csv", sep = ";", stringsAsFactors = FALSE)
CAN852 <- CAN852 %>%
  mutate(NUCAN = as.character(NUCAN),
         CodeDpt = substr(NUCAN, 1, 1 + (nchar(NUCAN) - 12)),
         CodeDpt = ifelse(nchar(CodeDpt) %in% 1, paste0("0", CodeDpt), CodeDpt),
         CodeCanton = substr(NUCAN, nchar(NUCAN) - 2, nchar(NUCAN) - 1),
         IDCanton = paste0(CodeDpt, CodeCanton))
write.csv2(CAN852, file = "/media/Data/Dropbox/hackathon élections/-Datacamp/Resultats/Cantonales 1985", row.names = FALSE)
save(CAN852, file = "/media/Data/Dropbox/Thèse/données propres/cantonales 1985/CAN852.Rdata")
