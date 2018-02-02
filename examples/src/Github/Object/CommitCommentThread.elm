-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module Github.Object.CommitCommentThread exposing (..)

import Github.InputObject
import Github.Interface
import Github.Object
import Github.Scalar
import Github.Union
import Graphqelm.Field as Field exposing (Field)
import Graphqelm.Internal.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Internal.Builder.Object as Object
import Graphqelm.Internal.Encode as Encode exposing (Value)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


{-| Select fields to build up a SelectionSet for this object.
-}
selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.CommitCommentThread
selection constructor =
    Object.selection constructor


{-| The comments that exist in this thread.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.

-}
comments : ({ first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String } -> { first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String }) -> SelectionSet decodesTo Github.Object.CommitCommentConnection -> Field decodesTo Github.Object.CommitCommentThread
comments fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string ]
                |> List.filterMap identity
    in
    Object.selectionField "comments" optionalArgs object identity


{-| The commit the comments were made on.
-}
commit : SelectionSet decodesTo Github.Object.Commit -> Field decodesTo Github.Object.CommitCommentThread
commit object =
    Object.selectionField "commit" [] object identity


id : Field Github.Scalar.Id Github.Object.CommitCommentThread
id =
    Object.fieldDecoder "id" [] (Decode.string |> Decode.map Github.Scalar.Id)


{-| The file the comments were made on.
-}
path : Field (Maybe String) Github.Object.CommitCommentThread
path =
    Object.fieldDecoder "path" [] (Decode.string |> Decode.maybe)


{-| The position in the diff for the commit that the comment was made on.
-}
position : Field (Maybe Int) Github.Object.CommitCommentThread
position =
    Object.fieldDecoder "position" [] (Decode.int |> Decode.maybe)


{-| The repository associated with this node.
-}
repository : SelectionSet decodesTo Github.Object.Repository -> Field decodesTo Github.Object.CommitCommentThread
repository object =
    Object.selectionField "repository" [] object identity
