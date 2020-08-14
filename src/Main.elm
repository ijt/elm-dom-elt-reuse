port module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes as Attribute exposing (id, style)
import Html.Events exposing (onClick)



-- MAIN


main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { layout : Layout }


type Layout
    = Row
    | Column


init : () -> ( Model, Cmd Msg )
init _ =
    ( { layout = Row }, startCounters () )



-- UPDATE


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



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick ToggleLayout ] [ text "Toggle Layout" ]
        , counters model
        ]


counters : Model -> Html Msg
counters model =
    case model.layout of
        Column ->
            div []
                [ div [] [ counter1 ]
                , div [] [ counter2 ]
                ]

        Row ->
            div [] [ counter1, spacer, counter2 ]


spacer : Html Msg
spacer =
    text " "


counter2 : Html Msg
counter2 =
    span [ id "counter2" ]
        [ text "0" ]


counter1 : Html Msg
counter1 =
    span [ id "counter1" ]
        [ text "0" ]


port startCounters : () -> Cmd msg
