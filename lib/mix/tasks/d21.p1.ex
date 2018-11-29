defmodule Mix.Tasks.D21.P1 do
  use Mix.Task

  import AdventOfCode2018.Day21

  @shortdoc "Day 21 Part 1"
  def run(_) do
    input = nil

    input
    |> part1()
    |> IO.inspect(label: "Part 1 Results") 
  end
end   
