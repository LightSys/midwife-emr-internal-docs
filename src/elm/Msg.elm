module Msg exposing (Msg(..))

import Material
import Window


-- LOCAL IMPORTS

import Model exposing (..)


type Msg
    = Mdl (Material.Msg Msg)
    | SelectTab Tab
    | WindowResize Window.Size
    | ViewPage Page
    | GoToTop String
