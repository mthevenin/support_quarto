library(dplyr)
library(ggplot2)


df <- read.csv("D:/D/Marc/SMS/assistoolsms_marc/R/assist/posts/spaghetti/fecondite_ggp.csv")
df = df %>% mutate_if(is.character,as.factor)

tmp <- df %>%
  mutate(pays2=pays)   

ggplot(tmp) +
  aes(x = year, y = y) +
  geom_line( data=tmp %>% dplyr::select(-pays), aes(group=pays2), color="grey", lwd=0.1) +    
  geom_line(colour = "#C24168", lwd=1.4) +
  labs(title = "Taux de fécondité") +
  theme_minimal() +
  theme(panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),  
        panel.grid.minor.y = element_blank()) + 
  labs(x = "Années", 
       y = "ICF", 
       title = "Indices conjoncturels de fécondité par pays de 1950 à 2022", 
       caption = "Source: GGP - Datalab Ined",) +
  scale_x_continuous(guide = guide_axis(n.dodge = 2), breaks=seq(1950,2020, 10)) + 
  scale_y_continuous(breaks=seq(0,6,1)) +
  facet_wrap(vars(pays), ncol = 4L)