defmodule MultiplePhxInstancesWeb.PageController do
  use MultiplePhxInstancesWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
