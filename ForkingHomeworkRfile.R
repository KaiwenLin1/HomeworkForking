library(tidyverse)
library(dplyr)
library(data.table)

diamonds

diamonds%>%
  select(carat,cut,price)%>%
  filter(cut == "Premium")%>%
  filter(price > 7000 & price < 10000)%>%
  arrange(desc(carat))%>%
  slice(1:20)


diamonds1 <- as.data.table(diamonds)
diamonds1[cut=="Premium" & price>7000 & price<10000, list(carat,cut,price)] -> diamonds1
diamonds1[order(-carat)] ->diamonds1
diamonds1[1:20]
