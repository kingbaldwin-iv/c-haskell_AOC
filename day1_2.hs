import System.IO
import Data.Char (digitToInt)
import Data.List (elemIndex,intersect)



evilmain :: String -> Int
evilmain s = 10 * (evilleft 0 s) + evilleft 1 (reverse s)
 where 
  evilleft :: Int -> String -> Int
  evilleft _ [] = -1
  evilleft n (x:xs)
   | elem x (take 9 ['1'..]) = digitToInt x
   | gx /= -1 = gx
   | otherwise = evilleft n xs
    where 
     gx = x3 (if not $ null x1 then elemIndex (head x1) (mapn n) else Nothing)
      where
       x1 :: [String]
       x1 = (intersect (map (\y -> [x] ++ take y xs) [2,3,4]) (mapn n))
       x3 :: Maybe Int -> Int
       x3 (Just a) = a + 1
       x3 Nothing = -1
       nums :: [String]
       nums = ["one","two","three","four","five","six","seven","eight","nine"]
       mapn :: Int -> [String]
       mapn 0 = nums
       mapn 1 = map reverse nums

main :: IO ()
main = do
 contents <- readFile "day1.txt"
 let allLines = lines contents
 putStrLn (head allLines)
 print (sum (map evilmain allLines))
