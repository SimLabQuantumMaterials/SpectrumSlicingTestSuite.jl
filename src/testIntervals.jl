function testIntervals(A,V,W)
    const n = size(A,1);

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
        return n*0.05 <= count <= n*0.2
    end

    intvls = map(intvls) do x
        count = sum(x[1] .<= W .<= x[2])
        return (x...,count)
    end
end

function testIntervals(B,V)

W = eigfact(B)[:values]
const c = (W[1] + W[end]) / 2 ;
const d = (W[end] - W[1]) / 2 ;

const A = (B - eye(size(B)...)*c) / d;
W = (W - c) / d;

intvls = testIntervals(A,V,W)

return intvls,W

end
