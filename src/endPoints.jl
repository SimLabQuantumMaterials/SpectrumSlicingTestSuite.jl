# form intervals
function endPoints( A, V, M )
    nvec = size(V,2);
    p = kpm(A, V, M);

    ∂p = Polynomials.derivative(p);
    ∂2p = Polynomials.derivative(∂p);

    r_∂p = Polynomials.roots(∂p) |>
        x -> filter( isreal, x ) |>
        real                     |>
        x-> filter(
            item -> -1 < item < 1,
            x )

    r_∂2p = Polynomials.roots(∂2p) |>
        x -> filter( isreal, x )   |>
        real                       |>
        x-> filter(
            item -> -1 < item < 1,
            x )

    roots =  [ r_∂p; r_∂2p]
    roots,p
end
