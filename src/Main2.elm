module Main2 exposing (Model, Msg(..), init, main, subscriptions, update, view)

import AFrame exposing (..)
import Browser
import Html exposing (Html)
import Html.Attributes exposing (attribute)
import Html.Events exposing (onClick)


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    Int


init : () -> ( Model, Cmd Msg )
init _ =
    ( 30, Cmd.none )


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( model + 1, Cmd.none )

        Decrement ->
            ( model - 1, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


view : Model -> Html Msg
view model =
    scene []
        [ atext [ avalue (String.fromInt model), position 0 2 -4, color "black", width 8 ] []
        , box
            [ Html.Events.onMouseDown Increment
            , onClick Increment
            , color "#EF2D5E"
            , position 1 0.5 -4
            , attribute "plus-box" ""
            ]
            []
        , box
            [ Html.Events.onMouseDown Decrement
            , onClick Decrement
            , color "#EF4533"
            , position -1 0.5 -4
            , attribute "minus-box" ""
            ]
            []
        , plane [ position 0 0 -4, rotation -90 0 0, width 4, height 4, color "#7BC8A4" ] []
        , camera [] [ cursor [] [] ]
        ]
