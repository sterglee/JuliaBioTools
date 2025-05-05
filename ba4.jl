# A solution to a programming assignment for the Bioinformatics Algorithms (Part 1) on Coursera.
# The associated textbook is Bioinformatics Algorithms: An Active-Learning Approach by Phillip Compeau & Pavel Pevzner.
# The course is run on Coursera and the assignments and textbook are hosted on Stepic

# Problem Title: De Bruijn Graph from k-mers Problem
# Assignment #: 4
# Problem ID: D
# URL: https://beta.stepic.org/Bioinformatics-Algorithms-2/Another-Walk-200/#step-7

# Read the input data.
kmers = readlines("data/stepic_4d.txt")
kmers = map(strip, kmers)

# Create a dictionary matching (k-1)-mers to their followers.
de_bruijn_dict = Dict{String, Set{String}}()
for kmer in kmers
    if haskey(de_bruijn_dict, kmer[1:end-1])
        push!(de_bruijn_dict[kmer[1:end-1]], kmer[2:end])
    else
        de_bruijn_dict[kmer[1:end-1]] = Set([kmer[2:end]])
    end
end

# Write the De Bruijn Graph in the specified format
de_buijn = [string(k, " -> ", join(v, ",")) for (k, v) in de_bruijn_dict]

# Print and save the answer.
println(join(de_buijn, "\n"))
open("output/Assignment_04D.txt", "w") do io
    write(io, join(de_buijn, "\n"))
end
