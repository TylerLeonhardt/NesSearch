defmodule NesSearch.NesSearchTest do
  use NesSearch.DataCase

  alias NesSearch.NesSearch
  alias NesSearch.NesSearch.Game

  @create_attrs %{eurelease: "some eurelease", narelease: "some narelease", publisher: "some publisher", title: "some title"}
  @update_attrs %{eurelease: "some updated eurelease", narelease: "some updated narelease", publisher: "some updated publisher", title: "some updated title"}
  @invalid_attrs %{eurelease: nil, narelease: nil, publisher: nil, title: nil}

  def fixture(:game, attrs \\ @create_attrs) do
    {:ok, game} = NesSearch.create_game(attrs)
    game
  end

  test "list_games/1 returns all games" do
    game = fixture(:game)
    assert NesSearch.list_games() == [game]
  end

  test "get_game! returns the game with given id" do
    game = fixture(:game)
    assert NesSearch.get_game!(game.id) == game
  end

  test "create_game/1 with valid data creates a game" do
    assert {:ok, %Game{} = game} = NesSearch.create_game(@create_attrs)
    assert game.eurelease == "some eurelease"
    assert game.narelease == "some narelease"
    assert game.publisher == "some publisher"
    assert game.title == "some title"
  end

  test "create_game/1 with invalid data returns error changeset" do
    assert {:error, %Ecto.Changeset{}} = NesSearch.create_game(@invalid_attrs)
  end

  test "update_game/2 with valid data updates the game" do
    game = fixture(:game)
    assert {:ok, game} = NesSearch.update_game(game, @update_attrs)
    assert %Game{} = game
    assert game.eurelease == "some updated eurelease"
    assert game.narelease == "some updated narelease"
    assert game.publisher == "some updated publisher"
    assert game.title == "some updated title"
  end

  test "update_game/2 with invalid data returns error changeset" do
    game = fixture(:game)
    assert {:error, %Ecto.Changeset{}} = NesSearch.update_game(game, @invalid_attrs)
    assert game == NesSearch.get_game!(game.id)
  end

  test "delete_game/1 deletes the game" do
    game = fixture(:game)
    assert {:ok, %Game{}} = NesSearch.delete_game(game)
    assert_raise Ecto.NoResultsError, fn -> NesSearch.get_game!(game.id) end
  end

  test "change_game/1 returns a game changeset" do
    game = fixture(:game)
    assert %Ecto.Changeset{} = NesSearch.change_game(game)
  end
end
