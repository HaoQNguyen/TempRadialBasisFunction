# exact equation
Temp(x) = 100 + 20 * x[1] + 30 * x[2] + 15 * x[1] * x[2];

# radial function
r(x1, x2) = norm([x2[1]-x1[1], x2[2]-x1[2]]);

# chi function with shape parameter c = 1
X(x, xj) = sqrt(1 + r(x, xj)^2 / 1);

# C matrix generation
function C_gen(x)

    C = zeros(length(x), length(x));
    
    for i = 1 : length(x), j = 1 : length(x)

            C[i,j] = X(x[i], x[j]);

    end

    return C;

end

# radial-basis interpolation function
function RBF(x, xj, a)

    T = 0;

    for i = 1 : length(x)

        T += a[i] * X(xj, x[i])

    end

    return T;
    
end