module Handler.Triangle where

import Import

-- Given an integer n, return the nth triangular number
triangles :: Integer -> Integer
triangles n = sum $ take (fromIntegral n) [1..]

-- An error message
getError :: String
getError = "Error"

-- Result is a JSON object, with key = "triangular" and value = "value"
getTriR :: Integer -> Handler Value
getTriR n
    | n < 1     = return $ object ["triangular" .= getError]
    | otherwise = return $ object ["triangular" .= triangles (abs n)]