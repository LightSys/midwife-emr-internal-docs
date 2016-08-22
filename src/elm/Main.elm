module Main exposing (..)

import Html.App as App
import Html exposing (..)
import Html.Attributes exposing (href, class, style)
import Markdown
import Material
import Material.Button as Button
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
    , selectedPage : Page
    , windowSize : WindowSize
    }


type Page
    = MainPage
    | WhatIsPage
    | FeaturesPage
    | HowPage
    | TrainingPage


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
    , selectedPage = MainPage
    , windowSize = windowSizeEmpty
    }



-- Material component indexes


learnWhatIsBtn : number
learnWhatIsBtn =
    0


learnFeaturesBtn : number
learnFeaturesBtn =
    1


learnHowToBtn : number
learnHowToBtn =
    2


learnTrainingBtn : number
learnTrainingBtn =
    3


learnBackBtn : number
learnBackBtn =
    4


type Msg
    = Mdl (Material.Msg Msg)
    | SelectTab Int
    | WindowResize Window.Size
    | ViewPage Page


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Mdl msg' ->
            Material.update msg' model

        SelectTab num ->
            { model | selectedTab = num, selectedPage = MainPage } ! []

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
    let
        main =
            case model.selectedPage of
                MainPage ->
                    viewMain

                WhatIsPage ->
                    viewWhatIs

                FeaturesPage ->
                    viewFeatures

                HowPage ->
                    viewHow

                TrainingPage ->
                    viewTraining
    in
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
            , main = [ main model ]
            }


viewWhatIs : Model -> Html Msg
viewWhatIs model =
    div [ style [ "padding" => "2rem" ] ]
        [ text ("What is page")
        , Button.render Mdl
            [ learnBackBtn ]
            model.mdl
            [ Button.ripple
            , Button.colored
            , Button.onClick <| ViewPage MainPage
            ]
            [ text "Back" ]
        ]


viewFeatures : Model -> Html Msg
viewFeatures model =
    div [ style [ "padding" => "2rem" ] ]
        [ text ("Features page")
        ]


viewHow : Model -> Html Msg
viewHow model =
    div [ style [ "padding" => "2rem" ] ]
        [ text ("How page")
        ]


viewTraining : Model -> Html Msg
viewTraining model =
    div [ style [ "padding" => "2rem" ] ]
        [ text ("Training page")
        ]


viewMain : Model -> Html Msg
viewMain model =
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



--cardContents : Color.Color -> String -> String -> List (Material.Card.Block a)


cardContents cardIdx page model headColor textColor title content =
    [ Card.title []
        [ Card.head [ Color.text headColor ]
            [ text title ]
        ]
    ]
        ++ [ Card.text
                [ Color.text textColor
                , css "padding-bottom" "0"
                , css "padding-top" "0"
                ]
                [ Markdown.toHtml [ class "cardText" ] content
                ]
           ]
        ++ [ Card.text [ Card.expand ] []
           , Card.actions [ Card.border ]
                [ Button.render Mdl
                    [ cardIdx ]
                    model.mdl
                    [ Button.ripple
                    , Button.accent
                    , Color.text Color.white
                    , css "width" "100%"
                    , css "background" "rgba(0,0,0,0.5)"
                    , Button.onClick <| ViewPage page
                    ]
                    [ text "Find out more" ]
                ]
           ]


viewLearnWhatIsCard : Model -> List (Html Msg)
viewLearnWhatIsCard model =
    let
        title =
            "What is Midwife-EMR?"

        contents =
            cardContents learnWhatIsBtn WhatIsPage model Color.primaryDark Color.accentContrast title Verbage.learnIntro
    in
        [ Card.view
            [ css "width" "100%"
            , Color.background Color.accent
            ]
            contents
        ]


viewLearnFeaturesCard : Model -> List (Html Msg)
viewLearnFeaturesCard model =
    let
        title =
            "Features"

        contents =
            cardContents learnFeaturesBtn FeaturesPage model Color.white Color.accent title Verbage.featuresIntro
    in
        [ Card.view
            [ css "width" "100%"
            , Color.background Color.primaryDark
            ]
            contents
        ]


viewLearnHowToCard : Model -> List (Html Msg)
viewLearnHowToCard model =
    let
        title =
            "How do I ...?"

        contents =
            cardContents learnHowToBtn HowPage model Color.accent Color.primaryContrast title Verbage.howIntro
    in
        [ Card.view
            [ css "width" "100%"
            , Color.background Color.primary
            ]
            contents
        ]


viewLearnTrainingCard : Model -> List (Html Msg)
viewLearnTrainingCard model =
    let
        title =
            "Training"

        contents =
            cardContents learnTrainingBtn TrainingPage model Color.accent Color.primaryContrast title Verbage.trainingIntro
    in
        [ Card.view
            [ css "width" "100%"
            , Color.background Color.accentContrast
            ]
            contents
        ]


viewLearn : Model -> Html Msg
viewLearn model =
    div []
        [ grid []
            [ cell [ size Desktop 6, size Tablet 8, size Phone 4 ] <| viewLearnWhatIsCard model
            , cell [ size Desktop 6, size Tablet 8, size Phone 4 ] <| viewLearnFeaturesCard model
            , cell [ size Desktop 6, size Tablet 8, size Phone 4 ] <| viewLearnHowToCard model
            , cell [ size Desktop 6, size Tablet 8, size Phone 4 ] <| viewLearnTrainingCard model
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
