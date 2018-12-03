defmodule FindBoxes do
  def getBoxIds(filePath) do 
    { :ok, contents } = File.read(filePath)
    contents |> String.split("\n", trim: true)
  end

  def letter_counts(id) do
    counts =
      id
      |> String.split("", trim: true)
      |> Enum.reduce(%{}, fn char, counts ->
        Map.update(counts, char, 1, &(&1 + 1))
      end)
      |> Enum.reduce({0, 0}, fn {char, count}, {c2, c3} ->
        case count do
          2 -> {1, c3}
          3 -> {c2, 1}
          _ -> {c2, c3}
        end
      end)
  end

  def getCounts(word) do
    counts = String.split(word, "", trim: true)
    |> Enum.reduce(%{}, fn char, acc 
    -> Map.update(acc, char, 1, &(&1 +1))
    end)
    :maps.filter fn _,v -> v == 2 || v == 3 end, counts
  end

end
