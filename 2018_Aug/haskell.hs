mapSkip :: (a->a) -> [a] -> [a]
mapSkip function [] = []

mapSkip function [x] = [function(x)]

mapSkip function (x:y:xs) =
  (function x): y: (mapSkip function xs)
