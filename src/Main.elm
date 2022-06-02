module Main exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Input as Input


type Msg
    = NoOp
    | ButtonPress
    | ButtonPress2


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
                , newFunction model
                , footer
                ]
        ]
    }


newFunction model =
    case model.showImage of
        True ->
            text "Нету"

        False ->
            viewPreview "./image.jpg"


color =
    { blue = rgb255 0x72 0x9F 0xCF
    , darkCharcoal = rgb255 0x2E 0x34 0x36
    , lightBlue = rgb255 0xC5 0xE8 0xF7
    , lightGrey = rgb255 0xE0 0xE0 0xE0
    , white = rgb255 0xFF 0xFF 0xFF
    }


logo =
    el
        [ width <| px 40
        , height <| px 40
        , Border.width 2
        , Border.rounded 6
        , Border.color color.blue
        ]
    <|
        viewPreview "./image.jpg"


header =
    row [ width fill, padding 20, spacing 20 ]
        [ logo
        , el [ Background.color <| color.blue, alignRight ] <| text "Меню1"
        , el [ alignRight ] <| text "Меню2"
        , el [ alignRight ] <| text "Меню3"
        , Input.button
            [ Border.width 1
            , Border.rounded 4
            , paddingXY 8 4
            ]
            { label = text "Жми жеж", onPress = Just ButtonPress }
        ]


footer =
    row []
        [ Input.button
            [ Border.width 1
            , Border.rounded 4
            , paddingXY 8 4
            ]
            { label = text "Ищё жми жиж", onPress = Just ButtonPress2 }
        ]


viewPreview url =
    image [ width <| fill, height <| fill ]
        { src = url
        , description = "An image"
        }


update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        ButtonPress ->
            ( { message = "Пока", showImage = True }, Cmd.none )

        ButtonPress2 ->
            ( { message = "Пока", showImage = False }, Cmd.none )
