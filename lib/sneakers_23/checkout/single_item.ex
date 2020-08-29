defmodule Sneakers23.Checkout.SingleItem do
  alias Sneakers23.Inventory
  alias Inventory.Store

  def sell_item(item_id, opts \\ []) do
    inventory_opts = Keyword.get(opts, :inventory_opts, [])

    with {:db, :ok} <- {:db, Store.reduce_availability(item_id)} do
      unless Keyword.get(opts, :skip_replication, false) do
        Task.start_link(fn -> Inventory.item_sold!(item_id, inventory_opts) end)
      end

      :ok
    else
      {:db, e = {:error, _}} ->
        e
    end
  end
end
