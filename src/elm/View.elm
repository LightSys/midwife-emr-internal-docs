module View exposing (view)

import Hash exposing (hash)
import Html exposing (..)
import Html.Attributes exposing (class, href, id, style)
import Markdown
import Material
import Material.Button as Button
import Material.Card as Card
import Material.Color as Color
import Material.Elevation as Elevation
import Material.Grid as Grid exposing (grid, cell, size, Device(..))
import Material.Layout as Layout
import Material.List as MList
import Material.Menu
import Material.Options as Options exposing (css, styled, when)
import Material.Typography as Typo
import String


-- LOCAL IMPORTS

import Msg exposing (Msg(..))
import Model exposing (..)
import Verbage


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


topBtn : number
topBtn =
    5


{-| Translation from Tab to Int for the sake of MDL.
-}
getTabInt : Tab -> Int
getTabInt tab =
    case tab of
        UseTab ->
            0

        LearnTab ->
            1


{-| Translation from Int to Tab for the sake of MDL. Since
    MDL requires Ints to represent tabs, we cannot escape
    these mappings.
-}
getIntTab : Int -> Tab
getIntTab num =
    case num of
        0 ->
            UseTab

        1 ->
            LearnTab

        _ ->
            LearnTab


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
            , Layout.selectedTab (getTabInt model.selectedTab)
            , Layout.onSelectTab (\t -> getIntTab t |> SelectTab)
            ]
            { header =
                if model.windowSize.height < 600 then
                    headerSmall "Welcome to Midwife-EMR"
                else
                    header "Welcome to Midwife-EMR"
            , drawer = []
            , tabs =
                tabs [ "Use", "Learn" ]
            , main = [ main model ]
            }


fst3 : ( a, b, c ) -> a
fst3 ( a, b, c ) =
    a


snd3 : ( a, b, c ) -> b
snd3 ( a, b, c ) =
    b


trd3 : ( a, b, c ) -> c
trd3 ( a, b, c ) =
    c


infixr 5 :>
(:>) : (a -> b) -> a -> b
(:>) f x =
    f x


{-| Displays


-}
viewDetailPage : String -> List ( String, String, String ) -> Color.Color -> Color.Color -> Color.Color -> Bool -> Model -> Html Msg
viewDetailPage title cards backColor titleColor textColor isTopLevel model =
    let
        divId =
            hash title |> toString |> String.append "divId"

        generateId str =
            String.words str
                |> String.join "-"

        toc =
            List.indexedMap
                (\idx card ->
                    MList.li [ MList.withBody ]
                        [ MList.content []
                            [ a [ href <| generateId <| "#" ++ (snd3 card) ]
                                [ text <| snd3 card ]
                            , MList.body [] [ text <| trd3 card ]
                            ]
                        ]
                )
                cards

        body =
            List.indexedMap
                (\idx card ->
                    cell [ size Desktop 12, size Tablet 8, size Phone 4 ]
                        [ Card.view
                            [ css "width" "100%"
                            , Color.background backColor
                            , Card.border
                            ]
                            [ Card.title []
                                [ Card.head
                                    [ Color.text titleColor
                                    , Options.attribute <| Html.Attributes.id <| generateId <| snd3 card
                                    ]
                                    [ text <| snd3 card ]
                                ]
                            , Card.text [ Color.text textColor ]
                                [ Markdown.toHtml [] <| fst3 card ]
                            , Card.menu []
                                [ Button.render Mdl
                                    [ topBtn ]
                                    model.mdl
                                    [ Button.plain
                                    , Button.ripple
                                    , Color.text Color.white
                                    , Button.onClick (GoToTop divId)
                                    ]
                                    [ text "Go to top" ]
                                ]
                            ]
                        ]
                )
                cards
    in
        div
            [ style [ "padding" => "2rem" ]
            , id divId
            ]
            [ Button.render Mdl
                [ learnBackBtn ]
                model.mdl
                [ Button.ripple
                , Button.colored
                , Button.onClick <| ViewPage MainPage
                , Button.disabled `when` isTopLevel
                , css "display" "none" `when` isTopLevel
                ]
                [ text "Back" ]
            , styled p [ Typo.display2 ] [ text title ]
            , MList.ul [] toc
            , grid [] body
            ]


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
        , Button.render Mdl
            [ learnBackBtn ]
            model.mdl
            [ Button.ripple
            , Button.colored
            , Button.onClick <| ViewPage MainPage
            ]
            [ text "Back" ]
        ]


viewHow : Model -> Html Msg
viewHow model =
    viewDetailPage "How do I ... ?" Verbage.howPageCards Color.primary Color.accent Color.primaryContrast False model


viewTraining : Model -> Html Msg
viewTraining model =
    div [ style [ "padding" => "2rem" ] ]
        [ text ("Training page")
        , Button.render Mdl
            [ learnBackBtn ]
            model.mdl
            [ Button.ripple
            , Button.colored
            , Button.onClick <| ViewPage MainPage
            ]
            [ text "Back" ]
        ]


viewMain : Model -> Html Msg
viewMain model =
    case model.selectedTab of
        UseTab ->
            viewUse model

        LearnTab ->
            viewLearn model


{-| Purpose:
    1. Allow user to download and install CA certificate, including instructions.
    2. Link to Midwife-EMR application (more than one IP?)
    3. Display IP addresses currently in use.
-}
viewUse : Model -> Html Msg
viewUse model =
    let
        page =
            viewDetailPage "Using Midwife-EMR" Verbage.usePageCards Color.primary Color.accent Color.primaryContrast True model
    in
        page


cardContents : Int -> Page -> Model -> Color.Color -> Color.Color -> String -> String -> List (Card.Block Msg)
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
            , Elevation.e4
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
            , Elevation.e4
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
            , Elevation.e4
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
            , Elevation.e4
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
