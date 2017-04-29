defmodule NesSearch.Repo.Migrations.CreateNesSearch.NesSearch.Game do
  use Ecto.Migration

  def change do
    create table(:nes_search_games) do
      add :title, :string
      add :narelease, :string
      add :eurelease, :string
      add :publisher, :string

      timestamps()
    end

  end
end
