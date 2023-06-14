library(ggplot2)

especie <- c('Mouse', 'Rat', 'Zebrafish', 'Hamster', 'Gerbil', 'Guinea Pig')
contagem <- c(log(4696), log(6364), log(28), log(47), log(22), log(55))
contagem1 <- c(4696, 6364, 28, 47, 22, 55)

df <- data.frame(contagem, especie)

My_Theme = theme(
  axis.title.x = element_text(size = 12),
  axis.text.x = element_text(size = 10),
  axis.title.y = element_text(size = 12),
  axis.text.y = element_text(size = 10),
  plot.title = element_text(face = 'bold', hjust = 0.5),
  plot.subtitle = element_text(face = 'plain', hjust = 0.5),
  plot.caption = element_text(size = 10))

titulo = labs(title = 'Contagem dos Experimentos',
              subtitle = 'Histograma na escala log da contagem de experimentos por espécie',
              caption = 'Fonte: Web of Science',
              fill = 'Espécie')


g <- df %>%
  ggplot(aes(x = reorder(especie, -contagem), y = contagem, fill = especie))+
  geom_bar(stat = 'identity', width = 0.7, position = position_dodge())+
  geom_text(aes(label = contagem1), vjust = -0.5)+
  xlab('Espécie')+
  ylab('Contagem')+
  scale_fill_discrete(breaks=c('Rat', 'Mouse', 'Guinea Pig', 'Hamster', 'Zebrafish', 'Gerbil'))+
  theme(axis.text.x=element_text(angle=80, hjust=0))+
  theme_minimal()
g + My_Theme + titulo

