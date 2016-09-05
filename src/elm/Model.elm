module Model exposing (..)

import Material


type alias Model =
    { mdl :
        Material.Model
        -- Boilerplate: model store for any and all Mdl components you use.
    , selectedTab : Tab
    , selectedPage : Page
    , windowSize : WindowSize
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
