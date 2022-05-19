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
