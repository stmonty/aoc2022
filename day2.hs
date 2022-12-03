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
  | c == 'X' || c == 'A' = 1
  | c == 'Y' || c == 'B' = 2
  | c == 'Z' || c == 'C' = 3
  | otherwise = 0

mapTuple :: (a -> b) -> (a, a) -> (b, b)
mapTuple f (a1, a2) = (f a1, f a2)

getPersonal :: [(Char, Char)] -> [(Int, Int)]
getPersonal = map $ mapTuple changeToInt
-- getPersonal [] = []
-- getPersonal ((x, y):xs) =

checkGame :: (Int, Int) -> Int
checkGame (x,y)
  | (x - y) == -2 = 0
  | (x - y) == 2 = 6
  | x < y = 6
  | x == y = 3
  | otherwise = 0

finalGameScore :: [(Int, Int)] -> [Int]
finalGameScore xs = map (\ x -> (snd x) + checkGame x) xs

main :: IO ()
main = do
  parsedContent <- parseInput <$> readFile "inputs/input2.txt"
  print $ sum $ finalGameScore $ getPersonal parsedContent
