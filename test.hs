import HW2types
import Data.List

-- Exercise 1

-- Problem A
ins :: Eq a => a -> Bag a -> Bag a
ins a [] = [(a, 1)]
ins a (y:ys)  | a == fst y = (a, succ(snd y)):ys
              | otherwise = y : (ins a ys)

-- Problem B
del :: Eq a => a -> Bag a -> Bag a
del a [] = []
del a (y:ys)  | ((a == fst y) && (snd y /= 1)) = (a, pred(snd y)):ys
              | ((a == fst y) && (snd y == 1)) = ys
              | otherwise = y : (del a ys)

-- Problem C
bag :: Eq a => [a] -> Bag a
bag [] = []
bag (x:xs) = ins x (bag xs)


-- Problem D
subbag :: Eq a => Bag a -> Bag a -> Bool
subbag [] [] = True
subbag [] _ = True
subbag _ [] = False
subbag (x:xs) (y:ys)    | x == y = subbag (xs) (ys)
                        | otherwise = subbag (x:xs) (ys)

-- Problem E
-- isSet :: Eq a => Bag a -> Bool

-- Problem F
-- size :: Bag a -> Int


-- Exercise 2

g :: Graph
g = [(1,2),(1,3),(2,3),(2,4),(3,4)]
h :: Graph
h = [(1,2),(1,3),(2,1),(3,2),(4,4)]

-- Problem A
toNode :: Edge -> [Node]
toNode (x, y) = [x, y]

nodes :: Graph -> [Node]
nodes [] = []
nodes (x:xs) = nub((toNode x) ++ (nodes xs))

-- Problem B
suc :: Node -> Graph -> [Node]
suc a [] = []
suc a ((x, y):xs) | a == x = nub(y : suc a xs)
                  | otherwise = suc a xs

-- Problem C
-- detach :: Node -> Graph -> Graph

-- Problem D
-- cyc :: Int -> Graph


-- Exercise 3
f = [Pt (4,4), Circle (5,5) 3, Rect (3,3) 7 2]

-- Problem A
width :: Shape -> Length
width (Pt p) = 0
width (Circle p l) = 2 * l
width (Rect p l1 l2) = l1

-- Problem B
bbox :: Shape -> BBox
bbox (Pt p) = (p, p)
bbox (Circle p l) = (((fst p) - l, (snd p) - l), ((fst p) + l, (snd p) + l))
bbox (Rect p l1 l2) = ((fst p, snd p), ((fst p) + l1, (snd p) + l2))

-- Problem C
minX :: Shape -> Number
minX (Pt p) = fst p
minX (Circle p l) = (fst p) - l
minX (Rect p l1 l2) = fst p

-- Problem D
-- move :: Shape -> Point -> Shape
