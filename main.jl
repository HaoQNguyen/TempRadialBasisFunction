using LinearAlgebra;
using Zygote;
include("function.jl");

# random points
x1 = [1,6];
x2 = [2,5];
x3 = [8,4];
x4 = [7,3];
x5 = [0,9];
x6 = [16,34];
x7 = [72,59];
x8 = [80,66];

x = [x1, x2, x3, x4, x5, x6, x7, x8];

# T matrix
T = [Temp(x1); Temp(x2); Temp(x3); Temp(x4); Temp(x5); Temp(x6); Temp(x7); Temp(x8)];

# C matrix
C = C_gen(x);

# alpha matrix
a = C \ T;

# interpolation testing points
x9  = [1,9];
x10 = [0,6];
x11 = [2,3];
x12 = [7,5];
x13 = [4,8];

T = [Temp(x9), Temp(x10), Temp(x11), Temp(x12), Temp(x13)];
Tint = [RBF(x,x9,a), RBF(x,x10,a), RBF(x,x11,a), RBF(x,x12,a), RBF(x,x13,a)];

res = T - Tint;
display(res);