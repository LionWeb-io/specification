using Http;

namespace LionWeb.Bulk;

model Database {
  name: string;
}

@tag("Database")
@route("/database")
interface DatabaseOperations {
  @doc("Creates the database used to store the repositories.")
  @post
  createDatabase(): LionwebResponse | Unauthorized;
}
