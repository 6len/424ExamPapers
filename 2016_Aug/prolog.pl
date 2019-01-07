transp([X|XS], [Y|YS]) :- transp(X, XS, Y, YS, YS).
transp([X|XR], XS, [Y|YR], [YT|YS], YA) :- write(X), write(YT), transp(XR, XS, YS, YS, YA).
transp(X, XS, Y, YS, YA) :- transp(XS, YS).
transp([], [], [], [], []).

tr([X|XS], [Y|YS]) :- tr(X, Y, XS, YS).
tr([X|XR], [Y|YR], XS, [YT|YS]) :- write(X), write(Y), tr(XR, YT, XS, YS).
tr([X|_], [Y|YR], XS, YS):- ((X == Y) -> write(X)).
tr([], [], [], []).