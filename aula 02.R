# aula de fundamentos do R. ALgumas sintaxes são semelhantes à linguagem 
# Python, então anotarei apenas as que são novas para mim
# seja x == 3
abs(3) # irá me retornar o modulo do valor em questao
choose(5,2) #irá me retornar uma permutação dos elementos dados
exp(3) # irá me retornar o exponencial do valor x
round(2.1458, digits = 2) #irá me retornar um arrendondamento válido para até
# 2 digitos (e quando lidamos com algarismos significativos? já setamos para o 
#algarismo digitado?)

# exercicio 1 - resolva a expressão

5/3 + (2 + ((2**2) * sqrt(17)) - 3 ** -1)/500

# o R permite que operemos com variáveis
x <- 5
x <- c(1, 2, 3, 4) # assim, cria-se um vetor 
print(x) # qual é a utilidade do 'c' na criação de vetores?

texto <- 'gabriel' # aqui, nota-se que 'gabriel' é um character
print(texto)
class(texto)

# utilizando-se o exemplo de Las Vegas: 

poker_vector <- c(140, -50, 20, -120, 240)
roullete_vector <- c(24, -50, 100, -350, 10)

#pode-se atribuir nomes aos elementos do vetor com a sintaxe names(x)

names(poker_vector) <- c('Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta')

#ou, da seguinte forma:

dias <- c('Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta')
names(roullete_vector) <- dias

print(poker_vector)
print(roullete_vector)

# operações com vetores: 

print (poker_vector + roullete_vector)
print(poker_vector - roullete_vector)
print(poker_vector / roullete_vector)
print(poker_vector * roullete_vector)

# somando o vetor em si mesmo:

sum(poker_vector)

soma_1 <- sum(poker_vector)
soma_2 <- sum(roullete_vector)


#pode- se comparar vetores também através de booleanos

soma_1 > soma_2
soma_1 == soma_2
soma_1 < soma_2

# pode-se, inclusive, selecionar elementos de um vetor

select_1 <- poker_vector > 0
print(select_1)
print(poker_vector[select_1])  # assim, somente será exibido o que condiz com a
#condição imposta por select_1


#funções interessantes:

vetor <- rep(30:50, 100)
print(vetor)

length(vetor) #mostra o tamanho do vetor em elementos
sum(vetor)
mean(vetor) # mostra a média dos termos do vetor
var(vetor) # mostra a variancia amostral do vetor
min(vetor) # mostra o minimo
max(vetor) #mostra o maximo
summary(vetor) #Mostra infos resumidas do vetor
boxplot(vetor)


# Matrizes

a <- matrix(1:9, byrow=F, nrow=3)
b <- matrix(1:9, byrow=T, nrow=3)
print(a)
print(b)
c <- matrix(1:9, byrow=T)
print(c)

# Assim, conclui-se que para a criação de uma matriz deve-se
# determinar, nos primmeiros termos, a variação de n a k, no aspecto
# byrow= configura-se se a contagem começará por coluna (em caso de T).
# o termo nrow diz respeito ao número de colunas

# construindo com um vetor de caracteres
matrix(c('a', 'b', 'c', 'd'))
matrix(c('a', 'b', 'c', 'd'), nrow=2)
# qual é o ponto de utilizar o termo c?

# imagine que precisemos construir duas matrizes, cada uma contendo
# as faltas dos alunos em dois bimestres diferentes.

alunos <- c('Aluno 1', 'Aluno 2', 'Aluno 3', 'Aluno 4')
faltasMar <- c(3, 4, 0, 1)
faltasAbr <- c(4, 5, 0, 2)

faltas1Bim <- matrix(c(faltasMar, faltasAbr), byrow=F,nrow=4)
row.names(faltas1Bim) <- alunos
colnames(faltas1Bim) <- c('Marco', 'Abril')
print(faltas1Bim)

faltasMai <- c(1, 0, 0, 3)
faltasJun <- c(0, 2, 0, 8)

faltas2Bim <- matrix(c(faltasMai, faltasJun), byrow=F, nrow=4)
colnames(faltas2Bim) <- c('Maio', 'Junho')
row.names(faltas2Bim) <- alunos

print(faltas2Bim)

# Pode-se juntar matrizes através do comando cbind

cbind(faltas1Bim, faltas2Bim)

rbind(faltas1Bim, faltas2Bim)

# nota-se que a difenreça está no fato de que cbind une pelas colunas, já rbind une 
# pela linha. No caso, rbind é um erro estatístico, pois plota o mesmo aluno duas vezes.

faltas <- cbind(faltas1Bim, faltas2Bim)
faltas

# Operações com matrizes:

  # Adição
faltas1Bim + faltas2Bim
# haverá soma de cada elemento dada uma matriz (n,K)

  # Subtração
faltas1Bim - faltas2Bim
# A subtração nada mais é do que uma adição negativa

  # Multiplicação
faltas1Bim * faltas2Bim

# Pode-se também, selecionar dados com base em condições

faltas[faltas > 1]
faltas[faltas < 10]

#   Divisão
faltas1Bim/ faltas2Bim

#   Transposta:
t(faltas1Bim) #irá retornar a matriz transposta em questão

# Selecionando elementos

#Elemento
faltas[1,1] # irá selecionar o elemento 1 na linha 1 e coluna 1

faltas[1, c(1,2)] #irá selecionar as faltas da linha 1 nas colunas 1 e 2

# Linha
faltas[1,] #irá printar as faltas na linha 1, todas

faltas['Aluno 1',] #irá retornar o mesmo da linha acima

faltas['Aluno 1', 'Marco'] #irá retornar as faltas do aluno 1 em marçoi, repare que 
# os dados foram nomeados

faltas[c('Aluno 1', 'Aluno 2'),] # espera-se que printará as faltas dos alunos 1 e 2

# teoria para o uso do prefixo c: é utilizado quando mais de uma variavel é selecionada em 
# uma mesma posição

# Coluna

faltas[, 1]
faltas[, 'Marco']
faltas[, c('Marco', 'Junho')]

# Selecionando com  base em condicionais

faltas[faltas > 1]
faltas[falta < 10] 

# FATORES
# são utilizados para armazenar os tipos de dados qualitativos

genero_vector <- c('Masculino', 'Feminino', 'Feminino', 'Masculino', 'Masculino')
fator_genero_vector <- factor(genero_vector)
fator_genero_vector # como setou-se o conjunto universo de fatores disponiveis, este
# comando irá printar os n fatores dados e seus k tipos

levels(fator_genero_vector) <- c('M', 'F') # a partir de agora os fatores respondem 
# por F e M, repare que os fatores foram nomeados termo a termo. Há forma de nomeá-los
# rapidamente?

fator_genero_vector

# DaTA-FRAMES

# um data frame é uma estrutura de dados utilizada para se armazenar tabelas de dados

data(iris) # carregando conjunto de dados disponível no R?
head(iris) # Primeiras linhas

tail(iris) # printa as ultimas linhas do dataframe

# Duvida: como definir qual é a porção head e tail de um dataframe?

str(iris) #estrutura geral do dataframe

dim(iris) #dimensões do dataframe

colnames(iris) # nome das colunas do dataframe de iris

row.names(iris) # termos nas linhas do dataframe de iris

# selecionando elementos do dataframe

iris[1,1] # pega a primeira linha e primeira coluna
iris[1,] # printa a primeira linha de iris
iris[, 1] #printa a primeira coluna de iris

names(iris) # irá printar os nomes de iris
iris[, 'Sepal.Length'] # printa a coluna com informações de comprimento da pétala

iris$Sepal.Length #Mesma coluna

# Duvida: qual a diferença entre a liha 232 e a linha 234?

# Criando um dataframe

nomes <- c('Alice', 'Gabriel', 'Júlia')
idades <- c('17', '19', '18')

sexo <- c('Feminin', 'Masculino', 'Feminino')
sexo <- factor(sexo)
levels(sexo) <- c('F', 'M', 'F')
sexo
# nota-se que renomeei as variáveis qualitativas (fatores) utilizando o comando levels
trabalha <- c(F, T, T)
pessoas <- data.frame(nomes, idades, sexo, trabalha)
pessoas
