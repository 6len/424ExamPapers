noah([X|XS], Y, [Z|ZS]) :- ((X == Z) -> noah(Y, XS, ZS)).
noah([],[],[]).