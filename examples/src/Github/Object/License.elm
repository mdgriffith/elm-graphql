-- Do not manually edit this file, it was auto-generated by Graphqelm
-- https://github.com/dillonkearns/graphqelm


module Github.Object.License exposing (..)

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
selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.License
selection constructor =
    Object.selection constructor


{-| The full text of the license
-}
body : Field String Github.Object.License
body =
    Object.fieldDecoder "body" [] Decode.string


{-| The conditions set by the license
-}
conditions : SelectionSet decodesTo Github.Object.LicenseRule -> Field (List (Maybe decodesTo)) Github.Object.License
conditions object =
    Object.selectionField "conditions" [] object (identity >> Decode.maybe >> Decode.list)


{-| A human-readable description of the license
-}
description : Field (Maybe String) Github.Object.License
description =
    Object.fieldDecoder "description" [] (Decode.string |> Decode.maybe)


{-| Whether the license should be featured
-}
featured : Field Bool Github.Object.License
featured =
    Object.fieldDecoder "featured" [] Decode.bool


{-| Whether the license should be displayed in license pickers
-}
hidden : Field Bool Github.Object.License
hidden =
    Object.fieldDecoder "hidden" [] Decode.bool


id : Field Github.Scalar.Id Github.Object.License
id =
    Object.fieldDecoder "id" [] (Decode.string |> Decode.map Github.Scalar.Id)


{-| Instructions on how to implement the license
-}
implementation : Field (Maybe String) Github.Object.License
implementation =
    Object.fieldDecoder "implementation" [] (Decode.string |> Decode.maybe)


{-| The lowercased SPDX ID of the license
-}
key : Field String Github.Object.License
key =
    Object.fieldDecoder "key" [] Decode.string


{-| The limitations set by the license
-}
limitations : SelectionSet decodesTo Github.Object.LicenseRule -> Field (List (Maybe decodesTo)) Github.Object.License
limitations object =
    Object.selectionField "limitations" [] object (identity >> Decode.maybe >> Decode.list)


{-| The license full name specified by <https://spdx.org/licenses>
-}
name : Field String Github.Object.License
name =
    Object.fieldDecoder "name" [] Decode.string


{-| Customary short name if applicable (e.g, GPLv3)
-}
nickname : Field (Maybe String) Github.Object.License
nickname =
    Object.fieldDecoder "nickname" [] (Decode.string |> Decode.maybe)


{-| The permissions set by the license
-}
permissions : SelectionSet decodesTo Github.Object.LicenseRule -> Field (List (Maybe decodesTo)) Github.Object.License
permissions object =
    Object.selectionField "permissions" [] object (identity >> Decode.maybe >> Decode.list)


{-| Short identifier specified by <https://spdx.org/licenses>
-}
spdxId : Field (Maybe String) Github.Object.License
spdxId =
    Object.fieldDecoder "spdxId" [] (Decode.string |> Decode.maybe)


{-| URL to the license on <https://choosealicense.com>
-}
url : Field (Maybe Github.Scalar.Uri) Github.Object.License
url =
    Object.fieldDecoder "url" [] (Decode.string |> Decode.map Github.Scalar.Uri |> Decode.maybe)
