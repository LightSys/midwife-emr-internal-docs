port module Main exposing (..)

import Html.App as App
import Material
import Material.Menu
import Window


-- LOCAL IMPORTS

import View exposing (view)
import Msg exposing (Msg(..))
import Model exposing (..)


windowSizeEmpty : { width : Int, height : Int }
windowSizeEmpty =
    { width = 0
    , height = 0
    }


model : Model
model =
    { mdl =
        Material.model
        -- Boilerplate: Always use this initial Mdl model store.
    , selectedTab = UseTab
    , selectedPage = MainPage
    , windowSize = windowSizeEmpty
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Mdl msg' ->
            Material.update msg' model

        SelectTab tab ->
            { model | selectedTab = tab, selectedPage = MainPage } ! []

        WindowResize wsize ->
            let
                newModel =
                    { model | windowSize = wsize }

                _ =
                    Debug.log "windowSize" model.windowSize
            in
                -- TODO: not sure that we even need this at all but it is helpful
                -- to find the breakpoints between devices.
                newModel ! []

        ViewPage page ->
            { model | selectedPage = page } ! []

        GoToTop divId ->
            ( model, scrollParent divId )


init : Maybe WindowSize -> ( Model, Cmd Msg )
init ws =
    let
        newModel =
            { model | windowSize = Maybe.withDefault windowSizeEmpty ws }
    in
        ( newModel, Material.init Mdl )



-- PORTS


{-| We use JS to do the actual scrolling due to needing to scroll a parent element
    created by MDL that does not have an id, which means that the Elm libraries
    won't touch it. This will scroll the parent of the element passed (via id) to
    the top of the screen.
-}
port scrollParent : String -> Cmd msg


main : Program (Maybe WindowSize)
main =
    App.programWithFlags
        { init = init
        , view = view
        , subscriptions =
            \model ->
                Sub.batch
                    [ Material.subscriptions Mdl model
                    , Material.Menu.subs Mdl model.mdl
                      -- TODO: Do we even need window resize events?
                    , Window.resizes WindowResize
                    ]
        , update = update
        }
