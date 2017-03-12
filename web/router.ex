defmodule Splurty.Router do
  use Splurty.Web, :router

  pipeline :browser do
    plug :accepts, ["html","text"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Splurty do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/test", PageController, :test
    get "/images", ImageController, :index
    resources "/reviews", ReviewController
    get "/quote", QuoteController, :index
    get "/quote/:messenger", QuoteController, :show
    resources "/users", UserController do
      resources "/posts", PostController
    end
    resources "/reviews", ReviewController
  end

  # scope "/", Splurty do
  #    get "/redirect_test", PageController, :redirect_test, as: :redirect_test
  #  end

  scope "/admin", Splurty.Admin, as: :admin do
  pipe_through :browser

  resources "/images",  ImageController
  resources "/reviews", ReviewController
  resources "/users",   UserController
  end
  # Other scopes may use custom stacks.
  # scope "/api", Splurty do
  #   pipe_through :api
  # end
end
