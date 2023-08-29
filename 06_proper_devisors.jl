function find_proper_devisors_sum(n)
    p_sum=0
    for i in 1:n-1
        if n%i==0
            p_sum+=i
        end
    end
    return p_sum
end

function find_proper_devisors_label(n)
    p_sum=find_proper_devisors_sum(n)
    if p_sum<n
        return "deficient"
    elseif p_sum == n
        return "perfect"
    else
        return "abundant"
    end
end

end_point=20000
labels=[]

for i in 1:end_point
    push!(labels,find_proper_devisors_label(i))
end

for i in ["deficient","perfect","abundant"]
    value_cont=count(n->(n==i), labels)
    println(i * ": $value_cont")
end




