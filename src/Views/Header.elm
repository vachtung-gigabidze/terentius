module Views.Header exposing (..)

import Html exposing (Html, div, h1, p)
import Html.Attributes exposing (class)

view : String -> String -> Html msg
view name bio =
    div [ class "hero is-primary" ]
        [ div [ class "hero-body" ]
            [ div [ class "container" ]
                [ h1 [ class "title" ] [ text name ]
                , p [ class "subtitle" ] [ text bio ]
                ]
            ]
        ]