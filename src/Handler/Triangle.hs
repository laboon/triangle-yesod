module Handler.Triangle where

import Import

-- An infinite list of triangular numbers
triangles :: Int -> Integer
triangles n = foldl (+) 0 $ take n [1..]

-- Result is a JSON object, with key = "triangular" and value = "value"
getTriR :: Int -> Handler Value
getTriR n = return $ object ["triangular" .= (triangles (abs n))]