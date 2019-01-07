thrice(A,X) :- containsInOrder(A,X,0).

containsInOrder(A, [X|Xs], N) :- ((A == X) ->  N1 is N+1; N1 is N+0), containsInOrder(A, Xs, N1).
containsInOrder(_, [], 3).