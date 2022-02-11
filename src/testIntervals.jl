function testIntervals(A,V,W; l::Real=0.05,u::Real=0.2)
    #const n = size(A,1);
    n = size(A,1);

    roots = map( x ->
                 endPoints(A,V,x)[1],
                 [15; 25; 35; 45])          |>
                     Base.Iterators.flatten |>
                     collect                |>
                     sort

    intvls = Base.Iterators.product( roots, roots) |> collect |> vec

    # post-process intervals
    intvls = filter(intvls) do  x
        count = sum(x[1] .<= W .<= x[2])
        return n*l <= count <= n*u
    end

    intvls = map(intvls) do x
        count = sum(x[1] .<= W .<= x[2])
        return (x...,count)
    end
end

function testIntervals(B,V; l::Real=0.05, u::Real=0.2)

    W = eigen(Matrix(B)).values
    c = (W[1] + W[end]) / 2 ;
    d = (W[end] - W[1]) / 2 ;

    A = (B - I.*c) / d;
    W = (W .- c) / d;

    intvls = testIntervals(A,V,W; l=l,u=u)

return intvls,W

end
