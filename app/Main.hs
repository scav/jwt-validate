{-# LANGUAGE OverloadedStrings #-}
module Main where

import Web.JWT
import Validate

-- This is the token that will be tested.
-- It needs to provide an exp element.
inputToken :: JSON
inputToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsic29tZS1zZXJ2aWNlIl0sInVzZXJfbmFtZSI6ImRldmVsb3BlciIsInNjb3BlIjpbInJlYWQiLCJ3cml0ZSJdLCJleHAiOjE0OTkyODk1NDksImF1dGhvcml0aWVzIjpbIlJPTEVfVVNFUiIsIlJPTEVfQUNUVUFUT1IiXSwianRpIjoiMDVmY2VjOTctZWIzNi00MjRmLTk4NGUtNTJnYzdmZGU1NDE1IiwiY2xpZW50X2lkIjoic29tZS1zZXJ2aWNlIn0.5Zm-1L7B6ujCPy1MiqiObYuHNCJfkz8EyB1gehcRJXg"
main :: IO ()
main = valid inputToken
