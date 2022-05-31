module Main exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Input as Input


type Msg
    = NoOp
    | ButtonPress


type alias Model =
    { message : String
    , showImage : Bool
    }


initialModel : Model
initialModel =
    { message = "Привет", showImage = False }


main : Program () Model Msg
main =
    Browser.document
        { init = \flags -> ( initialModel, Cmd.none )
        , view = view
        , update = update
        , subscriptions = always Sub.none
        }


view model =
    { title = "telegram web"
    , body =
        [ layout
            [-- explain Debug.todo
            ]
          <|
            column []
                [ header
                , text model.message
                , viewPreview "../image.jpg"
                ]
        ]
    }


header =
    row []
        [ Input.button
            [ Border.width 1
            , Border.rounded 4
            , paddingXY 8 4
            ]
            { label = text "Жми жеж", onPress = Just ButtonPress }
        ]


viewPreview url =
    image []
        { src = url
        , description = "An image"
        }


update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        ButtonPress ->
            ( { message = "Пока", showImage = True }, Cmd.none )
