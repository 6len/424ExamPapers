mul(X, Y, Z) :- mul(X, Y, Z, 0, 0).
mul([_|XS], Y, Z, Xlen, Ylen) :- N is Xlen+1, mul(XS, Y, Z, N, Ylen).
mul([], [_|YS] , Z, Xlen, Ylen) :- N is Ylen+1, mul([], YS, Z, Xlen, N). 
mul([],[], Z, Xlen,Ylen) :- Prod is Xlen*Ylen, length(Z, Prod).