import Html exposing (..)
import Browser
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)
import Aframe exposing (..)

main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
    }


type alias Model = Int 

init : () -> (Model, Cmd Msg)
init _ =
    (0, Cmd.none)


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Increment ->
            (model + 1, Cmd.none)

        Decrement ->
            (model - 1, Cmd.none)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


view : Model -> Html Msg
view model =
    scene []
        [ button [ onClick Decrement ][ text "-" ]
        , atext [ value (String.fromInt model ) ][]
        , button [ onClick Increment ][ text "+" ] 
        ]


