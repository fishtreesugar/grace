{-# LANGUAGE DerivingStrategies         #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings          #-}

{-| This module provides newtype wrappers for the different types of
    existential variables used in the type-checking algorithm.

    We don't use naked `Int`s since (empirically) conflating the various
    existentials is a common source of type-checking errors.
-}
module Grace.Existential
    ( -- * Types
      Existential

      -- * Utilities
    , toVariable
    ) where

import Data.Text (Text)
import Grace.Pretty (Pretty(..), label)

import qualified Data.Char as Char
import qualified Data.Text as Text

-- | An unsolved existential variable
newtype Existential a = UnsafeExistential Int
    deriving newtype (Eq, Num, Show)

instance Pretty (Existential a) where
    pretty x = label (pretty (toVariable x))

{-| Convert an existential variable to a user-friendly `Text`
    representation

>>> toVariable 0
"a"
>>> toVariable 1
"b"
>>> toVariable 26
"a0"
-}
toVariable :: Existential a -> Text
toVariable (UnsafeExistential n) = Text.cons prefix suffix
  where
    (q, r) = n `quotRem` 26

    prefix = Char.chr (Char.ord 'a' + r)

    suffix = if q == 0 then "" else Text.pack (show (q - 1))
