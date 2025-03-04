module Main exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Input as Input
import Element.Font as Font
import Html exposing (Html)
import Html.Events
import Json.Decode as Decode
-- import HelloWorld exposing (..)

-- import Html exposing (Html, Attribute, div, input, text)
-- import Html.Attributes exposing (..)
-- import Html.Events exposing (onInput)

type alias Model =
    { message : String
    , showImage : Bool
    , text : String
    , enterPressed : Bool
    }

type Msg
    = NoOp
    | ButtonPress
    | ButtonPress2
    | ChangeName String
    | ChangeDiscription String
    | UpdateText String
    | EnterWasPressed
    | SendDataToJS

initialModel : Model
initialModel =
    { message = "Привет", showImage = False, text = "", enterPressed = False}


main : Program () Model Msg
main =
    Browser.document
        { init = \flags -> ( initialModel, Cmd.none )
        , view = view
        , update = update
        , subscriptions = always Sub.none
        }

update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        ButtonPress ->
            ( { model | message = model.text, showImage = True }, Cmd.none )

        ButtonPress2 ->
            ( { model | message = "Пока", showImage = False }, Cmd.none )
        ChangeName _ ->  ( model, Cmd.none )           
        ChangeDiscription _ ->  ( model, Cmd.none )  
        UpdateText txt ->
            ({ model | text = txt }, Cmd.none)

        EnterWasPressed ->
            ({ model | enterPressed = True }, Cmd.none)
        SendDataToJS ->
            ( model, Cmd.none ) 


--PORT
-- Random.generate : (a -> msg) -> Generator a -> Cmd msg

-- Http.get : { url : String, expect : Expect msg } -> Cmd msg

port sendData : String -> Cmd msg



view model =
    { title = "telegram web"
    , body =
        [ layout
            [-- explain Debug.todo
            ]
          <|
            column []
                [ header
                , body model
                -- , helloWorld 1
                , footer
                ]
        ]
    }


newFunction model =
    case model.showImage of
        True ->
            text "Нету"

        False ->
            image2


color =
    { blue = rgb255 0x72 0x9F 0xCF
    , darkCharcoal = rgb255 0x2E 0x34 0x36
    , green = rgb255 0x20 0xBF 0x55
    , lightBlue = rgb255 0xC5 0xE8 0xF7
    , lightGrey = rgb255 0xE0 0xE0 0xE0
    , orange = rgb255 0xF2 0x64 0x19
    , red = rgb255 0xAA 0x00 0x00
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


image2 =
    el
        [ width <| px 140
        , height <| px 140
        , Border.width 2
        , Border.rounded 6
        , Border.color color.blue
        ]
    <|
        viewPreview "./image.jpg"


header =
    row [ width fill, padding 20, spacing 20 ]
        [ logo
        , button "жми жиж" (Just ButtonPress)
        , button "щё жми жиж" (Just ButtonPress2)
        
        ]


body model = column [] 
            [ text model.message
              , formView model
              , newFunction model ] 

button text2 onPress2 =  el [ alignRight ] <| Input.button
            [ Border.width 2
            , Border.rounded 4
            , paddingXY 8 4
            , Border.color <| color.lightBlue
            ]
            { label = text text2, onPress = onPress2 }

colorData : List { color : Color, name : String }
colorData =
    [ { color = color.darkCharcoal, name = "Black" }
    , { color = color.blue, name = "Blue" }
    , { color = color.green, name = "Green" }
    , { color = color.orange, name = "Orange" }
    , { color = color.red, name = "Red" }
    ]

footer =
    
    let
        headerAttrs =
            [ Font.bold
            , Font.color color.blue
            , Border.widthEach { bottom = 1, top = 0, left = 0, right = 0 }
            , Border.color color.lightGrey
            ]
    in
    table [ width shrink, spacing 10 ]
        { data = colorData
        , columns =
            [ { header = el headerAttrs <| text "Color name"
              , width = fillPortion 2
              , view = .name >> text >> el [ centerY ]
              }
            , { header = el headerAttrs <| text "Color sample"
              , width = fillPortion 1
              , view =
                    \rec ->
                        el
                            [ width fill
                            , height <| px 40
                            , Background.color rec.color
                            ]
                            none
              }
            ]
        }
onEnter : msg -> Element.Attribute msg
onEnter msg =
    Element.htmlAttribute
        (Html.Events.on "keyup"
            (Decode.field "key" Decode.string
                |> Decode.andThen
                    (\key ->
                        if key == "Enter" then
                            Decode.succeed msg

                        else
                            Decode.fail "Not the enter key"
                    )
            )
        )

formView model =  Input.text
            [ centerX
            , centerY
            , width (px 500)
            , spacing 16
            , onEnter EnterWasPressed
            , below
                (if model.enterPressed then
                    el
                        [ Font.color color.darkCharcoal
                        , moveDown 5
                        ]
                        (text "Enter was pressed!")

                 else
                    Element.none
                )
            ]
            { onChange = UpdateText
            , text = model.text
            , placeholder =
                Just
                    (Input.placeholder []
                        (text "type some text here and press enter")
                    )
            , label = Input.labelAbove [] (text "My Text Input")
            }
        

viewPreview url =
    image [ width <| fill, height <| fill ]
        { src = url
        , description = "An image"
        }


