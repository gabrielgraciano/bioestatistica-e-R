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
