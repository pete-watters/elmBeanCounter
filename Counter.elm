module Counter exposing (Model, Msg, init, update, view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)



-- MODEL


type alias Model =
  { count : Int
  }


init : Int -> Model
init count =
  Model count

-- UPDATE


type Msg
  = Increment


update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      { model |
        count = model.count + 1
      }

-- VIEW
view : Model -> Html Msg
view model =
  div []
    [ div [ countStyle ] [ text (toString model.count) ]
    , button [ onClick Increment ] [ text "+" ]
    ]


countStyle : Attribute msg
countStyle =
  style
    [ ("font-size", "20px")
    , ("font-family", "monospace")
    , ("display", "inline-block")
    , ("width", "50px")
    , ("text-align", "center")
    ]
