using Http;

namespace LionWeb.Bulk;

@error
@doc("Bad Request 400. The request is malformed.")
model BadRequest {
  ...BadRequestResponse;
}

@error
@doc("Unauthorized 401. Invalid token or no token provided.")
model Unauthorized {
  ...UnauthorizedResponse;
  //string;
}

@error
@doc("PreconditionFailed 412. A parameter or the request body is missing or invalid, or validation failed.")
model PreconditionFailed {
  @statusCode statusCode: 412;
  error: string;
}
