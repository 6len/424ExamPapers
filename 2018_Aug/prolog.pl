scissors([A|AX], B, [C|CX], D) :- ((A == C) ->   scissors(AX, B, CX, D)).
scissors([A|AX], B, [], D) :- ((A == B) -> scissors(AX, _, [], D)).
scissors([A|AX], _, [], [D|DX]) :- ((A == D) -> scissors(AX , _, [], DX)).
scissors([], _, [], []).
