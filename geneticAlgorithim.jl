include("entity.jl")
include("population.jl")

function converge(bestFits,repeatSize,totalRepeatSize)
    len = length(bestFits)
    if bestFits[len] == 0
        return true
     elseif len < repeatSize
         return false
     elseif len > totalRepeatSize
            return true
        else
            return (bestFits[len-2] - bestFits[len]) < 2

    end
end

function geneticAlgorithim(population, elitePercentage, crossoverPoint, mutationPercentage,repeatSize,totalRepeatSize,crossoverPoint2)
    calculatePopulationFitness!(population)
    populationSize = length(population)
    eliteSize = Int(trunc(elitePercentage*populationSize))
    eliteSize = eliteSize + (populationSize - eliteSize)%2
    bestFits = [population[1].fitness]
    while !converge(bestFits,repeatSize,totalRepeatSize)
        elite = deepcopy(selectPopulation(population,eliteSize))
        population = selectPopulation(population,10)
        population = crossoverPopulation!(population,crossoverPoint,crossoverPoint2)
        mutatePopulation!(population,mutationPercentage)
        population = [population;elite]
        calculatePopulationFitness!(population)
        bestFits = [bestFits; population[1].fitness]
    end
    return population,length(bestFits)
end