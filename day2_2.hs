module Main where
import Control.Monad (join)
import Data.List


parseInput :: String -> [(Char, Char)]
parseInput s = let
  lined = lines s
  final = [(head line, last line) | line <- lined]
  in final

changeToInt :: Char -> Int
changeToInt c
  | c == 'A' = 1
  | c == 'B' = 2
  | c == 'C' = 3
  | otherwise = 0

potg :: Char -> Int
potg c
  | c == 'X' = 0
  | c == 'Y' = 3
  | c == 'Z' = 6
  | otherwise = 0

mapTuple :: (a -> b) -> (a, a) -> (b, b)
mapTuple f (a1, a2) = (f a1, f a2)

mapTuple2 :: (a -> b) -> (a -> b) -> (a, a) -> (b, b)
mapTuple2 f1 f2 (a1, a2) = (f1 a1, f2 a2)

getPersonal :: [(Char, Char)] -> [(Int, Int)]
getPersonal = map $ mapTuple2 changeToInt potg
-- getPersonal [] = []
-- getPersonal ((x, y):xs) =

tupleAddition :: (Int, Int) -> Int
tupleAddition (x,y) = x + y

checkGame :: (Int, Int) -> Int
checkGame (x,y)
  | y == 6 && x == 3 = 1
  | y == 6 = x + 1
  | y == 3 = x
  | y == 0 && x == 1 = 3
  | y == 0 = x - 1
  | otherwise = 0

finalGame :: [(Int, Int)] -> [Int]
finalGame [] = []
finalGame (x:xs) = ((checkGame x) + snd x) : finalGame xs

    
main :: IO ()
main = do
  parsedContent <- parseInput <$> readFile "inputs/input2.txt"
  print $ sum $ finalGame $ getPersonal parsedContent
