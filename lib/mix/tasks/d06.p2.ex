defmodule Mix.Tasks.D06.P2 do
  use Mix.Task

  import AdventOfCode.Day06

  @shortdoc "Day 06 Part 2"
  def run(args) do
    input = nil

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_2: fn -> input |> part2() end}),
      else:
        input
        |> part2()
        |> IO.inspect(label: "Part 2 Results")
  end
end
