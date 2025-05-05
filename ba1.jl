text=""
k=0
open("data/stepic_4a.txt") do input_data
    global k = parse(Int, readline(input_data))
    global text = readline(input_data)
end

k=15
# Generate the list of all k-mers in text and sort them lexicographically.
composition = sort([text[i:i+k-1] for i in 1:length(text)-k+1])

# Print and save the answer.
println(join(composition, "\n"))
open("output/Assignment_04A.txt", "w") do output_data
    write(output_data, join(composition, "\n"))
end
