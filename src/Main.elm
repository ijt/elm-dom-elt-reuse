port module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (id)



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
        [ div [ id "counter1" ]
            [ text "0"
            ]
        , div [ id "counter2" ]
            [ text "0"
            ]
        ]


port startCounters : () -> Cmd msg
