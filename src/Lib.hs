{-# LANGUAGE OverloadedStrings #-}

module Lib where

import Crypto.Hash.MD5 (hash)
import qualified Data.ByteString.UTF8 as BSU8
import qualified Data.ByteString.Base16 as BSB16

nextChar :: Char -> Char
nextChar c = go c where
  go :: Char -> Char
  go 'a' = 'b'
  go 'b' = 'c'
  go 'c' = 'd'
  go 'd' = 'e'
  go 'e' = 'f'
  go 'f' = 'g'
  go 'g' = 'h'
  go 'h' = 'i'
  go 'i' = 'j'
  go 'j' = 'k'
  go 'k' = 'l'
  go 'l' = 'm'
  go 'm' = 'n'
  go 'n' = 'o'
  go 'o' = 'p'
  go 'p' = 'q'
  go 'q' = 'r'
  go 'r' = 's'
  go 's' = 't'
  go 't' = 'u'
  go 'u' = 'v'
  go 'v' = 'w'
  go 'w' = 'x'
  go 'x' = 'y'
  go 'y' = 'z'
  go 'z' = 'A'
  go 'A' = 'B'
  go 'B' = 'C'
  go 'C' = 'D'
  go 'D' = 'E'
  go 'E' = 'F'
  go 'F' = 'G'
  go 'G' = 'H'
  go 'H' = 'I'
  go 'I' = 'J'
  go 'J' = 'K'
  go 'K' = 'L'
  go 'L' = 'M'
  go 'M' = 'N'
  go 'N' = 'O'
  go 'O' = 'P'
  go 'P' = 'Q'
  go 'Q' = 'R'
  go 'R' = 'S'
  go 'S' = 'T'
  go 'T' = 'U'
  go 'U' = 'V'
  go 'V' = 'W'
  go 'W' = 'X'
  go 'X' = 'Y'
  go 'Y' = 'Z'
  go 'Z' = '0'
  go '0' = '1'
  go '1' = '2'
  go '2' = '3'
  go '3' = '4'
  go '4' = '5'
  go '5' = '6'
  go '6' = '7'
  go '7' = '8'
  go '8' = '9'
  go '9' = '!'
  go '!' = '?'
  go '?' = '"'
  go '"' = '£'
  go '£' = '$'
  go '$' = '('
  go '(' = ')'
  go ')' = '<'
  go '<' = '>'
  go '>' = '.'
  go '.' = ','
  go ',' = '@'
  go '@' = '\''
  go '\'' = '€'
  go '€' = '&'
  go '&' = '*'
  go '*' = '^'
  go '^' = '%'
  go '%' = '|'
  go '|' = '-'
  go '-' = '_'
  go '_' = '='
  go '=' = '+'
  go '+' = '`'
  go '`' = '¬'
  go '¬' = '~'
  go '~' = '#'
  go '#' = '['
  go '[' = ']'
  go ']' = '{'
  go '{' = '}'
  go '}' = '/'
  go '/' = '\\'
  go '\\' = ':'
  go ':' = ';'
  go ';' = ' '
  go ' ' = 'a'

iterateString :: String -> String
iterateString [] = "a"
iterateString (char:chars) =
  let next = nextChar char in
      if next == 'a' && char == ' '
      then next : (iterateString chars)
      else next : chars
        {-
  go :: String -> String
  go [] = "a"
  go (char:chars) =
    let next = nextChar char in
        if next == 'a' && char == ' '
           then next : (go chars)
           else next : chars
-}

hashCheck h string =
  if (BSB16.encode $ hash string) == h
  then [string]
  else []

hashMap h salt =
  head $
    filter (\x -> length x == 1) $ 
      map (\x -> hashCheck h (BSU8.fromString $ salt ++ x)) 
      (iterate iterateString "")
