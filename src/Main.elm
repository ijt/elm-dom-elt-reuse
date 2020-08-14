port module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes as Attribute exposing (id, style)
import Html.Events exposing (onClick)


main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    { layout : Layout }


type Layout
    = Row
    | Column


init : () -> ( Model, Cmd Msg )
init _ =
    ( { layout = Row }, startCounters () )


type Msg
    = ToggleLayout


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ToggleLayout ->
            let
                l2 =
                    case model.layout of
                        Row ->
                            Column

                        Column ->
                            Row
            in
            ( { model | layout = l2 }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick ToggleLayout ] [ text "Toggle Layout" ]
        , counters model
        ]


counters : Model -> Html Msg
counters model =
    let
        d =
            case model.layout of
                Column ->
                    "column"

                Row ->
                    "row"
    in
    div
        [ style "flex-direction" d
        , style "display" "flex"
        ]
        [ counter1
        , counter2
        ]


counter1 : Html Msg
counter1 =
    span [ id "counter1", style "padding" "8px" ]
        [ text "0" ]


counter2 : Html Msg
counter2 =
    span [ id "counter2", style "padding" "8px" ]
        [ text "0" ]


port startCounters : () -> Cmd msg
