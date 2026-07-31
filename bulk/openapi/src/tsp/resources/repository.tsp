using Http;

namespace LionWeb.Bulk;

model Repository {
  name: string;
}

@tag("Repository")
@route("/repositories")
interface RepositoryOperations {
  @post
  @route("/{clientId}/repository/{repository}")
  @doc("Creates a repository.")
  createRepository(...RepositoryContext):
    | LionwebResponse
    | Unauthorized
    | PreconditionFailed;

  @delete
  @route("/{clientId}/repository/{repository}")
  @doc("Deletes a repository.")
  deleteRepository(...RepositoryContext):
    | LionwebResponse
    | Unauthorized
    | PreconditionFailed;

  @get
  @doc("List repositories in a database.")
  listRepositories(@query clientLog: string): Repository[];
}

// @tag("Role")
// @route("/api/v1/role")
// interface RoleRoutes {
//   @doc("Query for Role. Paginated")
//   @list
//   op list(...SearchCriteria): Page<Role>;

//   @doc("Read Role by Id.")
//   @get
//   op get(@path id: int32):
//     | SingleResponse<Role>
//     | NotFoundErrorResponse;

//   @doc("Creates a Role.")
//   @post
//   op create(@body role: Role):
//     | CreatedElementResponse<Role>
//     | ValidationErrorResponse;

//   @doc("Updates a Role.")
//   @put
//   op update(@path id: int32, @body role: Role):
//     | SuccessResponse<Role>
//     | NotFoundErrorResponse
//     | ValidationErrorResponse;

//   @doc("Delete a Role.")
//   @delete
//   op delete(@path id: int32):
//     | NoContentResponse
//     | NotFoundErrorResponse;

// }
