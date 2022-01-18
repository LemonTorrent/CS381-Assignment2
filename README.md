# CS381-Assignment2

Exercise 1. Programming with Lists
Multisets,orbags,canberepresentedaslistofpairs(x,n) wherenindicatesthenumberofoccurrencesofxinthe
multiset.
type Bag a = [(a,Int)]
For the following exercises you can assume the following properties of the bag representation. But note: Your
function definitions have to maintain these properties for any multiset they produce!
(1) Each element x occurs in at most one pair in the list.
(2) Each element that occurs in a pair has a positive counter.
Asanexampleconsiderthemultiset{2,3,3,5,7,7,7,8},whichhasthefollowingrepresentation(amongothers).
[(5,1),(7,3),(2,1),(3,2),(8,1)]
Notethattheorderofelementsisnotfixed. Inparticular,wecannotassumethattheelementsaresorted. Thus,
the above list representation is just one example of several possible.

(a) Define the function ins that inserts an element into a multiset.
ins :: Eq a => a -> Bag a -> Bag a
(Note: The class constraint ”Eq a =>” restricts the element type a to those types that allow the comparison
of elements for equality with ==.)

(b) Definethefunctiondel thatremovesasingleelementfromamultiset. Notethatdeleting3 from{2,3,3,4}
yields{2,3,4}whereas deleting 3 from {2,3,4}yields{2,4}.
del :: Eq a => a -> Bag a -> Bag a

(c) Define a function bag that takes a list of values and produces a multiset representation.
bag :: Eq a => [a] -> Bag a
For example, with xs = [7,3,8,7,3,2,7,5] we get the following result.
> bag xs
[(5,1),(7,3),(2,1),(3,2),(8,1)]
(Note: It’s a good idea to use of the function ins defined earlier.)

(d) Define a function subbag that determines whether or not its first argument bag is contained in the second.
subbag :: Eq a => Bag a -> Bag a -> Bool
Note that a bag b is contained in a bag b if every element that occurs n times in b occurs also at least n times
in b′.

(e) Define a function is Set that tests whether a bag is actually a set, which is the case when each element occurs
only once.
isSet :: Eq a => Bag a -> Bool

(f) Define a function size that computes the number of elements contained in a bag.
size :: Bag a -> Int
Exercise 2. Graphs
A simple way to represent a directed graph is through a list of edges. An edge is given by a pair of nodes. For
simplicity,nodes are represented by integers.
type Node = Int
type Edge = (Node,Node)
type Graph = [Edge]
type Path = [Node]
(We ignore the fact that this representation cannot distinguish between isolated nodes with and without loops;
see, for example, the loop/edge (4,4) in the graph h that represents an isolated node.)
Consider,for example, the following directed graphs.
g =
1 2
3 4
h =
1 2
3 4
These two graphs are represented as follows.
g :: Graph
g = [(1,2),(1,3),(2,3),(2,4),(3,4)]
h :: Graph
h = [(1,2),(1,3),(2,1),(3,2),(4,4)]
3
Note: In some of your function definitions you might want to use the function norm (defined in the file HW1types.hs)
to remove duplicates from a list and sort it.

(a) Define the function nodes :: Graph -> [Node] that computes the list of nodes contained in a given graph.
For example, nodes g = [1,2,3,4].

(b) Define the function suc :: Node -> Graph -> [Node] that computes the list of successors for a node in a
given graph. For example, suc 2 g = [3,4], suc 4 g = [],and suc 4 h = [4].

(c) Definethefunctiondetach :: Node -> Graph -> Graph thatremovesanodetogetherwithallofitsincident
edges from a graph. For example, detach 3 g = [(1,2),(2,4)] and detach 2 h = [(1,3),(4,4)].

(d) Define the function cyc :: Int -> Graph that creates a cycle of any given number. For example, cyc 4 =
[(1,2),(2,3),(3,4),(4,1)].
Note: All functions can be succinctly implemented with list comprehensions.
Exercise 3. Programming with Data Types
Here is the definition of a data type for representing a few basic shapes. A figure is a collection of shapes. The
type BBox represents bounding boxes of objects by the points of the lower-left and upper-right hand corners of the
smallest enclosing rectangle.
type Number = Int
type Point = (Number,Number)
type Length = Number
data Shape = Pt Point
| Circle Point Length
| Rect Point Length Length
deriving Show
type Figure = [Shape]
type BBox = (Point,Point)

(a) Define the function width that computes the width of a shape.
width :: Shape -> Length
For example, the widths of the shapes in the figure f are as follows.
f = [Pt (4,4), Circle (5,5) 3, Rect (3,3) 7 2]
> map width f
[0,6,7]

(b) Define the function bbox that computes the bounding box of a shape.
bbox :: Shape -> BBox
The bounding boxes of the shapes in the figure f are as follows.
> map bbox f
[((4,4),(4,4)),((2,2),(8,8)),((3,3),(10,5))]
4

(c) Define the function minX that computes the minimum x coordinate of a shape.
minX :: Shape -> Number
The minimum x coordinates of the shapes in the figure f are as follows.
> map minX f
[4,2,3]

(d) Define a function move that moves the position of a shape by a vector given by a point as its second argument.
move :: Shape -> Point -> Shape
It is probably a good idea to define and use an auxiliary function addPt :: Point -> Point -> Point,which
adds two points component wise.
