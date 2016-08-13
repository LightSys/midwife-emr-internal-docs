module Main exposing (..)

import Html.App as App
import Html exposing (..)
import Html.Attributes exposing (href, class, style)
import Markdown
import Material
import Material.Card as Card
import Material.Color as Color
import Material.Grid as Grid exposing (grid, cell, size, Device(..))
import Material.Layout as Layout
import Material.Options as Options exposing (css)
import Material.Typography as Typo
import Window


-- LOCAL IMPORTS

import Verbage


type alias Model =
    { mdl :
        Material.Model
        -- Boilerplate: model store for any and all Mdl components you use.
    , selectedTab : Int
    , windowSize : WindowSize
    }


type alias WindowSize =
    { width : Int
    , height : Int
    }


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
    , selectedTab = 0
    , windowSize = windowSizeEmpty
    }


type Msg
    = Mdl (Material.Msg Msg)
    | SelectTab Int
    | WindowResize Window.Size


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Mdl msg' ->
            Material.update msg' model

        SelectTab num ->
            { model | selectedTab = num } ! []

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



-- VIEW


(=>) : a -> b -> ( a, b )
(=>) =
    (,)


type alias Mdl =
    Material.Model


tabSpan : String -> Html a
tabSpan lbl =
    Options.span [ Options.cs "tabLabel" ] [ text lbl ]


tabs : List String -> ( List (Html a), List (Options.Property b d) )
tabs labels =
    ( List.map tabSpan labels
    , [ Color.background (Color.color Color.LightBlue Color.S700) ]
    )


headerSmall : String -> List (Html a)
headerSmall title =
    [ Layout.row []
        [ Layout.title []
            [ text title ]
        ]
    ]


header : String -> List (Html a)
header title =
    [ h2
        [ style [ "padding" => "2rem" ]
        ]
        [ text title ]
    ]


view : Model -> Html Msg
view model =
    Layout.render Mdl
        model.mdl
        [ Layout.fixedHeader
        , Layout.fixedTabs
        , Layout.selectedTab model.selectedTab
        , Layout.onSelectTab SelectTab
        ]
        { header =
            if model.windowSize.height < 600 then
                headerSmall "Welcome to Midwife-EMR"
            else
                header "Welcome to Midwife-EMR"
        , drawer = []
        , tabs =
            tabs [ "Learn", "Use" ]
        , main = [ viewBody model ]
        }


viewBody : Model -> Html Msg
viewBody model =
    case model.selectedTab of
        0 ->
            viewLearn model

        1 ->
            viewUse model

        _ ->
            text "404"


viewUse : Model -> Html Msg
viewUse model =
    div [ style [ "padding" => "2rem" ] ]
        [ text ("Something else goes here")
        ]


viewLearnWhatIsCard : List (Html a)
viewLearnWhatIsCard =
    let
        title =
            "What is Midwife-EMR?"

        contents =
            [ Card.title []
                [ Card.head [ Color.text Color.primaryDark ]
                    [ text title ]
                ]
            ]
                ++ [ Card.text
                        [ Color.text Color.accentContrast
                        , css "padding-bottom" "0"
                        , css "padding-top" "0"
                        ]
                        [ Markdown.toHtml [ class "cardText" ] Verbage.learnIntro
                        ]
                   ]
                ++ [ Card.text [ Card.expand ] []
                   , Card.text
                        [ css "background" "rgba(0,0,0,0.5)"
                        , css "width" "100%"
                        ]
                        [ Options.span
                            [ Color.text Color.white
                            , Typo.title
                            , Typo.contrast 1.0
                            ]
                            [ text "Find out more" ]
                        ]
                   ]
    in
        [ Card.view
            [ css "width" "100%"
            , Color.background Color.accent
            ]
            contents
        ]


viewLearnFeaturesCard : List (Html a)
viewLearnFeaturesCard =
    let
        title =
            "Features"

        contents =
            [ Card.title []
                [ Card.head [ Color.text Color.accent ]
                    [ text title ]
                ]
            ]
                ++ [ Card.text
                        [ Color.text Color.primaryContrast
                        , css "padding-bottom" "0"
                        , css "padding-top" "0"
                        ]
                        [ Markdown.toHtml [ class "cardText" ] Verbage.featuresIntro
                        ]
                   ]
                ++ [ Card.text [ Card.expand ] []
                   , Card.text
                        [ css "background" "rgba(0,0,0,0.5)"
                        , css "width" "100%"
                        ]
                        [ Options.span
                            [ Color.text Color.white
                            , Typo.title
                            , Typo.contrast 1.0
                            ]
                            [ text "Find out more" ]
                        ]
                   ]
    in
        [ Card.view
            [ css "width" "100%"
            , Color.background Color.primaryDark
            ]
            contents
        ]


viewLearnHowToCard : List (Html a)
viewLearnHowToCard =
    let
        title =
            "How do I ...?"

        contents =
            [ Card.title []
                [ Card.head [ Color.text Color.accent ]
                    [ text title ]
                ]
            ]
                ++ [ Card.text
                        [ Color.text Color.primaryContrast
                        , css "padding-bottom" "0"
                        , css "padding-top" "0"
                        ]
                        [ Markdown.toHtml [ class "cardText" ] Verbage.howIntro
                        ]
                   ]
                ++ [ Card.text [ Card.expand ] []
                   , Card.text
                        [ css "background" "rgba(0,0,0,0.5)"
                        , css "width" "100%"
                        ]
                        [ Options.span
                            [ Color.text Color.white
                            , Typo.title
                            , Typo.contrast 1.0
                            ]
                            [ text "Find out more" ]
                        ]
                   ]
    in
        [ Card.view
            [ css "width" "100%"
            , Color.background Color.accentContrast
            ]
            --[ Card.title [] [ Card.head [ Color.text Color.primary ] [ text title ] ]
            --]
            contents
        ]


viewLearnTrainingCard : List (Html a)
viewLearnTrainingCard =
    let
        title =
            "Training"

        contents =
            [ Card.title []
                [ Card.head [ Color.text Color.accent ]
                    [ text title ]
                ]
            ]
                ++ [ Card.text
                        [ Color.text Color.primaryContrast
                        , css "padding-bottom" "0"
                        , css "padding-top" "0"
                        ]
                        [ Markdown.toHtml [ class "cardText" ] Verbage.trainingIntro
                        ]
                   ]
                ++ [ Card.text [ Card.expand ] []
                   , Card.text
                        [ css "background" "rgba(0,0,0,0.5)"
                        , css "width" "100%"
                        ]
                        [ Options.span
                            [ Color.text Color.white
                            , Typo.title
                            , Typo.contrast 1.0
                            ]
                            [ text "Find out more" ]
                        ]
                   ]
    in
        [ Card.view
            [ css "width" "100%"
            , Color.background Color.primary
            ]
            --[ Card.title [] [ Card.head [ Color.text Color.accent ] [ text title ] ]
            --]
            contents
        ]


viewLearn : Model -> Html Msg
viewLearn model =
    div []
        [ grid []
            [ cell [ size Desktop 6, size Tablet 8, size Phone 4 ] viewLearnWhatIsCard
            , cell [ size Desktop 6, size Tablet 8, size Phone 4 ] viewLearnFeaturesCard
            , cell [ size Desktop 6, size Tablet 8, size Phone 4 ] viewLearnHowToCard
            , cell [ size Desktop 6, size Tablet 8, size Phone 4 ] viewLearnTrainingCard
            ]
        ]


init : Maybe WindowSize -> ( Model, Cmd Msg )
init ws =
    let
        newModel =
            { model | windowSize = Maybe.withDefault windowSizeEmpty ws }
    in
        ( newModel, Material.init Mdl )


main : Program (Maybe WindowSize)
main =
    App.programWithFlags
        { init = init
        , view = view
        , subscriptions =
            \model ->
                Sub.batch
                    [ Material.subscriptions Mdl model
                      -- TODO: Do we even need window resize events?
                    , Window.resizes WindowResize
                    ]
        , update = update
        }
