//  /history/listPartitions:
//     post:
//       tags: [History]
//       operationId: historyListPartitions
//       summary: List all partitions at a repository version
//       description: >
//         Like `/bulk/listPartitions`, but returns the partitions as they existed at the given
//         `repoVersion`. Only meaningful for repositories created with `history=true`.
//       parameters:
//         - $ref: "#/components/parameters/clientId"
//         - $ref: "#/components/parameters/repository"
//         - $ref: "#/components/parameters/repoVersion"
//       responses:
//         "200":
//           description: Chunk containing all partition nodes at the given version.
//           content:
//             application/json:
//               schema:
//                 $ref: "#/components/schemas/ListPartitionsResponse"
//         "401":
//           $ref: "#/components/responses/Unauthorized"
//         "412":
//           $ref: "#/components/responses/PreconditionFailed"

//   /history/retrieve:
//     post:
//       tags: [History]
//       operationId: historyRetrieve
//       summary: Retrieve nodes at a repository version
//       description: >
//         Like `/bulk/retrieve`, but returns the nodes as they existed at the given
//         `repoVersion`. Only meaningful for repositories created with `history=true`.
//       parameters:
//         - $ref: "#/components/parameters/clientId"
//         - $ref: "#/components/parameters/repository"
//         - $ref: "#/components/parameters/depthLimit"
//         - $ref: "#/components/parameters/repoVersion"
//       requestBody:
//         required: true
//         content:
//           application/json:
//             schema:
//               $ref: "#/components/schemas/IdsRequest"
//       responses:
//         "200":
//           description: Chunk containing the requested nodes at the given version.
//           content:
//             application/json:
//               schema:
//                 $ref: "#/components/schemas/RetrieveResponse"
//         "401":
//           $ref: "#/components/responses/Unauthorized"
//         "412":
//           $ref: "#/components/responses/PreconditionFailed"
