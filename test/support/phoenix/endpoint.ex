defmodule PowAssent.Test.Phoenix.Endpoint do
  @moduledoc false
  use Phoenix.Endpoint, otp_app: :pow_assent

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_binaryid_key",
    signing_salt: "secret"

  plug Pow.Plug.Session,
    user: PowAssent.Test.Ecto.Users.User,
    repo: PowAssent.Test.Phoenix.MockRepo,
    routes_backend: PowAssent.Test.Phoenix.Routes,
    messages_backend: PowAssent.Test.Phoenix.Messages,
    otp_app: :pow_assent

  plug PowAssent.Test.Phoenix.Router
end
