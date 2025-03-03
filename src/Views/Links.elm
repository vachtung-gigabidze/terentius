module Views.Links exposing (..)

import Html exposing (Html, div, h2, a, text)
import Html.Attributes exposing (class, href, target)

view : Html msg
view =
    div [ class "section" ]
        [ div [ class "container" ]
            [ h2 [ class "title is-4" ] [ text "Ссылки" ]
            , div [ class "buttons" ]
                [ a [ class "button is-link", href "https://github.com", target "_blank" ]
                    [ text "Мой GitHub" ]
                , a [ class "button is-link", href "https://linkedin.com", target "_blank" ]
                    [ text "Мой LinkedIn" ]
                ]
            ]
        ]