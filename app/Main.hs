{-# LANGUAGE OverloadedStrings #-}

module Main where

import Lib
import qualified Data.ByteString.UTF8 as BSU8
import qualified System.Environment as Sys

main :: IO ()
main = do
  args <- Sys.getArgs
  putStrLn $
    show $ hashMap (BSU8.fromString $ args !! 0) "FOOBAR"
