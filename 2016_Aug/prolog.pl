tr(X, Y) :- tr(X, Y, 0).
tr([X|XS], Y, N) :- N1 is N+1, ((trCheck(X, Y, N) -> tr(XS, Y, N1))).
tr([], _, _).
    
trCheck([X|XS], [Y|YS] , N) :- ((nth0(N, Y, X)) -> trCheck(XS, YS, N)).
trCheck([], [], _).
