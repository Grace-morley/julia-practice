using Plots
global shape=400::Int64
global current_bord=rand([0,1],shape,shape)
global next_bord=zeros(shape,shape)
global p=heatmap(current_bord)

for t in 1:100000
    Threads.@threads for i in 1:shape
        Threads.@threads for j in 1:shape

            index_sum=current_bord[mod1(i-1,shape),mod1(j-1,shape)]
            index_sum+=current_bord[mod1(i-1,shape),mod1(j,shape)]
            index_sum+=current_bord[mod1(i-1,shape),mod1(j+1,shape)]

            index_sum+=current_bord[mod1(i-0,shape),mod1(j-1,shape)]
            index_sum+=current_bord[mod1(i-0,shape),mod1(j+1,shape)]

            index_sum+=current_bord[mod1(i+1,shape),mod1(j-1,shape)]
            index_sum+=current_bord[mod1(i+1,shape),mod1(j,shape)]
            index_sum+=current_bord[mod1(i+1,shape),mod1(j+1,shape)]

            if current_bord[i,j]==1 && index_sum==2 || index_sum==3
                next_bord[i,j]=1
            end
            if current_bord[i,j]==0 &&  index_sum==3
                next_bord[i,j]=1
            end
        end
    end
    global current_bord=copy(next_bord)
    global next_bord=zeros(Bool,shape,shape)
    p=heatmap(current_bord)
    display(p)
end