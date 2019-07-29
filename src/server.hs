module Main (main) where
{- cabal

build-depends: base, wai-app-static, warp

-}

import Network.Wai.Application.Static (staticApp, defaultWebAppSettings)
import qualified Network.Wai.Handler.Warp as Warp

main :: IO ()
main = do
  putStrLn "Serving on http://localhost:8080"
  Warp.run 8080 app

  where
  app - staticApp (defaultWebAppSettings ".")

