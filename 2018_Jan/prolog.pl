mul(List1, List2, List3) :-
  length(List1, X), length(List2, Y), length(List3, Z),
  Product is X * Y,
  Product = Z.
