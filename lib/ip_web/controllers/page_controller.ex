defmodule IpWeb.PageController do
  use IpWeb, :controller

  def index(conn, _params) do
    # iex(1)> :inet_res.gethostbyaddr({172, 217, 5, 206})
    # {:ok,
    # {:hostent, 'lax28s10-in-f14.1e100.net', [], :inet, 4, [{172, 217, 5, 206}]}}

    forwarded_for = List.first(Plug.Conn.get_req_header(conn, "x-forwarded-for"))

    remote_ip =
      if forwarded_for do
        String.split(forwarded_for, ",")
        |> Enum.map(&String.trim/1)
        |> List.first()
      else
        to_string(:inet_parse.ntoa(conn.remote_ip))
      end

    render(conn, "index.html", remote_ip: remote_ip)
  end
end
