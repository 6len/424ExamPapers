scissors([H|T], SplitElem, [], SecondBit) :-
  H = SplitElem,
  T = SecondBit, !.

scissors([H|T], SplitElem, [H1|T1], SecondBit) :-
  H = H1,
  scissors(T, SplitElem, T1, SecondBit).
