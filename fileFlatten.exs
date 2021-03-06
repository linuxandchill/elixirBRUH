defmodule FileFlatten do
  def list_all(path) do 
    _list_all(path)
  end

  defp _list_all(path) do
    cond do
      String.contains?(path, ".git") -> []
      true -> expand(File.ls(path), path)
    end
  end

  defp expand({:ok, files}, path) do 
    files
    |> Enum.flat_map(&_list_all("#{path}/#{&1}"))
  end

  defp expand({:error,_ }, path) do 
    [path]
  end
end

IO.puts FileFlatten.list_all("/home/tm/cpp")
