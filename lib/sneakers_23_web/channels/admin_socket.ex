defmodule Sneakers23Web.AdminSocket do
  use Phoenix.Socket
  require Logger

  channel "admin:cart_tracker", Sneakers23Web.Admin.DashboardChannel

  def connect(_params, socket, _connect_info) do
    {:ok, socket}
  end

  def id(_socket), do: nil
end
