
defmodule Sneakers23Web.Router do
  use Sneakers23Web, :router

  pipeline :admin do
    plug :put_layout, {Sneakers23Web.LayoutView, :admin}
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Sneakers23Web.CartIdPlug
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Sneakers23Web do
    pipe_through :browser

    get "/", ProductController, :index
    get "/checkout", CheckoutController, :show
    post "/checkout", CheckoutController, :purchase
    get "/checkout/complete", CheckoutController, :success
  end

  scope "/admin", Sneakers23Web.Admin do
    pipe_through [:browser, :admin]

    get "/", DashboardController, :index
  end
end
