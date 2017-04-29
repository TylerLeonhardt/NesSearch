defmodule NesSearch.Web.GameController do
  use NesSearch.Web, :controller

  alias NesSearch.NesSearch
  alias NesSearch.Game

  action_fallback NesSearch.Web.FallbackController

  def index(conn, _params) do
    games = NesSearch.list_games()
    render(conn, "index.json", games: games)
  end

  def create(conn, %{"game" => game_params}) do
    with {:ok, %Game{} = game} <- NesSearch.create_game(game_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", game_path(conn, :show, game))
      |> render("show.json", game: game)
    end
  end

  def show(conn, %{"id" => id}) do
    game = NesSearch.get_game!(id)
    render(conn, "show.json", game: game)
  end

  def update(conn, %{"id" => id, "game" => game_params}) do
    game = NesSearch.get_game!(id)

    with {:ok, %Game{} = game} <- NesSearch.update_game(game, game_params) do
      render(conn, "show.json", game: game)
    end
  end

  def delete(conn, %{"id" => id}) do
    game = NesSearch.get_game!(id)
    with {:ok, %Game{}} <- NesSearch.delete_game(game) do
      send_resp(conn, :no_content, "")
    end
  end

  def search(conn, %{"query" => query}) do
    IO.inspect(Tirexs.HTTP.url("#{Game.get_games_index_and_schema_name}/#{Game.get_games_type}/_search?q=#{URI.encode(query)}"))
    case Tirexs.HTTP.get("#{Game.get_games_index_and_schema_name}/#{Game.get_games_type}/_search?q=#{URI.encode(query)}") do
      {:ok, _status_code, result} ->
          render(conn, "results.json", hits: result.hits.hits)
      #TODO: patern match for errors
    end
  end
end
