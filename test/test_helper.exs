

Application.ensure_all_started(:hound)
ExUnit.start()
# Only change the Sandbox mode to manual once the Inventory process is done loading
# Otherwise, an error will occur due to how mode changes work.
:sys.get_state(Sneakers23.Inventory)
Ecto.Adapters.SQL.Sandbox.mode(Sneakers23.Repo, :manual)
