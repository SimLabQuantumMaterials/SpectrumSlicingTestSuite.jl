function convergenceratio(z, alpha, W, intervals, nexPercentage)

convergence = map(intervals) do interval

    P = x->phi(z,alpha,interval,x)

    mask = interval[1] .<= W .<= interval[2];
    W_inside  = W[mask]  |> P |> x->abs.(x) ;
    W_outside = W[.!mask] |> P |> x->abs.(x) |> x-> sort(x, order=Base.Order.Reverse);

    nev = length(W_inside)

    minval = minimum( W_inside )
    maxval = W_outside                  |>
        x-> Iterators.drop(x,ceil(Integer,nev*nexPercentage)) |>
        x-> Iterators.take(x,1)         |>
        collect

    if( length(maxval) == 0 )
        @printf("error\n");
        return NaN
    else
        return maxval[1] / minval
    end
end


end
