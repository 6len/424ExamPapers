%% 2018 Aug
scissors([A|AX], B, [C|CX], D) :- ((A == C) ->   scissors(AX, B, CX, D)).
scissors([A|AX], B, [], D) :- ((A == B) -> scissors(AX, _, [], D)).
scissors([A|AX], _, [], [D|DX]) :- ((A == D) -> scissors(AX , _, [], DX)).
scissors([], _, [], []).

%% 2018 Jan
mul(X, Y, Z) :- mul(X, Y, Z, 0, 0).
mul([_|XS], Y, Z, Xlen, Ylen) :- N is Xlen+1, mul(XS, Y, Z, N, Ylen).
mul([], [_|YS] , Z, Xlen, Ylen) :- N is Ylen+1, mul([], YS, Z, Xlen, N). 
mul([],[], Z, Xlen,Ylen) :- Prod is Xlen*Ylen, length(Z, Prod).

%% 2017 Aug
thrice(A, [X|XS]) :- 