module Models exposing (..)


type alias Model =
    { name : String
    , bio : String
    , contacts : List String
    , portfolio : List String
    , services : List String
    , testimonials : List String
    , showTestimonials : Bool
    }


init : Model
init =
    { name = "Зядик Дмитрий"
    , bio = "Привет! Я веб-разработчик с опытом работы в Elm и Elixir."
    , contacts = [ "Email: diman@example.com", "Телефон: +7 (999) 123-45-67" ]
    , portfolio = [ "Проект 1: Сайт компании", "Проект 2: Интернет-магазин" ]
    , services = [ "Разработка сайтов", "Оптимизация производительности", "Консультации" ]
    , testimonials = [ "Отличный разработчик!", "Очень доволен результатом.", "Профессионал своего дела." ]
    , showTestimonials = False
    }
