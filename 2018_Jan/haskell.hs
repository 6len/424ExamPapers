import Data.List

--with filter function
tear :: (Ord a) => (a -> Bool) -> [a] -> [[a]]
tear pred li
	| otherwise = [filter pred li, filter (not . pred) li]

--without filter function
tearNoFilter :: (Ord a) => (a -> Bool) -> [a] -> [[a]]
tearNoFilter pred li
	| otherwise = [noFilterHelper pred li, noFilterHelper (not . pred) li]

noFilterHelper :: (Ord a) => (a -> Bool) -> [a] -> [a]
noFilterHelper pred [] = []
noFilterHelper pred (li:ls) 
	| pred li = li : noFilterHelper pred ls
	| otherwise = noFilterHelper pred ls


main = do 
	print(tear (>5) [1,10,2,12,3,13])
	print(tearNoFilter (>5) [1,10,2,12,3,13])