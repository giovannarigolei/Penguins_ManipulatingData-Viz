#Instalando os pacotes e ativando-os
install.packages('palmerpenguins','tidyverse')
library("palmerpenguins", ""tidyverse")
library("ggplot2")

#Criando novas medidas agrupadas
View(penguins %>% 
       group_by(species, island) %>% 
       drop_na() %>% 
       summarize(max_bl=max(bill_length_mm), mean_bl=mean(bill_length_mm)))

#Adicionando novas colunas calculadas e ordenadas
View(penguins %>%
  mutate(body_mass_kg=body_mass_g/1000, flipper_length_m=flipper_length_mm/1000) %>% 
    arrange(bill_length_mm))

#Criando gráficos
ggplot(data=penguins) + geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g))
ggplot(data=penguins) + geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g, color=species))
ggplot(data=penguins) + geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g, shape=species, alpha=species))
ggplot(data=penguins) + geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g, shape=species, color=species))

ggplot(data=penguins) + geom_smooth(mapping=aes(x=flipper_length_mm, y=body_mass_g), color=RED)
ggplot(data=penguins) + geom_smooth(mapping=aes(x=flipper_length_mm, y=body_mass_g, linetype = species), color=red)

ggplot(data=penguins) + geom_bar(mapping=aes(x=sex, color=sex))
ggplot(data=penguins) + geom_bar(mapping=aes(x=sex, fill=color))
ggplot(data=penguins) + geom_bar(mapping=aes(x=sex, fill=year))

ggplot(data=penguins) + geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g)) + facet_wrap(~species)
ggplot(data=penguins) + geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g), color=red) + facet_grid(sex~species)
ggplot(data=penguins) + geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g), color=red) + facet_grid(sex~species) + labs(title="Quantity_of_Penguins_by_Species_and_Sex", subtitle="Species_/_Sex",caption="By_Giovanna")+annotate("text", x=250, y=3000, label = "X")

ggsave("viz.jpeg")

