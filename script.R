#Instalando os pacotes e ativando-os
install.packages('palmerpenguins','tidyverse')
library(palmerpenguins, tidyverse)

#Criando novas medidas agrupadas
view(penguins %>% 
       group_by(species, island) %>% 
       drop_na() %>% 
       summarize(max_bl=max(bill_length_mm), mean_bl=mean(bill_length_mm)))

#Adicionando novas colunas calculadas e ordenadas
view(penguins %>%
  mutate(body_mass_kg=body_mass_g/1000, flipper_length_m=flipper_length_mm/1000) %>% 
    arrange(bill_length_mm))


