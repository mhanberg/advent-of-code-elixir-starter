defmodule AdventOfCode.Input do
  @moduledoc """
  This module can help with automatically managing your Advent of Code input
  files. It will retrieve them once from the server and cache them to your
  machine.

  By default, it is configured to have network requests disabled. You can
  easily turn it on by editing the configuration.
  """

  @doc """
  Retrieves the specified input for your account. If the input is not in your
  cache, it will be retrieved from the server if `allow_network?: true` is
  configured and your cookie is setup.
  """
  def get!(day, year \\ nil)
  def get!(day, nil), do: get!(day, default_year())

  def get!(day, year) do
    cond do
      in_cache?(day, year) ->
        from_cache!(day, year)

      allow_network?() ->
        download!(day, year)

      true ->
        raise "Cache miss for day #{day} of year #{year} and `:allow_network?` is not `true`"
    end
  end

  @doc """
  If, somehow, your input is invalid or mangled and you want to delete it from
  your cache so you can re-fetch it, this will save your bacon.
  Please don't use this to retrieve the input from the server repeatedly!
  """
  def delete!(day, year \\ nil)
  def delete!(day, nil), do: delete!(day, default_year())
  def delete!(day, year), do: File.rm!(cache_path(day, year))

  defp cache_path(day, year), do: Path.join(cache_dir(), "/#{year}/#{day}.aocinput")
  defp in_cache?(day, year), do: File.exists?(cache_path(day, year))

  defp store_in_cache!(day, year, input) do
    path = cache_path(day, year)
    :ok = path |> Path.dirname() |> File.mkdir_p()
    :ok = File.write(path, input)
  end

  defp from_cache!(day, year), do: File.read!(cache_path(day, year))

  defp download!(day, year) do
    {:ok, {{~c"HTTP/1.1", 200, ~c"OK"}, _, input}} =
      :httpc.request(
        :get,
        {~c"https://adventofcode.com/#{year}/day/#{day}/input", headers()},
        [],
        []
      )

    store_in_cache!(day, year, input)

    to_string(input)
  end

  defp cache_dir do
    config()
    |> Keyword.get(
      :cache_dir,
      Path.join([System.get_env("XDG_CACHE_HOME", "~/.cache"), "/advent_of_code_inputs"])
    )
    |> Path.expand()
  end

  defp default_year do
    case :calendar.local_time() do
      {{y, 12, _}, _} -> y
      {{y, _, _}, _} -> y - 1
    end
  end

  defp config, do: Application.get_env(:advent_of_code, __MODULE__)
  defp allow_network?, do: Keyword.get(config(), :allow_network?, false)

  defp headers,
    do: [
      {~c"user-agent",
       ~c"github.com/mhanberg/advent-of-code-elixir-starter by aoc@mitchellhanberg.com"},
      {~c"cookie", String.to_charlist("session=" <> Keyword.get(config(), :session_cookie))}
    ]
end
