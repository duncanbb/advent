defmodule FindFrequency do
  def frequenciesFromFile(filePath) do 
    { :ok, contents } = File.read(filePath)
    frequenciesAsStrings = contents |> String.split("\n", trim: true);
    frequenciesAsStrings |> Enum.map(&String.to_integer/1)
  end

  def findFinalFrequency(filePath) do
    Enum.sum(frequenciesFromFile(filePath))
  end

  def findDoubleFrequency(filePath) do
    frequenciesFromFile(filePath)
    |> Stream.cycle()
    |> Enum.reduce_while({0, MapSet.new([0])}, fn i, { current, seen } ->
      frequency = current + i

      if MapSet.member?(seen, frequency) do
        {:halt, frequency}
      else 
        {:cont, {frequency, MapSet.put(seen, frequency)}}
      end
    end)
  end

end