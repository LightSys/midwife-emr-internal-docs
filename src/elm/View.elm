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
import Material.Icon as Icon
import Material.Layout as Layout
import Material.List as MList
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
        SetupTab ->
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
            SetupTab

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


midwifeLink : String -> String
midwifeLink hostname =
    "https://" ++ hostname


{-| Show the link to the server that the user is currently connected with
    so that the user can start Midwife-EMR.
-}
headerLink : Model -> Html a
headerLink model =
    let
        isLink =
            String.length model.hostname
                > 0
                && (model.hostname == model.wlan0IP || model.hostname == model.eth0IP)

        link =
            if isLink then
                Layout.link
                    [ Layout.href <| midwifeLink model.hostname
                    , Color.background <| Color.accentContrast
                    , Color.text <| Color.accent
                    ]
                    [ text "Go to Midwife-EMR" ]
            else
                text ""
    in
        Layout.navigation [] [ link ]


headerSmall : String -> Model -> List (Html a)
headerSmall title model =
    let
        contents =
            [ Layout.row []
                [ Layout.title []
                    [ text title
                    ]
                , Layout.spacer
                , Layout.row [] [ headerLink model ]
                ]
            ]
    in
        contents


{-| Not currently used.
-}
header : String -> Model -> List (Html a)
header title model =
    [ div []
        [ h2 [ style [ "padding" => "2rem" ] ]
            [ text title ]
        , Layout.row [] [ headerLink model ]
        ]
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
            { header = headerSmall "Midwife-EMR" model
            , drawer = []
            , tabs =
                tabs [ "Setup", "Learn" ]
            , main = [ main model ]
            }


titleToId : String -> String -> String
titleToId title appendage =
    hash title |> toString |> String.append appendage


infixr 5 :>
(:>) : (a -> b) -> a -> b
(:>) f x =
    f x


{-| Displays an optional back button at the top followed by a table of contents
    in the form of a list with a link and explanatory text. Each link leads to
    the section detail.
-}
viewDetailPage : String -> List VerbageRecord -> Color.Color -> Color.Color -> Color.Color -> Bool -> Model -> Html Msg
viewDetailPage title cards backColor titleColor textColor isTopLevel model =
    let
        divId =
            titleToId title "divId"

        generateId str =
            String.words str
                |> String.join "-"

        toc =
            List.indexedMap
                (\idx card ->
                    MList.li [ MList.withBody ]
                        [ MList.content []
                            [ a
                                [ href <| generateId <| "#" ++ (card.title)
                                , style [ "color" => "#0288D1" ]
                                ]
                                [ text <| card.title ]
                            , MList.body [] [ Markdown.toHtml [] <| card.teaser ]
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
                                    , Options.attribute <| Html.Attributes.id <| generateId <| card.title
                                    ]
                                    [ text <| card.title ]
                                ]
                            , Card.text [ Color.text textColor ]
                                [ Markdown.toHtml [] <| card.body ]
                            , Card.menu [ Options.cs "go-to-top-button" ]
                                [ Button.render Mdl
                                    [ topBtn ]
                                    model.mdl
                                    [ Button.icon
                                    , Color.background Color.primary
                                    , Color.text Color.white
                                    , Button.onClick (GoToTop divId)
                                    ]
                                    [ Icon.i "arrow_upward" ]
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
            , styled p [ Typo.display1 ] [ text title ]
            , MList.ul [] toc
            , grid [] body
            ]


viewWhatIs : Model -> Html Msg
viewWhatIs model =
    div [ style [ "padding" => "2rem" ] ]
        [ Button.render Mdl
            [ learnBackBtn ]
            model.mdl
            [ Button.ripple
            , Button.colored
            , Button.onClick <| ViewPage MainPage
            ]
            [ text "Back" ]
        , grid []
            [ cell
                [ size Desktop 12
                , size Tablet 8
                , size Phone 4
                ]
                [ Card.view
                    [ css "width" "100%"
                    , Color.background Color.accent
                    , Elevation.e4
                    ]
                    [ Card.text [ Color.text Color.accentContrast ]
                        [ Markdown.toHtml [] Verbage.whatIsPage ]
                    ]
                ]
            ]
        ]


viewFeatures : Model -> Html Msg
viewFeatures model =
    div [ style [ "padding" => "2rem" ] ]
        [ text ("Obviously we have not finished this page, sorry about that.")
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
    viewDetailPage "How do I ... ?"
        (Verbage.howPageCards model)
        Color.primary
        Color.accent
        Color.primaryContrast
        False
        model


viewTraining : Model -> Html Msg
viewTraining model =
    div [ style [ "padding" => "2rem" ] ]
        [ text ("Unfortunately we haven't written this yet - sorry.")
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
        SetupTab ->
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
    viewDetailPage "Setting up Midwife-EMR"
        Verbage.setupPageCards
        Color.primary
        Color.accent
        Color.primaryContrast
        True
        model


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
