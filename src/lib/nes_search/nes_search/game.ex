defmodule NesSearch.NesSearch.Game do
  @games_index_and_schema_name "nes"
  @games_type "game"

  use Ecto.Schema

  schema "nes_search_games" do
    field :eurelease, :string
    field :narelease, :string
    field :publisher, :string
    field :title, :string

    timestamps()
  end

  use ElasticSync.Schema,
    index: @games_index_and_schema_name,
    type: @games_type

  def get_games_index_and_schema_name, do: @games_index_and_schema_name
  def get_games_type, do: @games_type

  @doc """
  Convert a struct to a plain ol' map. This will become our document.
  """
  def to_search_document(record) do
    Map.take(record, [:id, :title, :publisher, :eurelease, :narelease])
  end
end
