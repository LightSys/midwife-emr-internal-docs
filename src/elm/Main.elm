module Main exposing (..)

import Html.App as App
import Http
import Json.Decode
import Json.Decode.Pipeline exposing (decode, required)
import Material
import Material.Menu
import Task
import Time
import Window


-- LOCAL IMPORTS

import View exposing (view)
import Msg exposing (Msg(..))
import Model exposing (..)
import Ports exposing (scrollParent)


windowSizeEmpty : { width : Int, height : Int }
windowSizeEmpty =
    { width = 0
    , height = 0
    }


model : Model
model =
    { mdl =
        Material.model
    , selectedTab = UseTab
    , selectedPage = MainPage
    , windowSize = windowSizeEmpty
    , eth0IP = ""
    , wlan0IP = ""
    , hostname = ""
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            let
                _ =
                    Debug.log "NoOp" "has been called"
            in
                model ! []

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

        FetchServerInfo time ->
            model ! [ fetchServerInfo ]

        ReceiveServerError err ->
            let
                _ =
                    Debug.log "FetchServerError" err
            in
                model ! []

        ReceiveServerInfo info ->
            ( { model | eth0IP = info.eth0IP, wlan0IP = info.wlan0IP }, Cmd.none )

        SetHostname hostname' ->
            { model | hostname = hostname' } ! []


init : InitialParams -> ( Model, Cmd Msg )
init initialParams =
    let
        height =
            Maybe.withDefault 0 initialParams.height

        width =
            Maybe.withDefault 0 initialParams.width

        hostname =
            Maybe.withDefault "" initialParams.hostname

        newModel =
            { model | windowSize = WindowSize height width, hostname = hostname }
    in
        newModel ! [ Material.init Mdl, fetchServerInfo ]



-- Server Interaction


apiEndPoint : String
apiEndPoint =
    "/getInfo.json"


fetchServerInfo : Cmd Msg
fetchServerInfo =
    Task.perform ReceiveServerError ReceiveServerInfo (Http.get infoDecoder apiEndPoint)


infoDecoder : Json.Decode.Decoder ServerInfo
infoDecoder =
    decode ServerInfo
        |> required "eth0" Json.Decode.string
        |> required "wlan0" Json.Decode.string


main : Program InitialParams
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
                    , Time.every (15 * Time.second) FetchServerInfo
                    ]
        , update = update
        }
