defprotocol Size do
  @doc "Calculates size of data structure"
  def size(data)
  ##def empty?(data)
end

defimpl Size, for: BitString do
  def size(string), do: byte_size(string)
end
defimpl Size, for: Map do
  def size(map), do: map_size(map)
end

defimpl Size, for: MapSet do 
  def size(set), do: MapSet.size(set)
end

defimpl Size, for:  Tuple do
  def size(tuple), do: tuple_size(tuple)
end

