module Handler.Triangle where

import Import

-- An infinite list of triangular numbers
triangles :: Int -> Integer
triangles n = foldl (+) 0 $ take n [1..]

-- An error message
getError :: [Char]
getError = "Error"

-- Result is a JSON object, with key = "triangular" and value = "value"
getTriR :: Int -> Handler Value
getTriR n
    | n < 1     = return $ object ["triangular" .= (getError)]
    | otherwise = return $ object ["triangular" .= (triangles (abs n))]