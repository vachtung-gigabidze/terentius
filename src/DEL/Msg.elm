module Msg exposing (Msg)

type Msg
    = NoOp
    | ButtonPress
    | ButtonPress2
    | ChangeName String
    | ChangeDiscription String
    | UpdateText String
    | EnterWasPressed
    | SendDataToJS