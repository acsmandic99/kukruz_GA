include("entity.jl")
include("population.jl")
include("geneticAlgorithim.jl")
include("analyse.jl")
populationSize = 20
genesLength = 42
popRange = 10:2:40

brGen = 0
population = generatePopulation(populationSize,genesLength)
calculatePopulationFitness!(population)
printPopulation(population)
population,brGen = geneticAlgorithim(population,0.1,21,0.1,10,1000,32)
brGen
printPopulation(population)

calculateAvrage(100,population,0.1,21,0.1,10,1000,32)

findBestPopNumber(100,popRange,0.1,21,0.1,10,1000,genesLength,32)