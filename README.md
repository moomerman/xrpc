# XRPC

Implementation of the [XRPC](https://atproto.com/specs/xrpc) client spec in Elixir.

## Installation

The package can be installed by adding `xrpc` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:xrpc, "~> 0.1.0"}
  ]
end
```

The docs can be found at <https://hexdocs.pm/xrpc>.

## Usage

Non-authenticated example:

```elixir
XRPC.Client.new("https://bsky.social")
|> XRPC.query("com.atproto.identity.resolveHandle", params: [handle: "atproto.com"])

{:ok, %{"did" => "did:plc:ewvi7nxzyoun6zhxrhs64oiz"}}
```

Authenticated example:

```elixir
access_token = "abcd1234"
XRPC.Client.new("https://bsky.social", access_token)
|> XRPC.query("app.bsky.actor.getProfile", params: [actor: "atproto.com"])

{:ok,
  %{
    "avatar" =>
      "https://cdn.bsky.social/imgproxy/EoCjH1lIwK1YNFuG_xYYK76vuHhEAQKWAkzlz8BSO_Q/rs:fill:1000:1000:1:0/plain/bafkreibjfgx2gprinfvicegelk5kosd6y2frmqpqzwqkg7usac74l3t2v4@jpeg",
    "banner" =>
      "https://cdn.bsky.social/imgproxy/Goxx1Ze2lScFMdlEXE0pVTzXBxsIuwbdxhYkWo1CVUA/rs:fill:3000:1000:1:0/plain/bafkreib4xwiqhxbqidwwatoqj7mrx6mr7wlc5s6blicq5wq2qsq37ynx5y@jpeg",
    "description" => "Social networking technology created by Bluesky.",
    "did" => "did:plc:ewvi7nxzyoun6zhxrhs64oiz",
    "displayName" => "AT Protocol",
    "followersCount" => 1878,
    "followsCount" => 11,
    "handle" => "atproto.com",
    "postsCount" => 10,
    ...
  }}
```

Example error:

```elixir
XRPC.Client.new("https://bsky.social")
|> XRPC.query("app.bsky.actor.getProfile", params: [actor: "atproto.com"])

{:error, %{"error" => "AuthenticationRequired", "message" => "Authentication Required"}}
```
