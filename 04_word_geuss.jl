using Random

DATA_PATH="./data/"
filename="words.txt"

global words=[]

open(DATA_PATH*filename,"r") do f
    for line in readlines(f)
        push!(words,chomp(line))
    end
end

global selected_word=rand(words)
global display_word=""
global game_ongoing=true
global guess_count=0

for i in selected_word
    global display_word=display_word*"_"
end

function guess_letter!(user_guess)
    if occursin(user_guess,selected_word)
        println("The letter $user_guess was in the word")

        new_string=""
        for i in eachindex(selected_word)
            if selected_word[i]==user_guess[1]
                new_string=new_string*user_guess
            else
                new_string=new_string*display_word[i]
            end
        end
        global display_word=new_string

        if display_word==selected_word
            println("The word was $selected_word")
            println("The game is over")
            global game_ongoing=false
        else
            println("The current known letters are $display_word")
        end
    end
end

function guess_word!(user_guess)
    if user_guess==selected_word
        println("Your guess was correct, the word was $selected_word")
        println("The game is over")
        global game_ongoing=false
    else
        println("Your guess was incorrect, the Remaining word is $display_word")
    end
end

while game_ongoing
    println(selected_word)
    println("The current word is $display_word")
    user_guess=readline()
    if length(user_guess)==1
        guess_letter!(user_guess)
    elseif length(user_guess)>1
        guess_word!(user_guess)
    else
        println("Invalid guess")
    end
end

