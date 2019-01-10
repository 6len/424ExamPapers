noah([], [], []).

noah([H1|T1], [H2|T2], [H3,H4|T3]) :-
  H1 = H3,
  H2 = H4,
  noah(T1, T2, T3).
