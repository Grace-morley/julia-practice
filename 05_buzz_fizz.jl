count=1000
global words=["buzz","fizz","tazz","pazz"]
global conditions=[3,5,7,11]

for i in 1:count
    to_return=""
    for (value,word) in zip(conditions,words)
        if i%value==0
            to_return=to_return*word
        end
    end
    if to_return==""
        println(i)
    else
        println(to_return)
    end
end