{-# LANGUAGE CPP #-}

module Generic.Data.Internal.Compat
  ( readPrec1
  ) where

import Data.Functor.Classes

#if !MIN_VERSION_base(4,10,0)
import Text.ParserCombinators.ReadPrec (ReadPrec, readS_to_Prec)
import Text.Read (Read(..))
#endif

#if !MIN_VERSION_base(4,10,0)
readPrec1 :: (Read1 f, Read a) => ReadPrec (f a)
readPrec1 = readS_to_Prec $ liftReadsPrec readsPrec readList
#endif