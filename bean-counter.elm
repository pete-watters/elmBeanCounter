import Counter
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)



main =
  Html.beginnerProgram
    { model = init 0 0 0 0
    , update = update
    , view = view
    }



-- MODEL


type alias Model =
  { beanCounterA : Counter.Model
  , beanCounterB : Counter.Model
  , beanCounterC : Counter.Model
  , totalCount: Int
  }


init : Int -> Int -> Int -> Int -> Model
init beancounterA beancounterB beancounterC totalcount =
  { beanCounterA = Counter.init beancounterA
  , beanCounterB = Counter.init beancounterB
  , beanCounterC = Counter.init beancounterC
  , totalCount = totalcount
  }



-- UPDATE
type Msg
  = UpdateTotal
  | BeanCounterA Counter.Msg
  | BeanCounterB Counter.Msg
  | BeanCounterC Counter.Msg


update : Msg -> Model -> Model
update message model =
  case message of
    UpdateTotal ->
      { model | totalCount = model.beanCounterA.count + model.beanCounterB.count + model.beanCounterC.count }

    BeanCounterA msg ->
      { model | beanCounterA = Counter.update msg model.beanCounterA }

    BeanCounterB msg ->
      { model | beanCounterB = Counter.update msg model.beanCounterB }

    BeanCounterC msg ->
      { model | beanCounterC= Counter.update msg model.beanCounterC }


-- VIEW


view : Model -> Html Msg
view model =
  div
    []
    [ Html.map BeanCounterA (Counter.view model.beanCounterA)
    , Html.map BeanCounterB (Counter.view model.beanCounterB)
    , Html.map BeanCounterC (Counter.view model.beanCounterC)
    , div [] [ text (toString model.totalCount) ]
    ]
