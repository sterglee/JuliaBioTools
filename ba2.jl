# A solution to a programming assignment for the Bioinformatics Algorithms (Part 1) on Coursera.
# The associated textbook is Bioinformatics Algorithms: An Active-Learning Approach by Phillip Compeau & Pavel Pevzner.
# The course is run on Coursera and the assignments and textbook are hosted on Stepic

# Problem Title: Overlap Graph Problem
# Assignment #: 04
# Problem ID: B
# URL: https://beta.stepic.org/Bioinformatics-Algorithms-2/String-Reconstruction-as-a-Walk-Through-the-Overlap-Graph-198/#step-7

using DelimitedFiles

dna = readlines("data/stepic_4b.txt") |> x -> strip.(x)

# Function to check for overlap and print overlaps in the desired way.
check_overlap(pair) = pair[1][2:end] == pair[2][1:end-1]
print_overlap(pair) = join(pair, " -> ")

# Get all pairs, filter out non-overlapping pairs, print overlapping pairs appropriately.
pairs = [(dna1, dna2) for (i, dna1) in enumerate(dna), (j, dna2) in enumerate(dna) if i != j]
overlaps = filter(check_overlap, pairs)
overlaps = map(print_overlap, overlaps)

# Print and save the answer.
println(join(overlaps, "\n"))
write("output/Assignment_04B.txt", join(overlaps, "\n"))
