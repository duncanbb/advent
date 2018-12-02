defmodule FindFrequency do
  def fromFile(filePath) do 
    { :ok, contents } = File.read(filePath)
    frequenciesAsStrings = contents |> String.split("\n", trim: true);
    frequencies = frequenciesAsStrings |> Enum.map(&String.to_integer/1)
    Enum.sum(frequencies)
  end
end