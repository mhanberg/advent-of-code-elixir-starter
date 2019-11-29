defmodule Mix.Tasks.D21.P1 do
  use Mix.Task

  import AdventOfCode.Day21

  @shortdoc "Day 21 Part 1"
  def run(args) do
    input = nil

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_1: fn -> input |> part1() end}),
      else:
        input
        |> part1()
        |> IO.inspect(label: "Part 1 Results")
  end
end
