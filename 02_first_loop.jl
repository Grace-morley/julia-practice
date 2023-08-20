global pi_value=0.0::Float64
global val::Float64
for i in 1:100000000
    global val=((-1)^i)/(2*i-1)
    global pi_value-=val
end
y="The aproximation of pi is: $(pi_value*4)"
println(y)