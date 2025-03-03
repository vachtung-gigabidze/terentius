module Views.Services exposing (..)

import Html exposing (Html, div, h2, ul, li, text)
import Html.Attributes exposing (class)

view : List String -> Html msg
view services =
    div [ class "section" ]
        [ div [ class "container" ]
            [ h2 [ class "title is-4" ] [ text "Услуги" ]
            , ul []
                (List.map (\service -> li [] [ text service ]) services)
            ]
        ]