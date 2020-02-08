{-# LANGUAGE OverloadedStrings #-}

module Main where

import Lib
import qualified Data.ByteString.UTF8 as BSU8
import qualified Data.Text.IO as DTIO
import qualified Data.Text.Encoding as DTE
import qualified System.Environment as Sys

  {-
main' :: IO ()
main' = do
  args <- Sys.getArgs
  DTIO.putStrLn $ 
    DTE.decodeUtf8 $ 
      (hashMap (BSU8.fromString $ args !! 0) "FOOBAR") !! 0
-}

main :: IO ()
main = do
  args <- Sys.getArgs
  putStrLn $
    (hashMap (args !! 0) "FOOBAR") !! 0
