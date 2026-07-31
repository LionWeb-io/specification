using Http;

namespace LionWeb.Bulk;

model CreatePartitionRequest {
  ...RepositoryContext;
  ...Chunk;
}

model DeletePartitionRequest {
  ...RepositoryContext;
  ids: LionWebId[];
}
model BulkIdsRequest {
  ...RepositoryContext;

  @doc("Number of ids to reserve.")
  @query
  count?: int32;
}
model BulkStoreRequest {
  ...RepositoryContext;
  ...Chunk;
}
model BulkRetriveRequest {
  ...RepositoryContext;
  @query depthLimit: int32;
  ...IdsRequest;
}

@tag("Partitions")
 @route("/bulk/partition/{clientId}/repository/{repository}")
interface PartitionOperations {
  @doc("List partitions")
  @post
  @route("list")
  bulkListPartitions(
    ...RepositoryContext;
    @query depthLimit?: uint32;
    @query commandId?: Identifier;
    @body additionalInfos: AdditionalInfo[];
  ):
    | LionwebResponse
    | Unauthorized
    | PreconditionFailed;


  @doc("Creates the partitions contained in the chunk. Partition nodes must have no parent, no children and no annotations. The chunk is validated (syntax, references and LionWeb version compatibility with the repository) before being stored.")
  @post
  bulkCreatePartitions(...CreatePartitionRequest):
    | LionwebResponse
    | Unauthorized
    | PreconditionFailed;

  @doc("Deletes the partitions with the given node ids, including all their contents.")
  @delete
  bulkDeletePartitions(...DeletePartitionRequest):
    | LionwebResponse
    | Unauthorized
    | PreconditionFailed;

}
 

@tag("Nodes")
@route("/bulk/{clientId}/repository/{repository}")
interface NodeOperations {
  @doc("Reserve free node ids")
  @post
  @route("ids")
  bulkIds(...BulkIdsRequest): IdsResponse | Unauthorized | PreconditionFailed;

  @doc("Reserve free node ids")
  @post
  @route("store")
  bulkStore(...BulkStoreRequest):
    | LionwebResponse
    | Unauthorized
    | PreconditionFailed;

  @doc(" Retrieve nodes")
  @post
  @route("retrieve")
  bulkRetrieve(...BulkRetriveRequest):
    | RetrieveResponse
    | Unauthorized
    | PreconditionFailed;
}
