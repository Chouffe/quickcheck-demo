module Lib
    ( bubblesort
    , mergesort
    , quicksort
    ) where

import Data.List
    ( drop
    , take
    )

-- QuickSort Implementation

quicksort :: Ord a =>  [a] -> [a]
quicksort [] = []
quicksort (x:xs) = quicksort [y | y <- xs, y <= x] ++ [x] ++ quicksort [y | y <- xs, y > x]

-- MergeSort Implementation

merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys)
  | x <= y = x : merge xs (y:ys)
  | otherwise = y : merge (x:ys) xs

split :: [a] ->([a], [a])
split [] = ([], [])
split [x] = ([x], [])
split xs = (take n xs, drop n xs)
    where n = div (length xs) 2

mergesort :: Ord a => [a] ->[a]
mergesort [] = []
mergesort [x] = [x]
mergesort xs = let (ys, zs) = split xs
               in
                   merge (mergesort ys) (mergesort zs)

-- Bubble Sort Implementation

bubblesortIter :: (Ord a) => [a] -> [a]
bubblesortIter (x:y:xs)
    | x > y = y : bubblesortIter (x:xs)
    | otherwise = x : bubblesortIter (y:xs)
bubblesortIter x = x

bubblesortHelper :: (Ord a) => [a] -> Int -> [a]
bubblesortHelper xs i
    | i == length xs = xs
    | otherwise = bubblesortHelper (bubblesortIter xs) (i + 1)

bubblesort :: (Ord a) => [a] -> [a]
bubblesort xs = bubblesortHelper xs 0
