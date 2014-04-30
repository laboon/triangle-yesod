module Foundation where

import           Yesod
import           Yesod.Default.Util
import           Yesod.Form.Jquery

data App = App

instance Yesod App

mkYesodData "App" [parseRoutes|
/             HomeR     GET
/tri/#Integer TriR      GET
|]
