defimpl Kino.Render, for: Req.Response do
  def to_livebook(response) do
    case List.keyfind(response.headers, "content-type", 0) do
      {_, "image/" <> _ = content_type} ->
        Kino.Image.new(response.body, content_type)
        |> Kino.Render.Kino.Image.to_livebook()

      {_, "text/csv"} when is_list(response.body) ->
        response.body
        |> Enum.map(fn row ->
          for {val, idx} <- Enum.with_index(row) do
            {idx, val}
          end
          |> Map.new()
        end)
        |> Kino.DataTable.new()
        |> Kino.Render.Kino.DataTable.to_livebook()

      _ ->
        response
    end
  end
end
