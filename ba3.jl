# A solution to a programming assignment for the Bioinformatics Algorithms (Part 1) on Coursera.
# The associated textbook is Bioinformatics Algorithms: An Active-Learning Approach by Phillip Compeau & Pavel Pevzner.
# The course is run on Coursera and the assignments and textbook are hosted on Stepic

# Problem Title: De Bruijn Graph from a String Problem
# Assignment #: 04
# Problem ID: C
# URL: https://beta.stepic.org/Bioinformatics-Algorithms-2/Another-Graph-for-String-Reconstruction-199/#step-6

# Read the input data.
de_buijn=""
open("data/stepic_4c.txt") do input_data
    k = parse(Int, readline(input_data))
    dna = strip(readline(input_data))
    
    # Create a dictionary matching (k-1)-mers to their followers.
    de_bruijn_dict = Dict{String, Set{String}}()
    for i in 1:(length(dna) - k + 1)
        kmer = dna[i:(i + k - 1)]
        prefix = kmer[1:end-1]
        suffix = kmer[2:end]
        if haskey(de_bruijn_dict, prefix)
            push!(de_bruijn_dict[prefix], suffix)
        else
            de_bruijn_dict[prefix] = Set([suffix])
        end
    end

    # Write the De Bruijn Graph in the specified format
    global de_buijn = [string(item[1], " -> ", join(item[2], ",")) for item in de_bruijn_dict]

    # Print and save the answer.
    println(join(de_buijn, "\n"))
    open("output/Assignment_04C.txt", "w") do output_data
        write(output_data, join(de_buijn, "\n"))
    end
end
