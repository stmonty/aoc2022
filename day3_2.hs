module Main where
import Data.List
import Data.Char

group2 :: Int -> [a] -> [[a]]
group2 _ [] = []
group2 n l
  | n > 0 = (take n l) : (group2 n (drop n l))
  | otherwise = error "Negative or zero n"

stringToAscii :: [Char] -> [Int]
stringToAscii = map ord

inter :: [Int] -> [Int] -> [Int] -> Int
inter [] [] [] = 0
inter xs ys zs = head $ filter (\x -> x `elem` xs) ys

intersection :: (Eq a) => [[a]] -> a
intersection x = head (foldr1 intersect x)

scores :: [[String]] -> [[Char]]
scores [] = []
scores (x:xs) = [intersection x] : scores xs

finalConvert :: Int -> Int
finalConvert c
  | c < 91 = c - 38
  | c > 91 = c - 96
  | otherwise = 0


main :: IO ()
main = do
  parsed <- lines <$> readFile "inputs/input3.txt"
  let p = group2 3 parsed
  let x = map stringToAscii $ scores p
  let y = map finalConvert $ concat x
  print $ sum y
