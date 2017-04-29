defmodule NesSearch.Web.GameView do
  use NesSearch.Web, :view
  alias NesSearch.Web.GameView

  def render("index.json", %{games: games}) do
    %{data: render_many(games, GameView, "game.json")}
  end

  def render("show.json", %{game: game}) do
    %{data: render_one(game, GameView, "game.json")}
  end

  def render("results.json", %{hits: hits}) do
    %{data: render_many(hits, GameView, "hit.json")}
  end

  def render("game.json", %{game: game}) do
    %{id: game.id,
      title: game.title,
      narelease: game.narelease,
      eurelease: game.eurelease,
      publisher: game.publisher}
  end

  def render("hit.json", %{game: game}) do
    %{id: game._id,
      title: game._source.title,
      publisher: game._source.publisher,
      narelease: game._source.narelease,
      eurelease: game._source.eurelease,
      score: game._score}
  end
end
