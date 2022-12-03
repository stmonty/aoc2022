module Main where
import Control.Monad (join)
import Data.List
import Data.Char

splitHalf :: [a] -> ([a], [a])
splitHalf [] = ([], [])
splitHalf [x] = ([x], [])
splitHalf (x:y:xys) = (x:xs, y:ys) where (xs, ys) = splitHalf xys

splitHalf2 :: [a] -> ([a], [a])
splitHalf2 [] = ([], [])
splitHalf2 [x] = ([x], [])
splitHalf2 x = (take n x, drop n x) where n = length x `div` 2

mapTuple :: (a -> b) -> (a, a) -> (b, b)
mapTuple f (a1, a2) = (f a1, f a2)

stringToAscii :: [Char] -> [Int]
stringToAscii = map ord

convert :: [([Char], [Char])] -> [([Int], [Int])]
convert [] = []
convert (x:xs) = mapTuple stringToAscii x : convert xs

inter :: [Int] -> [Int] -> Int
inter [] [] = 0
inter xs ys = head $ filter (\x -> x `elem` xs) ys

common :: [([Int], [Int])] -> [Int]
common [] = []
common (x:xs) = uncurry inter x : common xs

finalConvert :: Int -> Int
finalConvert c
  | c < 91 = c - 38
  | c > 91 = c - 96
  | otherwise = 0

main :: IO ()
main = do
  parsed <- lines <$> readFile "inputs/input3.txt"
  let p = map splitHalf2 parsed
  let y = map finalConvert $ common $ convert p
  print $ sum y
