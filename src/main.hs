{-# LANGUAGE OverloadedStrings #-}

import System.IO
import Control.Monad.IO.Class
import Pdf.Document
import System.Environment
import Data.Text

main :: IO ()
main = do
  [input] <- getArgs
  withBinaryFile input ReadMode $ \handle -> do
    pdf <- pdfWithHandle handle
    doc <- document pdf
    catalog <- documentCatalog doc
    rootNode <- catalogPageNode catalog
    count <- pageNodeNKids rootNode
    liftIO $ putStrLn $ show count
    -- the first page of the document
    page <- pageNodePageByNum rootNode 1
    txt <- pageExtractText page
    liftIO $ putStr $ unpack txt
    page <- pageNodePageByNum rootNode 2
    txt <- pageExtractText page
    liftIO $ putStr $ unpack txt
    page <- pageNodePageByNum rootNode 3
    txt <- pageExtractText page
    liftIO $ putStr $ unpack txt
    page <- pageNodePageByNum rootNode 4
    txt <- pageExtractText page
    liftIO $ putStr $ unpack txt
    page <- pageNodePageByNum rootNode 5
    txt <- pageExtractText page
    liftIO $ putStr $ unpack txt
    page <- pageNodePageByNum rootNode 6
    txt <- pageExtractText page
    liftIO $ putStr $ unpack txt

