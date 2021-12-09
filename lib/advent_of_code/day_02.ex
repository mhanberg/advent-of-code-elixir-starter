defmodule AdventOfCode.Day02 do
  @doc """
  It takes a list of coordinates with the format {x, y} and defining {0, 0} as the initial coordinate,
  increments the x and y values using those coordinates. At the end returns the multiply x*y.

    - x represents the horizontal value and
    - y represents a depth value.

  ## Examples

      iex> AdventOfCode.Day02.part1([{1, 0}, {0, 5}, {0, -3}])
      > x = x + 1 + 0 + 0
      > y = y + 0 + 5 - 3
      > {1, 2}
      > 1 * 2
      iex> 2
  """
  def part1(args) do
    start_coordinate = {0, 0}

    {final_horizontal, final_depth} =
      args
      |> define_coordinates()
      |> Enum.reduce(start_coordinate, fn {x, y}, {horizontal, depth} ->
        {horizontal + x, depth + y}
      end)

    final_horizontal * final_depth
  end

  @doc """
  It takes a list of instructions and convert each one into a coordinate representation following the rules:
    - forward N increases the horizontal position by N units.
    - down N increases the depth by N units.
    - up N decreases the depth by N units.

  Considering the coordinates (x, y) the forward instruction modified the x value (horizontal) and the other
  ones modify the y value (depth).

  The coordinate that is not modified is represented by 0.

  ## Examples

      iex> AdventOfCode.Day02.define_coordinates(["forward 1", "down 5", "up 3"])
      iex> [{1, 0}, {0, 5}, {0, -3}]
  """
  @spec define_coordinates(list()) :: [tuple()]
  def define_coordinates(input) do
    Enum.map(input, fn instruction -> coordinate(instruction) end)
  end

  defp coordinate(instruction) do
    case instruction do
      "forward " <> value ->
        x = String.to_integer(value)
        {String.to_integer(value), 0}

      "down " <> value ->
        y = String.to_integer(value)
        {0, y}

      "up " <> value ->
        y = String.to_integer(value)
        {0, -y}

      _ ->
        {0, 0}
    end
  end

  def part2(args) do
  end
end
