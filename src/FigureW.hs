module FigureW
       ( FigureW
       , newFigureW )
       where

import qualified Data.Text as T

import Graphics.Vty.Widgets.All
import Graphics.Vty.Image

import Figure
import FieldW

data FigureW = FigureW Figure

newFigureW :: Field -> Figure -> IO (Widget Figure)
newFigureW (Field wm wt) f = do
  wRef <- newWidget f $ \w ->
    w { render_ =
           \this _ ctx -> do
             s <- getState this
             return $ vert_cat $ map (string (getNormalAttr ctx)) (lines $ T.unpack $ draw s) }
  return wRef
