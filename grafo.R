library(igraph)

g <- graph(edges = c('PAR', 'AR', 'AR', 'AND', 'AND', 'FI', 'FI', 'GIR', 'GIR', 'FACE2', 'FACE2', 'FI',
                     'FI', 'AND', 'AND', 'PAR', 'PAR', 'FI', 'FI', 'AND', 'AND', 'AR', 'AR', 'AND', 'AND',
                     'GIR', 'GIR', 'CN', 'CN', 'FI', 'FI', 'AR', 'AR', 'FACE2', 'FACE2', 'FI', 'FI', 'GIR',
                     'GIR', 'CN', 'CN', 'FACE2', 'FACE2', 'FI', 'FI', 'GIR', 'GIR', 'FI', 'FI', 'PAR', 'PAR',
                     'AND', 'AND', 'FI', 'FI', 'AR', 'AR', 'FACE2', 'FACE2', 'AR', 'AR', 'PAR', 'PAR', 'AR', 'AR',
                     'FACE2', 'FACE2', 'FI', 'FI', 'GIR', 'GIR', 'FI', 'FI', 'AND', 'AND', 'FI', 'FI', 'GIR', 'GIR',
                     'FI', 'FI', 'CN', 'CN', 'PATA', 'PATA', 'FACE2', 'FACE2', 'PATA', 'PATA', 'FACE2', 'FACE2', 'PATA',
                     'PATA', 'FACE2', 'FACE2', 'PATA', 'PATA', 'FACE2', 'FACE2', 'PATA', 'PATA', 'FACE2', 'FACE2',
                     'PATA', 'PATA', 'FI', 'FI', 'GIR', 'GIR', 'FI', 'FI', 'GIR', 'GIR', 'FI', 'FI', 'PATA', 'PATA',
                     'FACE2', 'FACE2', 'FI', 'FI', 'FACE2', 'FACE2', 'PATA', 'PATA', 'FACE2', 'FACE2', 'PATA', 'PATA',
                     'FACE2', 'FACE2', 'PATA', 'PATA', 'GIR', 'GIR', 'FI', 'FI', 'AND', 'AND', 'FI', 'FI', 'AR', 'AR',
                     'PAR', 'PAR', 'GIR', 'GIR', 'AND', 'AND', 'FI', 'FI', 'GIR', 'GIR', 'AR', 'AR', 'PAR', 'PAR', 'GIR',
                     'GIR', 'FI', 'FI', 'AR', 'AR', 'PAR', 'PAR', 'CN', 'CN', 'FI', 'FI', 'GIR', 'GIR', 'FI', 'FI', 'GIR',
                     'GIR', 'FI', 'FI', 'AND', 'AND', 'AR', 'AR', 'PAR', 'PAR', 'FI', 'FI', 'GIR', 'GIR', 'FI', 'FI',
                     'AND', 'AND', 'FI', 'FI', 'FACE2', 'FACE2', 'AR', 'AR', 'PAR', 'PAR', 'AND', 'AND', 'PAR',
                     'PAR', 'GIR', 'GIR', 'AR', 'AR', 'FI', 'FI', 'GIR'), directed = TRUE)



# contando a frequência de cada aresta
edge_freq <- table(sort(c(apply(get.edgelist(g), 1, paste, collapse="-"))))
# convertendo para um vetor
edge_weights <- as.vector(edge_freq[sort(c(apply(get.edgelist(g), 1, paste, collapse="-")))])

g_simplified <- simplify(g, remove.multiple = TRUE, remove.loops = FALSE)

edge_freq
edge_weights
#cor
library(RColorBrewer)

# número de vértices
n_vertices <- vcount(g_simplified)

# gerando uma sequência de cores distintas
colors <- brewer.pal(n_vertices, "Set3")

# atribuindo uma cor para cada vértice
V(g_simplified)$color <- colors[as.numeric(factor(V(g_simplified)$name))]



# calculando o grau de cada vértice
vertex_sizes <- degree(g_simplified, mode = "total", v = V(g_simplified)) * 2

# plotando o grafo com os tamanhos dos vértices proporcionais à frequência
l <- layout_with_fr(g_simplified)
plot(g_simplified, edge.width = edge_weights+1, vertex.size = vertex_sizes, layout = l)

edge_weights
