{-# LANGUAGE OverloadedStrings #-}

module Lib where

import qualified Crypto.Hash.MD5 as MD5
import qualified Data.ByteString.UTF8 as BSU8
import qualified Data.ByteString.Base16 as BSB16

ctx0 = MD5.init
ctx = MD5.update ctx0 "FOOBAR"

nextChar :: Char -> Char
nextChar 'a' = 'b'
nextChar 'b' = 'c'
nextChar 'c' = 'd'
nextChar 'd' = 'e'
nextChar 'e' = 'f'
nextChar 'f' = 'g'
nextChar 'g' = 'h'
nextChar 'h' = 'i'
nextChar 'i' = 'j'
nextChar 'j' = 'k'
nextChar 'k' = 'l'
nextChar 'l' = 'm'
nextChar 'm' = 'n'
nextChar 'n' = 'o'
nextChar 'o' = 'p'
nextChar 'p' = 'q'
nextChar 'q' = 'r'
nextChar 'r' = 's'
nextChar 's' = 't'
nextChar 't' = 'u'
nextChar 'u' = 'v'
nextChar 'v' = 'w'
nextChar 'w' = 'x'
nextChar 'x' = 'y'
nextChar 'y' = 'z'
nextChar 'z' = 'A'
nextChar 'A' = 'B'
nextChar 'B' = 'C'
nextChar 'C' = 'D'
nextChar 'D' = 'E'
nextChar 'E' = 'F'
nextChar 'F' = 'G'
nextChar 'G' = 'H'
nextChar 'H' = 'I'
nextChar 'I' = 'J'
nextChar 'J' = 'K'
nextChar 'K' = 'L'
nextChar 'L' = 'M'
nextChar 'M' = 'N'
nextChar 'N' = 'O'
nextChar 'O' = 'P'
nextChar 'P' = 'Q'
nextChar 'Q' = 'R'
nextChar 'R' = 'S'
nextChar 'S' = 'T'
nextChar 'T' = 'U'
nextChar 'U' = 'V'
nextChar 'V' = 'W'
nextChar 'W' = 'X'
nextChar 'X' = 'Y'
nextChar 'Y' = 'Z'
nextChar 'Z' = '0'
nextChar '0' = '1'
nextChar '1' = '2'
nextChar '2' = '3'
nextChar '3' = '4'
nextChar '4' = '5'
nextChar '5' = '6'
nextChar '6' = '7'
nextChar '7' = '8'
nextChar '8' = '9'
nextChar '9' = '!'
nextChar '!' = '?'
nextChar '?' = '"'
nextChar '"' = '£'
nextChar '£' = '$'
nextChar '$' = '('
nextChar '(' = ')'
nextChar ')' = '<'
nextChar '<' = '>'
nextChar '>' = '.'
nextChar '.' = ','
nextChar ',' = '@'
nextChar '@' = '\''
nextChar '\'' = '€'
nextChar '€' = '&'
nextChar '&' = '*'
nextChar '*' = '^'
nextChar '^' = '%'
nextChar '%' = '|'
nextChar '|' = '-'
nextChar '-' = '_'
nextChar '_' = '='
nextChar '=' = '+'
nextChar '+' = '`'
nextChar '`' = '¬'
nextChar '¬' = '~'
nextChar '~' = '#'
nextChar '#' = '['
nextChar '[' = ']'
nextChar ']' = '{'
nextChar '{' = '}'
nextChar '}' = '/'
nextChar '/' = '\\'
nextChar '\\' = ':'
nextChar ':' = '¦'
nextChar '¦' = ';'
nextChar ';' = ' '
nextChar ' ' = 'a'

iterateString :: String -> String
iterateString [] = "a"
iterateString (char:chars) =
  let next = nextChar char in
      if next == 'a' && char == ' '
      then next : (iterateString chars)
      else next : chars

hashCheck :: BSU8.ByteString
          -> BSU8.ByteString
          -> [BSU8.ByteString]
hashCheck h string =
  if (BSB16.encode $ MD5.hash string) == h
  then [string]
  else []

newHashCheck h string =
  if (BSB16.encode $ placeHolder string) == h
  then [string]
  else []

placeHolder string =
  MD5.finalize $ MD5.update ctx string

hashMap :: BSU8.ByteString
        -> [Char]
        -> [BSU8.ByteString]
hashMap h salt =
  head $
    filter (\x -> length x == 1) $ 
      map (\x -> newHashCheck h (BSU8.fromString $ x)) 
      (iterate iterateString "")
