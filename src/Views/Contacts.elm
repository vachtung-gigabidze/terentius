module Views.Contacts exposing (..)

import Html exposing (Html, div, h2, ul, li, text)
import Html.Attributes exposing (class)

view : List String -> Html msg
view contacts =
    div [ class "section" ]
        [ div [ class "container" ]
            [ h2 [ class "title is-4" ] [ text "Контакты" ]
            , ul []
                (List.map (\contact -> li [] [ text contact ]) contacts)
            ]
        ]