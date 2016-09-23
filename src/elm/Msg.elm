module Msg exposing (Msg(..))

import Http
import Material
import Time
import Window


-- LOCAL IMPORTS

import Model exposing (..)


type Msg
    = NoOp
    | Mdl (Material.Msg Msg)
    | SelectTab Tab
    | WindowResize Window.Size
    | ViewPage Page
    | GoToTop String
    | FetchServerInfo Time.Time
    | ReceiveServerError Http.Error
    | ReceiveServerInfo ServerInfo
    | SetHostname String
