defmodule Mix.Tasks.D15.P1 do
  use Mix.Task

  import AdventOfCode.Day15

  @shortdoc "Day 15 Part 1"
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
