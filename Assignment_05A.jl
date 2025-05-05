using DataStructures

function eulerian_path(edge_dict)
    # Determine the unbalanced edges.
    out_values = reduce(+, values(edge_dict))
    unbalanced_from = nothing
    unbalanced_to = nothing
    for node in union(keys(edge_dict), out_values)
        out_value = count(out_values, node)
        in_value = node in keys(edge_dict) ? length(edge_dict[node]) : 0
        if in_value < out_value
            unbalanced_from = node
        elseif out_value < in_value
            unbalanced_to = node
        end
    end

    # Add an edge connecting the unbalanced edges.
    if haskey(edge_dict, unbalanced_from)
        push!(edge_dict[unbalanced_from], unbalanced_to)
    else
        edge_dict[unbalanced_from] = [unbalanced_to]
    end

    # Get the Eulerian Cycle from the edges, including the unbalanced edge.
    cycle = eulerian_cycle(edge_dict)

    # Find the location of the unbalanced edge in the eulerian cycle.
    divide_point = findfirst(i -> cycle[i:i+1] == [unbalanced_from, unbalanced_to], 1:length(cycle)-1)

    # Remove the unbalanced edge, and shift appropriately, overlapping the head and tail.
    return vcat(cycle[divide_point+1:end], cycle[1:divide_point+1])
end
