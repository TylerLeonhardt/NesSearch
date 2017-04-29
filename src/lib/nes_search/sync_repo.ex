defmodule NesSearch.SyncRepo do
  use ElasticSync.SyncRepo, ecto: NesSearch.Repo
end