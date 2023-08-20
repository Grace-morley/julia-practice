DATA_PATH="./data/"
filename="words.txt"

open(DATA_PATH*filename,"r") do f
    for line in readlines(f)
        println(line)
    end
end