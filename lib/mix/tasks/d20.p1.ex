defmodule Mix.Tasks.D20.P1 do
  use Mix.Task

  import AdventOfCode2018.Day20

  @shortdoc "Day 20 Part 1"
  def run(_) do
    input = nil

    input
    |> part1()
    |> IO.inspect(label: "Part 1 Results") 
  end
end   
