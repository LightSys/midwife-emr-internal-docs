module Model exposing (..)

import Material
import Template exposing (Template)


type alias Model =
    { mdl : Material.Model
    , selectedTab : Tab
    , selectedPage : Page
    , windowSize : WindowSize
    , eth0IP : String
    , wlan0IP : String
    , hostname : String
    }


type Page
    = MainPage
    | WhatIsPage
    | FeaturesPage
    | HowPage
    | TrainingPage


type Tab
    = UseTab
    | LearnTab


type alias WindowSize =
    { width : Int
    , height : Int
    }


{-| The shape of the data coming into the program at start up.
-}
type alias InitialParams =
    { height : Maybe Int
    , width : Maybe Int
    , hostname : Maybe String
    }


type alias VerbageRecord =
    { body : String
    , title : String
    , teaser : String
    }


type alias ServerInfo =
    { eth0IP : String
    , wlan0IP : String
    }
