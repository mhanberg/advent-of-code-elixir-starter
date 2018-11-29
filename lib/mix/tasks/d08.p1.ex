defmodule Mix.Tasks.D08.P1 do
  use Mix.Task

  import AdventOfCode2018.Day08

  @shortdoc "Day 08 Part 1"
  def run(_) do
    input = nil

    input
    |> part1()
    |> IO.inspect(label: "Part 1 Results") 
  end
end   
