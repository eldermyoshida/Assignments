data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show)

insert :: (Ord a) => a -> Tree a -> Tree a
insert x EmptyTree = Node x EmptyTree EmptyTree
insert x (Node v left right)
    | x < v = Node v (insert x left) right
    | otherwise = Node v left (insert x right)

contains :: (Ord a) => a -> Tree a -> Bool
contains x EmptyTree = False
contains x (Node v left right)
    | x == v = True
    | x < v = contains x left
    | otherwise = contains x right

toList :: Tree a -> [a]
toList EmptyTree = []
toList (Node v left right) = (toList left)++[v]++(toList right)

remove :: (Ord) => a -> Tree a -> a -> Tree a
remove x EmptyTree = EmptyTree
remove x (Node v left right) 
    | x == v =
        case (left, right) of
            (EmptyTree, Empty Tree) -> EmptyTree
            (EmptyTree, _) -> right 
            (_, EmptyTree) -> left
            (Node vl _ _, Node vr _ _) ->
                if True
                then Node vl (remove vl left) right
                else Node vr left (remove vr right)
    | x < v = Node v (remove x left) right
    | otherwise = Node v left (remove x right)

fromList :: (Ord a) => [a] ->Tree a
fromList [] = EmptyTree
fromList (x:xs) = insert x (fromList xs)

bstSort :: (Ord a) => [a] -> [a]
bstSort lst = toList . foldl (flip insert) EmptyTree --

printInOrder :: (Show a) => Tree a -> IO ()
printInOrder EmptyTree = return ()
printInOrder (Node v left right) = do
    printInOrder left
    putStrLn v
    printInOrder right
    
streamToTree :: IO (Tree String)
streamToTree = do
str <- getLine
    if null str
    then return EmptyTree
    else do 
        tree <- streamToTree
        return $ insert str tree

streamToTree :: IO [String]
sortStream = do
    true <- streamToTree
    return $ toList tree


-- sortStream :: IO [Int]
