module Views.Testimonials exposing (..)

import Html exposing (Html, div, h2, button, ul, li, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Messages exposing (Msg(..))

view : Bool -> List String -> Html Msg
view showTestimonials testimonials =
    div [ class "section" ]
        [ div [ class "container" ]
            [ h2 [ class "title is-4" ] [ text "Отзывы" ]
            , button [ class "button is-info", onClick ToggleTestimonials ]
                [ text (if showTestimonials then "Скрыть отзывы" else "Показать отзывы") ]
            , if showTestimonials then
                ul []
                    (List.map (\testimonial -> li [] [ text testimonial ]) testimonials)
              else
                text ""
            ]
        ]