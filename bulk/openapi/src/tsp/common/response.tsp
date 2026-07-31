import "@typespec/http";
import "./errors.tsp";

using Http;

namespace LionWeb.Bulk;

@doc("Result of the operation. `success` is `false` when the operation failed.")
model LionwebResponse {
  ...OkResponse;
  success: boolean;
  chunk: Chunk;
  additionalInfos?: AdditionalInfo[];
  messages?: ResponseMessage[];
}

model Chunk {

}


model AdditionalInfo {
  kind: Identifier;
  distribute?: boolean;
  message: string;
  data:  KeyValue[]
}
model KeyValue {
  // todo
}

@doc("LionWeb JSON Chunck.")
model LionWebJsonChunk {}

@doc("Node Tree Result")
model NodeTreeResult {}

@doc("The reserved ids.")
model IdsResponse {
  //...LionWebId[];
}

model ResponseMessage {
  @doc("Kind of message, e.g. `Info`, `PartitionHasParent`, `PartitionHasChildren`,`PartitionHasAnnotations`, `EmptyChunk`, `NullChunk`, `IdsIncorrect`,`PartitionAlreadyExists`, `NodeIsNotPartition`, `EmptyIdList`, `IdsNotFound`,`ParentMissing`, `NotImplemented`, `DepthLimitIncorrect`, or a validation issue kind.")
  kind: string;

  message: string;
  // data: any;
}

model RetrieveResponse {
  //  allOf:
  //     - $ref: "#/components/schemas/LionwebResponse"
  //     - type: object
  //       required: [chunk]
  //       properties:
  //         chunk:
  //           $ref: "#/components/schemas/LionWebJsonChunk"
}

@doc("List of partition response")
model ListPartitionsResponse {
  //  allOf:
  //         - $ref: "#/components/schemas/LionwebResponse"
  //         - type: object
  //           required: [chunk]
  //           properties:
  //             chunk:
  //               type: object
  //               nullable: true
  //               allOf:
  //                 - $ref: "#/components/schemas/LionWebJsonChunk"
}

//  IdsResponse:
//       allOf:
//         - $ref: "#/components/schemas/LionwebResponse"
//         - type: object
//           required: [ids]
//           properties:
//             ids:
//               type: array
//               items:
//                 $ref: "#/components/schemas/LionWebId"

//     RepositoryConfiguration:
//       type: object
//       required: [name, lionweb_version, history]
//       properties:
//         name:
//           type: string
//         lionweb_version:
//           type: string
//           enum: ["2023.1", "2024.1", "2026.1"]
//         history:
//           type: boolean

//     ListRepositoriesResponse:
//       allOf:
//         - $ref: "#/components/schemas/LionwebResponse"
//         - type: object
//           required: [repositories]
//           properties:
//             repositories:
//               type: array
//               items:
//                 $ref: "#/components/schemas/RepositoryConfiguration"

//     IdsRequest:
//       type: object
//       required: [ids]
//       properties:
//         ids:
//           type: array
//           items:
//             $ref: "#/components/schemas/LionWebId"

//     NodeTreeResult:
//       type: object
//       required: [id, parent, depth]
//       properties:
//         id:
//           $ref: "#/components/schemas/LionWebId"
//         parent:
//           $ref: "#/components/schemas/LionWebId"
//         depth:
//           type: integer

//     LionWebJsonMetaPointer:
//       type: object
//       description: Pointer to an element of a language (LionWeb MetaPointer).
//       required: [language, version, key]
//       properties:
//         language:
//           type: string
//         version:
//           type: string
//         key:
//           type: string

//     LionWebJsonUsedLanguage:
//       type: object
//       required: [key, version]
//       properties:
//         key:
//           type: string
//         version:
//           type: string

//     LionWebJsonProperty:
//       type: object
//       required: [property, value]
//       properties:
//         property:
//           $ref: "#/components/schemas/LionWebJsonMetaPointer"
//         value:
//           type: string
//           nullable: true

//     LionWebJsonContainment:
//       type: object
//       required: [containment, children]
//       properties:
//         containment:
//           $ref: "#/components/schemas/LionWebJsonMetaPointer"
//         children:
//           type: array
//           items:
//             $ref: "#/components/schemas/LionWebId"

//     LionWebJsonReferenceTarget:
//       type: object
//       required: [resolveInfo, reference]
//       properties:
//         resolveInfo:
//           type: string
//           nullable: true
//         reference:
//           type: string
//           nullable: true
//           description: A LionWeb node id, or null for an unresolved reference.

//     LionWebJsonReference:
//       type: object
//       required: [reference, targets]
//       properties:
//         reference:
//           $ref: "#/components/schemas/LionWebJsonMetaPointer"
//         targets:
//           type: array
//           items:
//             $ref: "#/components/schemas/LionWebJsonReferenceTarget"

//     LionWebJsonNode:
//       type: object
//       description: A node in the LionWeb JSON serialization format.
//       required: [id, classifier, properties, containments, references, annotations, parent]
//       properties:
//         id:
//           $ref: "#/components/schemas/LionWebId"
//         classifier:
//           $ref: "#/components/schemas/LionWebJsonMetaPointer"
//         properties:
//           type: array
//           items:
//             $ref: "#/components/schemas/LionWebJsonProperty"
//         containments:
//           type: array
//           items:
//             $ref: "#/components/schemas/LionWebJsonContainment"
//         references:
//           type: array
//           items:
//             $ref: "#/components/schemas/LionWebJsonReference"
//         annotations:
//           type: array
//           items:
//             $ref: "#/components/schemas/LionWebId"
//         parent:
//           type: string
//           nullable: true
//           description: Id of the parent node, or null for partition (root) nodes.

//     LionWebJsonChunk:
//       type: object
//       description: A chunk of nodes in the LionWeb JSON serialization format.
//       required: [serializationFormatVersion, languages, nodes]
//       properties:
//         serializationFormatVersion:
//           type: string
//           enum: ["2023.1", "2024.1", "2026.1"]
//         languages:
//           type: array
//           items:
//             $ref: "#/components/schemas/LionWebJsonUsedLanguage"
//         nodes:
//           type: array
//           items:
//             $ref: "#/components/schemas/LionWebJsonNode"

//     AttachPoint:
//       type: object
//       description: Point in the existing model where an imported tree is attached.
//       required: [container, containment, root]
//       properties:
//         container:
//           description: Id of the existing node the tree is attached to.
//           allOf:
//             - $ref: "#/components/schemas/LionWebId"
//         containment:
//           $ref: "#/components/schemas/LionWebJsonMetaPointer"
//         root:
//           description: Id of the root of the imported tree, appended to the containment.
//           allOf:
//             - $ref: "#/components/schemas/LionWebId"

//     BulkImport:
//       type: object
//       required: [attachPoints, nodes]
//       properties:
//         attachPoints:
//           type: array
//           items:
//             $ref: "#/components/schemas/AttachPoint"
//         nodes:
//           type: array
//           items:
//             $ref: "#/components/schemas/LionWebJsonNode"

// @doc("Paginated response.")
// model Page<T> {
//   ...OkResponse;
//   @doc("Items in the page.")
//   @pageItems items: T[];
//   @doc("Total elements in the search only if requested with param `c`.")
//   total?: int32;
// }

// @doc("Single resource response. 200 OK")
// model SingleResponse<T> {
//   ...OkResponse;
//   ...Body<T>;
// }

// @doc("Created resource. 201 Created.")
// model CreatedElementResponse<T> {
//   ...CreatedResponse;
//   ...Body<T>;
// }

// @doc("Successfull response. 200 OK")
// model SuccessResponse<T> {
//   ...OkResponse;
//   ...Body<T>;
// }

// @doc("Validation error response. 400 Bad request")
// model ValidationErrorResponse {
//   ...BadRequestResponse;
//   @header contentType: "application/problem+json";
//   ...Body<ValidationError>;
// }

// @doc("Not found response. 404 Not found")
// model NotFoundErrorResponse {
//   ...NotFoundResponse;
//   ...Body<NotFoundError>;
// }
