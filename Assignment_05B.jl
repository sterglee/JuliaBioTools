using DataStructures

function string_reconstruction(input_data)
    string_dict = Dict{String,String}()
    for line in input_data
        key, value = split(line, " -> ")
        string_dict[key] = value
    end

    head = filter(x -> !(x in values(string_dict)), keys(string_dict))[1]
    tail = filter(x -> !(x in keys(string_dict)), values(string_dict))[1]

    reconstructed_str = head[1]
    current_str = head

    while current_str != tail
        current_str = string_dict[current_str]
        reconstructed_str *= current_str[1]
    end

    reconstructed_str *= tail[2:end]

    return reconstructed_str
end
