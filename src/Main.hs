import           Handler.Home
import           Handler.Triangle
import           Import

mkYesodDispatch "App" resourcesApp

main :: IO ()
main = warpEnv App

