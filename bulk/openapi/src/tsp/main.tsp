import "@typespec/http";
import "@typespec/openapi";
import "@typespec/openapi3";
import "@typespec/versioning";

// Common Infrastructure -----
import "./common/errors.tsp";
import "./common/types.tsp";
import "./common/response.tsp";

// Resources -----
import "./resources/database.tsp";
import "./resources/repository.tsp";
import "./resources/partition.tsp";
import "./resources/additional.tsp";
import "./resources/history.tsp";

using OpenAPI;
using Http;

@info(#{
    version: "2026.1",
    summary: "Bulk Specification API",
    license: #{
        name: "Apache 2.0",
        url: "https://www.apache.org/licenses/LICENSE-2.0"
    }
})
@externalDocs(
  "https://lionweb.io/specification/bulk/repo-access-api.html",
  "Bulk Protocol"
)
@useAuth(BearerAuth)
@service(#{ title: "Bulk Specification API" })
namespace LionWeb.Bulk;
