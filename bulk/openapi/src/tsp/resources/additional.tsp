using Http;

namespace LionWeb.Bulk;

model GetNodeTreeRequest {
  ...RepositoryContext;
  @query depthLimit: int32;
  ...IdsRequest;
}

model BulkImport {}

model BulkImportRequest {
  ...RepositoryContext;
  ...BulkImport;
}

@tag("Additional")
interface AdditionalOperations {
  @doc("Get the tree structure below nodes.")
  @route("/additional/get-node-tree/{clientId}/repository/{repository}")
  @post
  getNodeTree(...GetNodeTreeRequest):
    | LionwebResponse
    | BadRequest
    | Unauthorized
    | PreconditionFailed;

  @doc(" Bulk import of new nodes.")
  @route("/bulk/import/{clientId}/repository/{repository}")
  @post
  bulkImport(...BulkImportRequest): LionwebResponse | BadRequest | Unauthorized;
}
