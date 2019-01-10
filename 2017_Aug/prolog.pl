thrice(Item, List) :-
  thriceHelper(Item, List, 0).

thriceHelper(Item, [], Count):-
  Count = 3, !.
  
thriceHelper(Item, [H|T], Count) :-
  Item = H, !,
  NewCount is Count + 1,
  thriceHelper(Item, T, NewCount)
  ; thriceHelper(Item, T, Count).
