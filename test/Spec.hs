import Data.List (sort)
import Test.QuickCheck
    ( maxSuccess
    , quickCheck
    , quickCheckWith
    , stdArgs
    , verboseCheck
    )
import Lib
    ( bubblesort
    , mergesort
    , quicksort
    )
import Props
    ( propReverse
    , sortElementInvarianceProp
    , sortIdempotenceProp
    , sortIdentityProp
    , sortLengthCommutativeProp
    , sortRegression
    , sortReversedInvarianceProp
    )



main :: IO ()
main = do
    verboseCheck propReverse
    -- verboseCheck propReverse
    -- quickCheck propReverse
    -- quickCheckWith stdArgs { maxSuccess = 100000 } propReverse
    -- quickCheck (sortRegression sort quicksort)
    -- quickCheck (sortRegression sort mergesort)
    -- quickCheck (sortRegression sort bubblesort)
    -- quickCheck (sortElementInvarianceProp bubblesort)
    -- quickCheck (sortIdempotenceProp bubblesort)
    -- quickCheck (sortLengthCommutativeProp quicksort)
    -- quickCheck (sortReversedInvarianceProp mergesort)
    -- verboseCheck sortIdentityProp
    -- verboseCheck (sortRegression sort quicksort)
    -- verboseCheck (sortRegression bubblesort sort)
    -- quickCheckWith stdArgs { maxSuccess = 10000 } (sortRegression bubblesort sort)
    -- verboseCheck (sortRegression mergesort quicksort)
    -- quickCheckWith stdArgs { maxSuccess = 100 } sortLengthInvarianceProp
    -- quickCheckWith stdArgs { maxSuccess = 100 } sortElementInvarianceProp
    -- quickCheckWith stdArgs { maxSuccess = 100 } sortReversedInvarianceProp
    -- verboseCheck propReverse
