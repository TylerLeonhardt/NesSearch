defmodule NesSearch.Web.Router do
  use NesSearch.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", NesSearch.Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :search
  end

  # Other scopes may use custom stacks.
  scope "/api", NesSearch.Web do
    pipe_through :api

    resources "/games", GameController, except: [:new, :edit]
    get "/search", GameController, :search
  end
end
