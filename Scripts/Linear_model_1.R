library(bannerCommenter)
banner("UTEG - Maestría en Finanzas", "Estadística e introducción a la econometría", "David Echeverría, Econ. Msc","Junio 2021",emph = TRUE)

###########################################################################
###########################################################################
###                                                                     ###
###                     UTEG - MAESTRÍA EN FINANZAS                     ###
###             ESTADÍSTICA E INTRODUCCIÓN A LA ECONOMETRÍA             ###
###                     DAVID ECHEVERRÍA, ECON. MSC                     ###
###                              JUNIO 2021                             ###
###                                                                     ###
###########################################################################
###########################################################################


library (tidyverse)
library (ggpubr)
library (dplyr)
library (datarium)
library (ggplot2)


data("marketing")

mod1 <- lm(sales ~ youtube, data=marketing)

marketing$predicciones <- predict(mod1)

ggplot(marketing,aes(x=youtube,y=sales))+
  theme(legend.position = "none")+
  labs(x="Gasto en publicidad en Youtube",y="Ventas")+
  geom_segment(aes(xend=youtube, yend=predicciones), col='red', lty='dashed') +
  geom_smooth(method="lm", se=FALSE, color="lightgrey")+
  geom_point() +
  geom_point(aes(y=predicciones), col='red',size=0.3) +
  theme_light()
  


