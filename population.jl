include("entity.jl")
function generatePopulation(populationSize,genesLength)
    data = []
    for i in 1:populationSize
       push!(data,generateEntity(genesLength))
    end
    return data;
end

function calculatePopulationFitness!(population)
    for i in 1:length(population)
        calculateFitness!(population[i])
    end
    sort!(population,by = d -> d.fitness,rev = false)
end

function selectPopulation(population,n)
    return deepcopy(population[1:n])
end

function printPopulation(population)
    for i in 1:length(population)
        printEntity(population[i])
    end
end

function crossoverPopulation!(population,crossoverPoint,crossoverPoint2)
    newPopulation = []
    len = length(population)
    for i in 1:(len/2)
        entity1 = population[Int64(i)]
        entity2 = population[len]
        crossover!(entity1,entity2,crossoverPoint,crossoverPoint2)
        len = len - 1
        push!(newPopulation,entity1)
        push!(newPopulation,entity2)
    end
    return newPopulation
end

function mutatePopulation!(population,mutatePercentage)
    for i in 1:length(population)
        mutate!(population[i],mutatePercentage)
    end
end