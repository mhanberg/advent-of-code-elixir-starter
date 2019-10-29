defmodule Mix.Tasks.D06.P2 do
  use Mix.Task

  import AdventOfCode2019.Day06

  @shortdoc "Day 06 Part 2"
  def run(_) do
    input = nil

    input
    |> part2() 
    |> IO.inspect(label: "Part 2 Results") 
  end
end   
