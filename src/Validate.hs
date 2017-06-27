{-# LANGUAGE OverloadedStrings #-}
module Validate where

import Prelude hiding (exp)
import Web.JWT
import Data.Maybe   (fromJust)
import Data.Time.Clock.POSIX

data TokenExpired = Expired deriving Show

data TokenNotExpired = NotExpired deriving Show

valid :: JSON -> IO ()
valid x = do
  now <- getPOSIXTime
  putStrLn $ tokenStatus now x extractExpNumeric

tokenStatus :: POSIXTime -> JSON -> (JWT VerifiedJWT -> NumericDate) -> String
tokenStatus now token ex = case decodeAndVerifySignature (secret "secret") token of
        Just x -> case isTokenExp now ex x of
              Right z -> "Token is valid and not expired."
              Left z -> "Token is valid but expired."
        Nothing -> "Token is invalid."

isTokenExp :: POSIXTime -> (JWT VerifiedJWT -> NumericDate) -> JWT VerifiedJWT -> Either TokenExpired TokenNotExpired
isTokenExp now expT token
  | currentTime >= tokenTime = Left Expired
  | otherwise = Right NotExpired
  where tokenTime = expT token
        currentTime = fromJust $ numericDate now

-- This should have its own type
extractExpNumeric :: JWT VerifiedJWT -> NumericDate
extractExpNumeric x = fromJust (exp (claims x))
