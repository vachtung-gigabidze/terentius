module Main exposing (..)

import Browser
import Html exposing (Html, div)
import Models exposing (Model, init)
import Messages exposing (Msg)
import Updates exposing (update)
import Views.Header as Header
import Views.Contacts as Contacts
import Views.Portfolio as Portfolio
import Views.Services as Services
import Views.Testimonials as Testimonials
import Views.Links as Links

view : Model -> Html Msg
view model =
    div []
        [ Header.view model.name model.bio
        , Contacts.view model.contacts
        , Portfolio.view model.portfolio
        , Services.view model.services
        , Testimonials.view model.showTestimonials model.testimonials
        , Links.view
        ]

main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }