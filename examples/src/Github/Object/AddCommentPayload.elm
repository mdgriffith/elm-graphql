-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module Github.Object.AddCommentPayload exposing (..)

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
selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.AddCommentPayload
selection constructor =
    Object.selection constructor


{-| A unique identifier for the client performing the mutation.
-}
clientMutationId : Field (Maybe String) Github.Object.AddCommentPayload
clientMutationId =
    Object.fieldDecoder "clientMutationId" [] (Decode.string |> Decode.maybe)


{-| The edge from the subject's comment connection.
-}
commentEdge : SelectionSet decodesTo Github.Object.IssueCommentEdge -> Field decodesTo Github.Object.AddCommentPayload
commentEdge object =
    Object.selectionField "commentEdge" [] object identity


{-| The subject
-}
subject : SelectionSet decodesTo Github.Interface.Node -> Field decodesTo Github.Object.AddCommentPayload
subject object =
    Object.selectionField "subject" [] object identity


{-| The edge from the subject's timeline connection.
-}
timelineEdge : SelectionSet decodesTo Github.Object.IssueTimelineItemEdge -> Field decodesTo Github.Object.AddCommentPayload
timelineEdge object =
    Object.selectionField "timelineEdge" [] object identity
