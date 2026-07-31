// /inspection/nodesByClassifier:
//     get:
//       tags: [Inspection]
//       operationId: nodesByClassifier
//       summary: List node ids grouped by classifier
//       parameters:
//         - $ref: "#/components/parameters/clientIdOptional"
//         - $ref: "#/components/parameters/repository"
//         - $ref: "#/components/parameters/limit"
//       responses:
//         "200":
//           description: Node ids per classifier.
//           content:
//             application/json:
//               schema:
//                 type: array
//                 items:
//                   type: object
//                   required: [language, classifier, ids, size]
//                   properties:
//                     language:
//                       type: string
//                       description: Key of the language of the classifier.
//                     classifier:
//                       type: string
//                       description: Key of the classifier.
//                     ids:
//                       type: array
//                       description: Ids of the nodes with this classifier (truncated to `limit`).
//                       items:
//                         $ref: "#/components/schemas/LionWebId"
//                     size:
//                       type: integer
//                       description: Total number of nodes with this classifier.
//         "401":
//           $ref: "#/components/responses/Unauthorized"
//         "412":
//           $ref: "#/components/responses/PreconditionFailed"

//   /inspection/nodesByLanguage:
//     get:
//       tags: [Inspection]
//       operationId: nodesByLanguage
//       summary: List node ids grouped by language
//       parameters:
//         - $ref: "#/components/parameters/clientIdOptional"
//         - $ref: "#/components/parameters/repository"
//         - $ref: "#/components/parameters/limit"
//       responses:
//         "200":
//           description: Node ids per language.
//           content:
//             application/json:
//               schema:
//                 type: array
//                 items:
//                   type: object
//                   required: [language, ids, size]
//                   properties:
//                     language:
//                       type: string
//                       description: Key of the language.
//                     ids:
//                       type: array
//                       description: Ids of the nodes of this language (truncated to `limit`).
//                       items:
//                         $ref: "#/components/schemas/LionWebId"
//                     size:
//                       type: integer
//                       description: Total number of nodes of this language.
//         "401":
//           $ref: "#/components/responses/Unauthorized"
//         "412":
//           $ref: "#/components/responses/PreconditionFailed"
