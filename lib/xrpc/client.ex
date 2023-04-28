defmodule XRPC.Client do
  defstruct [:host, :access_token, :refresh_token]

  def new(host, access_token \\ nil, refresh_token \\ nil) do
    %__MODULE__{host: host, access_token: access_token, refresh_token: refresh_token}
  end
end
