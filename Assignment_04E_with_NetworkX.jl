using Graphs
using DataStructures

# Read the input data.
edges = []
open("data/stepic_4e.txt") do file
    for line in eachline(file)
        edge = split(strip(line), " -> ")
        if ',' in edge[2]
            for node in split(edge[2], ',')
                push!(edges, (parse(Int, edge[1]), parse(Int, node)))
            end
        else
            push!(edges, (parse(Int, edge[1]), parse(Int, edge[2])))
        end
    end
end

# Create the graph.
G = DiGraph()
for (u, v) in edges
    add_edge!(G, u, v)
end

# Find an eulerian cycle.
path = [string(e[1]) for e in collect(eulerian_circuit(G))]
push!(path, path[1])

# Print and save the answer.
println(join(path, "->"))
open("output/Assignment_04E.txt", "w") do file
    write(file, join(path, "->"))
end
