module Model exposing (..)

import Material


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
    = SetupTab
    | LearnTab


{-| The shape of window resize events.
-}
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


{-| The shape of the documentation records.
-}
type alias VerbageRecord =
    { body : String
    , title : String
    , teaser : String
    }


{-| The shape of the data coming from the server when fetching
    server information.
-}
type alias ServerInfo =
    { eth0IP : String
    , wlan0IP : String
    }
