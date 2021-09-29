function phi(z,a,interval,x)
    z = [z; -z];
    a = [a; -a];

    r = (interval[2] - interval[1]) / 2;
    Emid = interval[1] + r;
    z = z*r .+ Emid;
    a = a*r;

    y = zeros(size(x)...);
    for i = 1:length(z)
        y = y + a[i] ./ (x .- z[i]) + conj(a[i]) ./ (x .- conj(z[i]));
    end
    y
end
