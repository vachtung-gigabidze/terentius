module Views.Portfolio exposing (..)

import Html exposing (Html, div, h2, ul, li, text)
import Html.Attributes exposing (class)

view : List String -> Html msg
view portfolio =
    div [ class "section" ]
        [ div [ class "container" ]
            [ h2 [ class "title is-4" ] [ text "Портфолио" ]
            , ul []
                (List.map (\project -> li [] [ text project ]) portfolio)
            ]
        ]