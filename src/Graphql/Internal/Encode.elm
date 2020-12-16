module Graphql.Internal.Encode exposing
    ( null, bool, enum, int, list, string, object, maybe, maybeObject, optional, float, fromJson
    , serialize
    , Value
    )

{-| **WARNING** `Graphql.Internal` modules are used by the `@dillonkearns/elm-graphql` command line
code generator tool. They should not be consumed through hand-written code.

`Graphql.Internal.Encode.Value`s are low-level details used by generated code.
They are only used by the code generated by the `@dillonkearns/elm-graphql` CLI tool.

@docs null, bool, enum, int, list, string, object, maybe, maybeObject, optional, float, fromJson
@docs serialize
@docs Value

-}

import Graphql.OptionalArgument as OptionalArgument exposing (OptionalArgument)
import Json.Encode


{-| Represents an encoded Value
-}
type Value
    = EnumValue String
    | Json Json.Encode.Value
    | List (List Value)
    | Object (List ( String, Value ))


{-| Encode directly from `Json.Encode.Value`. For internal use by
custom scalar codecs.
-}
fromJson : Json.Encode.Value -> Value
fromJson jsonValue =
    jsonValue |> Json


{-| Encode a list of key-value pairs into an object
-}
object : List ( String, Value ) -> Value
object value =
    Object value


{-| Encode a list of key-value pairs into an object
-}
maybeObject : List ( String, Maybe Value ) -> Value
maybeObject maybeValues =
    maybeValues
        |> List.filterMap
            (\( key, value ) ->
                case value of
                    Just actualValue ->
                        Just ( key, actualValue )

                    Nothing ->
                        Nothing
            )
        |> Object


{-| Encode a list of key-value pairs into an object
-}
optional : OptionalArgument a -> (a -> Value) -> Maybe Value
optional optionalValue toValue =
    case optionalValue of
        OptionalArgument.Present value ->
            toValue value
                |> Just

        OptionalArgument.Absent ->
            Nothing

        OptionalArgument.Null ->
            Just null


{-| Encode an int
-}
int : Int -> Value
int value =
    Json.Encode.int value
        |> Json


{-| Encode a float
-}
float : Float -> Value
float value =
    Json.Encode.float value
        |> Json


{-| Encode null
-}
null : Value
null =
    Json.Encode.null
        |> Json


{-| Encode a bool
-}
bool : Bool -> Value
bool value =
    Json.Encode.bool value
        |> Json


{-| Encode a string
-}
string : String -> Value
string value =
    Json.Encode.string value
        |> Json


{-| Encode an enum. The first argument is the toString function for that enum.
-}
enum : (a -> String) -> a -> Value
enum enumToString value =
    EnumValue (enumToString value)


{-| Encode a list of Values
-}
list : (a -> Value) -> List a -> Value
list toValue value =
    value
        |> List.map toValue
        |> List


{-| Encode a Maybe. Uses encoder for `Just`, or `Encode.null` for `Nothing`.
-}
maybe : (a -> Value) -> Maybe a -> Value
maybe encoder =
    Maybe.map encoder >> Maybe.withDefault null


{-| Low-level function for serializing a `Graphql.Internal.Encode.Value`s.
-}
serialize : Value -> String
serialize value =
    case value of
        EnumValue enumValue ->
            enumValue

        Json json ->
            Json.Encode.encode 0 json

        List values ->
            "["
                ++ (List.map serialize values |> String.join ", ")
                ++ "]"

        Object keyValuePairs ->
            "{"
                ++ (List.map (\( key, objectValue ) -> key ++ ": " ++ serialize objectValue)
                        keyValuePairs
                        |> String.join ", "
                   )
                ++ "}"