module Props
    ( propReverse
    , sortElementInvarianceProp
    , sortIdempotenceProp
    , sortIdentityProp
    , sortLengthCommutativeProp
    , sortRegression
    , sortReversedInvarianceProp
    ) where
import qualified Data.Set.Ordered.Unique as Set
import Lib
    ( bubblesort
    , mergesort
    , quicksort)

-- ------------------
-- Reverse Properties
-- ------------------

-- Is `reverse` colinear for `++` operator?
--
-- ∀ xs, ys, reverse (xs ++ ys) == reverse ys ++ reverse xs
--
propReverse :: [Int] -> [Int] -> Bool
propReverse xs ys = reverse (xs ++ ys) == reverse ys ++ reverse xs

-- Sort Properties

-- Is sort == Identity ?? Let's check
--
-- ∀ xs, xs == sort xs
--
sortIdentityProp :: ([Int] -> [Int]) -> [Int] -> Bool
sortIdentityProp sort xs = sort xs == xs

-- Is the sort function equals to an other sort implementation?
--
-- ∀ xs, sort1 xs == sort2 xs
--
sortRegression :: ([Int] -> [Int]) -> ([Int] ->[Int]) ->[Int] ->Bool
sortRegression sort1 sort2 xs = sort1 xs == sort2 xs

-- Is sort idempotent?
--
-- ∀ xs, sort . sort xs == sort xs
--
sortIdempotenceProp :: ([Int] -> [Int]) -> [Int] ->Bool
sortIdempotenceProp sort xs = sort xs == (sort . sort) xs

-- Is the length commutative?
--
-- ∀ xs, length . sort xs == length xs
--
sortLengthCommutativeProp :: ([Int] -> [Int]) ->[Int] ->Bool
sortLengthCommutativeProp sort xs = (length . sort) xs == length xs

-- Are the elements unchanged after sorting the list?
--
-- ∀ xs, {x ∈ sort xs} = {x ∈ xs}
--
sortElementInvarianceProp :: ([String] ->[String]) -> [String] -> Bool
sortElementInvarianceProp sort xs = Set.fromList (sort xs) == Set.fromList xs

-- Reverse invariant
--
-- ∀ xs, sort xs == sort . reverse xs
--
sortReversedInvarianceProp :: ([Int] ->[Int]) ->[Int] ->Bool
sortReversedInvarianceProp sort xs = sort xs == (sort . reverse) xs
