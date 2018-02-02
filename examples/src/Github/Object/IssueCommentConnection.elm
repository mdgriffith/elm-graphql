-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module Github.Object.IssueCommentConnection exposing (..)

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
selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.IssueCommentConnection
selection constructor =
    Object.selection constructor


{-| A list of edges.
-}
edges : SelectionSet decodesTo Github.Object.IssueCommentEdge -> Field (Maybe (List (Maybe decodesTo))) Github.Object.IssueCommentConnection
edges object =
    Object.selectionField "edges" [] object (identity >> Decode.maybe >> Decode.list >> Decode.maybe)


{-| A list of nodes.
-}
nodes : SelectionSet decodesTo Github.Object.IssueComment -> Field (Maybe (List (Maybe decodesTo))) Github.Object.IssueCommentConnection
nodes object =
    Object.selectionField "nodes" [] object (identity >> Decode.maybe >> Decode.list >> Decode.maybe)


{-| Information to aid in pagination.
-}
pageInfo : SelectionSet decodesTo Github.Object.PageInfo -> Field decodesTo Github.Object.IssueCommentConnection
pageInfo object =
    Object.selectionField "pageInfo" [] object identity


{-| Identifies the total count of items in the connection.
-}
totalCount : Field Int Github.Object.IssueCommentConnection
totalCount =
    Object.fieldDecoder "totalCount" [] Decode.int
