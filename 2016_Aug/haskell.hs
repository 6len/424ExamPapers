tr :: (Ord a) => [[a]]->[[a]]
tr (l1)
	| last l1 == [] = []
	| otherwise = [map head l1] ++ tr(map tail l1)

main = do
	print(tr [[1,2,3],[4,5,6]])