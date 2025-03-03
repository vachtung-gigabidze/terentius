module Updates exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model)

update : Msg -> Model -> Model
update msg model =
    case msg of
        ToggleTestimonials ->
            { model | showTestimonials = not model.showTestimonials }