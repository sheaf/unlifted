{-# Language NoImplicitPrelude #-}
{-# Language RebindableSyntax #-}
{-# Language MagicHash #-}
{-# Language KindSignatures #-}
{-# Language DataKinds #-}
{-# Language TypeSynonymInstances #-}
{-# Language ImportQualifiedPost #-}
{-# OPTIONS_GHC -Wno-orphans #-}

module A
  ( module Def.A
  , eqAddr, neAddr, ltAddr, leAddr, gtAddr, geAddr
  , Addr#
  , StablePtr#
  ) where

import Unlifted.Internal.Class
import GHC.Prim
import GHC.Types

import Def.A

eqAddr, neAddr, ltAddr, leAddr, gtAddr, geAddr :: Addr# -> Addr# -> Bool
eqAddr x y = isTrue# (eqAddr# x y)
{-# INLINE [1] eqAddr #-}
neAddr x y = isTrue# (neAddr# x y)
{-# INLINE [1] neAddr #-}
ltAddr x y = isTrue# (ltAddr# x y)
{-# INLINE [1] ltAddr #-}
gtAddr x y = isTrue# (gtAddr# x y)
{-# INLINE [1] gtAddr #-}
leAddr x y = isTrue# (leAddr# x y)
{-# INLINE [1] leAddr #-}
geAddr x y = isTrue# (geAddr# x y)
{-# INLINE [1] geAddr #-}

instance Eq Addr# where
  (==) = eqAddr
  (/=) = neAddr

instance Ord Addr# where
  (<=) = leAddr
  (>=) = geAddr
  (<) = ltAddr
  (>) = gtAddr

instance Eq (StablePtr# a) where
  x == y = isTrue# (eqStablePtr# x y)
