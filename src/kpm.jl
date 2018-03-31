function kpm( A, Vinit, M::Integer )


    nvec = size(Vinit,2)
    n = size(A,1);
    zeta = zeros(M,1);
    mu = zeros(M,1);
    V = zeros(n,M+1) + zeros(n,M+1)*im;

    for l = 1:nvec
        V[:,1] = Vinit[:,l];
        for k = 1:M
            zeta[k] = zeta[k] + real(dot(V[:,1],V[:,k]));
            if ( k == 1 )
                V[:,k+1] = A*V[:,k];
            else
                V[:,k+1] = 2*(A*V[:,k]) - V[:,k-1];
            end
        end
    end

    zeta = zeta ./ nvec;
    for k = 1:M
        kd = 2;
        if( k == 1 ) kd = 1; end
        mu[k] = kd / n / pi * zeta[k];
    end


    p = Polynomials.Poly(0.0)
    for k=1:M
        p += chebyshevpoly(k-1) * mu[k]
    end

    return p


end
