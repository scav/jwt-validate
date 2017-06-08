{-# LANGUAGE OverloadedStrings #-}
module Main where

import Web.JWT
import Validate

-- This is the token that will be tested.
-- It needs to provide an exp element.
inputToken :: JSON
inputToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiYWJ0cnUtc2VydmljZSJdLCJ1c2VyX25hbWUiOiJkZXZlbG9wZXIiLCJzY29wZSI6WyJyZWFkIiwid3JpdGUiXSwiZXhwIjoxNDk1Mjg5NTQ5LCJhdXRob3JpdGllcyI6WyJST0xFX1VTRVIiLCJST0xFX0FDVFVBVE9SIl0sImp0aSI6IjA1ZmNlYzk3LWViMzYtNDI0Zi05ODRlLTUyZGM3ZmRlNTQxNSIsImNsaWVudF9pZCI6ImFidHJ1LXNlcnZpY2UifQ.2EYU3a_fW83vBxZg8uHcXA4cd6oFFBOCJgf82-h4IdA"

main :: IO ()
main = valid inputToken
