-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module StarWars.Query exposing (CharacterRequiredArguments, HeroOptionalArguments, all, character, hero, selection)

import Graphql.Field as Field exposing (Field)
import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode exposing (Decoder)
import StarWars.Enum.Episode
import StarWars.InputObject
import StarWars.Interface
import StarWars.Object
import StarWars.Scalar
import StarWars.Union


{-| Select fields to build up a top-level query. The request can be sent with
functions from `Graphql.Http`.
-}
selection : (a -> constructor) -> SelectionSet (a -> constructor) RootQuery
selection constructor =
    Object.selection constructor


{-| Get all known characters.
-}
all : SelectionSet decodesTo StarWars.Object.Character -> Field (Maybe (List (Maybe decodesTo))) RootQuery
all object_ =
    Object.selectionField "all" [] object_ (identity >> Decode.nullable >> Decode.list >> Decode.nullable)


type alias CharacterRequiredArguments =
    { id : StarWars.Scalar.Id }


{-|

  - id - ID of the character.

-}
character : CharacterRequiredArguments -> SelectionSet decodesTo StarWars.Object.Character -> Field (Maybe decodesTo) RootQuery
character requiredArgs object_ =
    Object.selectionField "character" [ Argument.required "id" requiredArgs.id (\(StarWars.Scalar.Id raw) -> Encode.string raw) ] object_ (identity >> Decode.nullable)


type alias HeroOptionalArguments =
    { episode : OptionalArgument StarWars.Enum.Episode.Episode }


{-|

  - episode - If omitted, returns the hero of the whole saga. If provided, returns the hero of that particular episode.

-}
hero : (HeroOptionalArguments -> HeroOptionalArguments) -> SelectionSet decodesTo StarWars.Object.Character -> Field decodesTo RootQuery
hero fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { episode = Absent }

        optionalArgs =
            [ Argument.optional "episode" filledInOptionals.episode (Encode.enum StarWars.Enum.Episode.toString) ]
                |> List.filterMap identity
    in
    Object.selectionField "hero" optionalArgs object_ identity