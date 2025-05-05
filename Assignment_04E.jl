using DataStructures

function eulerian_cycle(edge_dict)
    current_node = first(keys(edge_dict))
    path = [current_node]

    # Get the initial cycle.
    while true
        push!(path, edge_dict[current_node][1])

        if length(edge_dict[current_node]) == 1
            delete!(edge_dict, current_node)
        else
            edge_dict[current_node] = edge_dict[current_node][2:end]
        end

        if path[end] in keys(edge_dict)
            current_node = path[end]
        else
            break
        end
    end

    # Continually expand the initial cycle until we're out of edge_dict.
    while length(edge_dict) > 0
        for i in 1:length(path)
            if path[i] in keys(edge_dict)
                current_node = path[i]
                cycle = [current_node]
                while true
                    push!(cycle, edge_dict[current_node][1])

                    if length(edge_dict[current_node]) == 1
                        delete!(edge_dict, current_node)
                    else
                        edge_dict[current_node] = edge_dict[current_node][2:end]
                    end

                    if cycle[end] in keys(edge_dict)
                        current_node = cycle[end]
                    else
                        break
                    end
                end
                path = vcat(path[1:i], cycle, path[i+1:end])
                break
            end
        end
    end
    return path
end

if abspath(PROGRAM_FILE) == @__FILE__
    # Read the input data.
    edges = Dict{Int,Vector{Int}}()
    open("data/stepic_4e.txt") do input_data
        for line in readlines(input_data)
            edge = split(line, " -> ")
            if "," in edge[2]
                edges[parse(Int, edge[1])] = parse.(Int, split(edge[2], ","))
            else
                edges[parse(Int, edge[1])] = [parse(Int, edge[2])]
            end
        end
    end

    # Get the Eulerian cycle.
    path = eulerian_cycle(edges)

    # Print and save the answer.
    println(join(path, "->"))
    open("output/Assignment_04E.txt", "w") do output_data
        write(output_data, join(path, "->"))
    end
end
