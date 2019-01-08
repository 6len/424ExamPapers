import Data.List

mapSkip :: (Ord a) => (a -> a) -> [a] -> [a]
mapSkip func li | li == [] = []
mapSkip func li | length li == 1 = [func (head li)]
mapSkip func (l1:l2:ls) = [func l1] ++ l2 : mapSkip func ls

main = do 
	print(mapSkip (+1000) [1..7])