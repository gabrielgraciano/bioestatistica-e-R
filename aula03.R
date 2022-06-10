install.packages('readxl')
library(readxl)
surto <- read_excel('surto.xlsx')
View(surto)
str(surto) #aqui, verifica-se se as variáveis foram importdas corretamente ou
# seja, quais os tipos/formatos. Para isso, utiliza-se a função str()
# observa-se que a maioria das variáveis estão tratadas como num, exceto algumas 
# como data de nascimento. O formato numérico não é o adequado para algumas
# variáveis

# as variáveis qualitativas são tratadas como fatores no R (factor) e as variáveis
# quantitativas têm formato numérico (num).

# Agora, entra uma parte trabalhosa: transformar as variáveis categóricas (qualitativas)
# em 'factor'. Para isso, utiliza-se a função factor() e o argumento label da própria
# função, que permite nomear as categorias das variáveis.

# transformando em factor:
surto$caso <- factor(surto$caso, labels=c(' Não', 'Sim'))
surto$sexo <- factor(surto$sexo, labels=c('Feminino', 'Masculino'))
surto$ocupa <- factor(surto$ocupa) # para que serve transformar em factor? já não está
# transformado nesse caso da ocupaçãp?
surto$diarreia <- factor(surto$diarreia, labels=c('Não', 'Sim'))
surto$colica <- factor(surto$colica, labels=c('Não', 'Sim'))
surto$vomito <- factor(surto$vomito, labels=c('Não', 'Sim'))
surto$nausea <- factor(surto$nausea, labels=c('Não', 'Sim'))
surto$cefaleia <- factor(surto$cefaleia, labels=c('Não', 'Sim'))
surto$desidratacao <- factor(surto$desidratacao, labels=c('Sim', 'Não'))
surto$febre <- factor(surto$febre, labels=c('Não', 'Sim'))
surto$servsaude <- factor(surto$servsaude, labels=c('Não', 'Sim'))
surto$gravidade <- factor(surto$gravidade, order= TRUE, labels=c('Leve', 'Moderado', 'Grave'))
# como interpretar esse comando do surto$gravidade?
surto$salada <- factor(surto$salada, labels=c('Não', 'Sim'))
surto$pao <- factor(surto$pao, labels=c('Não', 'Sim'))
surto$medalhao <- factor(surto$medalhao, labels=c'Não', 'Sim'))
surto$macarrao <- factor(surto$macarrao, labels=c('Não', 'Sim'))
surto$molhoqueijo <- factor(surto$molhoqueijo, labels=c('Não', 'Sim'))
surto$molhoverm <- factor(surto$molhoverm, labels=c('Não', 'Sim'))
surto$pudim <- factor(surto$pudim, labels=c('Não', 'Sim'))
surto$frutas <- factor(surto$frutas, label=c('Não', 'Sim'))
surto$agua <- factor(surto$agua, label=c('Não', 'Sim'))
surto$suco <- factor(surto$suco, labels=c('Não', 'Sim'))

# Lendo CSV

read.csv(file, header = TRUE, sep = “,”, quote = "", dec = “.”, fill = TRUE)
read.csv2(file, header = TRUE, sep = “;”, quote = "'", dec = “,”, fill = TRUE)
mtcarsl <- read.csv('mtcars.csv', stringAsFactors= TRUE)
head(mtcars1)')
      
      # Por que não dá certo??
#O parametro stringAsFactors permite que os campos que contenham string sejam transformados
# em fatores, caso contrário o arquivo será lido como string, apenas.

''' 

# lendo a base de dados surto
library(readxl)
surto <- read_excel("surto.xlsx")
View(surto)

library(tidyverse)
glimpse(surto)
# iremos transformar as variáveis quantitativas em fatores
surto <- surto %>%
  mutate( caso = factor(caso, labels=c('não', 'sim')),
          sexo = factor(sexo, labels= c('Feminino', 'Masculino')),
          ocupa = factor(ocupa),
          diarreia = factor(diarreia, labels= c('Não', 'Sim')),
          colica = factor(colica, labels = c('Não', 'Sim')),
          vomito = factor(vomito, labels = c('Não', 'Sim')),
          nausea = factor(nausea, labels = c('Não', 'Sim')),
          cefaleia = factor(cefaleia, labels = c('Não', 'Sim')),
          desidratacao = factor(desidratacao, labels = c('Não', 'Sim')),
          febre = factor(febre, labels= c('Não', 'Sim')),
          servsaude = factor(servsaude, labels = c('Não', 'Sim')),
          gravidade = factor(gravidade, order=TRUE, labels = c('Leve', 'Moderada', 'Grave')),
          salada = factor(salada, labels=  c('Não', 'Sim')),
          pao = factor(pao, labels = c('Não', 'Sim')),
          medalhao = factor(medalhao, labels = c('Não', 'Sim')),
          macarrao = factor(macarrao, labels = c('Não', 'Sim')),
          molhoqueijo = factor(molhoqueijo, labels = c('Não', 'Sim')),
          molhoverm = factor(molhoverm, labels = c('Não', 'Sim')),
          pudim = factor(pudim, labels = c('Não', 'Sim')),
          frutas = factor(frutas, labels = c('Não', 'Sim')),
          agua = factor(agua, labels = c('Não', 'Sim')),
          suco = factor(suco, labels = c('Não', 'Sim'))
  )
glimpse(surto)

# o tidyverse junta 8 pacotes do R, sendo o mais importante deles o dplyr, que permite
# manipulação de dados, colunas e linhas de forma facilitada e com uma sintaxe mais
# interessante.
surto <- readxl::read_excel('surto.xlsx',
                            sheet = 'plan1')
view(surto)

glimpse(surto)
# glimpse fornece o foramato da variável, pode ser:
# dbl = double (variável numérica quantitativa).
# dttm = data,
# chr = string.
# o operador pipe, pu %>% encadeia funções
surto2 <- surto %>% 
  select(id, caso, dtnasc, ocupa, dtisint, horaisint,
         diarreia, colica, vomito, nausea, desidratacao,
         cefaleia, febre, servsaude, gravidade)
glimpse(surto2)

surto3 <- surto2 %>% 
  select( -c(febre))
glimpse(surto3)
# aqui, observa-se que umao utr forma de dar select em dados é retirado aquilo que não
# se deseja do conjunto em questão.

surto4 <- surto %>% 
  filter(ocupa == 'enfermeiro')
view(surto4)

# o operador ou é feito com barra vertical | (barra pipe)
# o operador E é feito com &
surto %>% 
  filter(ocupa == 'enfermeiro'& ocupa=='medico')
# pode-se selecionar duas possiveis condições e concatená-las com uma terceira 
# condição fixa através da | + , condicao = 'tal'

# ordenando linhas:
surto %>% 
  arrange(leuco)
# agora de forma decrescente:
surto %>% 
  arrange(desc(leuco))
# sumarizando uma coluna/ variável:
# a função summarise resume a base, imagine que queiramos resumir, através da média, leuco
summarise(media_leuco = mean(leuco, na.rm = TRUE))

# agrupando a base por uma variável (group_by)
surto %>% 
  group_by(caso)

# finalmente, vamos calcular a média de leucocitos para os doentes e não doentes:
group_by(caso) %>% 
  summarise(media_leuco = mean(leuco, na.rm=TRUE))
# DÚVIDA: MINHA MÉDIA NÃO FUNCIONA. O QUE É A SINTAXE 'na.rm'???
