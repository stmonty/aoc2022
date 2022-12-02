module Main where
import Control.Monad (join)
import Data.List

strToInt :: [String] -> [Int]
strToInt = map read

parseInput :: String -> [String]
parseInput s = let 
    lined = lines s
    separated = lines $ join [if null line then "\n" else line ++ " " 
                                    | line <- lined]
    in separated
main :: IO ()
main = do
  parsedContent <- parseInput <$> readFile "inputs/input1.txt"
  let ans1 = map (sum . strToInt . words) parsedContent
  let ans2 = sum $ take 3 $ reverse (sort ans1)
  print (maximum ans1, ans2)
