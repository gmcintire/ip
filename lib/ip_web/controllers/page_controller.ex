defmodule IpWeb.PageController do
  use IpWeb, :controller

  def index(conn, _params) do
    # iex(1)> :inet_res.gethostbyaddr({172, 217, 5, 206})
    # {:ok,
    # {:hostent, 'lax28s10-in-f14.1e100.net', [], :inet, 4, [{172, 217, 5, 206}]}}

    render(conn, "index.html")
  end
end
