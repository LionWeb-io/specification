using Http;

namespace LionWeb.Bulk;

@doc("LionWeb Idenfier")
@pattern("[a-zA-Z0-9_-]+")
scalar Identifier extends string;

@doc("A LionWeb node id.")
scalar LionWebId extends Identifier;

@doc("Array of LionWeb ids.")
model IdsRequest {
  ids: LionWebId[];
}

model RepositoryContext {
  @doc("Cliente Id")
  @path
  clientId: Identifier;

  @doc("Repository")
  @path
  repository: Identifier;
}


