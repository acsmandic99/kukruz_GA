mutable struct Entity
    genes::Array{Int64}
    fitness::Int64
end

function generateEntity(genesLength)
    return Entity(rand(0:1:3,genesLength),0)
end

function calculateFitness!(entity)
    brojRazlicitih = 0
    for i in 1:length(entity.genes)-1
        if  entity.genes[i] != entity.genes[i+1]
            brojRazlicitih = brojRazlicitih + 1
        end
    end
    entity.fitness = brojRazlicitih
end

function printEntity(entity1)
    for i in 1:length(entity1.genes)
       print("$(round.(entity1.genes[i]; digits=4)) ")
    end
    print("fitnes: $(entity1.fitness)\n")
 end
#crossover u 2 tacke
 function crossover!(entity1,entity2,crossoverPoint1,crossoverPoint2)
    x = entity1.genes
    for i in 1:crossoverPoint1
        entity1.genes[i] = entity2.genes[i]
        entity2.genes[i] = x[i]
    end
    for i in crossoverPoint2:length(entity1.genes)
        entity1.genes[i] = entity2.genes[i]
        entity2.genes[i] = x[i]
    end
 end

function mutate!(entity1,mutationPercentage)
    if rand(Float64) < mutationPercentage
         mutationPoint = rand(1:length(entity1.genes))
        entity1.genes[mutationPoint] = rand(0:1:3)
    end
end