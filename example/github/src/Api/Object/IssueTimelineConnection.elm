module Api.Object.IssueTimelineConnection exposing (..)

import Api.Object
import Graphqelm.Argument as Argument exposing (Argument)
import Graphqelm.Field as Field exposing (Field, FieldDecoder)
import Graphqelm.Object as Object exposing (Object)
import Json.Decode as Decode


build : (a -> constructor) -> Object (a -> constructor) Api.Object.IssueTimelineConnection
build constructor =
    Object.object constructor


edges : FieldDecoder (List Object.IssueTimelineItemEdge) Api.Object.IssueTimelineConnection
edges =
    Field.fieldDecoder "edges" [] (Api.Object.IssueTimelineItemEdge.decoder |> Decode.list)


nodes : FieldDecoder (List String) Api.Object.IssueTimelineConnection
nodes =
    Field.fieldDecoder "nodes" [] (Decode.string |> Decode.list)


pageInfo : Object pageInfo Api.Object.PageInfo -> FieldDecoder pageInfo Api.Object.IssueTimelineConnection
pageInfo object =
    Object.single "pageInfo" [] object


totalCount : FieldDecoder String Api.Object.IssueTimelineConnection
totalCount =
    Field.fieldDecoder "totalCount" [] Decode.string