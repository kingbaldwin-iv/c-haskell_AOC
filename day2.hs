import System.IO
import Data.Char (digitToInt)
import Data.List (sort)

trim :: String -> Char -> [String]
trim [] _ = []
trim (x:xs) y = run (x:xs) y []
 where
  run :: String -> Char -> String -> [String]
  run (x:xs) y n 
   | x == y = [n] ++ run xs y []
   | x /= y = run xs y (n++[x])
  run [] _ n = [n]

pushuntil :: String -> Char -> String 
pushuntil [] _ = []
pushuntil (x:xs) y 
 | x == y = xs
 | x /= y = pushuntil xs y

trimzip :: String -> [[String]]
trimzip [] = []
trimzip x = map (\y -> trim y ',') (trim (pushuntil x ':') ';')

trimzip2 :: String -> [[String]]
trimzip2 x = concat $ map (\y -> (map (\z-> filter (\c->length c > 0) (trim z ' ')) y)) (map (\y -> trim y ',') (trim (pushuntil x ':') ';'))


trz4 x = map (\[a,b] -> (a, read b :: Integer)) (sort $ map (\c -> reverse c) (trimzip2 x))
trz5 [] = True
trz5 ((a,b):xs)
 | a == "red" && b < 13 = trz5 xs
 | a == "green" && b < 14 = trz5 xs
 | a == "blue" && b < 15 = trz5 xs
 | otherwise = False

main :: IO ()
main = do
 contents <- readFile "day2.txt"
 let allLines = lines contents
 print $ sum $ map fst $ filter (\(a,b)-> b) $ zip [1..] (map (\l -> trz5 $ trz4 l) allLines)
