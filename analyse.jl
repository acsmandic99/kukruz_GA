include("entity.jl")
include("population.jl")
include("geneticAlgorithim.jl")

function calculateAvrage(num,population, elitePercentage, crossoverPoint, mutationPercentage,repeatSize,totalRepeatSize,crossoverPoint2)
    avgGen = 0
    avgFit = 0
    for i in 1:num
        tempGen = 0
        population,tempGen  = geneticAlgorithim(population, elitePercentage, crossoverPoint, mutationPercentage,repeatSize,totalRepeatSize,crossoverPoint2)
        avgGen = avgGen + tempGen
        avgFit = avgFit + population[1].fitness
    end
    avgGen = avgGen / num
    avgFit = avgFit / num
    return avgGen,avgFit    
end

function findBestPopNumber(num,PopRange, elitePercentage, crossoverPoint, mutationPercentage,repeatSize,totalRepeatSize,genesLength,crossoverPoint2)
    resaultFit = []
    resaultGen = []
    resaultPop = []
    for bestPop in popRange
        push!(resaultPop,bestPop)
        population = generatePopulation(bestPop,genesLength)
        avgGen,avgFit = calculateAvrage(num,population,elitePercentage,crossoverPoint,mutationPercentage,repeatSize,totalRepeatSize,crossoverPoint2)
        push!(resaultFit,avgFit)
        push!(resaultGen,avgGen)
    end
    minIndex = argmin(resaultFit)
    optimalValue = resaultPop[minIndex]
    return minIndex,optimalValue,resaultGen[minIndex],resaultFit[minIndex]
end